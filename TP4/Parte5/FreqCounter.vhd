library ieee;
use ieee.std_logic_1164.all;

entity FreqCounter is
	port(clkIn : in std_logic;
		  k : in std_logic_vector(31 downto 0);
		  upDown : in std_logic;
		  reset : in std_logic;
		  countOut : out std_logic_vector(6 downto 0));
end FreqCounter;

architecture Structural of FreqCounter is

	signal s_clkOut : std_logic;
	signal s_count : std_logic_vector(3 downto 0);
	
begin
	divider : entity work.FreqDivider(Behavioral)
								port map(clkIn => clkIn,
											k => k,
											clkOut => s_clkOut);
											
	counter : entity work.CounterUpDown4(Behavioral)
								port map(clk => s_clkOut,
											upDown => upDown,
											reset => reset,
											count => s_count);
											
	segments : entity work.Bin7SegDecoder(Behavioral)
								 port map(binInput => s_count,
											 decOut => countOut);
end Structural;