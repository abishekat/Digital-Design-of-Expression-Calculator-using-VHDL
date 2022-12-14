LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY TOP_TB IS
END TOP_TB;

ARCHITECTURE TESTBENCH OF TOP_TB IS
  
  COMPONENT TOP IS
  
  PORT(
    A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    CLK : IN STD_LOGIC;
    LOAD : IN STD_LOGIC;
    CLR : IN STD_LOGIC;
    END_F : OUT STD_LOGIC;
    Z : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)    
  );
  
END COMPONENT;
 
 SIGNAL CLK, END_FLAG, CLR_FLAG, LOAD_IP : STD_LOGIC;
 SIGNAL A_IN, B_IN : STD_LOGIC_VECTOR (15 DOWNTO 0);
 SIGNAL Z_OUT : STD_LOGIC_VECTOR (31 DOWNTO 0);
 
 CONSTANT clk_period : time := 10ns;
 
 BEGIN
   UUT : TOP PORT MAP (A => A_IN, B => B_IN, CLK => CLK, LOAD => LOAD_IP, CLR => CLR_FLAG,
   END_F => END_FLAG, Z =>Z_OUT
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
     
        
      A_IN <= x"0008";
      
      B_IN <= x"0004";
      
      LOAD_IP <= '1';
          
      CLR_FLAG <= '0';
      
     WAIT FOR clk_period*4;
      
      A_IN <= x"0008";
      
      B_IN <= x"0002";
      
      LOAD_IP <= '0';
          
      CLR_FLAG <= '1';
      
     WAIT FOR clk_period*4;
        
        
     A_IN <= x"0004";
      
       B_IN <= x"0004";
      
       LOAD_IP <= '1';
          
       CLR_FLAG <= '0';
           
     WAIT FOR clk_period*4;
      
        A_IN <= x"0002";
      
       B_IN <= x"0004";
      
       LOAD_IP <= '0';
          
      CLR_FLAG <= '1';
           
     WAIT FOR clk_period*4;
      
        A_IN <= x"0006";
      
       B_IN <= x"0004";
      
       LOAD_IP <= '1';
          
       CLR_FLAG <= '0';
           
     WAIT FOR clk_period*4;
      
        A_IN <= x"0009";
      
       B_IN <= x"0004";
      
       LOAD_IP <= '0';
          
      CLR_FLAG <= '1';
           
     WAIT FOR clk_period*4;
      
        A_IN <= x"0003";
      
       B_IN <= x"0004";
      
       LOAD_IP <= '1';
          
       CLR_FLAG <= '0';
           
     WAIT FOR clk_period*4;
      
        A_IN <= x"0005";
      
       B_IN <= x"0004";
      
       LOAD_IP <= '0';
          
      CLR_FLAG <= '1';
           
     WAIT FOR clk_period*4;
      
        A_IN <= x"0008";
      
       B_IN <= x"0005";
      
       LOAD_IP <= '1';
          
       CLR_FLAG <= '0';
           
     WAIT FOR clk_period*4;
      
   
   END PROCESS;
END TESTBENCH;