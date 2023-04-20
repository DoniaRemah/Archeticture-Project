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
        FlagsOut: out std_logic_vector(2 downto 0);
        inport : in std_logic_vector(15 downto 0);
inportOut : out std_logic_vector(15 downto 0)

    );
end ID_EX_buf;

architecture Behavioral of ID_EX_buf is
begin
    process (clk, reset)
    begin
        if reset = '1' then
        -- make all outputs to 0
        dataSelectorOut <= '0';
        inDataSelectorOut <= '0';
        flagSelectorOut <= '0';
        flagEnableOut <= '0';
        regFileEnableOut <= '0';
        readAddressSelOut <= '0';
        writeAddressSelOut <= '0';
        dataWrittenSelOut <= '0';
        memOpOut <= '0';
        memReadOut <= '0';
        memWriteOut <= '0';
        dataBusSelectorOut <= '0';
        propRetRtiOut <= '0';
        ALUEnableOut <= '0';
        Imm_Src_selectorOut <= '0';
        branchingOpOut <= '0';
        callOpOut <= '0';
        partSelectorOut <= "00";
        opSelectorOut <= "000";
        newPCAddressOut <= "0000000000000000";
        jumped_call_address <= "0000000000000000";
        rs1DataOut <= "0000000000000000";
        rs2DataOut <= "0000000000000000";
        offset_ImmOut <= "0000000000000000";
        RdAddressOut <= "000";
        FlagsOut <= "000";
        inportOut <= (others => '0');
            -- check on the falling edge of teh clock
        elsif rising_edge(clk) then
            if writeEnable = '1' then
            -- write output to corresponding input
            dataSelectorOut <= dataSelector;
            inDataSelectorOut <= inDataSelector;
            flagSelectorOut <= flagSelector;
            flagEnableOut <= flagEnable;
            regFileEnableOut <= regFileEnable;
            readAddressSelOut <= readAddressSel;
            writeAddressSelOut <= writeAddressSel;
            dataWrittenSelOut <= dataWrittenSel;
            memOpOut <= memOp;
            memReadOut <= memRead;
            memWriteOut <= memWrite;
            dataBusSelectorOut <= dataBusSelector;
            propRetRtiOut <= propRetRti;
            ALUEnableOut <= ALUEnable;
            Imm_Src_selectorOut <= Imm_Src_selector;
            branchingOpOut <= branchingOP;
            callOpOut <= callOp;
            partSelectorOut <= partSelector;
            opSelectorOut <= opSelector;
            newPCAddressOut <= newPCAddress;
            jumped_call_address <= offset_Imm;
            rs1DataOut <= rs1Data;
            rs2DataOut <= rs2Data;
            jumped_call_address<= rdData;
            offset_ImmOut <= offset_Imm;
            RdAddressOut <= RdAddress;
            FlagsOut <= Flags;
            inportOut <= inport;
            end if;
        end if;
    end process;
end Behavioral;

