PYTHON=python3
GHDL=ghdl
GTKWAVE=gtkwave

all:
	@$(PYTHON) generate_tests.py
	@$(GHDL) -a gates.vhd g_and_p.vhd adder.vhd testbench.vhd
	@$(GHDL) -e testbench
	@$(GHDL) -r testbench --wave=wave.ghw
	@$(GTKWAVE) wave.ghw