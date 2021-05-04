library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA is
	generic( D : time := 5 ns) ;
	port(X,Y,CIN : in std_logic ;
		  SUM, COUT : out std_logic) ;
end entity FA ;

architecture STR of FA is 

	signal T1, T2, T3 : std_logic ;

	component HF
		port(A, B : in std_logic ;
				S, C : out std_logic) ;
	end component ;

begin

	COUT <= T1 or T2 after D;
	Inst_HF_1 : HF port map (A => X, B => Y, C => T1, S => T3) ;
	Inst_HF_2 : HF port map (A => T3, B => CIN, C => T2, S => SUM) ;

end architecture STR ;
