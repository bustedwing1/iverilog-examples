iVerilog Example 3 - SPI for AD7490 
============================================

This example develops a spi interface for the AD7490 ADC. This includes the
Verilog design and testbench. A minimal AD7490 simulation model was developed
that supports the converter's sequential mode, accessing each of the sixteen
converters in sequence. The resulting measurements are stored in the SPI block
and the process can access them via an APB interface.

The converters documentation is here: https://www.analog.com/en/products/ad7490.html
The APB specification is: https://developer.arm.com/documentation/ihi0024/latest/


Get the Code
------------

```bash
git clone https://github.com/bustedwing1/iverilog-examples
cd iverilog-examples/example3
```

Install iVerilog and GTKWaves
-----------------------------

Running Ubuntu 22.04

```bash
sudo apt update
sudo apt upgrade
sudo apt install iverilog gtkwaves
```

Run iVerilog Simulator
----------------------

```bash
./compile.sh
./run.sh
gtkwaves test.vcd
```

Files
-----

* ad7490_spi.v - This is the synthesizable Verilog module.
* ad7490_spi_tb.v - This is the simulation testbench.
* ad7490_model.v - This is a minimal simulation model of the ADC
* clean.sh - This script deletes unneeded files
* compile.sh - This script compiles the verilog files
* run.sh - This script runs the compiled executable
* README.md - This script runs the compiled executable

  
  

