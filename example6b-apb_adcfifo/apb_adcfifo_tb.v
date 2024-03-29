`timescale 1 ns /  100 ps
module tb();

  // In testbenches, I usually use 'reg' to declare the inputs to the Device
  // Under Test (DUT), and I use 'wire' to declare the DUT's outputs
  reg  system_reset_n = 0;


  reg  [31:0] paddr   = 0;
  reg         psel    = 0;
  reg         penable = 0;
  reg         pwrite  = 0;
  reg  [31:0] pwdata  = 0;
  wire [31:0] prdata;
  reg  [31:0] prdata_actual = 0;
  wire        pready;

  reg [31:0] sensor_data;
  reg        sensor_data_valid;

  // ==========================================================================
  // Generate a clock that toggles every 5nsec, resulting in a 100MHz pulsing
  // clock with a 50% duty cycle
  reg system_clock_100mhz = 0;
  always #5 system_clock_100mhz <= !system_clock_100mhz;


  // ==========================================================================
  // INSTANTIATE DEVICE UNDER TEST (DUT)
  
  apb_adcfifo u_apb_adcfifo_0
  (
    .clk      (system_clock_100mhz),
    .rst_n    (system_reset_n),

    .paddr    (paddr),
    .psel     (psel),
    .penable  (penable),
    .pwrite   (pwrite),
    .pwdata   (pwdata),
    .prdata   (prdata),
    .pready   (pready),
      
    .i_data   (sensor_data),
    .i_data_v (sensor_data_valid)
  );


  // ==========================================================================
  // SENSOR DATA GENERATOR

  reg [3:0] clk_cnt;
  always @(posedge system_clock_100mhz) begin
    if (system_reset_n == 1'b0) begin
      sensor_data <= 32'h12345000;
      clk_cnt <= 4'h0;
    end else begin
      clk_cnt <= clk_cnt + 1;
      sensor_data_valid <= (clk_cnt == 4'hF);
      if (sensor_data_valid) begin
        sensor_data <= sensor_data + 1;
      end
    end
  end


  // ==========================================================================
  // APB WRITE TASK
  // This task emulates the processor when it performs an APB write operation.
  // The task takes four clock cycles. The 1st and 4th cycles are idle cycles
  // to ensure the bus is stable before and after the write operation. The 2nd
  // cycle drives the address, write data, sel and write signals.  The 3rd
  // cycle pulses the penable strobe, that clocks the pwdata bus value into a
  // register in the ad7490_spi block.
  task apb_write (input [31:0] i_addr, input [31:0] i_wdata);
    begin
      paddr   <= 0;
      psel    <= 0;
      penable <= 0;
      pwrite  <= 0;
      pwdata  <= 0;
      @(posedge system_clock_100mhz);
      paddr   <= i_addr;
      psel    <= 1;
      pwrite  <= 1;
      pwdata  <= i_wdata;
      @(posedge system_clock_100mhz);
      penable <= 1;
      @(posedge system_clock_100mhz);
      paddr   <= 0;
      psel    <= 0;
      penable <= 0;
      pwrite  <= 0;
      pwdata  <= 0;
      @(posedge system_clock_100mhz);
    end
  endtask


  // ==========================================================================
  // APB READ TASK
  task apb_read (input [31:0] i_addr, input [31:0] prdata_expect);
    begin
      paddr   <= 0;
      psel    <= 0;
      penable <= 0;
      pwrite  <= 0;
      pwdata  <= 0;
      @(posedge system_clock_100mhz);
      paddr   <= i_addr;
      psel    <= 1;
      pwrite  <= 0;
      pwdata  <= 0;
      @(posedge system_clock_100mhz);
      penable <= 1;
      @(posedge system_clock_100mhz);
      prdata_actual <= prdata;
      paddr   <= 0;
      psel    <= 0;
      penable <= 0;
      pwrite  <= 0;
      pwdata  <= 0;
      #1
      if (prdata_actual != prdata_expect) begin
        fail_cnt = fail_cnt + 1;
        $display($time, ": FAIL APB Read. Actual = %x Expect = %x",
        prdata_actual, prdata_expect);
      end else begin
        $display($time, ": PASS APB Read. Actual = %x Expect = %x",
        prdata_actual, prdata_expect);
      end
      @(posedge system_clock_100mhz);
    end
  endtask

  // ==========================================================================
  // ==========================================================================
  // MAIN TEST INITIAL BLOCK
  // This block does very little. It pulses the reset at the beginning of the
  // simulation and then just waits for a lot of clock ticks.

  // Initial blocks start at the beginning of the simulation, run one time and
  // stop when it reaches the end.
  integer ii = 0;
  integer ii_prev = 0;
  integer ii_delta = 0;
  integer ignore_first = 1;
  integer fail_cnt = 0;
  integer blink_rate = 300;
  reg [31:0] adc_data_expect = 0;
  reg [31:0] apb_addr = 0;
  initial begin

    // SIMULATION STARTUP
    // Verilog uses the $display to print text to the screen. It's syntax
    // is similar to C's printf.
    $display($time, " info: Start of Simulation ii = %d", ii);

    // Wait for 10 clocks, with the reset still assserted low.
    repeat(10) @(posedge system_clock_100mhz);

    // Drive the reset high which enables the apb_spi to start working. Wait
    // for 10 more clocks just for good measure.
    system_reset_n = 1;
    
    apb_read (32'h40000004, 32'h00010000);
    apb_write(32'h40000004, 32'h00000000);
    apb_read (32'h40000004, 32'h00000000);

    repeat(200) @(posedge system_clock_100mhz);

    for (ii=0; ii < 10; ii = ii + 1) begin
      apb_read(32'h40000000, 32'h12345000 + ii);
    end

    // Wait to allow all 16 ADCs to be read by the SPI block
    repeat (200) @(posedge system_clock_100mhz);

    $display("\n===================================================================================\n");
    if (fail_cnt == 0) begin
      $display($time, ": TEST PASSED");
    end else begin
      $display($time, ": TEST FAILED. %d tests failed", fail_cnt);
    end

    $display($time, " info: End of Simulation");

    // The $finish command stops the verilog simulation
    $finish;
  end

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

