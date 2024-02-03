//-----------------------------------------------------------------------------
// Block: ad7490_spi
// Description:
//   This module provides a SPI interface. All modes have not been implemented.
//------------------------------------------------------------------------------

module ad7490_spi
#( // Parameter List
  parameter SCLK_PER   = 16,
  parameter NBITS      = 16,
  parameter GAPTIME    = SCLK_PER*4,
  parameter PREAMBLE   = 1,
  parameter DEFAULT_EN = 0
)
( // Port List
  input   clk,
  input   rst_n,

  input  [31:0] paddr,
  input         psel,
  input         penable,
  input         pwrite,
  input  [31:0] pwdata,
  output [31:0] prdata,
  output        pready,
  output        perr,
  output [31:0] rx_data,

  output        spi_sclk,
  output        spi_cs_n,
  output        spi_mosi, // Main to Sub
  input         spi_miso  // Sub to Main

);

  // ==========================================================================
  // ==========================================================================
  // APB INTERFACE

  reg [31:0] prdata;
  reg        pready;
  reg        perr;

  reg        apb_spi_enable;
  reg [16:0] adc_array [0:15]; // Driven by AD7490 PROTOCOL
  integer    index;

  always @(posedge clk) begin
    if (rst_n == 0) begin
      prdata     <= 32'h0;
      pready     <= 1'b0;
      perr       <= 1'b0;
      apb_spi_enable <= DEFAULT_EN;
    end else begin

      if (psel && pwrite && penable) begin
        case (paddr[7:0])
          64 : apb_spi_enable <= pwdata[0];
          default : ;
        endcase
      end

      if (psel) begin
        if (paddr[7:0] < 64) begin
          prdata <= {15'b0, adc_array[ paddr[7:2] ]};
        end else begin
          case (paddr[7:0])
            64 :  prdata <= {31'b0, apb_spi_enable};
            default : prdata <= 0;
          endcase
        end
      end else begin
        prdata <= 0;
      end

      pready <= 1'b1;
      perr   <= 1'b0;
    end
  end


  // ==========================================================================
  // ==========================================================================
  // AD7490 PROTOCOL

  localparam ST_ADC_IDLE    = 3'h0;
  localparam ST_ADC_DUMMY1  = 3'h1;
  localparam ST_ADC_DUMMY2  = 3'h2;
  localparam ST_ADC_CONTROL = 3'h3;
  localparam ST_ADC_READ    = 3'h4;

  reg  [2:0] adc_state;
  reg [31:0] adc_tx_data;
  reg        adc_start_spi_fsm;
  reg        adc_done;
  reg [31:0] rx_data;  // riven by SPI Interface logic
  wire       spi_done; // Driven by SPI Interface logic

  always @(posedge clk) begin
    if (rst_n == 0) begin
      adc_state <= ST_ADC_IDLE;
      adc_start_spi_fsm <= 1'b0;
      adc_tx_data <= 16'hffff;
      for (index=0; index<16; index = index + 1) begin
        adc_array[index] <= 0;
      end
      adc_done <= 1'b0;
    end else begin
      if (apb_spi_enable) begin
        case (adc_state)
          ST_ADC_IDLE:    adc_state <= ST_ADC_DUMMY1;
          ST_ADC_DUMMY1:  if (spi_done) adc_state <= ST_ADC_DUMMY2;
          ST_ADC_DUMMY2:  if (spi_done) adc_state <= ST_ADC_CONTROL;
          ST_ADC_CONTROL: if (spi_done) adc_state <= ST_ADC_READ;
          ST_ADC_READ:    adc_state <= ST_ADC_READ;
          default: adc_state <= ST_ADC_IDLE;
        endcase
        adc_start_spi_fsm <= (adc_state == ST_ADC_IDLE) || spi_done;

        if (adc_state == ST_ADC_READ) begin
          adc_tx_data <= 16'h0000;
        end else begin
          adc_tx_data <= 16'hffff;
        end

        if (adc_state == ST_ADC_READ && spi_done) begin
          adc_array[ rx_data[15:12] ] <= {1'b1, 4'b0, rx_data[11:0]};
          adc_done <= rx_data[15:12] == 4'hF;
        end

      end else begin // apb_spi_enable = 0
        adc_state <= ST_ADC_IDLE;
        adc_start_spi_fsm <= 1'b0;
        adc_tx_data <= 16'hffff;
        for (index=0; index<16; index = index + 1) begin
          adc_array[index] <= 0;
        end
      end

    end // else posedge clk
  end // always


  // ==========================================================================
  // ==========================================================================
  // SPI INTERFACE

  localparam ST_IDLE     = 2'b00;
  localparam ST_PREAMBLE = 2'b01;
  localparam ST_BUSY     = 2'b10;
  localparam ST_GAP      = 2'b11;

  reg  [1:0] spi_state;
  reg [11:0] spi_cnt;

  reg        spi_sclk;
  reg        spi_cs_n;
  reg        spi_mosi; // Main to Sub
  reg [31:0] spi_tx_shiftreg;
  reg [31:0] spi_rx_shiftreg;
  reg [31:0] spi_status;
  reg        adc_start_spi_fsm2;

  wire       preamble_done  = spi_state == ST_PREAMBLE && spi_cnt == 1*NBITS-1;
  wire       busy_done      = spi_state == ST_BUSY && spi_cnt == SCLK_PER*NBITS-1;
  wire       gap_done       = spi_state == ST_GAP && spi_cnt == GAPTIME-1;
  assign     spi_done       = gap_done;
  wire       clk_toggle     = spi_cnt[2:0] == 3'b111;
  wire       shift_mosi     = spi_state == ST_BUSY && spi_cnt[3:0] == 4'hf;
  wire       shift_miso     = (spi_state == ST_PREAMBLE || spi_state == ST_BUSY && !busy_done) && (spi_cnt[3:0] == 4'hf);

  always @(posedge clk) begin
    if (rst_n == 0) begin
      adc_start_spi_fsm2 <= 1'b0;
      spi_state          <= ST_IDLE;
      spi_tx_shiftreg    <= 32'h0;
      spi_rx_shiftreg    <= 32'h0;
      spi_cnt            <= 'h0;
      spi_sclk           <= 1'b0;
      spi_cs_n           <= 1'b1;
      spi_mosi           <= 1'b0;
      rx_data            <= 32'b0;
      spi_status         <= 32'b0;
    end else begin

      adc_start_spi_fsm2 <= spi_state == ST_IDLE && adc_start_spi_fsm;

      case (spi_state)
        ST_IDLE: if (adc_start_spi_fsm2) begin
                   if (PREAMBLE == 0) begin
                     spi_state <= ST_BUSY;
                   end else begin
                     spi_state <= ST_PREAMBLE;
                   end
                 end
        ST_PREAMBLE: if (preamble_done) spi_state <= ST_BUSY;
        ST_BUSY: if (busy_done) spi_state <= ST_GAP;
        ST_GAP:  if (gap_done)  spi_state <= ST_IDLE;
      endcase

      if (spi_state == ST_IDLE) begin
        spi_cnt <= 'h0;
      end else if (spi_state == ST_PREAMBLE) begin
        if (preamble_done) begin
          spi_cnt <= 'h0;
        end else begin
          spi_cnt <= spi_cnt + 1;
        end
      end else if (spi_state == ST_BUSY) begin
        if (busy_done) begin
          spi_cnt <= 'h0;
        end else begin
          spi_cnt <= spi_cnt + 1;
        end
      end else begin
        spi_cnt <= spi_cnt + 1;
      end

      if (spi_state == ST_IDLE) begin
        if (adc_start_spi_fsm2) begin
          spi_cs_n <= 1'b0;
        end else begin
          spi_cs_n <= 1'b1;
        end
      end else if (spi_state == ST_PREAMBLE) begin
        spi_cs_n <= 1'b0;
      end else if (spi_state == ST_BUSY) begin
        if (busy_done) begin
          spi_cs_n <= 1'b1;
        end else begin
          spi_cs_n <= 1'b0;
        end
      end else begin
        spi_cs_n <= 1'b1;
      end

      if (spi_state == ST_BUSY) begin
        if (clk_toggle) begin
           spi_sclk <= !spi_sclk;
        end
      end else begin
        spi_sclk <= 1'b1;
      end

      if (spi_state == ST_IDLE) begin
        if (adc_start_spi_fsm2) begin
          spi_tx_shiftreg <= adc_tx_data;
          spi_mosi <= adc_tx_data[NBITS-1];
        end else begin
          spi_tx_shiftreg <= 'h0;
          spi_mosi <= 1'b0;
        end
      end else if (spi_state == ST_PREAMBLE) begin
      end else if (spi_state == ST_BUSY) begin
        if (busy_done) begin
          spi_mosi <= 1'b0;
        end else if (shift_mosi) begin
          spi_tx_shiftreg <= {spi_tx_shiftreg[30:0], spi_miso};
          spi_mosi <= spi_tx_shiftreg[NBITS-2];
        end
      end else if (spi_state == ST_GAP) begin
        spi_mosi <= 1'b0;
      end

      if (adc_start_spi_fsm2) begin
        spi_rx_shiftreg <= 'h0;
      end else if (shift_miso) begin
        spi_rx_shiftreg <= {spi_rx_shiftreg[30:0], spi_miso};
      end

      if (spi_state == ST_GAP) begin
        if (spi_cnt == 0) begin
          rx_data <= spi_rx_shiftreg;
        end
      end

      if (spi_state == ST_IDLE) begin
        if (adc_start_spi_fsm2) begin
          spi_status <= 32'b0;
        end else begin
          spi_status <= 32'b1;
        end
      end else begin
        spi_status <= 32'b1;
      end

    end
  end

endmodule

