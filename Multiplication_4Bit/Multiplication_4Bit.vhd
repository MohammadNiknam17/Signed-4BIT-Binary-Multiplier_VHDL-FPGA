library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Multiplication_4Bit is
	port (
        x: in  std_logic_vector (3 downto 0);
        y: in  std_logic_vector (3 downto 0);
        p: out std_logic_vector (7 downto 0)
	);
end Multiplication_4Bit;


architecture structural of Multiplication_4Bit is
	
	signal G0, G1, G2:  std_logic_vector (3 downto 0);
	signal B0, B1, B2:  std_logic_vector (3 downto 0);
	signal TMP: std_logic;
	
	component ADDER_4BIT
	port(IN1, IN2 : in std_logic_vector(3 downto 0) ;
		  CIN : in std_logic ;
		  COUT : out std_logic ;
		  SUM : out std_logic_vector(3 downto 0)) ;
	end component;
	
	
	component HF
	port(A, B : in std_logic ;
			S, C : out std_logic) ;
	end component;
	
	
	
begin
	G0 <= (not(x(3) and y(1)), x(2) and y(1), x(1) and y(1), x(0) and y(1));
   G1 <= (not(x(3) and y(2)), x(2) and y(2), x(1) and y(2), x(0) and y(2));
   G2 <= (x(3) and y(3), not(x(2) and y(3)), not(x(1) and y(3)), not(x(0) and y(3)));
   B0 <= ('1', not(x(3) and y(0)), x(2) and y(0), x(1) and y(0));
	
	ADDER_1: ADDER_4BIT 
		port map (
            IN1 => G0,
            IN2 => B0,
            CIN => '0',
            COUT => B1(3), 
            SUM(3) => B1(2), 
            SUM(2) => B1(1), 
            SUM(1) => B1(0),
            SUM(0) => p(1)
				
        );
	ADDER_2: ADDER_4BIT 
		port map (
            IN1 => G1,
            IN2 => B1,
            CIN => '0',
            COUT => B2(3),
            SUM(3) => B2(2),
            SUM(2) => B2(1),
            SUM(1) => B2(0),
            SUM(0) => p(2)
        );
		
	ADDER_3: ADDER_4BIT 
		port map (
            IN1 => G2,
            IN2 => B2,
            CIN => '0',
            COUT => TMP,
            SUM => p(6 downto 3) 
        );
		  
	
	Half_Adder: HF
		port map (
		A => TMP,
		B => '1',
		S => P(7)
		);
		
	p(0) <= x(0) and y(0);
    
end structural;

