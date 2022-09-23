
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY MULTIPLIER8_TB IS
END MULTIPLIER8_TB;

ARCHITECTURE TEST_BENCH OF MULTIPLIER8_TB IS

COMPONENT multi_8bit

PORT(
  a : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
  x : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
  p : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
);

END COMPONENT;

SIGNAL clk, reset : STD_LOGIC := '0';
SIGNAL multiplier, multiplicand : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL product : STD_LOGIC_VECTOR (15 DOWNTO 0);

CONSTANT clk_period : time := 10ns;

BEGIN
  uut: multi_8bit
  PORT MAP(
    a => multiplier, x => multiplicand, p => product
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
    multiplier <= x"02";
    multiplicand <= x"08";
  WAIT;
  END PROCESS;

END TEST_BENCH;