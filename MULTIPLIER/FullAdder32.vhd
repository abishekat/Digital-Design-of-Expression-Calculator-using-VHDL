LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FullAdder32 IS
  PORT (
    A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    Cin : IN STD_LOGIC;
    S : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    Cout : OUT STD_LOGIC
  );
END FullAdder32;

ARCHITECTURE FULLADDER OF FULLADDER32 IS
  
  COMPONENT fullAdder IS
	PORT (
		A : IN STD_LOGIC;
		B : IN STD_LOGIC;
		Cin : IN STD_LOGIC;
		S : OUT STD_LOGIC;
		Cout : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL CF : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
  
   
  FA_1 : fullAdder PORT MAP (A(0), B(0), '0', S(0), CF(0)); 
  FA_2 : fullAdder PORT MAP (A(1), B(1), CF(0), S(1), CF(1)); 
  FA_3 : fullAdder PORT MAP (A(2), B(2), CF(1), S(2), CF(2)); 
  FA_4 : fullAdder PORT MAP (A(3), B(3), CF(2), S(3), CF(3)); 
  FA_5 : fullAdder PORT MAP (A(4), B(4), CF(3), S(4), CF(4)); 
  FA_6 : fullAdder PORT MAP (A(5), B(5), CF(4), S(5), CF(5)); 
  FA_7 : fullAdder PORT MAP (A(6), B(6), CF(5), S(6), CF(6)); 
  FA_8 : fullAdder PORT MAP (A(7), B(7), CF(6), S(7), CF(7)); 
  FA_9 : fullAdder PORT MAP (A(8), B(8), CF(7), S(8), CF(8)); 
  FA_10 : fullAdder PORT MAP (A(9), B(9), CF(8), S(9), CF(9)); 
  FA_11 : fullAdder PORT MAP (A(10), B(10), CF(9), S(10), CF(10)); 
  FA_12 : fullAdder PORT MAP (A(11), B(11), CF(10), S(11), CF(11)); 
  FA_13 : fullAdder PORT MAP (A(12), B(12), CF(11), S(12), CF(12)); 
  FA_14 : fullAdder PORT MAP (A(13), B(13), CF(12), S(13), CF(13)); 
  FA_15 : fullAdder PORT MAP (A(14), B(14), CF(13), S(14), CF(14)); 
  FA_16 : fullAdder PORT MAP (A(15), B(15), CF(14), S(15), CF(15)); 
  FA_17 : fullAdder PORT MAP (A(16), B(16), CF(15), S(16), CF(16)); 
  FA_18 : fullAdder PORT MAP (A(17), B(17), CF(16), S(17), CF(17)); 
  FA_19 : fullAdder PORT MAP (A(18), B(18), CF(17), S(18), CF(18)); 
  FA_20 : fullAdder PORT MAP (A(19), B(19), CF(18), S(19), CF(19)); 
  FA_21 : fullAdder PORT MAP (A(20), B(20), CF(19), S(20), CF(20)); 
  FA_22 : fullAdder PORT MAP (A(21), B(21), CF(20), S(21), CF(21)); 
  FA_23 : fullAdder PORT MAP (A(22), B(22), CF(21), S(22), CF(22)); 
  FA_24 : fullAdder PORT MAP (A(23), B(23), CF(22), S(23), CF(23)); 
  FA_25 : fullAdder PORT MAP (A(24), B(24), CF(23), S(24), CF(24)); 
  FA_26 : fullAdder PORT MAP (A(25), B(25), CF(24), S(25), CF(25)); 
  FA_27 : fullAdder PORT MAP (A(26), B(26), CF(25), S(26), CF(26)); 
  FA_28 : fullAdder PORT MAP (A(27), B(27), CF(26), S(27), CF(27)); 
  FA_29 : fullAdder PORT MAP (A(28), B(28), CF(27), S(28), CF(28)); 
  FA_30 : fullAdder PORT MAP (A(29), B(29), CF(28), S(29), CF(29)); 
  FA_31 : fullAdder PORT MAP (A(30), B(30), CF(29), S(30), CF(30)); 
  FA_32 : fullAdder PORT MAP (A(31), B(31), CF(30), S(31), Cout);
  
END FULLADDER;

