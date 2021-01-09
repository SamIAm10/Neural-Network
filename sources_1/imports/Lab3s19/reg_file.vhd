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

entity reg_file is

port( clk: in std_logic;
      reset: in std_logic;
		store: in std_logic;
      read_addr1: in signed(1 downto 0);
      read_addr2: in signed(1 downto 0);
		wr_addr: in signed(1 downto 0);
		wr_en: in std_logic;
		data_in: in signed(31 downto 0);
		op1: out signed(31 downto 0);
		op2: out signed(31 downto 0);
		reg_from_stack: in signed(127 downto 0);
		reg_to_stack: out signed(127 downto 0);
		ret: in std_logic
);

end reg_file;

architecture Behavioral of reg_file is

	signal reg0 : signed(31 downto 0) := (x"00000000");     --CPU registers
	signal reg1 : signed(31 downto 0) := (x"00000000");
	signal reg2 : signed(31 downto 0) := (x"00000000");
	signal reg3 : signed(31 downto 0) := (x"00000000");
	
	signal addr2 : signed(1 downto 0);

begin
reg_to_stack <= reg3 & reg2 & reg1 & reg0;
process(clk,reset,wr_addr, wr_en)
begin
  if(reset='1') then
	reg0 <= (x"00000000");     --CPU registers
	reg1 <= (x"00000000");     --CPU registers
	reg2 <= (x"00000000");     --CPU registers
	reg3 <= (x"00000000");     --CPU registers
  elsif(rising_edge(clk)) then
    if(wr_en = '1') then
        case wr_addr is
                when "00" =>  
                   reg0 <= data_in; 
                 when "01" =>  
                   reg1 <= data_in;
                 when "10" =>  
                   reg2 <= data_in;
                 when others =>  
                   reg3 <= data_in;
        end case;
     elsif(ret = '1') then
        reg0 <= reg_from_stack(31 downto 0);
        reg1 <= reg_from_stack(63 downto 32);
        reg2 <= reg_from_stack(95 downto 64);
        reg3 <= reg_from_stack(127 downto 96);    
	end if;
  end if;
end process;

process(store,wr_addr,read_addr2)
begin
  if(store='1') then
    addr2 <= wr_addr;
  else
    addr2 <= read_addr2;
  end if;
end process;

process(read_addr1,reg0,reg1,reg2,reg3)
begin
  
    case read_addr1 is
		    when "00" =>  
			   op1 <= reg0; 
			 when "01" =>  
			   op1 <= reg1; 
			 when "10" =>  
			   op1 <= reg2; 
			 when others =>  
			   op1 <= reg3; 
	end case;
end process;

process(addr2,reg0,reg1,reg2,reg3)
begin
    case addr2 is
		    when "00" =>  
			   op2 <= reg0; 
			 when "01" =>  
			   op2 <= reg1; 
			 when "10" =>  
			   op2 <= reg2; 
			 when others =>  
			   op2 <= reg3; 
	end case;
end process;

end Behavioral;

