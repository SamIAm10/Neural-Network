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

entity pc is

port( clk: in std_logic;
      reset: in std_logic;
	  branch: in std_logic;     --from TABLE 1
	  alu_branch: in std_logic; --from ALU OUTPUT
	  load: in std_logic;       --from TABLE 1
	  store: in std_logic;      --from TABLE 1
	  tag: in signed(4 downto 0);
	  pc_out:	 out signed(31 downto 0);
	  call: in std_logic; -- from TABLE 1
	  ret: in std_logic; -- from TABLE 1
	  pc_from_link:	 in signed(31 downto 0)
);

end pc;

architecture Behavioral of pc is

signal pc_temp : signed(31 downto 0);

begin

  pc_out <= pc_temp;

  process(clk,reset)
  begin
    if(reset='1') then                       --reset PC to 0 on a reset
        pc_temp <= x"00000000";
    elsif(rising_edge(clk)) then
    	-- YOU NEED TO MODIFY THE CODE WITHIN THIS ELSIF TO SUPPORT THE BRANCH, CALL, RET AND OTHER LAB3 INSTRUCTIONS
        if call = '1' then
            pc_temp <= "000000000000000000000000000" & tag;
        elsif ret = '1' then
            pc_temp <= pc_from_link;
        elsif branch = '1' then
            if alu_branch = '1' then
                pc_temp <= "000000000000000000000000000" & tag;
            else
                pc_temp <= pc_temp + 1;
            end if;
        else
            pc_temp <= pc_temp + 1;
        end if;
    end if;
  end process;
end Behavioral;

