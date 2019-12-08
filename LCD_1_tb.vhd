
LIBRARY ieee;
USE ieee.numeric_bit;
 
ENTITY LCD_1_tb IS
END LCD_1_tb;
 
ARCHITECTURE behavior OF LCD_1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LCD_1
    PORT(
         CLK50 : IN  bit;
         RESET : IN  bit;
         RS_IN : IN  bit;
         DATA_IN : IN  bit;
         DB : IN  bit_vector(7 downto 0);
         LED : OUT  bit;
         RS_OUT : OUT  bit;
         RW : OUT  bit;
         EN : OUT  bit;
         DATA_OUT : OUT  bit_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : bit := '0';
   signal RESET : bit := '0';
   signal RS_IN : bit := '0';
   signal DATA_IN : bit := '0';
   signal DB : bit_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal LED : bit;
   signal RS_OUT : bit;
   signal RW : bit;
   signal EN : bit;
   signal DATA_OUT : bit_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LCD_1 PORT MAP (
          CLK => CLK,
          RESET => RESET,
          RS_IN => RS_IN,
          DATA_IN => DATA_IN,
          DB => DB,
          LED => LED,
          RS_OUT => RS_OUT,
          RW => RW,
          EN => EN,
          DATA_OUT => DATA_OUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
