# vvp is the iVerilog run-time engine that executes the output of the iVerilog
# compiler, which in this case is apb_adc_fifo.vvp

vvp apb_adc_fifo.vvp && echo -e "\nSimulation Done. To view waves:\n  gtkwave test.vcd\n"

