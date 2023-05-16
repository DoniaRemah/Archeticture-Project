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

begin

    process( MEM1_MEM2_OP,  EX_MEM_OP)
    begin
    HAZARD_SIGNAL <= MEM1_MEM2_OP and EX_MEM_OP;
    end process;
end logicofhdu;