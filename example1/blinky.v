//-----------------------------------------------------------------------------
// Block: blinky
//
// git clone https://github.com/bustedwing1/iverilog-examples
// cd iverilog-examples/example1
//
// Description:
//   This module blinks an LED.
// Parameters:
//   CNT_WIDTH - This defines the number of bits in the counter.  Increasing
//               the number of bits slows the blink rate, and decreasing speeds
//               up the blink rate. It is set to 8 for a fast blink rate during
//               simulation. It should probably be increased to 28-ish when
//               used on actually hardware.
//------------------------------------------------------------------------------

// Modules are similar to Java classes and provide a means of bundling data and
// functionality together. 
module blinky

  // PARAMETERS
  // Parameters are optional constants similar to parameters passed to a Java
  // constructor.
  #(parameter CNT_WIDTH  = 27) // This should make the LED toggle about every second
  
  // PORT LIST
  // The port list is similar to an object's public variables. All communication
  // is through these signals. 
  ( 
    input   clk,   // The clock is pulsing signal that triggers the module to 
                   // execute on each rising edge
    input   rst_n, // The reset puts the module into a known initial state.
    output  led    // This signal is connected to an FPGA GPIO that drives the LED
  );

  // Registers are similar to private variables
  // All registers in this module can be viewed as flip-flops.  FYI, this is not
  // necessarily true in other Verilog modules.
  reg        led;  // 1-bit signal similar to a boolean
  reg [31:0] cnt;  // 32-bit signal similar to an integer

  // ================================================================================
  // ALWAYS BLOCK
  // An always block is similar to a method that is triggered by an event, runs
  // to completion, and the waits for the next trigger event.
  
  // This always block starts on every rising of of the system clock. It then runs
  // to completion and stops. It then waits for the next rising clock edge.
  
  // The reset signal for this design is active low.  Active low reset signals are
  // common for many FPGA designs, and it just means that the design is initialized
  // when the reset is low (or 0). In this example, when the clock'S rising edge 
  // starts the always block, the rst_n input signal is checked to see if it is 
  // low (0), and if it is then the flip-flop registers are cleared.
  
  // If the rst_n signal is high (1) then the else conditional code is executed. The
  // counter is incremented and the LED output is assigned to the most significant 
  // bit of the counter. Note, the '<=' assignment is used. This is called a
  // non-blocking assignment, which I recommend you always use for Flip-Flops... 
  // more on this another time.
  
  always @(posedge clk) begin
    if (rst_n == 0) begin
      cnt <= 32'h0;
      led <= 0;
    end else begin
      led <= cnt[CNT_WIDTH-1];
      cnt <= cnt + 1;
    end
  end

endmodule

