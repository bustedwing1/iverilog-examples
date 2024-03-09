//-----------------------------------------------------------------------------
// Block: apb_ram
// Description:
//   This module provides a 512x32 ram that can be accessed by the APB.
//------------------------------------------------------------------------------

module apb_ram
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
  output        perr
);

  // ==========================================================================
  // ==========================================================================
  // APB INTERFACE

  wire        pready = 1'b1;
  wire        perr = 1'b0;
  wire        mem_write = psel && penable && pwrite;
  wire        mem_read  = psel && !pwrite;
  wire [8:0]  mem_addr  = paddr[10:2]; // convert byte addr to 32-bit word addr
  
  reg  [31:0] mem[0:511];

  always @(posedge clk) begin
    if (mem_write) begin
      mem[mem_addr] <= pwdata;
    end
    if (mem_read) begin
      prdata <= mem[mem_addr];
    end else begin
      prdata <= 32'h0;
    end
  end

endmodule

