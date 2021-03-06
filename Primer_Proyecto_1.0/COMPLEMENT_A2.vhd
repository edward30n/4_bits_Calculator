LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------
ENTITY COMPLEMENT_A2 IS
	PORT(
	num_2	:	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	select_sum : IN STD_LOGIC;
	num_2_neg : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ENTITY COMPLEMENT_A2;
----------------------------------
ARCHITECTURE gateLevel OF COMPLEMENT_A2 IS
	SIGNAL num_2_A1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL carry_sum : STD_LOGIC_VECTOR(5 DOWNTO 0);
----------------------------------
BEGIN 
----------/COMPLEMENTO A1/---------------------------
	num_2_A1 <= '0' & '0' & '0' & '0' & num_2 WHEN select_sum = '1' ELSE '1' & '1'&'1' & '1' & NOT(num_2);
-----------------------------------------------------

---------/COMPLEMENTO_A2_SUM/------------------------

	num_2_neg(0) <= num_2_A1(0) XOR '1' WHEN select_sum ='0' ELSE num_2_A1(0);
	num_2_neg(1) <= num_2_A1(1) XOR num_2_A1(0) WHEN select_sum = '0' ELSE num_2_A1(1);
	carry_sum(0) <= num_2_A1(1) AND num_2_A1(0);
	num_2_neg(2) <= num_2_A1(2) XOR carry_sum(0) WHEN select_sum = '0' ELSE num_2_A1(2);
	carry_sum(1) <= num_2_A1(2) AND carry_sum(0);
	num_2_neg(3) <= num_2_A1(3) XOR carry_sum(1) WHEN select_sum = '0' ELSE num_2_A1(3);
	carry_sum(2) <= num_2_A1(3) AND carry_sum(1);
	num_2_neg(4) <= num_2_A1(4) XOR carry_sum(2) WHEN select_sum = '0' ELSE num_2_A1(4);
	carry_sum(3) <= num_2_A1(4) AND carry_sum(2);
	num_2_neg(5) <= num_2_A1(5) XOR carry_sum(3) WHEN select_sum = '0' ELSE num_2_A1(5);
	carry_sum(4) <= num_2_A1(5) AND carry_sum(3);
	num_2_neg(6) <= num_2_A1(6) XOR carry_sum(4) WHEN select_sum = '0' ELSE num_2_A1(6);
	carry_sum(5) <= num_2_A1(6) AND carry_sum(4);
	num_2_neg(7) <= num_2_A1(7) XOR carry_sum(5) WHEN select_sum = '0' ELSE num_2_A1(7);
-------------------------------------------------------
END gateLevel;