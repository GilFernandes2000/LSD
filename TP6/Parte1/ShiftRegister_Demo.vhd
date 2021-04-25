library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ShiftRegister_Demo is
	generic(N : positive := 8);
	port(CLOCK_50 : in std_logic;
		  SW : in std_logic_vector((N-1) downto 0);
		  LEDR : out std_logic_vector((N-1) downto 0));
end ShiftRegister_Demo;

architecture Shell of ShiftRegister_Demo is

	signal s_clkDiv : std_logic;
	
begin

	Clkd : entity work.ClkDividerN(Behavioral)
						generic map(N => 50000000)
						port map(clkIn => CLOCK_50,
									clkOut => s_clkDiv);
									
	system_core : entity work.ShiftRegisterN(Behavioral)
						generic map(N => 8)
						port map(clk => s_clkDiv,
									Sin => SW((N-1) downto 0),
									dataOut => LEDR((N-1) downto 0));
end Shell;