LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------
ENTITY BINARY_TO_DECIMAL IS
	PORT(
	num	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	unidades : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	decenas : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END ENTITY BINARY_TO_DECIMAL;
----------------------------------
ARCHITECTURE gateLevel OF BINARY_TO_DECIMAL IS
	SIGNAL first_block : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL second_block : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL sum_blocks :STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL bit_fundamental : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL signal_unidades : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL decenasx10 : STD_LOGIC_VECTOR(7 DOWNTO 0);
----------------------------------
BEGIN 
	FUNDAMENTAL_BIT_1_TO_4 : ENTITY work.FUNDAMENTAL_BIT
	PORT MAP(	num(0) => num(1),
				 num(1)=> num(2),
				 num(2)=> num(3),
				 num(3)=> num(4),
				fundamental_bit => first_block);
				
	FUNDAMENTAL_BIT_5_TO_8 : ENTITY work.FUNDAMENTAL_BIT
	PORT MAP(	num(0) => num(5),
				 num(1)=> num(6),
				 num(2)=> num(7),
				 num(3)=> '0',
				fundamental_bit => second_block);
	SUM_BLOCK : ENTITY work.SUM_FUNDAMENTAL_BIT
	PORT MAP(	num_A => first_block,
				num_B => second_block,
				result => sum_blocks);
	BIT_FUNDAMENTALES : ENTITY work.FUNDAMENTAL_BIT
	PORT MAP(	num(0) =>sum_blocks(0),
				num(1)=> sum_blocks(1),
				num(2)=> sum_blocks(2),
				num(3)=> sum_blocks(3),
				fundamental_bit => bit_fundamental);
	signal_unidades(0)<= num(0);
	signal_unidades(1)<= bit_fundamental(0) OR bit_fundamental(3);
	signal_unidades(2)<= bit_fundamental(1) OR bit_fundamental(3);
	signal_unidades(3)<= bit_fundamental(2);
	DECENAS_A_UNIDADES : ENTITY work.RESTA
	PORT MAP(	original_num => num,
				unity => signal_unidades,
				result => decenasx10);
	DET_DECENAS : ENTITY work.DECENAS_TO_UNIDADES
	PORT MAP(	num =>decenasx10,
				result=>decenas);
	unidades <= signal_unidades;
END gateLevel;