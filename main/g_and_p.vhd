library ieee;
use ieee.std_logic_1164.all;
library work;

entity G_and_P is
    port(
        G_u, P_u, G_l, P_l : in std_logic;
        Gout, Pout : out std_logic
    );
end entity G_and_P;

architecture arc of G_and_P is
    begin
        gate1 : entity work.Cin_map_G port map (G_u, P_u, G_l, Gout);
        gate2 : entity work.andgate port map (P_u, P_l, Pout);
end arc;