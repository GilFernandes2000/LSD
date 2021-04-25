library ieee;
use ieee.std_logic_1164.all;

entity ALU16_tb is
end ALU16_tb;

architecture Stimulus of ALU16_tb is

	signal s_op : std_logic_vector(2 downto 0);
	signal s_a, s_b : std_logic_vector(15 downto 0);
	signal s_r, s_m : std_logic_vector(15 downto 0);
	
begin
	uut: entity work.ALU16(Behavioral)
				port map(op => s_op,
							a => s_a,
							b => s_b,
							r => s_r, 
							m => s_m);
							
	stim_proc: process
	begin
		s_a <= x"FEDC";
		s_b <= x"0123";
		s_op <= "000";
		wait for 100 ns;
		s_op <= "001";
		wait for 100 ns; 
		s_op <= "010";
		s_b <= x"89AB";
		wait for 100 ns;
		s_op <= "011";
		s_b <= x"4567";
		wait for 100 ns;
		s_op <= "100";
		wait for 100 ns;
		s_a <= x"F30C";
		s_b <= x"F50A";
		s_op <= "101";
		wait for 100 ns;
		s_op <= "110";
		s_b <= x"0FA5";
		wait for 100 ns;
		s_op <= "111";
		wait for 100 ns;
		
		wait;
		
	end process;
end Stimulus;
		