//-----------------------------------------------------------------------------
// Block: apb_adc_fifo
// Description:
//   This module provides a 512x32 FIFO.  Data is written into from an ADC or
//   other sensor, and is read by the processor over APB.
//------------------------------------------------------------------------------

module apb_adc_fifo
( // Port List
  input   clk,
  input   rst_n,

  // APB INTERFACE
  input      [31:0] paddr,
  input             psel,
  input             penable,
  input             pwrite,
  input      [31:0] pwdata,
  output reg [31:0] prdata,
  output reg        pready,
  output            perr,
  
  // SENSOR INTERFACE
  input  [31:0] i_data,
  input         i_data_v
);

  // ==========================================================================
  // ==========================================================================
  // APB INTERFACE

  wire        perr = 1'b0;
  
  reg  [31:0] mem[0:511];
  reg  [8:0]  waddr;
  reg  [8:0]  raddr;
  reg  [15:0] count;
  reg  [31:0] csr;

  wire        sel_fifo    = psel && (paddr[2] == 1'b0);
  wire        sel_csr     = psel && (paddr[2] == 1'b1);
  
  wire        fifo_full   = count == 10'd512;
  wire        fifo_empty  = count == 10'd000;
  
  wire        fifo_reset  = csr[16];
  wire        mem_write   = i_data_v && !fifo_full;
  wire        incr_write  = mem_write;
  wire        mem_read    = psel && !pwrite && sel_fifo && !fifo_empty;
  wire        incr_read   = mem_read && penable;


  always @(posedge clk) begin
    if (mem_write) begin
      mem[waddr] <= i_data;
    end
    if (sel_fifo) begin
      prdata <= mem[raddr];
    end else if (sel_csr) begin
      prdata <= csr;
    end else begin
      prdata <= 32'h0;
    end
  end


  always @(posedge clk) begin
    if (rst_n == 1'b0) begin
      pready <= 1'b0;
      csr <= 32'h00010000; // fifo_reset = 1
    end else begin
      pready <= psel && !penable;
      csr[15:0] <= count;
      if (sel_csr && penable) begin
        csr[31:16] <= pwdata[31:16];
      end
    end
  end
  
  always @(posedge clk) begin
    if (fifo_reset) begin
      waddr <= 'h0;
      raddr <= 'h0;
      count <= 'h0;
    end else begin

      if (incr_read) begin
        raddr <= raddr + 9'h1;
      end
      
      if (incr_write) begin
        waddr <= waddr + 9'h1;
      end
      
      if (incr_write && !incr_read) begin
        count <= count + 10'h1;
      end else if (incr_read && !incr_write) begin
        count <= count - 10'h1;
      end

    end
  end

endmodule


