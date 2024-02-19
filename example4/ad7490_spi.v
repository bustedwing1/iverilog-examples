//-----------------------------------------------------------------------------
// Block: ad7490_spi
// Description:
//   This module provides a SPI interface. All modes have not been implemented.
//------------------------------------------------------------------------------

module ad7490_spi
#( // Parameter List
  parameter DEFAULT_EN = 1
)
( // Port List
  input   clk,
  input   rst_n,

  input  [31:0] paddr,
  input         psel,
  input         penable,
  input         pwrite,
  input  [31:0] pwdata,
  output reg [31:0] prdata,
  output        pready,
  output        perr,
  output [31:0] rx_data,

  output reg    sclk,
  output reg    cs,
  output reg    mosi, // Main to Sub
  input         miso  // Sub to Main

);

  // ==========================================================================
  // ==========================================================================
  // APB INTERFACE

  wire        pready = 1'b1;
  wire        perr = 1'b0;

  wire [31:0] id = 32'h12345678;
  reg  [31:0] scratch;
  reg         en;
  reg  [15:0] adc_array [0:15]; // Driven by SPI Interface
  integer     index;

  always @(posedge clk) begin
    if (rst_n == 0) begin
      prdata     <= 32'h0;
      scratch <= 32'h0;
      en <= DEFAULT_EN;
    end else begin

      if (psel && pwrite && penable) begin
        case (paddr[7:0])
          8'h04 : en <= pwdata[0];
          8'h08 : scratch <= pwdata;
          default : ;
        endcase
      end

      if (psel) begin
        if (paddr[7:0] >= 8'h40) begin
          prdata <= {16'ha5a5, adc_array[ paddr[5:2] ]};
        end else begin
          case (paddr[7:0])
            8'h00 : prdata <= 32'h12345678;
            8'h04 : prdata <= {31'b0, en};
            8'h08 : prdata <= scratch;
            default : prdata <= 0;
          endcase
        end
      end else begin
        prdata <= 0;
      end

    end
  end


  // ==========================================================================
  // ==========================================================================
  // SPI INTERFACE

  reg  [15:0] shiftreg;
  reg         shiftreg_v;
  reg  [15:0] cnt;
  reg         fe;
  reg  [3:0]  addr;
  reg  [11:0] value;
  reg         value_v;

  always @(posedge clk) begin
    if (rst_n == 0) begin
      shiftreg   <= 16'b0;
      shiftreg_v <= 1'b0;
      cnt     <= 16'h0;
      fe      <= 1'b0;
      value   <= 16'h0;
      value_v <= 1'b0;
    end else begin
      cnt  <= en ? cnt + 1 : 16'h0;
      sclk <= !cnt[3];
      cs   <= !cnt[8];
      mosi <= !cnt[13];
      fe   <= cnt[3:0] == 4'h7 && cnt[8];
      shiftreg_v <= cnt[8:0] == 9'h1ff;
      
      if (cs) begin
        shiftreg <= 16'h0;
      end else if (fe) begin
        shiftreg <= {shiftreg[14:0], miso};
      end
      value_v <= shiftreg_v && !mosi;
      if (shiftreg_v) begin
        addr  <= shiftreg[15:12];
        value <= shiftreg[11:0];
      end
      
      if (value_v) begin
        adc_array[addr] <= {addr, value};
      end
      
    end
  end

endmodule

