library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Entity declaration for the top level
entity mem1 is
    port(

        --Do I need clk and reset here? 
        clk : in std_logic;         
        reset : in std_logic;

        -- input

        -- the write back signals
        dataSelector, inDataSelector, flagSelector, flagEnable, regFileEnable:in std_logic;

        -- memory signals
        readAddressSel,writeAddressSel,dataWrittenSel,memOp,memRead, memWrite, dataBusSelector, propRetRti: in std_logic;

        newPCAddress,rs1Data,rs2Data,ALU_Imm,rdAddress: in std_logic_vector(15 downto 0);

        newFlags: in std_logic_vector(2 downto 0);

        -- output
        dataSelectorOut, inDataSelectorOut, flagSelectorOut, flagEnableOut, regFileEnableOut:out std_logic;

        readAddressSelOut,writeAddressSelOut,dataWrittenSelOut,memOpOut,memReadOut, memWriteOut, dataBusSelectorOut, propRetRtiOut: out std_logic;

        dataToBeWrittenOut, ALU_ImmOut, writeAddressOut, readAddressOut,RdAddressOut : out std_logic_vector(15 downto 0);
        
        newFlagsOut: out std_logic_vector(2 downto 0)
    );
end mem1;

architecture Behavioral of mem1 is
    signal SP_WE: std_logic;
    signal SP: std_logic_vector(15 downto 0);
    signal newSP: std_logic_vector(15 downto 0);
    signal dataOutofMux8x1: std_logic_vector(15 downto 0);
    begin
        -- the SP_WE is the oring of the readAddressSel and the writeAddressSel
        SP_WE <= readAddressSel or writeAddressSel;

        mux2x1_1: entity work.mux2x1
            port map(
                dataIn0 => newPCAddress,
                dataIn1 => rs1Data,
                selector => dataWrittenSel,
                dataOut => dataToBeWrittenOut
            );

        mux8x1: entity work.mux8x1
            port map(
                selector => dataBusSelector&readAddressSel&writeAddressSel,
                dataOut => dataOutofMux8x1
            );

        sp_reg: entity work.sp_reg
            port map(
                clk => clk,
                reset => reset,
                writeEnable => SP_WE,
                dataIn => newSP,
                dataOut => SP
            );

        adder: entity work.adder
            port map(
                A => dataOutofMux8x1,
                B => SP,
                C => newSP
            );
        mux2x1_2: entity work.mux2x1
            port map(
                dataIn0 => rs2Data,
                dataIn1 => SP,
                selector => writeAddressSel,
                dataOut => writeAddressOut
            );

        mux2x1_3: entity work.mux2x1
            port map(
                dataIn0 => rs1Data,
                dataIn1 => SP,
                selector => readAddressSel,
                dataOut => readAddressOut
            );

        writeBuffer: entity work.mem1_mem2_buf
            port map(
                clk => clk,
                reset => reset,
                -- put the write enable for the buffer to be 1
                -- Since there are no hazards yet
                writeEnable => '1',
                dataSelector => dataSelectorOut,
                inDataSelector => inDataSelectorOut,
                flagSelector => flagSelectorOut,
                flagEnable => flagEnableOut,
                regFileEnable => regFileEnableOut,
                readAddressSel => readAddressSelOut,
                writeAddressSel => writeAddressSelOut,
                dataWrittenSel => dataWrittenSelOut,
                memOp => memOpOut,
                memRead => memReadOut,
                memWrite => memWriteOut,
                dataBusSelector => dataBusSelectorOut,
                propRetRti => propRetRtiOut,
                dataToBeWritten => dataToBeWrittenOut,
                ALU_Imm => ALU_ImmOut,
                writeAddress => writeAddressOut,
                readAddress => readAddressOut,
                RdAddress => RdAddressOut,
                newFlags => newFlagsOut
            );

end Behavioral;

    
