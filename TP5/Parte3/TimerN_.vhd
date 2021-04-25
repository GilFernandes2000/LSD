library ieee;
use ieee.std_logic_1164.all;

entity TimerN_ is
	port(SW : in std_logic_vector(2 downto 0);
		  CLOCK_50 : in std_logic;
		  LEDR : out std_logic_vector(0 downto 0));
end TimerN_;

architecture Shell of TimerN_ is
begin
	system_core : entity work.TimerN(Behavioral)
								port map(clk => CLOCK_50,
											reset => SW(0),
											start => SW(1),
											enable => SW(2),
											timerOut => LEDR(0));
end Shell;