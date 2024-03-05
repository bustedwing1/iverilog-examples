//-----------------------------------------------------------------------------
// File: blinky.v
// Description:
//   This module blinks an LED.
//
//------------------------------------------------------------------------------







module blinky
  #(
  parameter CNT_WIDTH  = 27 // This should make the LED toggle about every second
  )
  (
    input   clk,
    input   rst_n,
    output  led
  );



  reg                 led;  // 1-bit signal similar to a boolean
  reg [CNT_WIDTH-1:0] cnt;  // 32-bit signal similar to an integer


  always @(posedge clk)
  begin

    if (rst_n == 0) begin
      led <= 0;
      cnt <= 32'h0;
    end else begin
      led <= cnt[CNT_WIDTH-1];
      cnt <= cnt + 1;
    end
  end

endmodule

