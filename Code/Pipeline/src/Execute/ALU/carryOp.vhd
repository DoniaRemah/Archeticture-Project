library IEEE;
use IEEE.std_logic_1164.all;

entity carryOp is 
port  (
    op_sel : in std_logic_vector (2 downto 0);
	flags : in std_logic_vector (2 downto 0); 
    new_flags : out std_logic_vector (2 downto 0)
);
end carryOp;

Architecture ArchcarryOp of carryOp is

signal  carryflag : std_logic ;

begin

    carryflag <= '1' when op_sel = "000" else '0' ;

    new_flags <= carryflag & flags(1) & flags (0);

end ArchcarryOp;