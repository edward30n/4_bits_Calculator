LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------
ENTITY DECENAS_TO_UNIDADES IS
	PORT(
	num	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	result : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END ENTITY DECENAS_TO_UNIDADES;
----------------------------------
ARCHITECTURE gateLevel OF DECENAS_TO_UNIDADES IS
----------------------------------
BEGIN 
	WITH num SELECT
		result <= 
					"0001" WHEN "00001010",
					"0010" WHEN "00010100",
					"0011" WHEN "00011110",
					"0100" WHEN "00101000",
					"0101" WHEN "00110010",
					"0110" WHEN "00111100",
					"0111" WHEN "01000110",
					"1000" WHEN "01010000",
					"0000" WHEN OTHERS;
END gateLevel;