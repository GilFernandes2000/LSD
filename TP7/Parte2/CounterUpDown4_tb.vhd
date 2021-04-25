library ieee;
use ieee.std_logic_1164.all;

entity CounterUpDown4_tb is
end CounterUpDown4_tb;

architecture Stimulus of CounterUpDown4_tb is

	signal s_clk : std_logic;
	signal s_upDown : std_logic;
	signal s_reset : std_logic;
	signal s_count : std_logic_vector(3 downto 0);
	
begin
	
	uut: entity work.CounterUpDown4(Behavioral)
			port map(clk => s_clk,
						upDown => s_upDown,
						reset => s_reset,
						count => s_count);
						
	clk_proc: process
	begin
		s_clk <= '0';
		wait for 100 ns;
		s_clk <= '1';
		wait for 100 ns;
	end process;
	
	stim_proc: process
	begin
		s_reset <= '1';
		s_upDown <= '1';
		wait for 325 ns;
		
		s_reset <= '0';
		wait for 25 ns;
		
		s_upDown <= '0';
		wait for 200 ns;
		
		s_upDown <= '1';
		wait for 200 ns;
	end process;
end stimulus;