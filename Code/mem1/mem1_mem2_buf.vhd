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

        -- memory signals
        readAddressSel,writeAddressSel,dataWrittenSel,memOp,memRead, memWrite, dataBusSelector, propRetRti: in std_logic;

        -- the data in
        dataToBeWritten, ALU_Imm, writeAddress, readAddress : in std_logic_vector(15 downto 0);  
        RdAddress: in std_logic_vector(2 downto 0);
        newFlags: in std_logic_vector(2 downto 0);
        
        -- the data out
        -- the same as the data in
        dataSelectorOut, inDataSelectorOut, flagSelectorOut, flagEnableOut, regFileEnableOut:out std_logic;

        readAddressSelOut,writeAddressSelOut,dataWrittenSelOut,memOpOut,memReadOut, memWriteOut, dataBusSelectorOut, propRetRtiOut: out std_logic;

        dataToBeWrittenOut, ALU_ImmOut, writeAddressOut, readAddressOut : out std_logic_vector(15 downto 0);
        RdAddressOut: out std_logic_vector(2 downto 0);
        
        newFlagsOut: out std_logic_vector(2 downto 0)
    );
end mem1_mem2_buf;

architecture Behavioral of mem1_mem2_buf is
    -- declare signals for all inputs
    signal dataSelectorSig, inDataSelectorSig, flagSelectorSig, flagEnableSig, regFileEnableSig: std_logic;
    signal readAddressSelSig, writeAddressSelSig, dataWrittenSelSig, memOpSig, memReadSig, memWriteSig, dataBusSelectorSig, propRetRtiSig: std_logic;
    signal dataToBeWrittenSig, ALU_ImmSig, writeAddressSig, readAddressSig: std_logic_vector(15 downto 0);
    signal RdAddressSig: std_logic_vector(2 downto 0);
    signal newFlagsSig: std_logic_vector(2 downto 0);
begin
    process (clk, reset)
    begin
        if reset = '1' then
            -- set all signals to default values
            dataSelectorSig <= '0';
            inDataSelectorSig <= '0';
            flagSelectorSig <= '0';
            flagEnableSig <= '0';
            regFileEnableSig <= '0';
            readAddressSelSig <= '0';
            writeAddressSelSig <= '0';
            dataWrittenSelSig <= '0';
            memOpSig <= '0';
            memReadSig <= '0';
            memWriteSig <= '0';
            dataBusSelectorSig <= '0';
            propRetRtiSig <= '0';
            dataToBeWrittenSig <= (others => '0');
            ALU_ImmSig <= (others => '0');
            writeAddressSig <= (others => '0');
            readAddressSig <= (others => '0');
            RdAddressSig <= (others => '0');
            newFlagsSig <= (others => '0');
            -- check on the falling edge of teh clock
        elsif falling_edge(clk) then
            if writeEnable = '1' then
            -- assign input signals to corresponding signals
                dataSelectorSig <= dataSelector;
                inDataSelectorSig <= inDataSelector;
                flagSelectorSig <= flagSelector;
                flagEnableSig <= flagEnable;
                regFileEnableSig <= regFileEnable;
                readAddressSelSig <= readAddressSel;
                writeAddressSelSig <= writeAddressSel;
                dataWrittenSelSig <= dataWrittenSel;
                memOpSig <= memOp;
                memReadSig <= memRead;
                memWriteSig <= memWrite;
                dataBusSelectorSig <= dataBusSelector;
                propRetRtiSig <= propRetRti;
                dataToBeWrittenSig <= dataToBeWritten;
                ALU_ImmSig <= ALU_Imm;
                writeAddressSig <= writeAddress;
                readAddressSig <= readAddress;
                RdAddressSig <= RdAddress;
                newFlagsSig <= newFlags;
            end if;
        end if;
    end process;
    dataSelectorOut <= dataSelectorSig;
    inDataSelectorOut <= inDataSelectorSig;
    flagSelectorOut <= flagSelectorSig;
    flagEnableOut <= flagEnableSig;
    regFileEnableOut <= regFileEnableSig;
    readAddressSelOut <= readAddressSelSig;
    writeAddressSelOut <= writeAddressSelSig;
    dataWrittenSelOut <= dataWrittenSelSig;
    memOpOut <= memOpSig;
    memReadOut <= memReadSig;
    memWriteOut <= memWriteSig;
    dataBusSelectorOut <= dataBusSelectorSig;
    propRetRtiOut <= propRetRtiSig;
    dataToBeWrittenOut <= dataToBeWrittenSig;
    ALU_ImmOut <= ALU_ImmSig;
    writeAddressOut <= writeAddressSig;
    readAddressOut <= readAddressSig;
    RdAddressOut <= RdAddressSig;
    newFlagsOut <= newFlagsSig;
end Behavioral;

