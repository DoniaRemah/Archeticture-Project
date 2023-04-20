library IEEE;
use IEEE.std_logic_1164.all;

entity ALU is 
port  (
    alu_enable:in std_logic;
    part_sel: in std_logic_vector (1 downto 0);
    op_sel : in std_logic_vector (2 downto 0);
	first_src : in std_logic_vector (15 downto 0); 
	second_src : in std_logic_vector (15 downto 0); 
	flags : in std_logic_vector (2 downto 0); 
    branching_res : out std_logic;
	alu_res : out std_logic_vector (15 downto 0);
    new_flags : out std_logic_vector (2 downto 0)
);
end ALU;

Architecture ArchALU of ALU is

    signal aluOp_res_data , branchingOp_res_data , carryOp_res_data , movOp_res_data : std_logic_vector (15 downto 0);
    signal aluOp_res_flags , branchingOp_res_flags , carryOp_res_flags , movOp_res_flags : std_logic_vector (2 downto 0);

begin
	

end ArchALU;