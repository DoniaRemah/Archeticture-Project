library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity load_use is
    port (
    load_ins_exc_MEM1:in std_logic;
    load_ins_MEM1_MEM2:in std_logic;
    rs1_add:in std_logic_vector (2 downto 0);
	rs2_add:in std_logic_vector (2 downto 0);
    DES_Add_exc_mem1:in std_logic_vector (2 downto 0);
	des_add_mem1_mem2:in std_logic_vector (2 downto 0);
    load_int_mem2_wb:in std_logic;
    LOAD_USE_cASE:out std_logic
    );
end load_use;

architecture logicofloaduse of load_use is 
begin

process (rs1_add,rs2_add,DES_Add_exc_mem1,des_add_mem1_mem2,load_ins_exc_MEM1,load_ins_MEM1_MEM2)
    begin
    
        if (load_ins_exc_MEM1 = '1' and (rs1_add=DES_Add_exc_mem1 or rs2_add=DES_Add_exc_mem1)) then
            LOAD_USE_cASE <= '1';
        elsif (load_ins_MEM1_MEM2 = '1' and (rs1_add=des_add_mem1_mem2 or rs2_add=des_add_mem1_mem2)) then
            LOAD_USE_cASE <= '1';
        elsif (load_int_mem2_wb='1') then
            LOAD_USE_cASE <= '0';
        end if;
    end process; 
end logicofloaduse;