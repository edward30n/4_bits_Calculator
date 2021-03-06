LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------
ENTITY COMPLEMENT_A2_8BITS IS
	PORT(
	num :	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	num_neg : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ENTITY COMPLEMENT_A2_8BITS;
----------------------------------
ARCHITECTURE gateLevel OF COMPLEMENT_A2_8BITS IS
	SIGNAL num_A1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL carry_sum : STD_LOGIC_VECTOR(5 DOWNTO 0);
BEGIN 
	----------/COMPLEMENTO A1/---------------------------
	num_A1 <= num WHEN num(7)='0' ELSE NOT(num);
-----------------------------------------------------

---------/COMPLEMENTO_A2_SUM/------------------------

	num_neg(0) <= num_A1(0) XOR '1' WHEN num(7) ='1' ELSE num_A1(0);
	num_neg(1) <= num_A1(1) XOR num_A1(0) WHEN num(7) = '1' ELSE num_A1(1);
	carry_sum(0) <= num_A1(1) AND num_A1(0);
	num_neg(2) <= num_A1(2) XOR carry_sum(0) WHEN num(7) = '1' ELSE num_A1(2);
	carry_sum(1) <= num_A1(2) AND carry_sum(0);
	num_neg(3) <= num_A1(3) XOR carry_sum(1) WHEN num(7) = '1' ELSE num_A1(3);
	carry_sum(2) <= num_A1(3) AND carry_sum(1);
	num_neg(4) <= num_A1(4) XOR carry_sum(2) WHEN num(7) = '1' ELSE num_A1(4);
	carry_sum(3) <= num_A1(4) AND carry_sum(2);
	num_neg(5) <= num_A1(5) XOR carry_sum(3) WHEN num(7) = '1' ELSE num_A1(5);
	carry_sum(4) <= num_A1(5) AND carry_sum(3);
	num_neg(6) <= num_A1(6) XOR carry_sum(4) WHEN num(7) = '1' ELSE num_A1(6);
	carry_sum(5) <= num_A1(6) AND carry_sum(4);
	num_neg(7) <= num_A1(7) XOR carry_sum(5) WHEN num(7) = '1' ELSE num_A1(7);
-------------------------------------------------------
END gateLevel;