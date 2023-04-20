LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

-- entity for dataIn0 4*1 mux
entity pipeline is
        port (
        --//// INPUTS
        clk,rst: in std_logic
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
signal Call_sig:std_logic;

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

begin
        -- // Fetching Components
        inst_cache: entity work.instCache port map (old_pc ,instruction,pc_rst_value);
        mux4x1: entity work.mux4x1 port map(New_PC,Jumped_call_address,Memory_returned_address,x"0000",propagated_ret_rti,branching_call_sig,New_PC_mux_out);
        pc_reg: entity work.pc_reg port map(clk,rst,New_PC_mux_out,pc_en,old_pc,pc_rst_value);
        mux2x1: entity work.mux2x1 port map(x"0001",x"0002",instruction(25),addition_value);
        pc_adder: entity work.adder port map(old_pc,addition_value,New_PC);
        fetch_dec_buffer: entity work.fetch_decode_buffer port map(clk,Flush_sig,Freeze_sig,Hazard_sig,Instruction,New_PC,buff_pc,buff_ins);
        
        flag_reg: entity work.flagReg port map (clk,rst,interrupt,flag_en,writeback_flags,out_flags);

        Reg_File: entity work.regFile port map(clk,rst,interrupt,buff_ins(24 downto 22),buff_ins(21 downto 19),buff_ins(18 downto 16),writeback_address,
        writeback_data,reg_file_en,Rd_data,Rs1_data,Rs2_data);
        -- // Decode Components

        control_unit: entity work.Control_unit port map (buff_ins(31 downto 26),alu_enable,branching_operation,part_selector,op_selector, call_op,
        read_address_sel,write_address_sel,data_written_sel,mem_op,mem_read,mem_write,data_bus_sel,data_sel,flag_sel,in_data_sel,reg_file_en,flag_en);

        -- // signals
        branching_call_sig <= Branching_sig or Call_sig;
        xor_value <= propagated_ret_rti xor current_ret_rti;
        not_call_branching <= not branching_call_sig;
        Freeze_sig <= xor_value and not_call_branching;
        Flush_sig <= Branching_sig or Call_sig;
        pc_en <= not Hazard_sig;

        

end pipeline_arch;

