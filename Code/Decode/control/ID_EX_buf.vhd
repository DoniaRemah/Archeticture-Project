library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ID_EX_buf is
    port (
        clk : in std_logic;         
        reset : in std_logic;       
        writeEnable : in std_logic; 
        interrupt : in std_logic;     

        -- the write back signals
        dataSelector, inDataSelector, flagSelector, flagEnable, regFileEnable:in std_logic;

        -- memory signals
        readAddressSel,writeAddressSel,dataWrittenSel,memOp,memRead, memWrite, dataBusSelector, propRetRti: in std_logic;

        -- execute signals
        ALUEnable,Imm_Src_selector,branchingOP,callOp: in std_logic;
        partSelector: in std_logic_vector(1 downto 0);
        opSelector: in std_logic_vector(2 downto 0);

        -- flush signal
        flush: in std_logic;

        -- hazard signal
        hazard: in std_logic;

        -- the data in
        rdData,rs1Data,rs2Data,newPCAddress : in std_logic_vector(15 downto 0);  
        offset_Imm: in std_logic_vector(15 downto 0);
        RdAddress: in std_logic_vector(2 downto 0);
        Flags: in std_logic_vector(2 downto 0);
        
        -- wb signals
        dataSelectorOut, inDataSelectorOut, flagSelectorOut, flagEnableOut, regFileEnableOut:out std_logic;
        -- memory signals
        readAddressSelOut,writeAddressSelOut,dataWrittenSelOut,memOpOut,memReadOut, memWriteOut, dataBusSelectorOut, propRetRtiOut: out std_logic;
        -- execute signals
        ALUEnableOut,Imm_Src_selectorOut,branchingOpOut,callOpOut: out std_logic;
        partSelectorOut: out std_logic_vector(1 downto 0);
        opSelectorOut: out std_logic_vector(2 downto 0);

        newPCAddressOut: out std_logic_vector(15 downto 0);
        jumped_call_address: out std_logic_vector(15 downto 0);
        rs1DataOut,rs2DataOut,offset_ImmOut: out std_logic_vector(15 downto 0);
        RdAddressOut: out std_logic_vector(2 downto 0);
        FlagsOut: out std_logic_vector(2 downto 0)

    );
end ID_EX_buf;

architecture Behavioral of ID_EX_buf is
    -- declare signals for all inputs
    signal dataSelectorSig, inDataSelectorSig, flagSelectorSig, flagEnableSig, regFileEnableSig: std_logic;
    signal readAddressSelSig,writeAddressSelSig,dataWrittenSelSig,memOpSig,memReadSig, memWriteSig, dataBusSelectorSig, propRetRtiSig: std_logic;
    signal ALUEnableSig,Imm_Src_selectorSig,branchingOpSig,callOpSig: std_logic;
    signal partSelectorSig: std_logic_vector(1 downto 0);
    signal opSelectorSig: std_logic_vector(2 downto 0);
    signal newPCAddressSig: std_logic_vector(15 downto 0);
    signal jumped_call_addressSig: std_logic_vector(15 downto 0);
    signal rs1DataSig,rs2DataSig,offset_ImmSig: std_logic_vector(15 downto 0);
    signal RdAddressSig: std_logic_vector(2 downto 0);
    signal FlagsSig: std_logic_vector(2 downto 0);
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
            ALUEnableSig <= '0';
            Imm_Src_selectorSig <= '0';
            branchingOpSig <= '0';
            callOpSig <= '0';
            partSelectorSig <= "00";
            opSelectorSig <= "000";
            newPCAddressSig <= (others => '0');
            jumped_call_addressSig <= (others => '0');
            rs1DataSig <= (others => '0');
            rs2DataSig <= (others => '0');
            offset_ImmSig <= (others => '0');
            RdAddressSig <= (others => '0');
            FlagsSig <= (others => '0');
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
                ALUEnableSig <= ALUEnable;
                Imm_Src_selectorSig <= Imm_Src_selector;
                branchingOpSig <= branchingOp;
                callOpSig <= callOp;
                partSelectorSig <= partSelector;
                opSelectorSig <= opSelector;
                newPCAddressSig <= newPCAddress;
                jumped_call_addressSig <= rdData;
                rs1DataSig <= rs1Data;
                rs2DataSig <= rs2Data;
                offset_ImmSig <= offset_Imm;
                RdAddressSig <= RdAddress;
                FlagsSig <= Flags;

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
    ALUEnableOut <= ALUEnableSig;
    Imm_Src_selectorOut <= Imm_Src_selectorSig;
    branchingOpOut <= branchingOpSig;
    callOpOut <= callOpSig;
    partSelectorOut <= partSelectorSig;
    opSelectorOut <= opSelectorSig;
    newPCAddressOut <= newPCAddressSig;
    jumped_call_address <= jumped_call_addressSig;
    rs1DataOut <= rs1DataSig;
    rs2DataOut <= rs2DataSig;
    offset_ImmOut <= offset_ImmSig;
    RdAddressOut <= RdAddressSig;
    FlagsOut <= FlagsSig;
end Behavioral;

