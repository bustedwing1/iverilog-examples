# iverilog is a verilog compiler that parses the Verilog RTL and testbench and
# outputs an executable file that can be run by iverlog's vvp run-time engine.

iverilog -o apb_blinky.vvp apb_blinky.v apb_blinky_tb.v && echo "Compile Successful. Executable is: blinky.vvp"

