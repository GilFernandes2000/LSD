library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AddSub4 is
	port(a : in std_logic_vector(3 downto 0);
		  b : in std_logic_vector(3 downto 0);
		  cin : in std_logic;
		  s : out std_logic_vector(3 downto 0);
		  count : out std_logic);
end AddSub4;

architecture Structural of AddSub4 is

	signal s_b : std_logic_vector(3 downto 0);
	signal S_cin : std_logic;
	
begin
	process(s_b)
	begin
		if(sub = '0') then
			s_b <= b;
			s_cin <= '0';
		else
			s_b <= not b;
			s_cin <= '1';
		end if;
	end process;
	
		system_core : entity work.Adder4(Structural)
							port map(a => a(3 downto 0),
										b => b(3 downto 0),
										cin => cin,
										s => s(3 downto 0),
										count => count);
end Structural;

architecture Behavioral of AddSub4 is

	signal s_a, s_b, s_s : unsigned(4 downto 0);
	
begin
	s_a <= '0' & unsigned(a);
	s_b <= '0' & unsigned(b);
	s_s <= (s_a + s_b) when (cin = '0') else
			 (s_a - s_b);
	s <= std_logic_vector(s_s(3 downto 0));
	count <= s_s(4);
end Behavioral;
						