library ieee;
use ieee.std_logic_1164.all;

entity ShiftRegisterN is
generic(N : positive := 8);
port(Sin : in std_logic_vector(N-1 downto 0);
	  clk : in std_logic;
	  dataOut : out std_logic_vector(N-1 downto 0 ));
end ShiftRegisterN;

architecture Behavioral of ShiftRegisterN is

	signal s_shiftReg : std_logic_vector(N-1 downto 0);
	
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			s_shiftReg <= s_shiftReg(N-2 downto 0) & '0';
		end if;
	end process;
	
	dataOut <= s_shiftReg;
	
end Behavioral;