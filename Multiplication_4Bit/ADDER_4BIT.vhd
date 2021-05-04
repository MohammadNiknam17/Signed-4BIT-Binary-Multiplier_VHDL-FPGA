library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_STD.ALL;

entity ADDER_4BIT is
	port(IN1, IN2 : in std_logic_vector(3 downto 0) ;
		  CIN : in std_logic ;
		  COUT : out std_logic ;
		  SUM : out std_logic_vector(3 downto 0)) ;
end ADDER_4BIT;

architecture Behavioral of ADDER_4BIT is

	signal C1, C2, C3 : std_logic ;

	component FA
		generic( D : time := 5 ns) ;
		port(X,Y,CIN : in std_logic ;
			  SUM, COUT : out std_logic) ;
	end component FA ;

begin

Inst_FA_1 : FA generic map (D => 0 ns)
port map (X => IN1(0), Y => IN2(0), CIN => CIN, COUT => C1, SUM => SUM(0)) ;

Inst_FA_2 : FA generic map (D => 0 ns)
port map (X => IN1(1), Y => IN2(1), CIN => C1, COUT => C2, SUM => SUM(1)) ;

Inst_FA_3 : FA generic map (D => 0 ns)
port map (X => IN1(2), Y => IN2(2), CIN => C2, COUT => C3, SUM => SUM(2)) ;

Inst_FA_4 : FA generic map (D => 0 ns)
port map (X => IN1(3), Y => IN2(3), CIN => C3, COUT => COUT, SUM => SUM(3)) ;
								 
end Behavioral;

