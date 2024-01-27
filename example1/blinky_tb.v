`timescale 1 ns /  100 ps
module tb();
  parameter CNT_WIDTH  = 8;

  reg  rst_n = 1;
  wire led;

  // Generate clock that toggles every 5nsec
  reg clk = 0;
  always #5 clk <= !clk;

  blinky #(CNT_WIDTH) u_dut (
    .clk(clk),
    .rst_n(rst_n),
    .led(led)
  );

  integer ii = 0;
  initial begin
    $display($time, " info: Start of Simulation");
    @(posedge clk);
    rst_n = 0;
    repeat(10) @(posedge clk);
    rst_n = 1;
    
    repeat(10) @(posedge clk);



    repeat(10000) begin
      @(posedge clk); 
    end
    repeat (20) @(posedge clk); #1;
    $display($time, " info: End of Simulation");
    $finish;
  end

  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, tb);
  end


endmodule

