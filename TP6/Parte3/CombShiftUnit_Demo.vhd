library ieee;
use ieee.std_logic_1164.all;

entity CombShiftUnit_Demo is
	port(SW : in std_logic_vector(10 downto 0);
		  KEY : in std_logic_vector(2 downto 0);
		  LEDR : out std_logic_vector(7 downto 0));
end CombShiftUnit_Demo;

architecture Shell of CombShiftUnit_Demo is
begin
	system_core : entity work.CombShiftUnit(Behavioral)
								port map(dataIn => SW(7 downto 0),
											rotate => KEY(0),
											dirLeft => KEY(1),
											shArith => KEY(2),
											shAmount => SW(10 downto 8),
											dataOut => LEDR(7 downto 0));
end Shell;