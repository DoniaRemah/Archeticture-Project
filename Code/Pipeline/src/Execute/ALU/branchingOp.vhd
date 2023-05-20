library IEEE;
use IEEE.std_logic_1164.all;

entity branchingOp is 
port  (
    op_sel : in std_logic_vector (2 downto 0);
	flags : in std_logic_vector (2 downto 0); 
    branching_res : out std_logic;
    new_flags : out std_logic_vector (2 downto 0)
);
end branchingOp;

Architecture ArchbranchingOp of branchingOp is
signal zeroflag , carryflag , negativeflag : std_logic ;
begin

    branching_res <= '1' when op_sel = "010" else flags(0) when op_sel = "000" else flags(2) when op_sel = "001" else '0';
    zeroflag <= '0'  when op_sel = "000" and flags(0) = '1' else flags(0);
    carryflag  <= '0'  when op_sel = "001" and flags(2) = '1' else flags(2);
    negativeflag <= flags(1);
    new_flags <= carryflag & negativeflag & zeroflag;

end ArchbranchingOp;