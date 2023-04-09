LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY writeBack_reg IS
generic (n:integer :=16);
PORT( 
-- input   
clk,rst : IN std_logic; 
write_adress: in std_logic_vector (2 downto 0);
write_enable : in std_logic;
alu_output: in std_logic_vector (15 downto 0);
-- output 
write_adress_out: out std_logic_vector (2 downto 0);
write_enable_out : out std_logic;
alu_output_out: out std_logic_vector (15 downto 0)
);
END writeBack_reg;

ARCHITECTURE WB_arch OF writeBack_reg IS

BEGIN
PROCESS(clk,rst)
BEGIN
IF(rst = '1') THEN

write_adress_out <= (others => '0');
write_enable_out <= '0';
alu_output_out <= (others => '0');


ELSIF rising_edge(clk) THEN

write_adress_out <= write_adress;
write_enable_out <= write_enable;
alu_output_out <= alu_output;

END IF;
END PROCESS;


END WB_arch;
