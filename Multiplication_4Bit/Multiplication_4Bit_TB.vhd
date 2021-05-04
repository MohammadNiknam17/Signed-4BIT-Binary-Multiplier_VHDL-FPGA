LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
ENTITY Multiplication_4Bit_TB IS
END Multiplication_4Bit_TB;
 
ARCHITECTURE behavior OF Multiplication_4Bit_TB IS 

 
    COMPONENT Multiplication_4Bit
    PORT(
         x : IN  std_logic_vector(3 downto 0);
         y : IN  std_logic_vector(3 downto 0);
         p : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(3 downto 0) := (others => '0');
   signal y : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal p : std_logic_vector(7 downto 0);

 
BEGIN
 
   uut: Multiplication_4Bit PORT MAP (
          x => x,
          y => y,
          p => p
        );
   
	stim_proc:process
    begin
        for i in 0 to 15 loop
            x <= std_logic_vector(to_unsigned(i, x'length));
            for j in 0 to 15 loop
                y <= std_logic_vector(to_unsigned(j, y'length));
                wait for 10 ns;
            end loop;
        end loop;
        wait;
    end process;

END;
