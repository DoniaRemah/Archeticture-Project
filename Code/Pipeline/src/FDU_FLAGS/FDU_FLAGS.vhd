library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity FDU_FLAGS is
    port (
    FLAGS_in:in std_logic_vector (2 downto 0);
    Mem1_Alu_flags:in std_logic_vector (2 downto 0);
	Alu_Result_flags:in std_logic_vector (2 downto 0);
    Writeback_Flags:in std_logic_vector (2 downto 0);
	flag_Enable:in std_logic;
    Execution_WB_Signal:in std_logic;
    Mem1_Wb_Signal:in std_logic;
    Flags_Out:out std_logic_vector (2 downto 0)  
    );
end FDU_FLAGS;

architecture logicofFDU of FDU_FLAGS is 
begin

process (FLAGS_in, flag_Enable,Execution_WB_Signal,Mem1_Wb_Signal)
    begin
    
    Flags_Out <= FLAGS_in;
        -- My source, is the destination of a previous alu operation
        if (Execution_WB_Signal = '1') then
            Flags_Out <= Alu_Result_flags;
        -- Second instruction after the one we want its result
        elsif (Mem1_Wb_Signal = '1') then
              
            Flags_Out <= Mem1_Alu_flags;
        -- Third Instruction after the one we want its result
        elsif (flag_Enable = '1') then
               
                    Flags_Out <= Writeback_Flags;
                 
        end if;
    end process; 
end logicofFDU;