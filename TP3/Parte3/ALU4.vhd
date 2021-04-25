library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU4 is
	port(a, b : in std_logic_vector(3 downto 0);
		  op : in std_logic_vector(2 downto 0);
		  r, m : out std_logic_vector(3 downto 0));
end ALU4;

architecture Behavioral of ALU4 is

	signal s_m : std_logic_vector(7 downto 0);

begin
	s_m <= std_logic_vector(signed(a) * signed(b));
	
	process(op, a, b, s_m)
	begin
		case op is
			when "000" =>
				r <= std_logic_vector(signed(a) + signed(b));
			when "001" =>
				r <= std_logic_vector(signed(a) - signed(b));
			when "010" =>
				r <= s_m(3 downto 0);
			when "011" =>
				r <= std_logic_vector(signed(a) / signed(b));
			when"100" =>
				r <= std_logic_vector(signed(a) rem signed(b));
			when"101" =>
				r <= a and b;
			when "110"=>
				r <= a or b;
			when others =>
				r <= a xor b;
		end case;
	end process;
	m <= s_m(7 downto 4) when (op = "010") else (others => '0');
end Behavioral;	