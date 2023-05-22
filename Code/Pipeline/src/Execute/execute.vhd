library IEEE;
use IEEE.std_logic_1164.all;

entity execute is 
port  (
    alu_enable:in std_logic;
    part_sel: in std_logic_vector (1 downto 0);
    op_sel : in std_logic_vector (2 downto 0);
    imm_src_selector : in std_logic;
    branching_op : in std_logic;
	rs1_data : in std_logic_vector (15 downto 0); 
	rs2_data : in std_logic_vector (15 downto 0); 
    imm_value : in std_logic_vector (15 downto 0); 
	flags : in std_logic_vector (2 downto 0); 
    branching_res_control_sig : out std_logic;
	alu_res : out std_logic_vector (15 downto 0);
    new_flags : out std_logic_vector (2 downto 0);
    outportdata : out std_logic_vector (15 downto 0)
);
end execute;

Architecture Archexecute of execute is

    component mux2x1 is
        generic (
        DATA_WIDTH : integer := 16
        );
        port (
        -- input data and output data are generic width
        dataIn0, dataIn1 : in std_logic_vector(DATA_WIDTH-1 downto 0);
        -- selector is 1 bit
        selector : in std_logic;
        dataOut : out std_logic_vector(DATA_WIDTH-1 downto 0)
        );
end component;

component ALU is 
port  (
    alu_enable:in std_logic;
    part_sel: in std_logic_vector (1 downto 0);
    op_sel : in std_logic_vector (2 downto 0);
	first_src : in std_logic_vector (15 downto 0); 
	second_src : in std_logic_vector (15 downto 0); 
	flags : in std_logic_vector (2 downto 0); 
    branching_res : out std_logic;
	alu_res : out std_logic_vector (15 downto 0);
    new_flags : out std_logic_vector (2 downto 0)
);
end component;


-- component ex_mem1_buf is
--     port (
--         clk : in std_logic;         
--         reset : in std_logic;       
--         writeEnable : in std_logic; 
--         interrupt : in std_logic;     

--         -- the write back signals
--         dataSelector, inDataSelector, flagSelector, flagEnable, regFileEnable:in std_logic;

--         -- memory signals
--         readAddressSel,writeAddressSel,dataWrittenSel,memOp,memRead, memWrite, dataBusSelector, propRetRti: in std_logic;

--         -- the data in
--         ALU_Imm, rs1_data, rs2_data , newPC_address : in std_logic_vector(15 downto 0);  
--         RdAddress: in std_logic_vector(2 downto 0);
--         newFlags: in std_logic_vector(2 downto 0);
        
--         -- the data out
--         -- the same as the data in
--         dataSelectorOut, inDataSelectorOut, flagSelectorOut, flagEnableOut, regFileEnableOut:out std_logic;

--         readAddressSelOut,writeAddressSelOut,dataWrittenSelOut,memOpOut,memReadOut, memWriteOut, dataBusSelectorOut, propRetRtiOut: out std_logic;

--         ALU_ImmOut, rs1_data_Out, rs2_data_Out ,newPC_address_out : out std_logic_vector(15 downto 0);
--         RdAddressOut: out std_logic_vector(2 downto 0);
        
--         newFlagsOut: out std_logic_vector(2 downto 0)
--     );
-- end component;

    signal branching_res , temp_branching_res_control_sig: std_logic;
    signal second_operand , temp_alu_res : std_logic_vector (15 downto 0);
    signal temp_new_flags : std_logic_vector (2 downto 0);

    -- signal dataSelectorOut, inDataSelectorOut, flagSelectorOut, flagEnableOut, regFileEnableOut:std_logic;

    --     signal readAddressSelOut,writeAddressSelOut,dataWrittenSelOut,memOpOut,memReadOut, memWriteOut, dataBusSelectorOut, propRetRtiOut: std_logic;

    --     signal ALU_ImmOut, rs1_data_Out, rs2_data_Out ,newPC_address_out : std_logic_vector(15 downto 0);
    --     signal RdAddressOut: std_logic_vector(2 downto 0);
        
    --     signal newFlagsOut: std_logic_vector(2 downto 0);

begin
    second_operand_mux21 : mux2x1 generic map(16) PORT MAP (rs2_data , imm_value , imm_src_selector , second_operand);
    theALU : ALU PORT MAP (alu_enable,part_sel , op_sel , rs1_data , second_operand , flags , branching_res,temp_alu_res, temp_new_flags);
    temp_branching_res_control_sig <= branching_res and branching_op;

    branching_res_control_sig <= temp_branching_res_control_sig;
    alu_res <= temp_alu_res;
    new_flags <= temp_new_flags;
    outportdata <= rs1_data;

    -- buff : ex_mem1_buf PORT MAP (clk , reset , writeEnable , interrupt , dataSelector, inDataSelector, flagSelector, flagEnable, regFileEnable , readAddressSel,writeAddressSel,dataWrittenSel,memOp,memRead, memWrite, dataBusSelector, propRetRti , temp_alu_res , rs1_data , rs2_data , pc , RdAddress , temp_new_flags , dataSelectorOut, inDataSelectorOut, flagSelectorOut, flagEnableOut, regFileEnableOut , readAddressSelOut,writeAddressSelOut,dataWrittenSelOut,memOpOut,memReadOut, memWriteOut, dataBusSelectorOut, propRetRtiOut , ALU_ImmOut, rs1_data_Out, rs2_data_Out ,newPC_address_out , RdAddressOut , newFlagsOut);

end Archexecute;