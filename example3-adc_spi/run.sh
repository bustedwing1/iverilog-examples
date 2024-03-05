# vvp is the iVerilog run-time engine that executes the output of the iVerilog
# compiler, which in this case is ad7490_spi.vvp

 vvp ad7490_spi.vvp && echo -e "\nSimulation Done. To view waves:\n  gtkwave test.vcd\n"

