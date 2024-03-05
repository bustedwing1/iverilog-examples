# iverilog is a verilog compiler that parses the Verilog source code and outputs
# executable bytecode that can be run by iverilog's vvp run time engine. This is
# similar with how Java's javac compiler generates bytecode for the Java Runtime
# Environment (JRE).

iverilog -o blinky.vvp blinky.v blinky_tb.v && \
echo "Compile Successful. Executable is: blinky.vvp"

