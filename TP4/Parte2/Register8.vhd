library ieee;
use ieee.std_logic_1164.all;

entity Register8 is 
	port(clk : in std_logic;
		  wrEn : in std_logic;
		  dataIn : in std_logic_vector(7 downto 0);
		  dataOut : out std_logic_vector(7 downto 0 ));
end Register8;

architecture Behavioral of Register8 is
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			if(wrEn= '1') then
				dataOut <= dataIn;
			end if;
		end if;
	end process;
end Behavioral;
