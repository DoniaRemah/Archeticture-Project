library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ex_mem1_buf is
    port (
        clk : in std_logic;         
        reset : in std_logic;       
        writeEnable : in std_logic; 
        interrupt : in std_logic;     

        -- the write back signals
        dataSelector, inDataSelector, flagSelector, flagEnable, regFileEnable:in std_logic;

        -- memory signals
        readAddressSel,writeAddressSel,dataWrittenSel,memOp,memRead, memWrite, dataBusSelector, propRetRti: in std_logic;

        -- the data in
        ALU_Imm, rs1_data, rs2_data , newPC_address : in std_logic_vector(15 downto 0);  
        RdAddress: in std_logic_vector(2 downto 0);
        newFlags: in std_logic_vector(2 downto 0);
        
        -- the data out
        -- the same as the data in
        dataSelectorOut, inDataSelectorOut, flagSelectorOut, flagEnableOut, regFileEnableOut:out std_logic;

        readAddressSelOut,writeAddressSelOut,dataWrittenSelOut,memOpOut,memReadOut, memWriteOut, dataBusSelectorOut, propRetRtiOut: out std_logic;

        ALU_ImmOut, rs1_data_Out, rs2_data_Out ,newPC_address_out : out std_logic_vector(15 downto 0);
        RdAddressOut: out std_logic_vector(2 downto 0);
        
        newFlagsOut: out std_logic_vector(2 downto 0);
        inport : in std_logic_vector(15 downto 0);
inportOut : out std_logic_vector(15 downto 0)
    );
end ex_mem1_buf;

architecture Behavioral of ex_mem1_buf is
    -- declare signals for all inputs
    signal dataSelectorSig, inDataSelectorSig, flagSelectorSig, flagEnableSig, regFileEnableSig: std_logic;
    signal readAddressSelSig, writeAddressSelSig, dataWrittenSelSig, memOpSig, memReadSig, memWriteSig, dataBusSelectorSig, propRetRtiSig: std_logic;
    signal  ALU_ImmSig, rs1_dataSig, rs2_dataSig , newPC_addressSig : std_logic_vector(15 downto 0);
    signal RdAddressSig: std_logic_vector(2 downto 0);
    signal newFlagsSig: std_logic_vector(2 downto 0);
begin
    process (clk, reset)
    begin
        if reset = '1' then
            -- set all signals to default values
            -- dataSelectorSig <= '0';
            -- inDataSelectorSig <= '0';
            -- flagSelectorSig <= '0';
            -- flagEnableSig <= '0';
            -- regFileEnableSig <= '0';
            -- readAddressSelSig <= '0';
            -- writeAddressSelSig <= '0';
            -- dataWrittenSelSig <= '0';
            -- memOpSig <= '0';
            -- memReadSig <= '0';
            -- memWriteSig <= '0';
            -- dataBusSelectorSig <= '0';
            -- propRetRtiSig <= '0';
            -- ALU_ImmSig <= (others => '0');
            -- rs1_dataSig <= (others => '0');
            -- rs2_dataSig <= (others => '0');
            -- newPC_addressSig <= (others => '0');
            -- RdAddressSig <= (others => '0');
            -- newFlagsSig <= (others => '0');

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
            ALU_ImmOut <= (others => '0');
            rs1_data_Out<= (others => '0');
            rs2_data_Out  <= (others => '0') ;
            newPC_address_out  <=  (others => '0');
            RdAddressOut <= (others => '0');
            newFlagsOut <= (others => '0');
            inportOut <= (others => '0');
            -- check on the falling edge of teh clock
        elsif rising_edge(clk) then
            if writeEnable = '1' then
            -- assign input signals to corresponding signals
                -- dataSelectorSig <= dataSelector;
                -- inDataSelectorSig <= inDataSelector;
                -- flagSelectorSig <= flagSelector;
                -- flagEnableSig <= flagEnable;
                -- regFileEnableSig <= regFileEnable;
                -- readAddressSelSig <= readAddressSel;
                -- writeAddressSelSig <= writeAddressSel;
                -- dataWrittenSelSig <= dataWrittenSel;
                -- memOpSig <= memOp;
                -- memReadSig <= memRead;
                -- memWriteSig <= memWrite;
                -- dataBusSelectorSig <= dataBusSelector;
                -- propRetRtiSig <= propRetRti;
                -- ALU_ImmSig <= ALU_Imm;
                -- rs1_dataSig <= rs1_data;
                -- rs2_dataSig <= rs2_data;
                -- newPC_addressSig <= newPC_address;
                -- RdAddressSig <= RdAddress;
                -- newFlagsSig <= newFlags;

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
            ALU_ImmOut <= ALU_Imm;
            rs1_data_Out<= rs1_data;
            rs2_data_Out  <= rs2_data ;
            newPC_address_out  <=  newPC_address;
            RdAddressOut <= RdAddress;
            newFlagsOut <= newFlags;
            inportOut <= inport;
            end if;
        end if;
    end process;
end Behavioral;

