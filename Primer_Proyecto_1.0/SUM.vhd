LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------
ENTITY SUM IS
	PORT(
	num_A	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	num_B	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	result : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ENTITY SUM;
----------------------------------
ARCHITECTURE gateLevel OF SUM IS
	SIGNAL carry : STD_LOGIC_VECTOR(7 DOWNTO 0);
----------------------------------
BEGIN 
---------/COMPLEMENTO_A2_SUM/------------------------

	result(0)<= num_A(0) XOR num_B(0);
	carry(0) <= num_A(0) AND num_B(0);
	result(1)<= num_A(1) XOR num_B(1) XOR carry(0);
	carry(1) <= (num_A(1) AND num_B(1)) OR (num_B(1) AND carry(0)) OR (carry(0) AND num_A(1));
	result(2)<= num_A(2) XOR num_B(2) XOR carry(1);
	carry(2) <= (num_A(2) AND num_B(2)) OR (num_B(2) AND carry(1)) OR (carry(1) AND num_A(2));
	result(3)<= num_A(3) XOR num_B(3) XOR carry(2);
	carry(3) <= (num_A(3) AND num_B(3)) OR (num_B(3) AND carry(2)) OR (carry(2) AND num_A(3));
	result(4)<= num_A(4) XOR num_B(4) XOR carry(3);
	carry(4) <= (num_A(4) AND num_B(4)) OR (num_B(4) AND carry(3)) OR (carry(3) AND num_A(4));
	result(5)<= num_A(5) XOR num_B(5) XOR carry(4);
	carry(5) <= (num_A(5) AND num_B(5)) OR (num_B(5) AND carry(4)) OR (carry(4) AND num_A(5));
	result(6)<= num_A(6) XOR num_B(6) XOR carry(5);
	carry(6) <= (num_A(6) AND num_B(6)) OR (num_B(6) AND carry(5)) OR (carry(5) AND num_A(6));
	result(7)<= num_A(7) XOR num_B(7) XOR carry(6);
-------------------------------------------------------
END gateLevel;