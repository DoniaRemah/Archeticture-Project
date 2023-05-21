library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity HDU is
    port (
        MEM1_MEM2_OP : in std_logic;         
        EX_MEM_OP : in std_logic;       
        HAZARD_SIGNAL : out std_logic 
    );
end HDU;

architecture logicofhdu of HDU is
signal tempand: std_logic;

begin

    tempand <= (MEM1_MEM2_OP and EX_MEM_OP);

    HAZARD_SIGNAL <= tempand;

end logicofhdu;