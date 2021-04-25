library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux4_1 is
	port(sel : in std_logic_vector(1 downto 0);
		  inputs : in std_logic_vector(3 downto 0);
		  output : out std_logic);
end Mux4_1;

architecture Behavioral of Mux4_1 is
begin
	process(sel, inputs)
	begin
		if(sel = "00") then
			output <= inputs(0);
		elsif(sel = "01") then
			output <= inputs(1);
		elsif(sel = "10") then
			output <= inputs(2);
		else 
			output <= inputs(3);
		end if;
	end process;
end Behavioral;