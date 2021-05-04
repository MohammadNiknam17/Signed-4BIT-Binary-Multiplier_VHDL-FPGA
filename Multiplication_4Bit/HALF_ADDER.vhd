library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HF is
	port(A, B : in std_logic ;
			S, C : out std_logic) ;
end entity HF ;

architecture STR of HF is

begin

	S <= A xor B ;
	C <= A and B ;
	
end architecture STR ;
