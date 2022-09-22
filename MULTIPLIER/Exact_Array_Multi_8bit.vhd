LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY multi_8bit IS
	PORT (
		a : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		x : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		p : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END multi_8bit;

ARCHITECTURE Behavioral OF multi_8bit IS
	--- Component Declaration

	COMPONENT creating_pp
		PORT (
			a, b : IN std_logic_vector(7 DOWNTO 0);
			y : OUT std_logic_vector(63 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT fullAdder
		PORT (
			a, b, cin : IN STD_LOGIC;
			s, cout : OUT STD_LOGIC
		);
	END COMPONENT;

	--- Signal Declaration
	SIGNAL y : STD_LOGIC_VECTOR (63 DOWNTO 0);
	SIGNAL cf : STD_LOGIC_VECTOR (59 DOWNTO 0);
	SIGNAL S : STD_LOGIC_VECTOR (55 DOWNTO 0);
BEGIN
	p1 : creating_pp
	PORT MAP(a, x, y); -- first number, second, partials
	p(0) <= y(0);
	fa1 : fullAdder
	PORT MAP(y(1), y(8), '0', p(1), cf(1));
	fa2 : fullAdder
	PORT MAP(y(2), y(9), cf(1), s(2), cf(2));
 
fa3 : fullAdder
PORT MAP(s(2), y(16), '0', p(2), cf(3));
fa4 : fullAdder
PORT MAP(y(3), cf(2), y(10), s(4), cf(4));
fa5 : fullAdder
PORT MAP(s(4), cf(3), y(17), s(5), cf(5));
fa6 : fullAdder
PORT MAP(s(5), '0', y(24), p(3), cf(6));
 
fa7 : fullAdder
PORT MAP(y(4), cf(4), y(11), s(7), cf(7));
fa8 : fullAdder
PORT MAP(s(7), cf(5), y(18), s(8), cf(8));
fa9 : fullAdder
PORT MAP(s(8), cf(6), y(25), s(9), cf(9));
fa10 : fullAdder
PORT MAP(s(9), '0', y(32), p(4), cf(10));
 
fa11 : fullAdder
PORT MAP(y(5), cf(7), y(12), s(11), cf(11));
fa12 : fullAdder
PORT MAP(s(11), cf(8), y(19), s(12), cf(12));
fa13 : fullAdder
PORT MAP(s(12), cf(9), y(26), s(13), cf(13));
fa14 : fullAdder
PORT MAP(s(13), cf(10), y(33), s(14), cf(14));
fa15 : fullAdder
PORT MAP(s(14), '0', y(40), p(5), cf(15));
 
fa16 : fullAdder
PORT MAP(y(6), cf(11), y(13), s(16), cf(16));
fa17 : fullAdder
PORT MAP(s(16), cf(12), y(20), s(17), cf(17));
fa18 : fullAdder
PORT MAP(s(17), cf(13), y(27), s(18), cf(18));
fa19 : fullAdder
PORT MAP(s(18), cf(14), y(34), s(19), cf(19));
fa20 : fullAdder
PORT MAP(s(19), cf(15), y(41), s(20), cf(20));
fa21 : fullAdder
PORT MAP(s(20), '0', y(48), p(6), cf(21));
 
fa22 : fullAdder
PORT MAP(y(7), cf(16), y(14), s(22), cf(22));
fa23 : fullAdder
PORT MAP(s(22), cf(17), y(21), s(23), cf(23));
fa24 : fullAdder
PORT MAP(s(23), cf(18), y(28), s(24), cf(24));
fa25 : fullAdder
PORT MAP(s(24), cf(19), y(35), s(25), cf(25));
fa26 : fullAdder
PORT MAP(s(25), cf(20), y(42), s(26), cf(26));
fa27 : fullAdder
PORT MAP(s(26), cf(21), y(49), s(27), cf(27));
fa28 : fullAdder
PORT MAP(s(27), '0', y(56), p(7), cf(28));
 
fa29 : fullAdder
PORT MAP('0', cf(22), y(15), s(29), cf(29));
fa30 : fullAdder
PORT MAP(s(29), cf(23), y(22), s(30), cf(30));
fa31 : fullAdder
PORT MAP(s(30), cf(24), y(29), s(31), cf(31));
fa32 : fullAdder
PORT MAP(s(31), cf(25), y(36), s(32), cf(32));
fa33 : fullAdder
PORT MAP(s(32), cf(26), y(43), s(33), cf(33));
fa34 : fullAdder
PORT MAP(s(33), cf(27), y(50), s(34), cf(34));
fa35 : fullAdder
PORT MAP(s(34), cf(28), y(57), p(8), cf(35));
 
fa36 : fullAdder
PORT MAP(cf(29), y(23), cf(30), s(36), cf(36));
fa37 : fullAdder
PORT MAP(s(36), cf(31), y(30), s(37), cf(37));
fa38 : fullAdder
PORT MAP(s(37), cf(32), y(37), s(38), cf(38));
fa39 : fullAdder
PORT MAP(s(38), cf(33), y(44), s(39), cf(39));
fa40 : fullAdder
PORT MAP(s(39), cf(34), y(51), s(40), cf(40));
fa41 : fullAdder
PORT MAP(s(40), cf(35), y(58), p(9), cf(41));
 
fa42 : fullAdder
PORT MAP(cf(36), y(31), cf(37), s(42), cf(42));
fa43 : fullAdder
PORT MAP(s(42), cf(38), y(38), s(43), cf(43));
fa44 : fullAdder
PORT MAP(s(43), cf(39), y(45), s(44), cf(44));
fa45 : fullAdder
PORT MAP(s(44), cf(40), y(52), s(45), cf(45));
fa46 : fullAdder
PORT MAP(s(45), cf(41), y(59), p(10), cf(46));
 
fa47 : fullAdder
PORT MAP(cf(42), y(39), cf(43), s(47), cf(47));
fa48 : fullAdder
PORT MAP(s(47), cf(44), y(46), s(48), cf(48));
fa49 : fullAdder
PORT MAP(s(48), cf(45), y(53), s(49), cf(49));
fa50 : fullAdder
PORT MAP(s(49), cf(46), y(60), p(11), cf(50));
 
fa51 : fullAdder
PORT MAP(cf(47), y(47), cf(48), s(51), cf(51));
fa52 : fullAdder
PORT MAP(s(51), cf(49), y(54), s(52), cf(52));
fa53 : fullAdder
PORT MAP(s(52), cf(50), y(61), p(12), cf(53));
 
fa54 : fullAdder
PORT MAP(cf(51), y(55), cf(52), s(54), cf(54));
fa55 : fullAdder
PORT MAP(s(54), cf(53), y(62), p(13), cf(55));
 
fa56 : fullAdder
PORT MAP(cf(55), y(63), cf(54), p(14), p(15));
END Behavioral;