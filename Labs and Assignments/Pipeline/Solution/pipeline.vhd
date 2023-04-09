LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY pipeline IS
	PORT(
                clk : IN std_logic;
                rst: in std_logic;
                enable: in std_logic
        );
END ENTITY pipeline;

ARCHITECTURE pipeline_arch OF pipeline IS


        -- control signals
        signal counter: std_logic_vector(5 downto 0);
        signal instruction: std_logic_vector(15 downto 0);
        signal Op_code:   std_logic_vector (2 downto 0);

        -- source address
        signal Src_1:  std_logic_vector (2 downto 0);
        signal Src_2:  std_logic_vector (2 downto 0);

        -- source value
        signal src1out1: std_logic_vector(15 downto 0);
        signal src2out1: std_logic_vector(15 downto 0);
        signal src1out2: std_logic_vector(15 downto 0);
        signal src2out2: std_logic_vector(15 downto 0);

        -- destination address
        signal dst1:  std_logic_vector (2 downto 0);
        signal dst2:  std_logic_vector (2 downto 0);
        signal dst3:  std_logic_vector (2 downto 0);

        signal writeback_enable1: std_logic;
        signal writeback_enable2: std_logic;
        signal writeback_enable3: std_logic;

        signal Alu_selector1:  std_logic_vector (3 downto 0);
        signal Alu_selector2:  std_logic_vector (3 downto 0);

        signal alu_output1: std_logic_vector(15 downto 0);
        signal alu_output2: std_logic_vector(15 downto 0);
        signal cout: std_logic;
	BEGIN

                pc: entity work.pc port map(clk, rst,counter,enable); 
                inst_cache: entity work.instCache port map (clk,counter, instruction);
                fetch_reg: entity work.FetchReg port map (clk,rst,enable,instruction,Op_code,Src_1,Src_2,dst1);
                controller: entity work.Controller port map (Op_code,writeback_enable1,Alu_selector1);
                reg_file : entity work.Reg_File port map (alu_output2,Src_1,Src_2,dst3,writeback_enable3,clk,rst,src1out1,src2out1);
                DE: entity work.DE_Reg port map (clk,rst,src1out1,src2out1,dst1,writeback_enable1,Alu_selector1,
                src1out2,src2out2,dst2,writeback_enable2,Alu_selector2);
                alu: entity work.ALU port map (src1out2,src2out2,'0',Alu_selector2,cout,alu_output1);
                we_reg: entity work.writeBack_reg port map(clk,rst,dst2,writeback_enable2,alu_output1,dst3,writeback_enable3,alu_output2);




END pipeline_arch;