LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY multi_16bit IS
  PORT (
    a16 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    x16 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    p16 : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
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
mLow <= a16 (7 DOWNTO 0);
mHigh <= a16 (15 DOWNTO 8);
nLow <= x16 (7 DOWNTO 0);
nHigh <= x16 (15 DOWNTO 8);

-- 8x8 to 16x16

u1: multi_8bit PORT MAP ( mLow, nLow, mLow_nLow);
u2: multi_8bit PORT MAP ( mHigh, nLow, mHigh_nLow);
u3: multi_8bit PORT MAP ( mLow, nHigh, mLow_nHigh);
u4: multi_8bit PORT MAP ( mHigh, nHigh, mHigh_nHigh);

mHigh_nHigh_32(15 DOWNTO 0) <= mHigh_nHigh(15 DOWNTO 0);

first <= to_integer(unsigned(mLow_nLow));
second <= to_integer(unsigned(mHigh_nLow));
third <= to_integer(unsigned(mLow_nHigh));
fourth <= to_integer(shift_left(unsigned(mHigh_nHigh_32),16));

--report "first" & integer'image(first);
--report "seconf" & integer'image(second);
--report "third" & integer'image(third);
--report "fourth" & integer'image(fourth);

sum <= fourth + (third + second)*256 + first;
p16 <= STD_LOGIC_VECTOR(to_signed(sum, 32));

END MULTIPLIER_16;

