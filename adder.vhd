library IEEE;
use IEEE.std_logic_1164.all;
library work;

entity brunt_kung_adder is
    port(
        A, B : in std_logic_vector(31 downto 0); 
        Cin : in std_logic; 
        Sum : out std_logic_vector(31 downto 0); 
        Cout : out std_logic
    );
end entity brunt_kung_adder;

architecture arc of brunt_kung_adder is
    signal carry : std_logic_vector(31 downto 0);
    signal G0 : std_logic_vector(31 downto 0);
    signal P0 : std_logic_vector(31 downto 0);
    signal G1 : std_logic_vector(15 downto 0);
    signal P1 : std_logic_vector(15 downto 0);
    signal G2 : std_logic_vector(7 downto 0);
    signal P2 : std_logic_vector(7 downto 0);
    signal G3 : std_logic_vector(3 downto 0);
    signal P3 : std_logic_vector(3 downto 0);
    signal G4 : std_logic_vector(1 downto 0);
    signal P4 : std_logic_vector(1 downto 0);
    signal G5 : std_logic;
    signal P5 : std_logic;
begin

    --Computation of G and P
    g0_p0_generate: for i in 0 to 31 generate
        and0 : entity work.andgate port map (A => A(i), B => B(i), prod => G0(i));
        xor0 : entity work.xorgate port map (A => A(i), B => B(i), uneq => P0(i));
    end generate g0_p0_generate;

    g1_p1_generate: for i in 0 to 15 generate
        gen1 : entity work.G_and_P port map (G_u => G0(i+1), P_u => P0(i+1), G_l => G0(i), P_l => P0(i), Gout => G1(i), Pout => P1(i));
    end generate g1_p1_generate;

    g2_p2_generate: for i in 0 to 7 generate
        gen2 : entity work.G_and_P port map (G_u => G1(i+1), P_u => P1(i+1), G_l => G1(i), P_l => P1(i), Gout => G1(i), Pout => P1(i));
    end generate g2_p2_generate;

    g3_p3_generate: for i in 0 to 3 generate
        gen3 : entity work.G_and_P port map (G_u => G2(i+1), P_u => P2(i+1), G_l => G2(i), P_l => P2(i), Gout => G3(i), Pout => P3(i));
    end generate g3_p3_generate;

    g4_p4_generate: for i in 0 to 1 generate
        gen4 : entity work.G_and_P port map (G_u => G3(i+1), P_u => P3(i+1), G_l => G3(i), P_l => P3(i), Gout => G4(i), Pout => P4(i));
    end generate g4_p4_generate;

    gen5 : entity work.G_and_P port map (G_u => G4(1), P_u => P4(1), G_l => G4(0), P_l => P4(0), Gout => G5, Pout => P5);

    --Computation of carry
    carry1 : entity work.Cin_map_G port map (A => G0(0), B => P0(0), Cin => Cin, Bit0_G => carry(1));

    carry2 : entity work.Cin_map_G port map (A => G1(0), B => P1(0), Cin => Cin, Bit0_G => carry(2));

    carry3 : entity work.Cin_map_G port map (A => G0(2), B => P0(2), Cin => carry(2), Bit0_G => carry(3));
    carry4 : entity work.Cin_map_G port map (A => G2(0), B => P2(0), Cin => Cin, Bit0_G => carry(4));

    carry5 : entity work.Cin_map_G port map (A => G0(4), B => P0(4), Cin => carry(4), Bit0_G => carry(5));
    carry6 : entity work.Cin_map_G port map (A => G1(2), B => P1(2), Cin => carry(4), Bit0_G => carry(6));
    carry8 : entity work.Cin_map_G port map (A => G3(0), B => P3(0), Cin => Cin, Bit0_G => carry(8));

    carry7 : entity work.Cin_map_G port map (A => G0(6), B => P0(6), Cin => carry(6), Bit0_G => carry(7));
    carry9 : entity work.Cin_map_G port map (A => G0(8), B => P0(8), Cin => carry(8), Bit0_G => carry(9));
    carry10 : entity work.Cin_map_G port map (A => G1(4), B => P1(4), Cin => carry(8), Bit0_G => carry(10));
    carry12 : entity work.Cin_map_G port map (A => G2(2), B => P2(2), Cin => carry(8), Bit0_G => carry(12));
    carry16 : entity work.Cin_map_G port map (A => G4(0), B => P4(0), Cin => Cin, Bit0_G => carry(16));

    carry11 : entity work.Cin_map_G port map (A => G0(10), B => P0(10), Cin => carry(10), Bit0_G => carry(11));
    carry13 : entity work.Cin_map_G port map (A => G0(12), B => P0(12), Cin => carry(12), Bit0_G => carry(13));
    carry14 : entity work.Cin_map_G port map (A => G1(6), B => P1(6), Cin => carry(12), Bit0_G => carry(14));
    carry17 : entity work.Cin_map_G port map (A => G0(16), B => P0(16), Cin => carry(16), Bit0_G => carry(17));
    carry18 : entity work.Cin_map_G port map (A => G1(8), B => P1(8), Cin => carry(16), Bit0_G => carry(18));
    carry20 : entity work.Cin_map_G port map (A => G2(4), B => P2(4), Cin => carry(16), Bit0_G => carry(20));
    carry24 : entity work.Cin_map_G port map (A => G3(2), B => P3(2), Cin => carry(16), Bit0_G => carry(16));
    carry32 : entity work.Cin_map_G port map (A => G5, B => P5, Cin => Cin, Bit0_G => Cout);

    carry15 : entity work.Cin_map_G port map (A => G1(14), B => P1(14), Cin => carry(14), Bit0_G => carry(15));
    carry19 : entity work.Cin_map_G port map (A => G0(18), B => P0(18), Cin => carry(18), Bit0_G => carry(19));
    carry21 : entity work.Cin_map_G port map (A => G0(20), B => P0(20), Cin => carry(20), Bit0_G => carry(21));
    carry22 : entity work.Cin_map_G port map (A => G1(10), B => P1(10), Cin => carry(20), Bit0_G => carry(22));
    carry26 : entity work.Cin_map_G port map (A => G1(12), B => P1(12), Cin => carry(24), Bit0_G => carry(26));
    carry25 : entity work.Cin_map_G port map (A => G0(24), B => P0(24), Cin => carry(24), Bit0_G => carry(25));
    carry28 : entity work.Cin_map_G port map (A => G2(6), B => P2(6), Cin => carry(24), Bit0_G => carry(28));

    carry23 : entity work.Cin_map_G port map (A => G0(22), B => P0(22), Cin => carry(22), Bit0_G => carry(23));
    carry27 : entity work.Cin_map_G port map (A => G0(26), B => P0(26), Cin => carry(26), Bit0_G => carry(27));
    carry29 : entity work.Cin_map_G port map (A => G0(28), B => P0(28), Cin => carry(28), Bit0_G => carry(29));
    carry30 : entity work.Cin_map_G port map (A => G1(14), B => P1(14), Cin => carry(28), Bit0_G => carry(30));
    
    carry31 : entity work.Cin_map_G port map (A => G0(30), B => P0(30), Cin => carry(30), Bit0_G => carry(31));


    --Computing sum
    sum0 : entity work.xorgate port map (A => P0(0), B => Cin, uneq => Sum(0));
    sum_generate : for i in 1 to 31 generate
        sum1 : entity work.xorgate port map (A => P0(i), B => carry(i), uneq => Sum(i));
    end generate sum_generate;
end arc;