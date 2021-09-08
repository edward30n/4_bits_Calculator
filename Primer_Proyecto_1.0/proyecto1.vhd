LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------
ENTITY proyecto1 IS
	PORT(	num_1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	num_2	:	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	select_sum	: IN STD_LOGIC;
	select_mult : IN STD_LOGIC;
	segmento1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	segmento2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	segmento3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);		
	segmento4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END ENTITY proyecto1;	
----------------------------------
ARCHITECTURE gateLevel OF proyecto1 IS 
------------SEÑALES------------------
	SIGNAL error_DET_ERROR_1 : STD_LOGIC;
	SIGNAL error_DET_ERROR_2 : STD_LOGIC;
	SIGNAL num_2_neg : 	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL mult_AND_0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL mult_AND_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL mult_AND_2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL mult_AND_3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL sum_3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL sum_4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL sal_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL sal_2 : STD_LOGIC_VECTOR(7 DOWNTO 0);	
	SIGNAL result : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL result_neg : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL r : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL unidades : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL decenas  : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL negativo : STD_LOGIC;
-------------------------------------
BEGIN 
--------MODULO DE DETECCIÓN DE ERROR/DET_ERROR-----------------
	DET_ERROR_1: ENTITY work.DET_ERROR
	PORT MAP(	num_1 => num_1,
					error => error_DET_ERROR_1);
---------------------------------------------------------------
	DET_ERROR_2: ENTITY work.DET_ERROR
	PORT MAP(	num_1 => num_2,
					error => error_DET_ERROR_2);
---------------------------------------------------------------

-------MODULO DE COMPLEMENTO A_2-------------------------------
	COMPLEMENT_A2_4BITS: ENTITY work.COMPLEMENT_A2
	PORT MAP(	 num_2 => num_2,
					 select_sum => select_sum,
					 num_2_neg => num_2_neg);

----------MODULO DE PRODUCTO---------------------------

--------/DESPLAZAMIENTO 0 BITS/------------------------

	mult_AND_0 <= '0' & '0' & '0' & '0' & num_2 WHEN num_1(0)='1' ELSE "00000000";
		
-------------------------------------------------------

--------/DESPLAZAMIENTO 1 BITS/------------------------

	mult_AND_1 <= '0' & '0' & '0' & num_2 & '0' WHEN num_1(1)='1' ELSE "00000000";	
-------------------------------------------------------

--------/DESPLAZAMIENTO 2 BITS/------------------------
 
	mult_AND_2 <= '0' & '0' & num_2 & '0' & '0' WHEN num_1(2)='1' ELSE "00000000";
-------------------------------------------------------

--------/DESPLAZAMIENTO 3 BITS/------------------------

	mult_AND_3 <= '0' & num_2 & '0' & '0' & '0' WHEN num_1(3)='1' ELSE "00000000";
		
-------------------------------------------------------

-----/SUMA DE AND_0 Y AND_1/---------------------------
	SUM_AND_0_1: ENTITY work.SUM
	PORT MAP(	num_A => mult_AND_0,
				num_B => mult_AND_1,
				result => sum_3);
-------------------------------------------------------

-----------/SUMA DE AND_2 Y AND_3/---------------------
	SUM_AND_2_3: ENTITY work.SUM
	PORT MAP(	num_A => mult_AND_2,
				num_B => mult_AND_3,
				result => sum_4);
-------------------------------------------------------

----------/DETERMINACIÓN DE SUMA O PRODUCTO/-----------
	DET_SUM_OR_MULT: ENTITY work.DET
	PORT MAP(num_1 => num_1,
				num_2 => num_2_neg,
				num_3 => sum_3,
				num_4 => sum_4,
				sal_1 => sal_1,
				sal_2 => sal_2,
				select_mult => select_mult);
-------------------------------------------------------

---------/SUMA FINAL/----------------------------------
	SUM_END: ENTITY work.SUM
	PORT MAP(	num_A => sal_1,
				num_B => sal_2,
				result => result);
				negativo <= result(7);
-------------------------------------------------------

--------/COMPLEMENTO A_2 FINAL-------------------------
	COMPLEMENT_A2_8BTIS: ENTITY work.COMPLEMENT_A2_8BITS
	PORT MAP(	num => result,
				num_neg => r);
	
-------------------------------------------------------

------/CONVERTOR BINARIO A DECIMAL/--------------------
	CONVERT_BINARY_TO_DECIMAL: ENTITY work.BINARY_TO_DECIMAL
	PORT MAP( num => r,
				decenas=> decenas,
				unidades=>unidades);
-------------------------------------------------------
	DECIMAL_7SEG_1: ENTITY work.DEC_TO_7SEG
	PORT MAP( bin => unidades,
				 error => (error_DET_ERROR_1 OR error_DET_ERROR_2),
				 negativo =>'0',
				 sseg => segmento1);
	DECIMAL_7SEG_2: ENTITY work.DEC_TO_7SEG
	PORT MAP( bin => decenas,
				 error => (error_DET_ERROR_1 OR error_DET_ERROR_2),
				 negativo => negativo,
				 sseg => segmento2);
	DECIMAL_7SEG_3: ENTITY work.DEC_TO_7SEG
	PORT MAP( bin => num_2,
				 error => error_DET_ERROR_2,
				 negativo =>'0',
			    sseg => segmento3);
	DECIMAL_7SEG_4: ENTITY work.DEC_TO_7SEG
	PORT MAP( bin => num_1,
				 error => error_DET_ERROR_1,
				 negativo =>'0',
				 sseg => segmento4);
END gateLevel;