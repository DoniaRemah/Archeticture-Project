library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mem1_mem2_buf is
    port (
        clk : in std_logic;         
        reset : in std_logic;       
        writeEnable : in std_logic;   
        interrupt : in std_logic; 

        -- the write back signals
        dataSelector, inDataSelector, flagSelector, flagEnable, regFileEnable:in std_logic;

        -- the data in
        dataRead,flagsRead,ALU_Imm:in std_logic_vector(15 downto 0);
        RdAddress:in std_logic_vector(2 downto 0);
        newFlags:in std_logic_vector(2 downto 0);
        
        -- the data out
        -- write back signals
        dataSelectorOut, inDataSelectorOut, flagSelectorOut, flagEnableOut, regFileEnableOut:out std_logic;

        memResult,AluResult:out std_logic_vector(15 downto 0);
        -- the mem flags are the read flags from the memory
        -- the alu flags are the new flags
        -- note: when reading the flags from the memory, take the most significant 3 bit
        memFlags,ALUflags,wbAddress:out std_logic_vector(2 downto 0)
    );
end mem1_mem2_buf;

architecture Behavioral of mem1_mem2_buf is
begin
    process(clk,reset)
    begin
        if reset = '1' then
            -- reset the signals
            dataSelectorOut <= '0';
            inDataSelectorOut <= '0';
            flagSelectorOut <= '0';
            flagEnableOut <= '0';
            regFileEnableOut <= '0';
            memResult <= (others => '0');
            memFlags <= (others => '0');
            AluResult <= (others => '0');
            ALUflags <= (others => '0');
            wbAddress <= (others => '0');
        elsif rising_edge(clk) then
            if writeEnable = '1' then
                -- write the inputs to the corresponding outputs
                dataSelectorOut <= dataSelector;
                inDataSelectorOut <= inDataSelector;
                flagSelectorOut <= flagSelector;
                flagEnableOut <= flagEnable;
                regFileEnableOut <= regFileEnable;
                memResult <= dataRead;
                memFlags <= flagsRead;
                AluResult <= ALU_Imm;
                ALUflags <= newFlags;
                wbAddress <= RdAddress;
            end if;
        end if;
    end process;
end Behavioral;

