LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------
ENTITY DET IS
	PORT(
	num_1	:	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	num_2	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	num_3 :	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	num_4 :	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	sal_1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	sal_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	select_mult : IN STD_LOGIC
	);
END ENTITY DET;
----------------------------------
ARCHITECTURE gateLevel OF DET IS
	SIGNAL num_1_8bits : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN 
	num_1_8bits <= '0' & '0' & '0' & '0' & num_1;
	sal_1 <= num_1_8bits WHEN select_mult='1' ELSE num_3;
	sal_2 <= num_2 WHEN select_mult='1' ELSE num_4;
END gateLevel;