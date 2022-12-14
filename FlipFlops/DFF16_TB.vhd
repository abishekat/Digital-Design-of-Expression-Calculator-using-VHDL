
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY DFF16_TESTBENCH IS
END DFF16_TESTBENCH;

ARCHITECTURE TEST_BENCH OF DFF16_TESTBENCH IS

COMPONENT DFF16
PORT(
  d : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  enable : IN STD_LOGIC;
  clk : IN STD_LOGIC;
  q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
);
END COMPONENT;

SIGNAL enable, clk : STD_LOGIC := '0';
SIGNAL d, q :STD_LOGIC_VECTOR(15 DOWNTO 0);

CONSTANT clk_period : time := 10ns;

BEGIN
  uut : DFF16
  PORT MAP(
  d => d, enable => enable, clk => clk, q => q
  );
  
  CLOCK: PROCESS
  BEGIN
    clk <= '0';
    WAIT FOR clk_period/2;
    clk <= '1';
    WAIT FOR clk_period/2;
  END PROCESS;
  
  STIMULUS: PROCESS
  BEGIN
    d <="0000000000000000";
WAIT FOR clk_period*2;
  enable <= '1';
  d <="0000000000000001";
WAIT FOR clk_period*2; 
   
     enable <= '1';
     d <="0000000000000001";
WAIT FOR clk_period*2;
   
      enable <= '0';
      d <="0000000000000001";
WAIT FOR clk_period*2;

  enable <= '1';
      d <="0000000000000001";
WAIT FOR clk_period*2;

  enable <= '0';
      d <="0000000000000001";
WAIT FOR clk_period*2;

  enable <= '1';
      d <="0000000000000001";
WAIT FOR clk_period*2;

  enable <= '0';
      d <="0000000000000001";
WAIT FOR clk_period*2;

  enable <= '1';
      d <="0000000000000001";
WAIT FOR clk_period*2;
   
  END PROCESS;

END TEST_BENCH;

