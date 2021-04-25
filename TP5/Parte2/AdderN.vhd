library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AdderN is
	generic(N : positive := 8 );
	port(operand0 : in std_logic_vector((N-1) downto 0);
		  operand1 : in std_logic_vector((N-1) downto 0);
		  result : out std_logic_vector((N-1) downto 0));
end AdderN;

architecture Behavioral of AdderN is
begin
	result <= std_logic_vector(unsigned(operand0) + unsigned(operand1));
end Behavioral;