# vvp is the iVerilog run-time engine that executes the output of the iVerilog
# compiler, which in this case is apb_serv_riscv.vvp

vvp apb_serv_riscv.vvp && echo -e "\nSimulation Done. To view waves:\n  gtkwave test.vcd\n"

