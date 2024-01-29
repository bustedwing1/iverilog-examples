//-----------------------------------------------------------------------------
// blinky_tb.v
//
// git clone https://github.com/bustedwing1/iverilog-examples
// cd iverilog-examples/example1
//
// Description:
//   This is the testbench for the blinky module.
//
//------------------------------------------------------------------------------

`timescale 1 ns /  100 ps
module tb;

  // In testbenches, I usually use 'reg' to declare the inputs to the Device
  // Under Test (DUT), and I use 'wire' to declare the DUT's outputs
  reg  system_reset_n = 1;
  wire gpio_led;

  // ==========================================================================
  // Generate a clock that toggles every 5nsec, resulting in a 100MHz pulsing
  // clock with a 50% duty cycle
  reg system_clock_100mhz = 0;
  always
  begin
   #5 // Wait 5 ns
   system_clock_100mhz <= !system_clock_100mhz; // toggle the clock
  end

  // ==========================================================================
  // Instantiate the blinky module, call the instance name u_dut. It is common
  // to prefix instance names with "u_" (primarily for historical reasons). It
  // is also common for testbenches to call the the module being tested the
  // Device Under Test (DUT) or Unit Under Test (UUT).
  
  // The syntax for a module instantiation is the module name (blinky), followed
  // by optional parameters (in this case CNT_WIDTH), followed by the instance
  // name (u_dut), followed by the module's IO (inputs and outputs). The IOs are
  // in a comma separated list. In this example a named port syntax is used
  // of dot '.', followed by the module's internal name, followed by the 
  // calling module's (the testbench module's) external name in parentheses. Note,
  // Verilog also supports a position port naming syntax, which is almost never
  // used (except for tool-generated netlists).  
  blinky #(9) u_blinky (
    .clk(system_clock_100mhz), // input
    .rst_n(system_reset_n),    // input
    .led(gpio_led)             // output
  );

  // ==========================================================================
  // MAIN TEST INITIAL BLOCK
  // This block does very little. It pulses the reset at the beginning of the 
  // simulation and then just waits for a lot of clock ticks.

  // Initial blocks start at the beginning of the simulation, run one time and
  // stop when it reaches the end.
  integer ii = 0;
  integer ii_prev = 0;
  integer ii_delta = 0;
  integer fail_cnt = 0;
  integer first_time = 1;
  reg gpio_led2 = 0;
  initial begin
  
    // SIMULATION STARTUP
    // Verilog uses the $display to print text to the screen. It's syntax
    // is similar to C's printf.
    $display($time, " info: Start of Simulation ii = %d", ii);
    
    // Wait for the 1st rising clock edge and then drive the reset low tp 
    // reset the blinky module.
    @(posedge system_clock_100mhz);
    system_reset_n = 0;
    
    // Wait for 10 more clocks, with the reset still assserted low.
    repeat(10) begin
      @(posedge system_clock_100mhz);
    end
    
    // Drive the reset high which enables the blinky to start working. Wait
    // for 10 more clocks just for good measure.
    system_reset_n = 1;
    repeat(10) @(posedge system_clock_100mhz);

    // SIMULATION RUNS FOR A LONG TIME. BLINKY SHOULD PULSE MANY TIMES
    // This waits for 10000 clocks. A for loop is used here just to show
    // its syntax, which is similar to C, but the "i++" increment is not
    // supported. Also note the "begin / end" instead of curly braces.
    for (ii=0; ii < 10000; ii = ii + 1) begin
      gpio_led2 <= gpio_led;
      @(posedge system_clock_100mhz);
      if (gpio_led != gpio_led2) begin
        ii_delta = ii - ii_prev;
        if (ii_delta == 256) begin
          $display($time, " nsec : PASS GPIO_LED changing from %d to %d. blink rate = %d clocks", 
                   gpio_led2, gpio_led, ii_delta);
        end else begin
          if (!first_time) begin
            fail_cnt = fail_cnt + 1;
            $display($time, " nsec: FAIL GPIO_LED changing from %d to %d. blink rate = %d clocks", 
                     gpio_led2, gpio_led, ii_delta);
          end
        end
        first_time = 0;
        ii_prev = ii;
      end
    end

    // MOP-UP SIMULULATION
    repeat (20) @(posedge system_clock_100mhz); #1;

    $display("\n=========================================================================================\n");
    if (fail_cnt == 0) begin
      $display($time, ": TEST PASSED");
    end else begin
      $display($time, ": TEST FAILED. %d tests failed", fail_cnt);
    end

    $display($time, " info: End of Simulation");
    
    // The $finish command stops the verilog simulation
    $finish;
  end // end of MAIN TEST initial block

  // ==========================================================================
  // The $dumpfile and $dumpvars commands are used to output trace waveforms.
  // Note, this initial block and the above MAIN TEST initial block both
  // start at time zero, and run in "parallel", similar to a multi-threading.
  // In this simple case, the $dump commands are run at time zero, and then 
  // this block stops for the remainder of the simulation.  Also note that these
  // two dump commands could have been placed at the top of the MAIN TEST
  // initial block, and the results would have been identical.
  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, tb);
  end


endmodule

