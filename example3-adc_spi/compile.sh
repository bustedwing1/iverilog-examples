# iverilog is a verilog compiler that parses the Verilog RTL and testbench and
# outputs an executable file that can be run by iverlog's vvp run-time engine.

iverilog -o ad7490_spi.vvp ad7490_spi.v ad7490_model.v ad7490_spi_tb.v && echo "Compile Successful. Executable is: ad7490_spi.vvp"

