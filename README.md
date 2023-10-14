# 32-bit-Brunt-Kung-Adder
This is a 32-bit logarithmic adder based on Brunt-Kung Architecture. The adder module takes in two 32-bit signals and one single-bit carry as input and generates a 32-bit sum and a carry out.
The delay of the adder circuit is proportional to log<sub>2</sub>(32) = 5 full adder delays.  GHDL open-source simualator is used to test the design and gtkwave is used to visualize timing diagram. </br>
Testing the design: </br>
Testing is done by testbench.vdh. generate_tests.py generates 10 random test vectors. Testbench reads those test vectors, simulates it and prints result. A gtkwave window pops up for timing analysis </br>

PS: Run makefile to simulate the design with random vectors in one shot
