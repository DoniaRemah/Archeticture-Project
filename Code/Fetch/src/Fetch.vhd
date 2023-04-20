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

        Instruction: out std_logic_vector(32 downto 0);
        New_PC: out std_logic_vector(15 downto 0);
        Flush_sig,Freeze_sig: in std_logic
        );
end Fetch;


-- architecture for the 4*1 mux
architecture Fetch_arch of Fetch is

signal instruction1: std_logic_vector(15 downto 0);
signal instruction2: std_logic_vector(15 downto 0);
signal pc_value : std_logic_vector(15 downto 0);
signal pc_en: std_logic;
signal pc_rst_value: std_logic_vector(15 downto 0);
signal old_pc: std_logic_vector(15 downto 0);
signal New_PC_mux_out:  std_logic_vector(15 downto 0);

begin
        inst_cache: entity work.instCache port map (old_pc ,instruction1);
        pc_reg: entity work.pc_reg port map(clk,rst,pc_en,pc_rst_value,New_PC_mux_out,old_pc);
        process (clk, rst)
                
        begin
                if rst ='1' then
                        old_pc <= x"0000";
                        pc_rst_value<= instruction1;

                -- else if rising_edge(clk) then



                end if;
        end process;
end Fetch_arch;

