Intro to Verilog for Software Folk
==================================

This first example implements Blinky (of course).

Youtube Video
-------------

* (https://www.youtube.com/@BustedWing)
* [iVerilog and GTKWave Intro](https://youtu.be/5A15qHDWmLY?si=aOe4LcHdFczW0A7r)
* [Verilog for Software Engineers](https://youtu.be/Fz_bga0tyJ8?si=qy0pQ9rkW5G2q-dh)
* [Verilog Testbench for Blinky](https://youtu.be/pnTZlvEVo28?si=6645zgLUIId43shw)

Get the Code
------------

```bash
git clone https://github.com/bustedwing1/iverilog-examples
cd iverilog-examples/example1
```


My Setup
--------

Running Ubuntu 22.04 on Virtualbox VM, recording with ShareX


Install iVerilog and GTKWaves
-----------------------------

```bash
sudo apt update
sudo apt upgrade
sudo apt install iverilog gtkwave
```


Compile and Run iVerilog
------------------------

```bash
./compile.sh
./run.sh
gtkwaves test.vcd
```


Files
-----

* blinky.v - This is the synthesizable Verilog module.
* blinky_tb.v - This is the simulation testbench.
* clean.sh - This script deletes unneeded files
* compile.sh - This script compiles the verilog files
* run.sh - This script runs the compiled executable
* README.md - This script runs the compiled executable


