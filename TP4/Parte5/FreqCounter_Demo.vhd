library ieee;
use ieee.std_logic_1164.all;

entity FreqCounter_Demo is
	port(CLOCK_50 : in std_logic;
		  SW : in std_logic_vector(1 downto 0);
		  HEX0 : out std_logic_vector(6 downto 0));
end FreqCounter_Demo;

architecture Shell of FreqCounter_Demo is
begin
	system_core : entity work.FreqCounter(Structural) 
									 port map(ClkIn => CLOCK_50,
												 k => x"017D7840",
												 upDown => SW(0),
												 reset => SW(1),
												 countOut => HEX0(6 downto 0));
end Shell;