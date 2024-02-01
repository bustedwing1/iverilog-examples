//-----------------------------------------------------------------------------
// Block: apb_blinky
// Description:
//   This module blinks an LED. The blink rate is programmable by the
//   APB interface
//------------------------------------------------------------------------------

module apb_blinky #(
  parameter NO_PARAMS  = 32  // provided for syntax example only
) (
  input   clk,
  input   rst_n,
  
  // These are the APB signals from/to the processor
  input  [31:0] paddr,
  input         psel,
  input         penable,
  input         pwrite,
  input  [31:0] pwdata,
  output [31:0] prdata,
  output        pready,
  output        perr,

  output  led
);

  // The APB interface allows the processor to write and read the blink rate.
  // So the blink rate is now variable, versus the initial blinky design that
  // had a fixed blink rate. 
  

  reg [31:0] blink_rate;
  reg [31:0] prdata;
  reg        pready;
  reg        perr;

  always @(posedge clk) begin
    if (rst_n == 0) begin
      blink_rate <= 32'd128;
      prdata   <= 32'h0;
      pready   <= 1'b0;
      perr     <= 1'b0;    
    end else begin
      if (psel && pwrite && penable) begin
        case (paddr[7:0])
          4 :  blink_rate <= pwdata;
          default : ;
        endcase
      end

      case (paddr[7:0])
        4 :  prdata <= blink_rate;
        default : prdata <= 0;
      endcase
      
      pready <= 1'b1;
      perr   <= 1'b0;    
    end
  end

  // All registers in this module can be viewed as flip-flops.  FYI, this is not
  // necessarily true in other modules.
  reg        led;
  reg [31:0] cnt;

  // This always block waits for a rising of of the system clock. It then runs
  // to completion and returns the top, where it waits for the next rising clock
  // edge.
  
  // The reset signal for this design is active low.  Active low reset signals are
  // common for many FPGA designs, and it just means that the design is initialized
  // when the reset is low (or 0). In this example, when the rising edge starts the 
  // always block, the rst_n input signal is checked to see if it is low (0), and if
  // it is then the flip-flop registers are cleared.
  
  // If the rst_n signal is high (1) then the else conditional code is executed. The
  // counter is incremented and the LED output is assigned to the most significant 
  // bit of the counter. Note, the '<=' assignment is used. This is called a
  // blocking assignment, which I recommend you always use for Flip-Flops... more on
  // this later.
  
  always @(posedge clk) begin
    if (rst_n == 0) begin
      cnt <= 32'h0;
      led <= 0;
    end else begin
      if (cnt < blink_rate) begin
        cnt <= cnt + 1;
      end else begin       
        cnt <= 32'b0;
      end
      if (cnt == 32'h1) begin
        led <= !led;
      end
    end
  end

endmodule

