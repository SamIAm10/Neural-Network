----------------------------------------------------------------------------------
-- Company: University of Connecticut
-- Engineer: Masab Ahmad
----------------------------------------------------------------------------------
library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity aludemux is

port(
		use_imm:          in std_logic;
                load:             in std_logic;
		store:            in std_logic;
                inst_out:         in signed(31 downto 0);
		alu_out:          in signed(63 downto 0);
		
		dmem_addr:        out signed(31 downto 0);
		write_data:       out signed(31 downto 0)
); 

end aludemux;

architecture Behavioral of aludemux is

begin

  process(load,store,alu_out)
  begin
    if(load='1' or store='1') then
	   dmem_addr <= alu_out (31 downto 0);
	 else
	   write_data <= alu_out (31 downto 0);
	 end if;
  end process;

end Behavioral;

