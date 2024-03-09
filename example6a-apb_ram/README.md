Verilog Example 4 - APB RAM
============================================

This example develops a RAM that is can be accessed by the APB bus.

Get the Code
------------

```bash
git clone https://github.com/bustedwing1/iverilog-examples
cd iverilog-examples/example4-apb_bus
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

* apb_ram.v - This is the synthesizable Verilog memory (512x32).
* apb_ram_tb.v - This is the simulation testbench.
* clean.sh - This script deletes unneeded files
* compile.sh - This script compiles the verilog files
* run.sh - This script runs the compiled executable
* README.md - This script runs the compiled executable

  
  

