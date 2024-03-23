# iverilog is a verilog compiler that parses the Verilog RTL and testbench and
# outputs an executable file that can be run by iverlog's vvp run-time engine.

iverilog -o apb_serv_riscv.vvp `cat rtl_filelist.txt` bench/apb_serv_riscv_tb.v && echo "Compile Successful. Executable is: apb_serv_riscv.vvp"

