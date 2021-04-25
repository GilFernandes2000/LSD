library ieee;
use ieee.std_logic_1164.all;

entity SeqDe1001 is
	generic(N : positive :=8);
	port(CLOCK_50 : in std_logic;
		  SW : in std_logic_vector(1 downto 0);
		  LEDR : out std_logic_vector(0 downto 0));
end SeqDe1001;

architecture Shell of SeqDe1001 is
	signal s_clk : std_logic;
begin
	
	clk : entity work.ClkDividerN(Behavioral)
						generic map(divFactor => 250000000‬)
						port map(clkIn => CLOCK_50,
									clkOut => s_clk);
									
	system_core : entity work.SeqDetFSM(BEHAVIOR)
						port map(clock => s_clk,
									reset => SW(1),
									Xin => SW(0),
									Yout => LEDR(0));
end Shell;