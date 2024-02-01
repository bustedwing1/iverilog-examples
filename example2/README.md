iVerilog Example 2 - APB Processor Interface
============================================

The first example of blinky had a fixed blink rate.
* [Verilog for Software engineers](https://youtu.be/Fz_bga0tyJ8?si=C9Uw7y_QNes2AqZc)

This 2nd example extends blinky by adding an APB interface, allowing a processor
to select the blink frequency.

The APB specification is: https://developer.arm.com/documentation/ihi0024/latest/


Get the Code
------------

```bash
git clone https://github.com/bustedwing1/iverilog-examples
cd iverilog-examples/example2
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

* apb_blinky.v - This is the synthesizable Verilog module.
* apb_blinky_tb.v - This is the simulation testbench.
* clean.sh - This script deletes unneeded files
* compile.sh - This script compiles the verilog files
* run.sh - This script runs the compiled executable
* README.md - This script runs the compiled executable


