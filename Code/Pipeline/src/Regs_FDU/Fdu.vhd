library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity FDU is
    port (
    RS1_Address:in std_logic_vector (2 downto 0);
    RS2_Address:in std_logic_vector (2 downto 0);
    WB_Address:in std_logic_vector (2 downto 0);
    ALU_Rdst:in std_logic_vector (2 downto 0);
    MEM1_Rd_Address:in std_logic_vector (2 downto 0);
    RS1_Data:in std_logic_vector (15 downto 0);
    RS2_Data:in std_logic_vector (15 downto 0);
    Mem1_Alu_Result_Immd:in std_logic_vector (15 downto 0);
	Alu_Result_Immd:in std_logic_vector (15 downto 0);
    WB_Data:in std_logic_vector (15 downto 0);
	Reg_File_Enable:in std_logic;
    Execution_WB_Signal:in std_logic;
    Mem1_Wb_Signal:in std_logic;
    inDataSelectorOut_ex_mem1 : in std_logic;
    inportOUT_ex_mem1 : in std_logic_vector (15 downto 0);
    inDataSelectorOut_mem1_mem2 : in std_logic;
    inportOUT_mem1_mem2 : in std_logic_vector (15 downto 0);
    inDataSelectorOut_mem2_wb : in std_logic;
    inportOUT_ex_mem2_wb : in std_logic_vector (15 downto 0);
    RS1_DATA_Out:out std_logic_vector (15 downto 0);
    RS2_DATA_Out:out std_logic_vector (15 downto 0)
    );
end FDU;

architecture logicofFDU of FDU is 
begin

process (RS1_Address,RS2_Address,WB_Address,MEM1_Rd_Address,ALU_Rdst,RS1_Data,RS2_Data,Mem1_Alu_Result_Immd,Alu_Result_Immd,WB_Data,Reg_File_Enable,Execution_WB_Signal,Mem1_Wb_Signal )
VARIABLE rs1 : bit :='0';
VARIABLE rs2 : bit :='0';
    begin
    
    RS1_DATA_Out <= RS1_Data;
    RS2_DATA_Out <= RS2_Data;
    rs1 :='0';
    rs2:='0';
        -- My source, is the destination of a previous alu operation
        if (Execution_WB_Signal = '1' and ((RS1_Address = ALU_Rdst) or (RS2_Address = ALU_Rdst ))) then
            -- Checking which source is the destination
            -- case Rs1
            if RS1_Address = ALU_Rdst then
                if(inDataSelectorOut_ex_mem1 ='1') then
                    RS1_DATA_Out <=inportOUT_ex_mem1;
                else
                    RS1_DATA_Out <= Alu_Result_Immd;
                end if;
                RS2_DATA_Out <= RS2_Data;
                rs1 := '1';
            -- case Rs2
            else 
                if(inDataSelectorOut_ex_mem1 ='1') then
                    RS2_DATA_Out <=inportOUT_ex_mem1;
                else
                    RS2_DATA_Out <= Alu_Result_Immd;
                end if;
                -- ESHM3NA HENA
                rs2:='1';
                RS1_DATA_Out <= RS1_Data;
            end if;
        end if;

        -- Second instruction after the one we want its result
        if (Mem1_Wb_Signal = '1' and ((RS1_Address = MEM1_Rd_Address) or (RS2_Address = MEM1_Rd_Address )) and (not(ALU_Rdst = MEM1_Rd_Address and (Execution_WB_Signal='1' )))) then
                if RS1_Address = MEM1_Rd_Address and  rs1='0' then
                if(inDataSelectorOut_mem1_mem2 ='1') then
                    RS1_DATA_Out <=inportOUT_mem1_mem2;
                else
                    RS1_DATA_Out <= Mem1_Alu_Result_Immd;
                end if;
                    rs1:='1';
                    if rs2='0' then
                        RS2_DATA_Out <= RS2_Data;
                    end if;
                else
                    if rs2='0' then 
                        if(inDataSelectorOut_mem1_mem2 ='1') then
                            RS2_DATA_Out <=inportOUT_mem1_mem2;
                        else
                            RS2_DATA_Out <= Mem1_Alu_Result_Immd;
                        end if;
                        rs2:='1';
                        end if ;
                    if rs1 ='0' then 
                        RS1_DATA_Out <= RS1_Data;
                    end if;
                end if;
        end if;
        -- Third Instruction after the one we want its result
        if (( Reg_File_Enable = '1'  and ((RS1_Address = WB_Address) or (RS2_Address = WB_Address )) and (not(WB_Address = MEM1_Rd_Address and( Mem1_Wb_Signal = '1'))) and (not(WB_Address = ALU_Rdst  and (Execution_WB_Signal='1' ))))) then 
                if RS1_Address = WB_Address and rs1='0' then
                    if(inDataSelectorOut_mem2_wb='1') then
                    RS1_DATA_Out <=inportOUT_ex_mem2_wb;
                else
                    RS1_DATA_Out <= WB_Data;
                end if;
                    rs1:='1';
                    if rs2='0' then
                    RS2_DATA_Out <= RS2_Data;
                    end if;
                else 
                    if rs2='0' then 
                    if(inDataSelectorOut_mem2_wb='1') then
                    RS2_DATA_Out <=inportOUT_ex_mem2_wb;
                else
                    RS2_DATA_Out <= WB_Data;
                end if;
                        rs2:='1';
                    end if ;
                        if rs1 ='0' then 
                            RS1_DATA_Out <= RS1_Data;
                    end if;
                end if;
        end if;
    end process; 
end logicofFDU;