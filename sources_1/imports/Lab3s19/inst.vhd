----------------------------------------------------------------------------------
-- Company: University of Connecticut
-- Engineer: Masab Ahmad
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity inst is

port(
        reset: in std_logic;                  --reset, loads instructions
		  addr: in signed(31 downto 0);         --dram addr
		  data_store: in signed(2047 downto 0);  --input data
		  data_load: out signed(31 downto 0)    --output data
);

end inst;

architecture Behavioral of inst is

   type instout is array (143 downto 0) of signed(31 downto 0);

	signal inst_reg : instout :=           (--144 instructions, Default is NOP
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",                                            
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
											--96 instructions, Default is NOP
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",                                            
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
											--48 instructions, Default is NOP
	                                        x"0000004f", x"0000004f", x"0000004f", x"0000004f",
											x"0000004f", x"0000004f", x"0000004f", x"0000004f",
				                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
											x"0000004f", x"0000004f", x"0000004f", x"0000004f",
                                            x"0000004f", x"0000004f", x"0000004f", x"0000004f",
											x"0000004f", x"0000004f", x"0000004f", x"0000004f",
											x"0000004f", x"0000004f", x"0000004f", x"0000004f",
											x"0000004f", x"0000004f", x"0000004f", x"0000004f",
											x"0000004f", x"0000004f", x"0000004f", x"0000004f",
											x"0000004f", x"0000004f", x"0000004f", x"0000004f",
											x"0000004f", x"0000004f", x"0000004f", x"0000004f",											
	                                        x"0000004f", x"0000004f", x"0000004f", x"0000004f"); -- READS BACKWARDS INST MEMORY
				
	signal i : integer := 0;	
   begin

   i <= to_integer(addr);

   --Instruction Cache Process
   process(reset)
   begin
	--Start only if testbench says start
	--i set by the PC counter, 8 bit instructions
	  if(reset='1') then
	        inst_reg (0) <= data_store(31 downto 0);
			  inst_reg (1) <= data_store(63 downto 32);
			  inst_reg (2) <= data_store(95 downto 64);
			  inst_reg (3) <= data_store(127 downto 96);
			  inst_reg (4) <= data_store(159 downto 128);
			  inst_reg (5) <= data_store(191 downto 160);
			  inst_reg (6) <= data_store(223 downto 192);
			  inst_reg (7) <= data_store(255 downto 224);
			  inst_reg (8) <= data_store(287 downto 256);
			  inst_reg (9) <= data_store(319 downto 288);
			  inst_reg (10) <= data_store(351 downto 320);
			  inst_reg (11) <= data_store(383 downto 352);
			  inst_reg (12) <= data_store(415 downto 384);
			  inst_reg (13) <= data_store(447 downto 416);
			  inst_reg (14) <= data_store(479 downto 448);
			  inst_reg (15) <= data_store(511 downto 480);
			  inst_reg (16) <= data_store(543 downto 512);
			  inst_reg (17) <= data_store(575 downto 544);
			  inst_reg (18) <= data_store(607 downto 576);
			  inst_reg (19) <= data_store(639 downto 608);
			  inst_reg (20) <= data_store(671 downto 640);
			  inst_reg (21) <= data_store(703 downto 672);
			  inst_reg (22) <= data_store(735 downto 704);
			  inst_reg (23) <= data_store(767 downto 736);
			  inst_reg (24) <= data_store(799 downto 768);
			  inst_reg (25) <= data_store(831 downto 800);
			  inst_reg (26) <= data_store(863 downto 832);
			  inst_reg (27) <= data_store(895 downto 864);
			  inst_reg (28) <= data_store(927 downto 896);
			  inst_reg (29) <= data_store(959 downto 928);
			  inst_reg (30) <= data_store(991 downto 960);
			  inst_reg (31) <= data_store(1023 downto 992);
			  inst_reg (32) <= data_store(1055 downto 1024);
			  inst_reg (33) <= data_store(1087 downto 1056);
			  inst_reg (34) <= data_store(1119 downto 1088);
			  inst_reg (35) <= data_store(1151 downto 1120);
			  inst_reg (36) <= data_store(1183 downto 1152);
			  inst_reg (37) <= data_store(1215 downto 1184);
			  inst_reg (38) <= data_store(1247 downto 1216);
			  inst_reg (39) <= data_store(1279 downto 1248);
			  inst_reg (40) <= data_store(1311 downto 1280);
			  inst_reg (41) <= data_store(1343 downto 1312);
			  inst_reg (42) <= data_store(1375 downto 1344);
			  inst_reg (43) <= data_store(1407 downto 1376);
			  inst_reg (44) <= data_store(1439 downto 1408);
			  inst_reg (45) <= data_store(1471 downto 1440);
			  inst_reg (46) <= data_store(1503 downto 1472);
			  inst_reg (47) <= data_store(1535 downto 1504);
			  inst_reg (48) <= data_store(1567 downto 1536);
			  inst_reg (49) <= data_store(1599 downto 1568);
			  inst_reg (50) <= data_store(1631 downto 1600);
			  inst_reg (51) <= data_store(1663 downto 1632);
			  inst_reg (52) <= data_store(1695 downto 1664);
			  inst_reg (53) <= data_store(1727 downto 1696);
			  inst_reg (54) <= data_store(1759 downto 1728);
			  inst_reg (55) <= data_store(1791 downto 1760);
			  inst_reg (56) <= data_store(1823 downto 1792);
			  inst_reg (57) <= data_store(1855 downto 1824);
			  inst_reg (58) <= data_store(1887 downto 1856);
			  inst_reg (59) <= data_store(1919 downto 1888);
			  inst_reg (60) <= data_store(1951 downto 1920);
			  inst_reg (61) <= data_store(1983 downto 1952);
			  inst_reg (62) <= data_store(2015 downto 1984);
			  inst_reg (63) <= data_store(2047 downto 2016);
	  end if;
   end process;
	
   data_load <= inst_reg(i);

end Behavioral;

