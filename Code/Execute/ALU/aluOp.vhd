library IEEE;
use IEEE.std_logic_1164.all;

entity aluOp is 
port  (
    alu_enable:in std_logic;
    op_sel : in std_logic_vector (2 downto 0);
    first_src : in std_logic_vector (15 downto 0); 
	second_src : in std_logic_vector (15 downto 0); 
	flags : in std_logic_vector (2 downto 0); 
    aluOp_res : out std_logic_vector (15 downto 0);
    new_flags : out std_logic_vector (2 downto 0)
);
end aluOp;

Architecture ArchaluOp of aluOp is

begin

    aluOp_res <= first_src;
    new_flags <= flags;

end ArchaluOp;