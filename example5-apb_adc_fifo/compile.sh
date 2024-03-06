# iverilog is a verilog compiler that parses the Verilog RTL and testbench and
# outputs an executable file that can be run by iverlog's vvp run-time engine.

iverilog -o apb_adc_fifo.vvp apb_adc_fifo.v apb_adc_fifo_tb.v && echo "Compile Successful. Executable is: apb_adc_fifo.vvp"

