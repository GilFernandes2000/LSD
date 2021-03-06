-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- Generated by Quartus Prime Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition
-- Created on Tue Apr 28 11:52:35 2020

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY DrinksFSM IS
    PORT (
        clock : IN STD_LOGIC;
        reset : IN STD_LOGIC := '0';
        m20 : IN STD_LOGIC := '0';
        m50 : IN STD_LOGIC := '0';
        Abrir : OUT STD_LOGIC;
		  sout : out std_logic_vector(2 downto 0)
    );
END DrinksFSM;

ARCHITECTURE BEHAVIOR OF DrinksFSM IS
    TYPE type_fstate IS (S0,S1,S2,S3,S4,S5);
    SIGNAL fstate : type_fstate;
    SIGNAL reg_fstate : type_fstate;
BEGIN
    PROCESS (clock,reg_fstate)
    BEGIN
        IF (clock='1' AND clock'event) THEN
            fstate <= reg_fstate;
        END IF;
    END PROCESS;

    PROCESS (fstate,reset,m20,m50)
    BEGIN
        IF (reset='1') THEN
            reg_fstate <= S0;
            Abrir <= '0';
        ELSE
            Abrir <= '0';
            CASE fstate IS
                WHEN S0 =>
                    IF (((m20 = '1') AND (m50 = '0'))) THEN
                        reg_fstate <= S1;
                    ELSIF ((m50 = '1')) THEN
                        reg_fstate <= S2;
                    ELSIF (((m20 = '0') AND (m50 = '0'))) THEN
                        reg_fstate <= S0;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= S0;
                    END IF;

                    Abrir <= '0';
                WHEN S1 =>
                    IF (((m20 = '1') AND (m50 = '0'))) THEN
                        reg_fstate <= S2;
                    ELSIF ((m50 = '1')) THEN
                        reg_fstate <= S4;
                    ELSIF (((m20 = '0') AND (m50 = '0'))) THEN
                        reg_fstate <= S1;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= S1;
                    END IF;

                    Abrir <= '0';
                WHEN S2 =>
                    IF (((m20 = '1') AND (m50 = '0'))) THEN
                        reg_fstate <= S3;
                    ELSIF ((m50 = '1')) THEN
                        reg_fstate <= S5;
                    ELSIF (((m20 = '0') AND (m50 = '0'))) THEN
                        reg_fstate <= S2;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= S2;
                    END IF;

                    Abrir <= '0';
                WHEN S3 =>
                    IF (((m20 = '1') AND (m50 = '0'))) THEN
                        reg_fstate <= S4;
                    ELSIF ((m50 = '1')) THEN
                        reg_fstate <= S5;
                    ELSIF (((m20 = '0') AND (m50 = '0'))) THEN
                        reg_fstate <= S3;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= S3;
                    END IF;

                    Abrir <= '0';
                WHEN S4 =>
                    IF (((m20 = '1') OR (m50 = '1'))) THEN
                        reg_fstate <= S5;
                    ELSIF (((m20 = '0') AND (m50 = '0'))) THEN
                        reg_fstate <= S4;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= S4;
                    END IF;

                    Abrir <= '0';
                WHEN S5 =>
                    reg_fstate <= S0;

                    Abrir <= '1';
                WHEN OTHERS => 
                    Abrir <= 'X';
                    report "Reach undefined state";
            END CASE;
        END IF;
    END PROCESS;
	 with reg_fstate select
		sout <= "000" when S0,
				  "001" when S1,
				  "010" when S2,
				  "011" when S3,
				  "100" when S4,
				  "101" when S5,
				  "111" when others;
END BEHAVIOR;
