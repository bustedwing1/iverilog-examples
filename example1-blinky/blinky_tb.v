//-----------------------------------------------------------------------------
// blinky_tb.v
//------------------------------------------------------------------------------

`timescale 1 ns /  100 ps







module tb;



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
 
 
 
  blinky #(9) u_blinky
 
  
   
  ( // Port List
    .clk(system_clock_100mhz), // input
    .rst_n(system_reset_n),    // input
    .led(gpio_led)             // output
  );


  // ==========================================================================
  // MAIN TEST INITIAL BLOCK

  integer ii = 0;
  integer ii_prev = 0;
  integer ii_delta = 0;
  integer fail_cnt = 0;
  integer first_time = 1;
  reg gpio_led2 = 0;
  initial
  begin
  
    // SIMULATION STARTUP
    // Verilog uses '$display' to print text to the screen. It's syntax
    // is similar to C's printf.
    $display($time, " info: Start of Simulation integer example = %d", ii_prev);
    
    // Wait for the 1st rising clock edge and then drive the reset low to
    // reset the blinky module.
    @(posedge system_clock_100mhz);
    system_reset_n <= 0;
    
    // Wait for 10 more clocks, with the reset still assserted low.
    repeat(10) begin
      @(posedge system_clock_100mhz);
    end
    
    // Drive the reset high which enables the blinky to start working. Wait
    // for 10 more clocks just for good measure.
    system_reset_n <= 1;
    repeat(10) @(posedge system_clock_100mhz);


    // SIMULATION RUNS FOR A LONG TIME. BLINKY SHOULD PULSE MANY TIMES
    // This waits for 10000 clocks. 
    for (ii=0; ii < 10000; ii = ii + 1) begin
      gpio_led2 <= gpio_led;
      @(posedge system_clock_100mhz);
      if (gpio_led != gpio_led2) begin
        ii_delta = ii - ii_prev;
        #1;
        if (ii_delta == 256) begin
          $display($time, " nsec : PASS GPIO_LED changing from %d to %d. blink rate = %d clocks", 
                   gpio_led2, gpio_led, ii_delta);
   
        end else begin
          if (!first_time) begin
            fail_cnt <= fail_cnt + 1;
            $display($time, " nsec: FAIL GPIO_LED changing from %d to %d. blink rate = %d clocks", 
                     gpio_led2, gpio_led, ii_delta);
                     
          end
        end
        first_time <= 0;
        ii_prev <= ii;
      end // if
    end // for

    // MOP-UP SIMULULATION
    repeat (20) @(posedge system_clock_100mhz);
    
    

    $display("\n=====================================================================\n");
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

