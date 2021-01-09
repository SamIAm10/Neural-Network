library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity neuron is
    port (nn: in std_logic;
        data_from_mem: in signed(159 downto 0);
        neuron_output: out signed(31 downto 0));
end neuron;

architecture Behavioral of neuron is
    signal in0, in1, in2, in3, coeff: signed(31 downto 0) := (others => '0');
    signal result: signed(63 downto 0) := (others => '0'); --in case of overflow
begin
    in0 <= data_from_mem(159 downto 128);
    in1 <= data_from_mem(127 downto 96);
    in2 <= data_from_mem(95 downto 64);
    in3 <= data_from_mem(63 downto 32);
    coeff <= data_from_mem(31 downto 0);
    result <= coeff*(in0 + in1 + in2 + in3) when nn = '1';
    neuron_output <= result(31 downto 0) when nn = '1';
end Behavioral;
