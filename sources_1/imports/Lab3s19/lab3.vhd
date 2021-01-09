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

entity lab3 is

port(
      clk:                 in std_logic;
		reset:             in std_logic;
		inst_init:        in signed(2047 downto 0);
		data_init:        in signed(8191 downto 0);
		
		op1_out:           out signed(31 downto 0);
		op2_out:           out signed(31 downto 0);

		inst:              out signed(31 downto 0);
		pc_val:            out signed(31 downto 0)
);

end lab3;

architecture Behavioral of lab3 is

signal wr_en: std_logic;

signal read_addr1 : signed(1 downto 0);
signal read_addr2 : signed(1 downto 0);
signal wr_addr    : signed(1 downto 0);

signal tab1_out : signed(10 downto 0); --changed from 9 downto 0

signal op1 : signed(31 downto 0);
signal op2 : signed(31 downto 0);

signal data_load  : signed(31 downto 0);
signal store_data : signed(31 downto 0);
signal reg_data   : signed(31 downto 0);
signal dmem_addr : signed(31 downto 0);

signal inst_out : signed(31 downto 0);

signal pc_out : signed(31 downto 0);
signal addr   : signed(31 downto 0);

signal alu_out : signed(63 downto 0);
signal pc_from_link : signed(31 downto 0);

signal reg_from_stack : signed(127 downto 0);
signal reg_to_stack : signed(127 downto 0);

signal neuron_output: signed(31 downto 0); --added
signal data_from_mem: signed (159 downto 0); --added

begin

   --Outputs
   op1_out <= op1;
	op2_out <= op2;
	pc_val  <= pc_out;
	inst    <= inst_out;

   --ALU Inputs & Arithmetic                            ALU_OP             load     store   
	aluarith : entity work.aluarith port map(op1,op2,tab1_out(4 downto 2),tab1_out(6),tab1_out(5),alu_out);
	
	--ALU Muxes                                   load     store    
	alumuxes : entity work.alumuxes port map(tab1_out(7),tab1_out(6),tab1_out(5), alu_out, data_load, inst_out, dmem_addr, reg_data, tab1_out(10), neuron_output); --changed
	
	--Reg File                                            store      read_addr1  read_addr2  wr_addr  reg_wr_en   write_b_mux
	reg_file1 : entity work.reg_file port map(clk,reset,tab1_out(5), read_addr1, read_addr2, wr_addr, tab1_out(0),reg_data, op1, op2, reg_from_stack, reg_to_stack, tab1_out(9));
	
	--PC Val and Mux                        use_imm,                load      store                                      call         ret     
	pc1 : entity work.pc port map(clk,reset,tab1_out(7),alu_out(0),tab1_out(6),tab1_out(5),inst_out(14 downto 10),pc_out,tab1_out(8), tab1_out(9),pc_from_link);
	
	--Instruction Handler                   addr                inst
	inst1 : entity work.inst port map(reset,pc_out,inst_init,inst_out);
	
	--DRAM                                      dmem_wr_en
	dram1 : entity work.dram port map(clk,reset,tab1_out(1),dmem_addr,op1,data_load, data_init, tab1_out(10), data_from_mem); --changed
	
	--Table 1                               inst
	table1 : entity work.table1 port map(inst_out(9 downto 0), read_addr1, read_addr2, wr_addr, tab1_out); --changed
	
	--Link Register 
	link_register : entity work.link_register port map(clk, reset, tab1_out(8), pc_out , pc_from_link );
	
	--Stack
	stack : entity work.stack port map(clk, reset, tab1_out(8), reg_to_stack ,reg_from_stack );
	
	neuron: entity work.neuron port map(tab1_out(10), data_from_mem, neuron_output); --added

end Behavioral;

