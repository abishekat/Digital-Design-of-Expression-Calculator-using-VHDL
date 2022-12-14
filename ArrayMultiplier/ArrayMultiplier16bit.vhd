LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY multi_16bit IS
  PORT (
    X : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    Y : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    Z_P : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END multi_16bit;

ARCHITECTURE MULTIPLIER_16 OF multi_16bit IS 

COMPONENT multi_8bit IS 

PORT(
    a : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
  x : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
  p : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
);

END COMPONENT;

SIGNAL mHigh, mLow, nHigh, nLow : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL mHigh_nLow, mLow_nLow, mHigh_nHigh, mLow_nHigh : STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL mHigh_nHigh_32 : STD_LOGIC_VECTOR (31 DOWNTO 0);
-- mHigh_nHigh is MSB of the product


SIGNAL first, second, third, fourth, sum: INTEGER;

BEGIN 
mLow <= X (7 DOWNTO 0);
mHigh <= X (15 DOWNTO 8);
nLow <= Y (7 DOWNTO 0);
nHigh <= Y (15 DOWNTO 8);

-- 8x8 to 16x16

u1: multi_8bit PORT MAP ( mLow, nLow, mLow_nLow);
u2: multi_8bit PORT MAP ( mHigh, nLow, mHigh_nLow);
u3: multi_8bit PORT MAP ( mLow, nHigh, mLow_nHigh);
u4: multi_8bit PORT MAP ( mHigh, nHigh, mHigh_nHigh);

mHigh_nHigh_32(15 DOWNTO 0) <= mHigh_nHigh(15 DOWNTO 0);

first <= to_integer(unsigned(mLow_nLow));
second <= to_integer(unsigned(mHigh_nLow));
third <= to_integer(unsigned(mLow_nHigh));
fourth <= to_integer(unsigned(mHigh_nHigh_32));


sum <= fourth + (third + second)*256 + first;
Z_P <= STD_LOGIC_VECTOR(to_signed(sum, 32));

END MULTIPLIER_16;
