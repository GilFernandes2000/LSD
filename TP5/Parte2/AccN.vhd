library ieee;
use ieee.std_logic_1164.all;

entity AccN is
	generic(N : positive :=8);
	port(reset : in std_logic;
		  clk : in std_logic;
		  enable : in std_logic;
		  dataIn : in std_logic_vector((N-1) downto 0);
		  dataOut : out std_logic_vector((N-1) downto 0));
end AccN;

architecture Structural of AccN is

	signal s_result, s_dataOut : std_logic_vector((N-1) downto 0);
	
begin
	Adder : entity work.AdderN(Behavioral)
					port map(operand0 => dataIn,
								operand1 => s_dataOut,
								result => s_result);
								
	Reg : entity work.RegN(Behavioral)
					port map(reset => reset,
								clk => clk,
								enable => enable,
								dataIn => s_result,
								dataOut => s_dataOut);
								
	dataOut <= std_logic_vector(s_dataOut);
end Structural;