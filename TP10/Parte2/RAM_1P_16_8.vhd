library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM_1P_16_8 is
	generic(N : positive := 8;
			  ad : positive := 4);
	port(wrClk : in std_logic;
		 wrEn : in std_logic;
		 wrData : in std_logic_vector((N-1) downto 0);
		 addr : in std_logic_vector((ad-1) downto 0);
		 rdData : out std_logic_vector((N-1) downto 0));
end RAM_1P_16_8;

architecture Behavioral of RAM_1P_16_8 is

	constant NUM_WORDS : integer := (2**ad);
	subtype TDataWord is std_logic_vector((N-1) downto 0);
	type TMemory is array(0 to NUM_WORDS-1) of TDataWord;
	signal S_memory : TMemory;-- podem ser colocados valores iniciais aqui
	
begin
	process(wrClk)
	begin
		if(rising_edge(wrClk)) then
			if(wrEn = '1') then
				s_memory(to_integer(unsigned(addr))) <= wrData;
			end if;
		end if;
	end process;
	
	rdData <= s_memory(to_integer(unsigned(addr)));
end Behavioral;