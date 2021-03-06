LIBRARY ieee;
USE ieee.std_logic_1164.all;
------------------------------------------------
ENTITY DEC_TO_7SEG IS
	PORT( bin :	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			sseg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			error : IN STD_LOGIC;
			negativo : IN STD_LOGIC
	);
END ENTITY DEC_TO_7SEG;
------------------------------------------------
ARCHITECTURE behaviour OF DEC_TO_7SEG IS
SIGNAL proces : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
  proces <= "1110" WHEN error='1' ELSE 
  "1101" WHEN negativo='1' ELSE
	bin;
	WITH proces SELECT
		sseg <=
			"1000000" WHEN "0000",
			"1111001" WHEN "0001",
			"0100100" WHEN "0010",
			"0110000" WHEN "0011",
			"0011001" WHEN "0100",
			"0010010" WHEN "0101",
			"0000010" WHEN "0110",
			"1111000" WHEN "0111",
			"0000000" WHEN "1000",
			"0010000" WHEN "1001",
			"0111111" WHEN "1101",--Negativo
			"0000110" WHEN "1110",--E
			"0000110" WHEN OTHERS;--E

END behaviour;