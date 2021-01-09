--ECE 3401 Lab3
--Written by Masab Ahmad
--University of Connecticut

library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

---------------------------------------------

entity aluarith is

port(
		op1:	            in signed(31 downto 0);
		op2:		         in signed(31 downto 0);
		alu_operation:    in signed(2 downto 0);
		load:             in std_logic;
		store:            in std_logic;
		alu_out:		      out signed(63 downto 0)

); 
end aluarith;

----------------------------------------------

architecture behv of aluarith is
   
	signal alu_in1: signed(31 downto 0) := (others => '0');
	signal alu_in2: signed(31 downto 0) := (others => '0');

begin

  --ALU in 1 MUX
  process(op1,op2,store)  
  begin
    if(store='1') then
	   alu_in1 <= op2;
	 else
	   alu_in1 <= op1;
	 end if;
  end process;
  
  --ALU in 2 MUX
  process(op2,store,load)  
  begin
    if(store='1' or load='1') then
	   alu_in2 <= x"00000000";
	 else
	   alu_in2 <= op2;
	 end if;
  end process;
  
  --ALU
  process(alu_in1,alu_in2, alu_operation)
  begin 
         if(alu_operation="001") then  --MULT
		alu_out <= alu_in1 * alu_in2;
	 elsif(alu_operation="010") then  --SHIFT LEFT
		alu_out <= (x"00000000" & shift_left(alu_in2,1));
	 elsif(alu_operation="011") then  --SHIFT RIGHT
		alu_out <= (x"00000000" & shift_right(alu_in2,1));
	 elsif(alu_operation="100") then  --BRANCHIFLESS
		if (alu_in2 < alu_in1) then
			alu_out <= (x"00000000") & (x"00000001");
		else
			alu_out <= (x"00000000") & (x"00000000");
		end if;
	 else                             --LD, ST, NOP DUMMY ADD
	   alu_out <= (x"00000000" & alu_in1) + alu_in2; 
    end if;
  end process;

end behv;
