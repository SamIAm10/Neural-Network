--------------------------------------------------------------------------------
-- Company: University of Connecticut
-- Project Testbench
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY tb_nn IS
END tb_nn;
 
ARCHITECTURE behavior OF tb_nn IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT lab3
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         inst_init : IN  signed(2047 downto 0);
         data_init:  IN signed(8191 downto 0);
         op1_out : OUT  signed(31 downto 0);
         op2_out : OUT  signed(31 downto 0);
         inst : OUT  signed(31 downto 0);
         pc_val : OUT  signed(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal inst_init : signed(2047 downto 0) := (others => '0');
   signal data_init : signed(8191 downto 0) := (others => '0');

 	--Outputs
   signal op1_out : signed(31 downto 0);
   signal op2_out : signed(31 downto 0);
   signal inst : signed(31 downto 0);
   signal pc_val : signed(31 downto 0);


	constant inst0 : signed(31 downto 0) := "00000000000000000000000000000000";--LD R0,[R0] (R0 = 1)  		
	constant inst1 : signed(31 downto 0) := "00000000000000000000000100000010";--ADD R1,R0,R0		
	constant inst2 : signed(31 downto 0) := "00000000000000000000001100011001";--NN R3,R1
	constant inst3 : signed(31 downto 0) := "00000000000000000000000000110001";--ST [R0],R3 (4 inst)
	constant inst4 : signed(31 downto 0) := "00000000000000000000000000001111";--NOP
	constant inst5 : signed(31 downto 0) := "00000000000000000000000000001111";--NOP                   
	constant inst6 : signed(31 downto 0) := "00000000000000000000000000001111";--NOP 		
	constant inst7 : signed(31 downto 0) := "00000000000000000000000000001111";--NOP
	constant inst8 : signed(31 downto 0) := "00000000000000000000000000001111";--NOP
	constant inst9 : signed(31 downto 0) := "00000000000000000000000000001111";--NOP 
	constant inst10 : signed(31 downto 0) := "00000000000000000000000000001111";--NOP	
	constant inst11 : signed(31 downto 0) := "00000000000000000000000000001111";--NOP
	constant inst12 : signed(31 downto 0) := "00000000000000000000000000001111";--NOP
	constant inst13 : signed(31 downto 0) := "00000000000000000000000000001111";--NOP
	constant inst14 : signed(31 downto 0) := "00000000000000000000000000001111";--NOP
	constant inst15 : signed(31 downto 0) := "00000000000000000000000000001111";--NOP
	constant inst16 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst17 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst18 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst19 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst20 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst21 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst22 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst23 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst24 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst25 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst26 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst27 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst28 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst29 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst30 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst31 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst32 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst33 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst34 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst35 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst36 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst37 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst38 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst39 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst40 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst41 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst42 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst43 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst44 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst45 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst46 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst47 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst48 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst49 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst50 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst51 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst52 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst53 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst54 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst55 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst56 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst57 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst58 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst59 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst60 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst61 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst62 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP
	constant inst63 : signed(31 downto 0) := "00000000000000000000000000001111"; --NOP

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lab3 PORT MAP (
          clk => clk,
          reset => reset,
          inst_init => inst_init,
          data_init => data_init,
          op1_out => op1_out,
          op2_out => op2_out,
          inst => inst,
          pc_val => pc_val
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
        data_init(31 downto 0) <= x"00000001";
		data_init(63 downto 32) <= x"00000000";
		data_init(95 downto 64) <= x"00000001";
		data_init(127 downto 96) <= x"00000002";
		data_init(159 downto 128) <= x"00000003";
		data_init(191 downto 160) <= x"00000004";
		data_init(223 downto 192) <= x"00000007";
		data_init(255 downto 224) <= x"00000000";
		data_init(287 downto 256) <= x"00000004";
		
		wait for 5 ns;
      
        reset <= '1';
		inst_init <= inst63 & inst62 & inst61 & inst60 & inst59 & inst58 & inst57 & 
			      inst56 & inst55 & inst54 & inst53 & inst52 & inst51 & inst50 & inst49 & 
			      inst48 & inst47 & inst46 & inst45 & inst44 & inst43 & inst42 & inst41 & 
			      inst40 & inst39 & inst38 & inst37 & inst36 & inst35 & inst34 & inst33 & 
			      inst32 & inst31 & inst30 & inst29 & inst28 & inst27 & inst26 & inst25 & 
			      inst24 & inst23 & inst22 & inst21 & inst20 & inst19 & inst18 & inst17 & 
			      inst16 & inst15 & inst14 & inst13 & inst12 & inst11 & inst10 & inst9 & 
			      inst8 & inst7 & inst6 & inst5 & inst4 & inst3 & inst2 & inst1 & inst0;
		wait for 10 ns;
		
		reset <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
