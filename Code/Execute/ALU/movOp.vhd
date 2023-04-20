library IEEE;
use IEEE.std_logic_1164.all;

entity movOp is 
port  (
    op_sel : in std_logic_vector (2 downto 0);
    first_src : in std_logic_vector (15 downto 0); 
	second_src : in std_logic_vector (15 downto 0); 
	flags : in std_logic_vector (2 downto 0); 
    movOp_res : out std_logic_vector (15 downto 0);
    new_flags : out std_logic_vector (2 downto 0)
);
end movOp;

Architecture ArchmovOp of movOp is

begin

    movOp_res <= first_src;
    new_flags <= flags;

end ArchmovOp;