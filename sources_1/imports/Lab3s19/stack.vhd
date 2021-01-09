----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2019 02:52:43 PM
-- Design Name: 
-- Module Name: stack - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity stack is
port (clk, reset, en	: in std_logic;
	D		: in signed(127 downto 0);
	Q		: out signed(127 downto 0));
	
end stack;

architecture Behavioral of stack is
    signal Q_int : signed(127 downto 0) := (others => '0');
begin
--Add your code here
Q <= Q_int;
	process(clk, reset)
	begin
        if (reset = '1') then
            Q_int <= (others => '0');
        elsif (rising_edge(clk)) then
            if (en = '1') then
                Q_int <= D;
            else
                Q_int <= Q_int;
            end if;
        else
            Q_int <= Q_int;
        end if;
	end process;
end Behavioral;
