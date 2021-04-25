library ieee;
use ieee.std_logic_1164.all;

entity ShiftRegister4 is
port(Sin : in std_logic_vector(3 downto 0);
	  clk : in std_logic;
	  dataOut : out std_logic_vector(3 downto 0 ));
end ShiftRegister4;

architecture Behavioral of ShiftRegister4 is

	signal s_shiftReg : std_logic_vector(3 downto 0);
	
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			s_shiftReg <= s_shiftReg(2 downto 0) & '0';
		end if;
	end process;
	
	dataOut <= s_shiftReg;
	
end Behavioral;