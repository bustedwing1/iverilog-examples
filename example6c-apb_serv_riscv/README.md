Verilog Example 5 - APB ADC FIFO
============================================

This example allows the external processor (using APB) to load the
SERV's memory.

Get the Code
------------

```bash
git clone https://github.com/bustedwing1/iverilog-examples
cd iverilog-examples/example6c-apb_serv_riscv
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
./scripts/compile_iverilog.sh 
./scripts/sim_iverilog.sh 
gtkwaves test.vcd
```

Files
-----

* apb_serv_riscv.v - This is the synthesizable Verilog FIFO (512x32).
* apb_serv_riscv_tb.v - This is the simulation testbench.
* clean.sh - This script deletes unneeded files
* compile.sh - This script compiles the verilog files
* run.sh - This script runs the compiled executable
* README.md - This script runs the compiled executable


  

