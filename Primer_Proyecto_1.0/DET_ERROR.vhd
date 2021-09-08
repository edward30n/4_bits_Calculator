LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------
ENTITY DET_ERROR IS
	PORT( num_1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	error : OUT STD_LOGIC
	);
END ENTITY DET_ERROR;
----------------------------------
ARCHITECTURE gateLevel OF DET_ERROR IS
----------------------------------
BEGIN 
	error <= '1' WHEN ((num_1(3)) AND (num_1(2) OR (num_1(1)))) = '1'  ELSE '0';
END gateLevel;