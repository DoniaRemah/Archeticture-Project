LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY DE_Reg IS
generic (n:integer :=16);
PORT( 
-- input   
clk,rst : IN std_logic; 
Src_1: in std_logic_vector (n-1 downto 0);
Src_2: in std_logic_vector (n-1 downto 0);
write_adress: in std_logic_vector (2 downto 0);
write_enable : in std_logic;
alu_select: in  std_logic_vector(3 DOWNTO 0);
-- output 
Src_1_out: out std_logic_vector (n-1 downto 0);
Src_2_out: out std_logic_vector (n-1 downto 0);
write_adress_out: out std_logic_vector (2 downto 0);
write_enable_out : out std_logic;
alu_select_out: out  std_logic_vector(3 DOWNTO 0)
);
END DE_Reg;

ARCHITECTURE DE_arch OF DE_Reg IS

BEGIN

PROCESS(clk,rst)
BEGIN
IF(rst = '1') THEN
Src_1_out <= (others => '0');
Src_2_out <= (others => '0');
write_adress_out <= (others => '0');
write_enable_out <= '0';
alu_select_out <= (others => '0');

ELSIF rising_edge(clk) THEN
Src_1_out <= Src_1;
Src_2_out <= Src_2;
write_adress_out <= write_adress;
write_enable_out <= write_enable;
alu_select_out <= alu_select;
END IF;
END PROCESS;

END DE_arch;
