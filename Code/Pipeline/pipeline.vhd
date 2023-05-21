LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

-- entity for dataIn0 4*1 mux
entity pipeline is
        port (
        --//// INPUTS
        clk,rst: in std_logic;
        inport: in std_logic_vector(15 downto 0)
        );
end pipeline;


-- architecture for the 4*1 mux
architecture pipeline_arch of pipeline is

-- // FETCHING SIGNALS
-- signal instruction2: std_logic_vector(15 downto 0);
-- signal pc_value : std_logic_vector(15 downto 0);
signal pc_en: std_logic;
signal pc_rst_value: std_logic_vector(15 downto 0);
signal old_pc: std_logic_vector(15 downto 0);
signal New_PC_mux_out:  std_logic_vector(15 downto 0);
signal branching_call_sig: std_logic;
signal xor_value: std_logic;
signal not_call_branching: std_logic;
signal addition_value:std_logic_vector(15 downto 0);
signal buff_ins: std_logic_vector(31 downto 0);
signal buff_pc: std_logic_vector(15 downto 0);
---------------------------------
signal Instruction:  std_logic_vector(31 downto 0);
signal New_PC: std_logic_vector(15 downto 0);
signal Jumped_call_address: std_logic_vector(15 downto 0);
signal Memory_returned_address: std_logic_vector(15 downto 0);
signal propagated_ret_rti:std_logic;
signal current_ret_rti: std_logic; 
signal Flush_sig:std_logic;
signal Freeze_sig: std_logic;
signal Hazard_sig: std_logic;
signal Branching_sig: std_logic;

--// Control SIGNALS 

signal alu_enable: std_logic;
signal branching_operation: std_logic;
signal part_selector: std_logic_vector(1 downto 0);
signal op_selector: std_logic_vector(2 downto 0);
signal call_op: std_logic;
signal read_address_sel: std_logic;
signal write_address_sel:std_logic;
signal data_written_sel: std_logic;
signal mem_op:std_logic;
signal mem_read:std_logic;
signal mem_write:std_logic;
signal data_bus_sel:std_logic;
signal data_sel:std_logic;
signal flag_sel:std_logic;
signal in_data_sel:std_logic;
signal reg_file_en:std_logic;
signal flag_en:std_logic;

--// Reg File Signals

signal interrupt: std_logic;
signal writeback_address:std_logic_vector(2 downto 0);
signal writeback_data: std_logic_vector(15 downto 0);
signal writeback_flags: std_logic_vector(2 downto 0);
signal out_flags: std_logic_vector(2 downto 0);
signal Rd_data: std_logic_vector(15 downto 0);
signal Rs1_data: std_logic_vector(15 downto 0);
signal Rs2_data: std_logic_vector(15 downto 0);
signal reg_file_en_wb: std_logic;
--// Decode Buffer

signal dataSelectorOut, inDataSelectorOut, flagSelectorOut, flagEnableOut, regFileEnableOut: std_logic;

signal readAddressSelOut,writeAddressSelOut,dataWrittenSelOut,memOpOut,memReadOut, memWriteOut, dataBusSelectorOut, propRetRtiOut:  std_logic;

signal ALUEnableOut,Imm_Src_selectorOut,branchingOpOut,callOpOut:  std_logic;
signal partSelectorOut:  std_logic_vector(1 downto 0);
signal opSelectorOut:  std_logic_vector(2 downto 0);
signal rdDataOut: std_logic_vector(15 downto 0);
signal newPCAddressOut:  std_logic_vector(15 downto 0);
signal rs1DataOut,rs2DataOut,offset_ImmOut:  std_logic_vector(15 downto 0);
signal RdAddressOut:  std_logic_vector(2 downto 0);
signal FlagsOut:  std_logic_vector(2 downto 0);
signal prop_ret_rti_out:std_logic;

--// Execute 

signal alu_res: std_logic_vector(15 downto 0);
signal alu_flags_res: std_logic_vector(2 downto 0);
-- the same as the data in
signal dataSelectorOut_ex, inDataSelectorOut_ex, flagSelectorOut_ex, flagEnableOut_ex, regFileEnableOut_ex: std_logic;

signal readAddressSelOut_ex,writeAddressSelOut_ex,dataWrittenSelOut_ex,memOpOut_ex,memReadOut_ex, memWriteOut_ex, dataBusSelectorOut_ex, propRetRtiOut_ex:  std_logic;

signal ALU_ImmOut_ex, rs1_data_Out_ex, rs2_data_Out_ex ,newPC_address_out_ex :  std_logic_vector(15 downto 0);
signal RdAddressOut_ex:  std_logic_vector(2 downto 0);

signal newFlagsOut_ex:  std_logic_vector(2 downto 0);

--// Mem1 outputs

signal data_tobe_written_out_mem1: std_logic_vector(15 downto 0);
signal write_adress_out_mem1: std_logic_vector(15 downto 0);
signal read_address_out_mem1: std_logic_vector(15 downto 0);

signal Stack_Op: std_logic;

--// Mem2 Outputs

signal dataSelectorOut_mem2, inDataSelectorOut_mem2, flagSelectorOut_mem2, flagEnableOut_mem2, regFileEnableOut_mem2: std_logic;

signal readAddressSelOut_mem2,writeAddressSelOut_mem2,dataWrittenSelOut_mem2,memOpOut_mem2,memReadOut_mem2, memWriteOut_mem2, dataBusSelectorOut_mem2, propRetRtiOut_mem2:  std_logic;

signal dataToBeWrittenOut_mem2, ALU_ImmOut_mem2, writeAddressOut_mem2, readAddressOut_mem2 :  std_logic_vector(15 downto 0);
signal RdAddressOut_mem2:  std_logic_vector(2 downto 0);

signal newFlagsOut_mem2:  std_logic_vector(2 downto 0);

signal dataread_memory: std_logic_vector(15 downto 0);
signal flagsread_memory: std_logic_vector(2 downto 0);

signal  dataSelectorOut_wb, inDataSelectorOut_wb, flagSelectorOut_wb, flagEnableOut_wb, regFileEnableOut_wb: std_logic;

signal memResult_wb,AluResult_wb: std_logic_vector(15 downto 0);
signal memFlags_wb,ALUflags_wb,wbAddress_wb: std_logic_vector(2 downto 0);

signal control_prop: std_logic;

signal inportOUTde , inportOUTex , inportOUTmem1 , inportOUTmem2 , inportOUTwb:std_logic_vector(15 downto 0);

signal flag_en_wb : std_logic;

-- mux 8x1 signals
signal mux8x1_out: std_logic_vector(15 downto 0);

-- adder
signal newSPfromAdder: std_logic_vector(15 downto 0);
signal oldSPtoAdder: std_logic_vector(15 downto 0);

-- sp write enable signal
signal sp_write_en_after_circuit: std_logic;

-- mux8x1 selector
signal mux8x1_selector: std_logic_vector(2 downto 0);


begin
        -- // Fetching Components
        inst_cache: entity work.instCache port map (old_pc ,instruction,pc_rst_value);
        mux4x1: entity work.mux4x1 port map(New_PC,Jumped_call_address,Memory_returned_address,x"0000",propagated_ret_rti,branching_call_sig,New_PC_mux_out);
        pc_reg: entity work.pc_reg port map(clk,rst,Hazard_sig,New_PC_mux_out,pc_en,old_pc,pc_rst_value);
        mux2x1: entity work.mux2x1 port map(x"0001",x"0002",instruction(25),addition_value);
        pc_adder: entity work.adder port map(old_pc,addition_value,New_PC);

        -- // fETCH signals
        branching_call_sig <= Branching_sig or call_op;
        xor_value <= propagated_ret_rti xor current_ret_rti;
        not_call_branching <= not branching_call_sig;
        Freeze_sig <= xor_value and not_call_branching;
        Flush_sig <= Branching_sig or call_op;
        pc_en <= not Hazard_sig;


        -- mux 8x1
        mux8x1_selector<=dataBusSelectorOut_mem2&(readAddressSelOut_mem2 and memReadOut_mem2)&(writeAddressSelOut_mem2 and memWriteOut_mem2);

        fetch_dec_buffer: entity work.fetch_decode_buffer port map(clk,Flush_sig,Freeze_sig,Hazard_sig,Instruction,New_PC,buff_pc,buff_ins,inport,inportOUTde);
        
        flag_reg: entity work.flagReg port map (clk,rst,interrupt,flag_en_wb,writeback_flags,out_flags);

        Reg_File: entity work.regFile port map(clk,rst,interrupt,buff_ins(24 downto 22),buff_ins(21 downto 19),buff_ins(18 downto 16),writeback_address,
        writeback_data,reg_file_en_wb,Rd_data,Rs1_data,Rs2_data);
        -- // Decode Components

        dec_ex_buff: entity work.ID_EX_buf port map(clk,rst,pc_en,interrupt,data_sel,in_data_sel,flag_sel,flag_en,reg_file_en,
        read_address_sel,write_address_sel,data_written_sel,mem_op,mem_read,mem_write,data_bus_sel,control_prop,alu_enable,
        buff_ins(25),branching_operation,call_op,part_selector,op_selector,Flush_sig,Hazard_sig,Rd_data,Rs1_data,Rs2_data,New_PC,
        buff_ins(15 downto 0),buff_ins(18 downto 16),out_flags,dataSelectorOut,inDataSelectorOut,flagSelectorOut,flagEnableOut,regFileEnableOut,
        readAddressSelOut,writeAddressSelOut,dataWrittenSelOut,memOpOut,memReadOut,memWriteOut,dataBusSelectorOut,prop_ret_rti_out,ALUEnableOut,
        Imm_Src_selectorOut,branchingOpOut,call_op,partSelectorOut,opSelectorOut,newPCAddressOut,Jumped_call_address,rs1DataOut,rs2DataOut,
        offset_ImmOut,RdAddressOut,FlagsOut,inportOUTde,inportOUTex);

        control_unit: entity work.Control_unit port map (buff_ins(31 downto 26),alu_enable,branching_operation,part_selector,op_selector, call_op,
        read_address_sel,write_address_sel,data_written_sel,mem_op,mem_read,mem_write,data_bus_sel,data_sel,flag_sel,in_data_sel,reg_file_en,flag_en,control_prop,current_ret_rti);


        execute: entity work.execute port map(ALUEnableOut,partSelectorOut,opSelectorOut,Imm_Src_selectorOut,branchingOpOut,rs1DataOut,rs2DataOut,
        offset_ImmOut,FlagsOut,Branching_sig,alu_res,alu_flags_res);

        execute_mem1_buffer: entity work.ex_mem1_buf port map(clk,rst,'1',Hazard_sig,interrupt,dataSelectorOut,inDataSelectorOut,flagSelectorOut,flagEnableOut,regFileEnableOut,
        readAddressSelOut,writeAddressSelOut,dataWrittenSelOut,memOpOut,memReadOut,memWriteOut,dataBusSelectorOut,prop_ret_rti_out,alu_res,rs1DataOut,rs2DataOut,
        newPCAddressOut,RdAddressOut,alu_flags_res,dataSelectorOut_ex, inDataSelectorOut_ex, flagSelectorOut_ex, flagEnableOut_ex, regFileEnableOut_ex,
        readAddressSelOut_ex,writeAddressSelOut_ex,dataWrittenSelOut_ex,memOpOut_ex,memReadOut_ex, memWriteOut_ex, dataBusSelectorOut_ex, propRetRtiOut_ex,
        ALU_ImmOut_ex, rs1_data_Out_ex, rs2_data_Out_ex ,newPC_address_out_ex,RdAddressOut_ex,newFlagsOut_ex,inportOUTex,inportOUTmem1);
        
        HDU: entity work.HDU port map(memOpOut_ex,memOpOut,Hazard_sig);

        -- mem1: entity work.mem1 port map(clk,rst,dataBusSelectorOut_ex,readAddressSelOut_ex,writeAddressSelOut_ex,dataWrittenSelOut_ex,newPC_address_out_ex,
        -- rs1_data_Out_ex,rs2_data_Out_ex,data_tobe_written_out_mem1,write_adress_out_mem1,read_address_out_mem1);
        mem1: entity work.mem1
        port map(
                readAddressSel => readAddressSelOut_ex,
                writeAddressSel => writeAddressSelOut_ex,
                dataWrittenSel => dataWrittenSelOut_ex,
                newPCAddress=> newPC_address_out_ex,
                rs1Data => rs1_data_Out_ex,
                rs2Data => rs2_data_Out_ex,
                -- The sp will be taken from the sp register
                SP=>oldSPtoAdder,
                dataToBeWrittenOut => data_tobe_written_out_mem1,
                writeAddressOut => write_adress_out_mem1,
                readAddressOut => read_address_out_mem1
        );

        mux8x1: entity work.mux8x1 
        port map(
                selector=>mux8x1_selector,
                dataOut=>mux8x1_out
        );

        adderAftermux8x1: entity work.adder
        port map(
                A=>mux8x1_out,
                -- old sp from sp reg
                B=>oldSPtoAdder,
                -- new sp to sp reg
                C=>newSPfromAdder
        );

        sp_reg: entity work.sp_reg
        port map(
                clk=>clk,
                reset=>rst,
                -- circuit from mem2
                writeEnable=>sp_write_en_after_circuit,
                dataIn=>newSPfromAdder,
                dataOut=>oldSPtoAdder
        );
        spwe_circuit_inst: entity work.spWE_circuit
        port map (
                readAddressSelector  => readAddressSelOut_mem2,
                writeAddressSelector => writeAddressSelOut_mem2,
                memOP                => memOpOut_mem2,
                spWE                 => sp_write_en_after_circuit
        );

        mem1_mem2_buffer: entity work.mem1_mem2_buf port map(clk,rst,'1',interrupt,dataSelectorOut_ex,inDataSelectorOut_ex,flagSelectorOut_ex, flagEnableOut_ex, regFileEnableOut_ex,
        readAddressSelOut_ex,writeAddressSelOut_ex,dataWrittenSelOut_ex,memOpOut_ex,memReadOut_ex, memWriteOut_ex, dataBusSelectorOut_ex, propRetRtiOut_ex, data_tobe_written_out_mem1,
        ALU_ImmOut_ex,write_adress_out_mem1,read_address_out_mem1,RdAddressOut_ex,newFlagsOut_ex,dataSelectorOut_mem2, inDataSelectorOut_mem2, flagSelectorOut_mem2, flagEnableOut_mem2, 
        regFileEnableOut_mem2,readAddressSelOut_mem2,writeAddressSelOut_mem2,dataWrittenSelOut_mem2,memOpOut_mem2,memReadOut_mem2, memWriteOut_mem2, dataBusSelectorOut_mem2, propagated_ret_rti,
        dataToBeWrittenOut_mem2, ALU_ImmOut_mem2, writeAddressOut_mem2, readAddressOut_mem2 ,
        RdAddressOut_mem2,newFlagsOut_mem2,inportOUTmem1,inportOUTmem2);

        Stack_Op <= readAddressSelOut_mem2 or writeAddressSelOut_mem2;

        memory: entity work.memory port map (clk,Stack_Op,memOpOut_mem2,memReadOut_mem2, memWriteOut_mem2, dataBusSelectorOut_mem2,dataToBeWrittenOut_mem2,writeAddressOut_mem2, readAddressOut_mem2,newFlagsOut_mem2,
        dataread_memory,flagsread_memory);
        
        mem2_Wb_Buffer: entity work.mem2_WB_buf port map (clk,rst,'1',interrupt,dataSelectorOut_mem2, inDataSelectorOut_mem2, flagSelectorOut_mem2, flagEnableOut_mem2, 
        regFileEnableOut_mem2,dataread_memory,ALU_ImmOut_mem2,RdAddressOut_mem2,newFlagsOut_mem2,flagsread_memory,dataSelectorOut_wb, inDataSelectorOut_wb, flagSelectorOut_wb, flag_en_wb, reg_file_en_wb,
        memResult_wb,AluResult_wb,memFlags_wb,ALUflags_wb,writeback_address,inportOUTmem2,inportOUTwb);

        wb: entity work.WB port map (dataSelectorOut_wb, inDataSelectorOut_wb, flagSelectorOut_wb,memResult_wb,AluResult_wb,inportOUTwb,memFlags_wb,ALUflags_wb,writeback_data,writeback_flags);

        
end pipeline_arch;

