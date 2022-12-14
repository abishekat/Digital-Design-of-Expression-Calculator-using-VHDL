LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY MULTIPLIER16_TB IS
END MULTIPLIER16_TB;

ARCHITECTURE TEST_BENCH OF MULTIPLIER16_TB IS

COMPONENT multi_16bit

PORT(
	X : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
	Y : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
	Z_P : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
);

END COMPONENT;

SIGNAL clk, reset : STD_LOGIC := '0';
SIGNAL multiplier, multiplicand : STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL product : STD_LOGIC_VECTOR (31 DOWNTO 0);

CONSTANT clk_period : time := 10ns;

BEGIN
	uut: multi_16bit
	PORT MAP(
		X => multiplier, Y => multiplicand, Z_P => product
	);
	
	
	PROCESS
	BEGIN
		clk <= '0';
		WAIT FOR clk_period/2;
		clk <= '1';
		WAIT FOR clk_period/2;
	
	END PROCESS;
	
	stimulus : PROCESS
	BEGIN
		multiplier <= "0000000000000001";
		multiplicand <= "0000000000000010";
	WAIT FOR clk_period*2;
	multiplier <= "0000000000000001";
  multiplicand <= "0000000000000010";
WAIT FOR clk_period*2;
  multiplier <= "0000000000000011";
  multiplicand <= "0000000000000010";
WAIT FOR clk_period*2;
  multiplier <= "0000000000000001";
  multiplicand <= "0000000000000011";
WAIT FOR clk_period*2;
  multiplier <= "0000000000000101";
  multiplicand <= "0000000000000010";
WAIT FOR clk_period*2;
  multiplier <= "0000000000000001";
  multiplicand <= "0000000000001010";
WAIT FOR clk_period*2;
  multiplier <= "0000000000001001";
  multiplicand <= "0000000000000110";
WAIT FOR clk_period*2;
  multiplier <= "0000000000000101";
  multiplicand <= "0000000000000011";
WAIT FOR clk_period*2;
  multiplier <= "0000000000001001";
  multiplicand <= "0000000000000110";
WAIT FOR clk_period*2;
  multiplier <= "0000000000001011";
  multiplicand <= "0000000000000010";
WAIT FOR clk_period*2;	
  multiplier <= "0000000000000101";
  multiplicand <= "0000000000010011";
WAIT FOR clk_period*2;
	END PROCESS;

END TEST_BENCH;