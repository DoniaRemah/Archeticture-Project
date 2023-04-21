LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

-- entity for dataIn0 4*1 mux
entity Fetch is
        port (
        
        --//// INPUTS

        clk,rst: in std_logic;

        -- Anomalous Address (Input)
        Jumped_call_address,  -- From Branching/ Call
        Memory_returned_address : in std_logic_vector(15 downto 0); -- From ret/rti

        -- Return and RTI signals (Input)
        propagated_ret_rti,
        current_ret_rti, 

        -- Branch and call signals (Input) 
        Branching_sig,
        Call_sig ,

        -- Hazard Detected Signal (Input) 
        Hazard_sig : in std_logic;

        --//// OUTPUTS

        Instruction: out std_logic_vector(31 downto 0);
        New_PC: out std_logic_vector(15 downto 0);
        Flush_sig,Freeze_sig: out std_logic
        );
end Fetch;


-- architecture for the 4*1 mux
architecture Fetch_arch of Fetch is

-- signal instruction_sig: std_logic_vector(15 downto 0);
signal instruction2: std_logic_vector(15 downto 0);
signal pc_value : std_logic_vector(15 downto 0);
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
        
begin
        -- // Components
        inst_cache: entity work.instCache port map (old_pc ,instruction,pc_rst_value);
        mux4x1: entity work.mux4x1 port map(New_PC,Jumped_call_address,Memory_returned_address,x"0000",propagated_ret_rti,branching_call_sig,New_PC_mux_out);
        pc_reg: entity work.pc_reg port map(clk,rst,New_PC_mux_out,pc_en,old_pc,pc_rst_value);
        mux2x1: entity work.mux2x1 port map(x"0001",x"0002",instruction(25),addition_value);
        pc_adder: entity work.adder port map(old_pc,addition_value,New_PC);
        fetch_dec_buffer: entity work.fetch_decode_buffer port map(clk,Flush_sig,Freeze_sig,Hazard_sig,Instruction,New_PC,buff_pc,buff_ins);
        -- // signals
        branching_call_sig <= Branching_sig or Call_sig;
        xor_value <= propagated_ret_rti xor current_ret_rti;
        not_call_branching <= not branching_call_sig;
        Freeze_sig <= xor_value and not_call_branching;
        Flush_sig <= Branching_sig or Call_sig;
        pc_en <= not Hazard_sig;

end Fetch_arch;

