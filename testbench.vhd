library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;

entity testbench is
end;

architecture arc of testbench is
    signal Ain, Bin, S : std_logic_vector(31 downto 0);
    signal Cin, Cout : std_logic;

    begin
        dut : entity work.brunt_kung_adder port map (A => Ain, B => Bin, Cin => Cin, Sum => S, Cout => Cout);

        process begin
            for i in 0 to 2 loop
                for j in 0 to 2 loop
                    for k in std_logic range '0' to '1' loop
                        Ain <= std_logic_vector(to_signed(i, Ain'length));
                        Bin <= std_logic_vector(to_signed(j, Bin'length));
                        Cin <= k;
                        wait for 10 ns; 
                        assert S = i + j + to_integer(k) report "Failed";
                    end loop;
                end loop;
            end loop;
        end process;
end arc;