library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CombShiftUnit is
	port(dataIn : in std_logic_vector(7 downto 0);
		  shAmount : in std_logic_vector(2 downto 0);
		  rotate : in std_logic;
		  dirLeft : in std_logic;
		  shArith :in std_logic;
		  dataOut : out std_logic_vector(7 downto 0));
end CombShiftUnit;

architecture Behavioral of CombShiftUnit is

	signal s_shAmount : integer;
	signal s_combReg : std_logic_vector(7 downto 0);
	
begin
	s_shAmount <= to_integer(unsigned(shAmount));
	
	process(dataIn, dirLeft, rotate, shArith)
	begin
		if(rotate = '1') then
			if(dirLeft = '1') then
				s_combReg <= std_logic_vector(rotate_left(unsigned(dataIn), s_shAmount));
			else
				s_combReg <= std_logic_vector(rotate_right(unsigned(dataIn), s_shAmount));
			end if;
		elsif(shArith = '1') then
			if(dirLeft = '1') then
				s_combReg <= std_logic_vector(shift_left(signed(dataIn), s_shAmount));
			else
				s_combReg <= std_logic_vector(shift_right(signed(dataIn), s_shAmount));
			end if;
		else
			if(dirLeft = '1') then
				s_combReg <= std_logic_vector(shift_left(unsigned(dataIn), s_shAmount));
			else
				s_combReg <= std_logic_vector(shift_right(unsigned(dataIn), s_shAmount));
			end if;
		end if;
		dataOut <= s_combReg;
	end process;
end Behavioral;