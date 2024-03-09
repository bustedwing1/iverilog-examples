# iverilog is a verilog compiler that parses the Verilog RTL and testbench and
# outputs an executable file that can be run by iverlog's vvp run-time engine.

iverilog -o apb_ram.vvp apb_ram.v apb_ram_tb.v && echo "Compile Successful. Executable is: apb_ram.vvp"

