//-----------------------------------------------------------------------------
// Block: ad7490_model
// This model works in simulation but is not synthesizable. It emulates the 
// ADC's sequence mode, but not the other modes.
//------------------------------------------------------------------------------

module ad7490_model
(  
  input   spi_sclk,
  input   spi_cs_n,
  input   spi_mosi, // Main to Sub
  output  spi_miso  // Sub to Main

);

  reg [15:0] shift_reg;
  reg        spi_miso;
  reg  [3:0] addr;
  reg [11:0] data;

  always
  begin
    
    // PROCESS 1ST 16 DUMMY SPI WRITES. ONLY 3 are needed
    
    repeat(16) begin
      spi_miso = 1'bz;
      @(negedge spi_cs_n);
      shift_reg = 16'habcd;
      spi_miso = shift_reg[15];
      repeat(16) begin
        @(negedge spi_sclk);
        shift_reg = {shift_reg[14:0],1'b0};
        spi_miso = shift_reg[15];
      end
      @(posedge spi_cs_n);
    end

    // PROCESS THE REMAINING SPI TRANSFERS WHICH SHOULD ALL BE READS.
    addr = 0;
    data = 12'h000;
    while (1) begin
      spi_miso = 1'bz;
      @(negedge spi_cs_n);
      shift_reg = {addr, data};
      spi_miso = shift_reg[15];
      repeat(16) begin
        @(negedge spi_sclk);
        shift_reg = {shift_reg[14:0],1'b0};
        spi_miso = shift_reg[15];
      end
      @(posedge spi_cs_n);
      addr = addr + 1;
      data = data + 'h111;
    end
  end

  reg [7:0] clk_cnt;
  always @(negedge spi_sclk or posedge spi_cs_n)
  begin
    if (spi_cs_n) begin
      clk_cnt <= 8'h0;
    end else begin
      clk_cnt <= clk_cnt + 1;
    end
  end

endmodule

