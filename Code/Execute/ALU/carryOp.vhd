library IEEE;
use IEEE.std_logic_1164.all;

entity carryOp is 
port  (
    alu_enable:in std_logic;
    op_sel : in std_logic_vector (2 downto 0);
	flags : in std_logic_vector (2 downto 0); 
    new_flags : out std_logic_vector (2 downto 0)
);
end carryOp;

Architecture ArchcarryOp of carryOp is

begin

    new_flags <= flags;

end ArchcarryOp;