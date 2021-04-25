library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux2_1 is
	port(sel : in std_logic;
		  dataIn0 : in std_logic;
		  dataIn1 : in std_logic;
		  dataOut : out std_logic);
end Mux2_1;

architecture Behavioral of Mux2_1 is

	signal s_andOut0, s_andOut1 : std_logic;
	
begin
	s_andOut0 <= not sel and dataIn0;
	s_andOut1 <= sel and dataIn1;
	dataOut <= s_andOut0 or s_andOut1;
end Behavioral;