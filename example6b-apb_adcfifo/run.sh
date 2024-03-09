# vvp is the iVerilog run-time engine that executes the output of the iVerilog
# compiler, which in this case is apb_adcfifo.vvp

vvp apb_adcfifo.vvp && echo -e "\nSimulation Done. To view waves:\n  gtkwave test.vcd\n"

