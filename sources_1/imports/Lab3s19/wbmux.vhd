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

entity wbmux is

port(
		load:             in std_logic;
		write_data:		   in signed(31 downto 0);
		load_data:		   in signed(31 downto 0);

		reg_data:		   out signed(31 downto 0);
		
		nn: in std_logic; --added
		neuron_output: in signed(31 downto 0) --added
);

end wbmux;

architecture Behavioral of wbmux is

begin

 process(load,write_data,load_data, nn, neuron_output) --changed
 begin
    if load = '1' and nn = '1' then --added
	   reg_data <= neuron_output;
	elsif load = '1' then
	  reg_data <= load_data;
	 else
	   reg_data <= write_data;
	 end if;
 end process;

end Behavioral;

