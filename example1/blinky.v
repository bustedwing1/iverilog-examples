//-----------------------------------------------------------------------------
// Block: blinky
// Description:
//
//------------------------------------------------------------------------------

module blinky #(
  parameter CNT_WIDTH  = 8
) (
  input   clk,
  input   rst_n,
  output  led
);
  reg        led;
  reg [31:0] cnt;

  always @(posedge clk) begin
    if (rst_n == 0) begin
      led <= 0;
      cnt <= 32'h0;
    end else begin
      cnt <= cnt + 1;
      led <= cnt[CNT_WIDTH-1];
    end
  end

endmodule

