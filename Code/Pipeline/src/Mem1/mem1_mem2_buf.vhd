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
        
        newFlagsOut: out std_logic_vector(2 downto 0);
        inport : in std_logic_vector(15 downto 0);
inportOut : out std_logic_vector(15 downto 0)
    );
end mem1_mem2_buf;

architecture Behavioral of mem1_mem2_buf is

begin
    process (clk, reset)
    begin
        if reset = '1' then
            -- put zero on all outputs
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
            dataToBeWrittenOut <= (others => '0');
            ALU_ImmOut <= (others => '0');
            writeAddressOut <= (others => '0');
            readAddressOut <= (others => '0');
            RdAddressOut <= (others => '0');
            newFlagsOut <= (others => '0');
            inportOut <= (others => '0');
            -- check on the falling edge of teh clock
        elsif rising_edge(clk) then
            if writeEnable = '1' then
            -- assign inputs to corresponding outputs
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
            dataToBeWrittenOut <= dataToBeWritten;
            ALU_ImmOut <= ALU_Imm;
            writeAddressOut <= writeAddress;
            readAddressOut <= readAddress;
            RdAddressOut <= RdAddress;
            newFlagsOut <= newFlags;
            inportOut <= inport;
            end if;
        end if;
    end process;
end Behavioral;

