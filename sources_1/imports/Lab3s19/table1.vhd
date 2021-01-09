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

entity table1 is

port(
       inst:	    in signed(9 downto 0);
	   read_addr1:  out signed(1 downto 0);
       read_addr2:  out signed(1 downto 0);
       wr_addr:     out signed(1 downto 0);
       tab1_out:	out signed(10 downto 0) --changed from 9 downto 0
);

end table1;

architecture Behavioral of table1 is

	--Table 1
	type table1 is array (15 downto 0,10 downto 0) of std_logic; --15 --changed
	
	--Table format
	--nn, ret, call, use_imm, load, store, ALU_OP (3 bits), dmem_wr_en, reg_wren  --added nn
	--MSB                                                           LSB
	
	--changed tab1
	signal tab1 : table1 := (   "00000000000",  --1111 NOP
				                "00000000000",  --1110 NOP
			                    "00000000000",  --1101 NOP
                                "00000000000",  --1100 NOP
                                "00000000000",  --1011 NOP
                                "00000000000",  --1010 NOP
                                "10001000001",  --1001 NN --changed
                                "01000000000",  --1000 <= CONTROL TABLE OUTPUT IS WRONG. YOU NEED TO FIX THIS FOR LAB3
                                "00100000000",  --0111 <= CONTROL TABLE OUTPUT IS WRONG. YOU NEED TO FIX THIS FOR LAB3
                                "00010010000",  --0110 <= CONTROL TABLE OUTPUT IS WRONG. YOU NEED TO FIX THIS FOR LAB3
                                "00000001101",  --0101 <= CONTROL TABLE OUTPUT IS WRONG. YOU NEED TO FIX THIS FOR LAB3
                                "00000001001",  --0100 <= CONTROL TABLE OUTPUT IS WRONG. YOU NEED TO FIX THIS FOR LAB3
                                "00000000101",  --0011 <= CONTROL TABLE OUTPUT IS WRONG. YOU NEED TO FIX THIS FOR LAB3
                                "00000000001",  --0010 <= CONTROL TABLE OUTPUT IS WRONG. YOU NEED TO FIX THIS FOR LAB3
                                "00000100010",  --0001 <= CONTROL TABLE OUTPUT IS WRONG. YOU NEED TO FIX THIS FOR LAB3
                                "00001000001"); --0000 <= CONTROL TABLE OUTPUT IS WRONG. YOU NEED TO FIX THIS FOR LAB3

signal tab1i : integer := 0;
signal tab1_addr : signed(4 downto 0) := (others => '0');  --Address into table 1

begin
   
   tab1_addr(3 downto 0) <= inst(3 downto 0);              --Table address based in 4 LSB inst bits
   tab1i <= to_integer(tab1_addr);                         --convert addr to integer to index into table array

	--Table 1 Address Indexing
   process(tab1_addr,tab1i, tab1)
   begin
	          tab1_out(0) <= tab1 (tab1i,0);
			  tab1_out(1) <= tab1 (tab1i,1);
			  tab1_out(2) <= tab1 (tab1i,2);
			  tab1_out(3) <= tab1 (tab1i,3);
			  tab1_out(4) <= tab1 (tab1i,4);
			  tab1_out(5) <= tab1 (tab1i,5);
			  tab1_out(6) <= tab1 (tab1i,6);
			  tab1_out(7) <= tab1 (tab1i,7);
			  tab1_out(8) <= tab1 (tab1i,8);
			  tab1_out(9) <= tab1 (tab1i,9);
			  tab1_out(10) <= tab1 (tab1i,10); --added
   end process;	
	
	--Register file addressing 
   process(inst)
   begin
	  read_addr1 <= inst(5 downto 4);  --Rs1
	  read_addr2 <= inst(7 downto 6);  --Rs2
	  wr_addr    <= inst(9 downto 8);  --Rd
   end process;

end Behavioral;
