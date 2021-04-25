library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FreqDivider_Demo is
	port(CLOCK_50 : in std_logic;
		  LEDR : out std_logic_vector(0 downto 0));
end FreqDivider_Demo;

architecture Shell of FreqDivider_Demo is
begin
	system_core : entity work.FreqDivider(Behavioral)
								port map(clkIn => CLOCK_50,
											k => x"017D7840",
											clkOut => LEDR(0));
end Shell;
											