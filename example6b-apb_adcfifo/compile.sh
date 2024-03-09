# iverilog is a verilog compiler that parses the Verilog RTL and testbench and
# outputs an executable file that can be run by iverlog's vvp run-time engine.

iverilog -o apb_adcfifo.vvp apb_adcfifo.v apb_adcfifo_tb.v && echo "Compile Successful. Executable is: apb_adcfifo.vvp"

