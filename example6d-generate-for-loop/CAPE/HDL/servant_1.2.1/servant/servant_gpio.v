module servant_gpio
  (input wire i_wb_clk,
   input wire [31:0] i_wb_dat,
   input wire i_wb_we,
   input wire i_wb_cyc,
   output reg o_wb_rdt,
   output reg [31:0] o_gpiobus,
   output reg o_gpio);

   always @(posedge i_wb_clk) begin
      o_wb_rdt <= o_gpio;
      if (i_wb_cyc & i_wb_we) begin
	o_gpio <= i_wb_dat;
	o_gpiobus <= i_wb_dat;
      end
   end
endmodule
