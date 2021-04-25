library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU16 is
	port(a, b : in std_logic_vector(15 downto 0);
		  op : in std_logic_vector(2 downto 0);
		  r, m : out std_logic_vector(15 downto 0));
end ALU16;

architecture Behavioral of ALU16 is

	signal s_m : std_logic_vector(31 downto 0);

begin
	s_m <= std_logic_vector(unsigned(a) * unsigned(b));
	
	process(op, a, b, s_m)
	begin
		case op is
			when "000" =>
				r <= std_logic_vector(unsigned(a) + unsigned(b));
			when "001" =>
				r <= std_logic_vector(unsigned(a) - unsigned(b));
			when "010" =>
				r <= s_m(15 downto 0);
			when "011" =>
				r <= std_logic_vector(unsigned(a) / unsigned(b));
			when"100" =>
				r <= std_logic_vector(unsigned(a) rem unsigned(b));
			when"101" =>
				r <= a and b;
			when "110"=>
				r <= a or b;
			when others =>
				r <= a xor b;
		end case;
	end process;
	m <= s_m(31 downto 16) when (op = "010") else (others => '0');
end Behavioral;	