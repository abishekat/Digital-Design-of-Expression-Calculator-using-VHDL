LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY DFF30 IS


PORT(
  d : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
  enable : IN STD_LOGIC;
  clk : IN STD_LOGIC;
  q : OUT STD_LOGIC_VECTOR(29 DOWNTO 0)
);
END DFF30;

ARCHITECTURE DFF_ARCH OF DFF30 IS
BEGIN

  PROCESS (clk, enable) IS
  BEGIN
    IF FALLING_EDGE(clk) THEN
        IF (enable='1') THEN
          q <= d;
        ELSE
          q <= (OTHERS=>'0');
        END IF;
     END IF;  
  END PROCESS;
END ARCHITECTURE DFF_ARCH;
