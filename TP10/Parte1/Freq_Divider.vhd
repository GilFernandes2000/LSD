library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Freq_Divider is
	generic(K : positive := 25000000);
	port(	clkIn		: in std_logic;
			clkOut	: out std_logic);
end Freq_Divider;

architecture Behavioral of Freq_Divider is
	
	signal s_counter : integer := 1;
	signal tmp : std_logic := '0';
	
begin
	process(clkIn)
	begin
		if( rising_edge(clkIn) ) then
			s_counter <= s_counter+1;
			if (s_counter=K) then
				tmp <= not tmp;
				s_counter <= 1;
			end if;
		end if;
		clkOut <= tmp;
	end process;
end Behavioral;