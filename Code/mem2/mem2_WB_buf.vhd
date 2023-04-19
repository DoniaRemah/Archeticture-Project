library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mem1_mem2_buf is
    port (
        clk : in std_logic;         
        reset : in std_logic;       
        writeEnable : in std_logic;     

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
    -- signal for all inputs
    signal dataSelectorSig, inDataSelectorSig, flagSelectorSig, flagEnableSig, regFileEnableSig:std_logic;
    signal dataReadSig,ALU_ImmSig:std_logic_vector(15 downto 0);
    signal flagsReadSig:std_logic_vector(2 downto 0);
    signal RdAddressSig:std_logic_vector(2 downto 0);
    signal newFlagsSig:std_logic_vector(2 downto 0);
begin
    process(clk,reset)
    begin
        if reset = '1' then
            -- reset all signals
            dataSelectorSig <= '0';
            inDataSelectorSig <= '0';
            flagSelectorSig <= '0';
            flagEnableSig <= '0';
            regFileEnableSig <= '0';
            dataReadSig <= (others => '0');
            flagsReadSig <= (others => '0');
            RdAddressSig <= (others => '0');
            ALU_ImmSig <= (others => '0');
            newFlagsSig <= (others => '0');
        elsif falling_edge(clk) then
            if writeEnable = '1' then
                -- write the signals
                dataSelectorSig <= dataSelector;
                inDataSelectorSig <= inDataSelector;
                flagSelectorSig <= flagSelector;
                flagEnableSig <= flagEnable;
                regFileEnableSig <= regFileEnable;
                dataReadSig <= dataRead;
                flagsReadSig <= flagsRead;
                RdAddressSig <= RdAddress;
                ALU_ImmSig <= ALU_Imm;
                newFlagsSig <= newFlags;
            end if;
        end if;
    end process;
    -- assign the signals
    dataSelectorOut <= dataSelectorSig;
    inDataSelectorOut <= inDataSelectorSig;
    flagSelectorOut <= flagSelectorSig;
    flagEnableOut <= flagEnableSig;
    regFileEnableOut <= regFileEnableSig;
    wbAddress <= RdAddressSig;
    memResult <= dataReadSig;
    memFlags <= flagsReadSig;
    AluResult <= ALU_ImmSig;
    ALUflags <= newFlagsSig;
end Behavioral;

