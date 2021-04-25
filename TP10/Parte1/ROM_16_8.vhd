library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM_16_8 is
	port(addr : in std_logic_vector(3 downto 0);
		 dataOut : out std_logic_vector(7 downto 0));
end ROM_16_8;

architecture Behavioral of ROM_16_8 is

	subtype TDataWord is std_logic_vector(7 downto 0);
	type TROM is array (0 to 15) of TDataWord;
	constant c_memory : TROM := ("00000000", "00001100", "00110000", "00011000", "00010000", "00000010", "01000000", "00011110",
								 "01001000", "01100110", "00000010", "01111100", "00000000", "01000000", "00010000", "00001000");
								 
begin
	dataOut <= c_memory(to_integer(unsigned(addr)));
end Behavioral;