LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY DrinksFSM IS
    PORT (
        clock : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        C : IN STD_LOGIC;
        V : IN STD_LOGIC;
        Abrir : OUT STD_LOGIC;
		  sout : out std_logic_vector(2 downto 0)
    );
END DrinksFSM;

ARCHITECTURE BEHAVIOR OF DrinksFSM IS
    TYPE type_fstate IS (E0,E1,E2,E3,E4,E5);
    SIGNAL fstate : type_fstate;
    SIGNAL reg_fstate : type_fstate;
BEGIN
    PROCESS (clock,reg_fstate)
    BEGIN
        IF (clock='1' AND clock'event) THEN
            fstate <= reg_fstate;
        END IF;
    END PROCESS;

    PROCESS (fstate,reset,C,V)
    BEGIN
        IF (reset='1') THEN
            reg_fstate <= E0;
            Abrir <= '0';
        ELSE
            Abrir <= '0';
            CASE fstate IS
                WHEN E0 =>
                    IF (((V = '1') AND (C = '0'))) THEN
                        reg_fstate <= E1;
                    ELSIF ((C = '1')) THEN
                        reg_fstate <= E2;
                    ELSIF (((V = '0') AND (C = '0'))) THEN
                        reg_fstate <= E0;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= E0;
                    END IF;

                    Abrir <= '0';
                WHEN E1 =>
                    IF (((V = '1') AND (C = '0'))) THEN
                        reg_fstate <= E2;
                    ELSIF ((C = '1')) THEN
                        reg_fstate <= E4;
                    ELSIF (((V = '0') AND (C = '0'))) THEN
                        reg_fstate <= E1;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= E1;
                    END IF;

                    Abrir <= '0';
                WHEN E2 =>
                    IF (((V = '1') AND (C = '0'))) THEN
                        reg_fstate <= E3;
                    ELSIF ((C = '1')) THEN
                        reg_fstate <= E5;
                    ELSIF (((V = '0') AND (C = '0'))) THEN
                        reg_fstate <= E2;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= E1;
                    END IF;

                    Abrir <= '0';
                WHEN E3 =>
                   IF (((V = '1') AND (C = '0'))) THEN
                        reg_fstate <= E4;
                    ELSIF ((C = '1')) THEN
                        reg_fstate <= E5;
                    ELSIF (((V = '0') AND (C = '0'))) THEN
                        reg_fstate <= E3;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= E3;
                    END IF;
						  
						  Abrir <= '0';
					  WHEN E4 => 
						IF (((V = '1') OR (C = '1'))) THEN
                        reg_fstate <= E5;
                    ELSIF (((V = '0') AND (C = '0'))) THEN
                        reg_fstate <= E4;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= E4;
                    END IF;
						  Abrir <= '0';
					  WHEN E5 =>
						reg_fstate <= E0;
						Abrir <= '1';
                WHEN OTHERS => 
                    Abrir <= 'X';
                    report "Reach undefined state";
            END CASE;
        END IF;
    END PROCESS;
	 
	 with reg_fstate select
		sout <= "000" when E0,
				  "001" when E1,
				  "010" when E2,
				  "011" when E3,
				  "100" when E4,
				  "101" when E5,
				  "111" when others;
END BEHAVIOR;