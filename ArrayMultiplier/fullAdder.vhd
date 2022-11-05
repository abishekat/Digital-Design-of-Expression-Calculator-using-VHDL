LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fullAdder IS
	PORT (
		A : IN STD_LOGIC;
		B : IN STD_LOGIC;
		Cin : IN STD_LOGIC;
		S : OUT STD_LOGIC;
		Cout : OUT STD_LOGIC
	);
END fullAdder;

ARCHITECTURE fulladd OF fullAdder IS

	SIGNAL AxorB : std_logic;
	SIGNAL NotA, NotB, NotCin : std_logic;
	SIGNAL t1, t2, t3, t4 : std_logic;
	SIGNAL AandB, BandCin, AandCin : std_logic;
BEGIN
	-- AxorB <= A XOR B;
	-- S <= AxorB XOR Cin;
	-- Cout <= (AxorB and Cin) or (A AND B);
	NotA <= NOT A;
	NotB <= NOT B;
	NotCin <= NOT Cin;
	t1 <= (NotA AND NotB) AND Cin;
	t2 <= (NotA AND B) AND NotCin;
	t3 <= (A AND NotB) AND NotCin;
	t4 <= (A AND B) AND Cin;
	S <= (((t1 OR t2) OR t3) OR t4);

	AandB <= A AND B;
	BandCin <= B AND Cin;
	AandCin <= A AND Cin;

	Cout <= ((AandB OR BandCin) OR AandCin);

END fullAdd;