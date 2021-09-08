LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------
ENTITY RESTA IS
	PORT(
	original_num	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	unity	:	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	result : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ENTITY RESTA;
----------------------------------
ARCHITECTURE gateLevel OF RESTA IS
----------------------------------
	SIGNAL num_2_neg : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL num_2_A1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL carry_sum :STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL carry : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN 
----------/COMPLEMENTO A1/---------------------------
	num_2_A1 <= '1' & '1'&'1' & '1' & NOT(unity);
-----------------------------------------------------

---------/COMPLEMENTO_A2_SUM/------------------------
	num_2_neg(0) <= num_2_A1(0) XOR '1';
	num_2_neg(1) <= num_2_A1(1) XOR num_2_A1(0);
	carry_sum(0) <= num_2_A1(1) AND num_2_A1(0);
	num_2_neg(2) <= num_2_A1(2) XOR carry_sum(0);
	carry_sum(1) <= num_2_A1(2) AND carry_sum(0);
	num_2_neg(3) <= num_2_A1(3) XOR carry_sum(1);
	carry_sum(2) <= num_2_A1(3) AND carry_sum(1);
	num_2_neg(4) <= num_2_A1(4) XOR carry_sum(2);
	carry_sum(3) <= num_2_A1(4) AND carry_sum(2);
	num_2_neg(5) <= num_2_A1(5) XOR carry_sum(3);
	carry_sum(4) <= num_2_A1(5) AND carry_sum(3);
	num_2_neg(6) <= num_2_A1(6) XOR carry_sum(4);
	carry_sum(5) <= num_2_A1(6) AND carry_sum(4);
	num_2_neg(7) <= num_2_A1(7) XOR carry_sum(5);
-------------------------------------------------------
	result(0)<= original_num(0) XOR num_2_neg(0);
	carry(0) <= original_num(0) AND num_2_neg(0);
	result(1)<= original_num(1) XOR num_2_neg(1) XOR carry(0);
	carry(1) <= (original_num(1) AND num_2_neg(1)) OR (num_2_neg(1) AND carry(0)) OR (carry(0) AND original_num(1));
	result(2)<= original_num(2) XOR num_2_neg(2) XOR carry(1);
	carry(2) <= (original_num(2) AND num_2_neg(2)) OR (num_2_neg(2) AND carry(1)) OR (carry(1) AND original_num(2));
	result(3)<= original_num(3) XOR num_2_neg(3) XOR carry(2);
	carry(3) <= (original_num(3) AND num_2_neg(3)) OR (num_2_neg(3) AND carry(2)) OR (carry(2) AND original_num(3));
	result(4)<= original_num(4) XOR num_2_neg(4) XOR carry(3);
	carry(4) <= (original_num(4) AND num_2_neg(4)) OR (num_2_neg(4) AND carry(3)) OR (carry(3) AND original_num(4));
	result(5)<= original_num(5) XOR num_2_neg(5) XOR carry(4);
	carry(5) <= (original_num(5) AND num_2_neg(5)) OR (num_2_neg(5) AND carry(4)) OR (carry(4) AND original_num(5));
	result(6)<= original_num(6) XOR num_2_neg(6) XOR carry(5);
	carry(6) <= (original_num(6) AND num_2_neg(6)) OR (num_2_neg(6) AND carry(5)) OR (carry(5) AND original_num(6));
	result(7)<= original_num(7) XOR num_2_neg(7) XOR carry(6);
-------------------------------------------------------

END gateLevel;
