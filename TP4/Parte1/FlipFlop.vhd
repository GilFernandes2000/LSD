library ieee;
use ieee.std_logic_1164.all;

entity FlipFlop is
	port(clk : in std_logic;
		  d : in std_logic;
		  enable : in std_logic;
		  reset : in std_logic;
		  q : out std_logic);
end FlipFlop;

architecture Behavioral of FlipFlop is
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				q <='0';
			elsif (enable = '1') then
				q <= d;
			end if;
		end if;
	end process;
end Behavioral;