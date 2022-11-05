LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY MUX_TB IS
END MUX_TB;

ARCHITECTURE TESTBENCH OF MUX_TB IS
  
  COMPONENT MUX2TO1
    PORT(
      a : IN STD_LOGIC;
      b : IN STD_LOGIC;
      sel : IN STD_LOGIC;
      O: OUT STD_LOGIC
    );
END COMPONENT;

SIGNAL clk, a, b, sel, o : STD_LOGIC := '0';
CONSTANT clk_period: time := 10ns;


BEGIN
  uut: MUX2TO1
  PORT MAP(
  a => a, b => b, sel => sel, o => o
  );
  
  PROCESS
  BEGIN
    clk <= '0';
    WAIT FOR clk_period/2;
    clk <= '1';
    WAIT FOR clk_period/2;
  END PROCESS;
  
  stimulus: PROCESS
  BEGIN
  a <= '0';
  b <= '1';
  WAIT FOR clk_period*2;
  sel <= '1';
  a <= '1';
  b <= '0';
  WAIT;
  END PROCESS;

END TESTBENCH;
