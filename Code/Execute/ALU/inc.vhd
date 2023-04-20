library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity inc is 
port  (
    first_src : in std_logic_vector (15 downto 0); 
    inc_res : out std_logic_vector (15 downto 0);
    new_flags : out std_logic_vector (2 downto 0)
);
end inc;

Architecture Archinc of inc is

    signal zeroflag , carryflag , negativeflag : std_logic ;

    signal tempres : std_logic_vector (15 downto 0);
begin

    tempres <= x"0000" when first_src = x"FFFF" else std_logic_vector(unsigned(first_src) + 1) ;

    zeroflag <= '1' when first_src = x"FFFF" else '0' ;

    carryflag <= '1' when first_src = x"FFFF" else '0';

    -- negativeflag <= '1' when (signed(std_logic_vector(unsigned(first_src) + 1)) < 0) else '0';

    negativeflag <= '1' when tempres(15) = '1' else '0';

    inc_res <= tempres;

    new_flags <= carryflag & negativeflag & zeroflag;

end Archinc;