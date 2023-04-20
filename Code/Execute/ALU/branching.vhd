library IEEE;
use IEEE.std_logic_1164.all;

entity branchingOp is 
port  (
    alu_enable:in std_logic;
    op_sel : in std_logic_vector (2 downto 0);
	flags : in std_logic_vector (2 downto 0); 
    branching_res : out std_logic;
    new_flags : out std_logic_vector (2 downto 0)
);
end branchingOp;

Architecture ArchbranchingOp of branchingOp is

begin

    branching_res <= '0';
    new_flags <= flags;

end ArchbranchingOp;