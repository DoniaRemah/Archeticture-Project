library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity notOp is 
port  (
    first_src : in std_logic_vector (15 downto 0); 
    flags : in std_logic_vector (2 downto 0);
    not_res : out std_logic_vector (15 downto 0);
    new_flags : out std_logic_vector (2 downto 0)
);
end notOp;

Architecture ArchnotOp of notOp is

    signal zeroflag , carryflag , negativeflag : std_logic ;

    signal tempres : std_logic_vector (15 downto 0);
begin

    tempres <= not first_src ;

    zeroflag <= '1' when tempres = x"0000" else '0' ;

    carryflag <= flags(2);

    -- negativeflag <= '1' when (signed(std_logic_vector(unsigned(first_src) + 1)) < 0) else '0';

    negativeflag <= '1' when tempres(15) = '1' else '0';

    not_res <= tempres;

    new_flags <= carryflag & negativeflag & zeroflag;

end ArchnotOp;