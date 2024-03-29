// default_nettype none

module apb_servant_ram
  #(//Memory parameters
    parameter depth = 256,
    parameter aw    = $clog2(depth),
    parameter RESET_STRATEGY = "",
    parameter memfile = "")
   (input wire 		i_wb_clk,
    input wire 		i_wb_rst,

    input  [31:0] paddr,
    input         psel,
    input         penable,
    input         pwrite,
    input  [31:0] pwdata,
    output reg [31:0] prdata,
    output reg        pready,
    output        perr,

    input wire [aw-1:2] i_wb_adr,
    input wire [31:0] 	i_wb_dat,
    input wire [3:0] 	i_wb_sel,
    input wire 		i_wb_we,
    input wire 		i_wb_cyc,
    output reg [31:0] 	o_wb_rdt,
    output reg 		o_wb_ack);

   wire [3:0] 		we = {4{i_wb_we & i_wb_cyc}} & i_wb_sel;

   reg [31:0] 		mem [0:depth/4-1] /* verilator public */;

   wire [aw-3:0] 	addr = i_wb_adr[aw-1:2];

   wire [aw-3:0]        apb_addr   = paddr[aw-1:2];
   wire                 apb_mem_we = psel && penable && pwrite;
   wire                 apb_mem_re = psel && !pwrite;

   wire   sel_apb = i_wb_rst;

   assign perr = 1'b0;


   always @(posedge i_wb_clk)
   begin
     pready <= psel && !penable;
   end


   wire [aw-3:0] maddr  =  sel_apb ? apb_addr : addr;
   wire          mwe    =  sel_apb ? apb_mem_we : we;
   wire [31:0]   mwdata =  sel_apb ? pwdata : i_wb_dat;
   wire [31:0]   mrdata =  mem[maddr];

   always @(posedge i_wb_clk)
   begin
     if (mwe) begin
       mem[maddr] <= mwdata;
     end
   end

   always @(posedge i_wb_clk)
   begin
     if (i_wb_rst & (RESET_STRATEGY != "NONE"))
       o_wb_ack <= 1'b0;
     else begin
       o_wb_ack <= i_wb_cyc & !o_wb_ack;
     end

     o_wb_rdt <= mrdata;
     if (apb_mem_re) begin
       prdata <= mrdata;
     end else begin
       prdata <= 32'h0;
     end
   end



//     always @ (posedge i_wb_clk)
//     begin
// //        o_wb_rdt <= mem[addr];
//       case (addr)
//
// `define BLINKY_SLOW
//
// `ifdef BLINKY_FAST
// // blink_fast.hex
//         11'd0 : o_wb_rdt <= 32'h40000537;
//         11'd1 : o_wb_rdt <= 32'h00050513;
//         11'd2 : o_wb_rdt <= 32'h01000313;
//         11'd3 : o_wb_rdt <= 32'h00000293;
//         11'd4 : o_wb_rdt <= 32'h00550023;
//         11'd5 : o_wb_rdt <= 32'h0012C293;
//         11'd6 : o_wb_rdt <= 32'h000073B3;
//         11'd7 : o_wb_rdt <= 32'h00138393;
//         11'd8 : o_wb_rdt <= 32'hFE731EE3;
//         11'd9 : o_wb_rdt <= 32'hFEDFF06F;
//         11'd10 : o_wb_rdt <= 32'h00000000;
// `endif
//
// `ifdef BLINKY_SLOW
// // blinky_slow.hex
//         11'd0 : o_wb_rdt <= 32'h40000537;
//         11'd1 : o_wb_rdt <= 32'h00050513;
//         11'd2 : o_wb_rdt <= 32'h00100337;
//         11'd3 : o_wb_rdt <= 32'h00000293;
//         11'd4 : o_wb_rdt <= 32'h00550023;
//         11'd5 : o_wb_rdt <= 32'h0012C293;
//         11'd6 : o_wb_rdt <= 32'h000073B3;
//         11'd7 : o_wb_rdt <= 32'h00138393;
//         11'd8 : o_wb_rdt <= 32'hFE731EE3;
//         11'd9 : o_wb_rdt <= 32'hFEDFF06F;
//         11'd10: o_wb_rdt <= 32'h00000000;
// `endif
//         default: o_wb_rdt <= 32'h00000000;
//       endcase
//     end // always



//    initial
//      if(|memfile) begin
// `ifndef ISE
// 	$display("Preloading %m from %s", memfile);
// `endif
// 	$readmemh(memfile, mem);
//      end

endmodule
