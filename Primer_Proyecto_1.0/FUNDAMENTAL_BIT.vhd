LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------
ENTITY FUNDAMENTAL_BIT IS
	PORT(
	num :	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	fundamental_bit : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END ENTITY FUNDAMENTAL_BIT;
----------------------------------
ARCHITECTURE gateLevel OF FUNDAMENTAL_BIT IS
BEGIN 
	WITH num SELECT
	fundamental_bit <=
							"0000" WHEN   "0000" ,
							"0001" WHEN   "0001" ,
							"0010" WHEN   "0010" ,
							"1000" WHEN   "0011" ,
							"0100" WHEN   "0100" ,
							"0000" WHEN   "0101" ,
							"0001" WHEN   "0110" ,
							"0010" WHEN   "0111" ,
							"1000" WHEN   "1000" ,
							"0100" WHEN   "1001" ,
							"0000" WHEN   "1010" ,
							"0001" WHEN   "1011" ,
							"0010" WHEN   "1100" ,
							"1000" WHEN   "1101" ,
							"0100" WHEN   "1110" ,
							"0000" WHEN   "1111" ,
							"0000" WHEN OTHERS;

END gateLevel;