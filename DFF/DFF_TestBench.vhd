LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY DFF_TESTBENCH IS
END DFF_TESTBENCH;

ARCHITECTURE TEST_BENCH OF DFF_TESTBENCH IS

COMPONENT DFF
PORT(
	d : IN STD_LOGIC;
	sync_reset : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	q : OUT STD_LOGIC
);
END COMPONENT;

SIGNAL d, sync_reset, clk, q : STD_LOGIC := '0';

CONSTANT clk_period : time := 10ns;

BEGIN
	uut: DFF
	PORT MAP(
	d => d, sync_reset => sync_reset, clk => clk, q => q
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
		d <='1';
		WAIT FOR clk_period;
		d <='0';
		WAIT FOR 100ns; 
		sync_reset <= '1';
		d <='1';
		WAIT FOR clk_period;
		d <='0';
	END PROCESS;

END TEST_BENCH;
