library ieee;
use ieee.std_logic_1164.all;

entity RAM_1P_16_8_tb is
end RAM_1P_16_8_tb;

architecture Stimulus of RAM_1P_16_8_tb is
	signal s_clk, s_wrEn : std_logic;
	signal s_addr : std_logic_vector(3 downto 0);
	signal s_wrData, s_rdData : std_logic_vector(7 downto 0);
	
begin
	ram_ut : entity work.RAM_1P_16_8(Behavioral)
				port map(wrClk => s_clk, 
						 wrEn => s_wrEn,
						 wrData => s_wrData,
						 addr => s_addr,
						 rdData => s_rdData);
						 
	clk : process
	begin
		s_clk <= '0'; wait for 10 ns;
		s_clk <= '1'; wait for 10 ns;
	end process;
	
	stim : process
	begin
		wait for 5 ns;
		s_wrEn <= '1';
		s_wrData <= X"55";
		s_addr <= "0000";
		wait for 20 ns;
		s_addr <= "0001";
		wait for 20 ns;
		s_wrData <= X"AA";
		s_addr <= "0100";
		wait for 20 ns;
		s_addr <= "0111";
		wait for 20 ns;
		s_wrEn <= '0';
		s_addr <= "0000";
		wait for 20 ns;
		s_addr <= "0011";
		wait for 20 ns;
		s_addr <= "1000";
		wait for 20 ns;
		s_addr <= "0001";
		wait for 20 ns;
		s_addr <= "1111";
		wait for 20 ns;
	end process;
end Stimulus;