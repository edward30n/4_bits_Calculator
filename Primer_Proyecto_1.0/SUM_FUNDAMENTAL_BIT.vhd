LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------
ENTITY SUM_FUNDAMENTAL_BIT IS
	PORT(
	num_A	:	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	num_B	:	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	result : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END ENTITY SUM_FUNDAMENTAL_BIT;
----------------------------------
ARCHITECTURE gateLevel OF SUM_FUNDAMENTAL_BIT IS
----------------------------------
BEGIN 
	result(0)<= (num_A(3) AND num_B(3)) OR (num_A(0) XOR num_B(0));
	result(1)<= (num_A(0) AND num_B(0)) OR (num_A(1) XOR num_B(1));
	result(2)<= (num_A(1) AND num_B(1)) OR (num_A(2) XOR num_B(2));
	result(3)<= (num_A(2) AND num_B(2)) OR (num_A(3) XOR num_B(3));
END gateLevel;