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

  wire        spi_sclk;
  wire        spi_cs_n;
  wire        spi_mosi; // Main to Sub
  wire        spi_miso; // Sub to Main


  // ==========================================================================
  // Generate a clock that toggles every 5nsec, resulting in a 100MHz pulsing
  // clock with a 50% duty cycle
  reg system_clock_100mhz = 0;
  always #5 system_clock_100mhz <= !system_clock_100mhz;

  // ==========================================================================
  // Instantiate the ad7490_spi module, call the instance name u_dut. It is common
  // to prefix instance names with "u_" (primarily for historical reasons). It
  // is also common for testbenches to call the the module being tested the
  // Device Under Test (DUT) or Unit Under Test (UUT).
  
  // The syntax for a module instantiation is the module name (ad7490_spi), followed
  // by optional parameters (in this case CNT_WIDTH), followed by the instance
  // name (u_dut), followed by the module's IO (inputs and outputs). The IOs are
  // in a comma separated list. In this example a named port syntax is used
  // of dot '.', followed by the module's internal name, followed by the 
  // calling module's (the testbench module's) external name in parentheses. Note,
  // Verilog also supports a position port naming syntax, which is almost never
  // used (except for tool-generated netlists).  
  ad7490_spi #(16) u_spi (
    .clk     (system_clock_100mhz),
    .rst_n   (system_reset_n),

    .paddr   (paddr),
    .psel    (psel),
    .penable (penable), 
    .pwrite  (pwrite),    
    .pwdata  (pwdata),   
    .prdata  (prdata),    
    .pready  (pready),    

    .spi_sclk(spi_sclk),
    .spi_cs_n(spi_cs_n),
    .spi_mosi(spi_mosi),  // Main to Sub
    .spi_miso(spi_miso)   // Sub to Main
  );



ad7490_model ad7490_model
(  
    .spi_sclk(spi_sclk),
    .spi_cs_n(spi_cs_n),
    .spi_mosi(spi_mosi),  // Main to Sub
    .spi_miso(spi_miso)   // Sub to Main
);


  // ==========================================================================
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
    repeat(10) @(posedge system_clock_100mhz);

    // Verify that spi block defaults to not enabled
    apb_read(32'h40000040, 0);
    
    // Enable spi block
    apb_write(32'h40000040, 32'h1);

    // Read-back enable bit
    apb_read(32'h40000040, 1);
    
    // Wait to allow all 16 ADCs to be read by the SPI block
    repeat (6500) @(posedge system_clock_100mhz);

    // Read each of the 16 ADC values.
    adc_data_expect = 'h10000; 
    for (ii =0; ii < 64; ii = ii + 4) begin
      apb_read(ii, adc_data_expect);
      adc_data_expect = adc_data_expect + 'h111;
    end
    
    // MOP-UP SIMULULATION
    repeat (100) @(posedge system_clock_100mhz);

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

