LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY my_DFF IS
PORT( clk,rst : IN std_logic; 
write_enable: in  std_logic;
d: in std_logic_vector (15 downto 0);
q : OUT std_logic_vector (15 downto 0));
END my_DFF;

ARCHITECTURE a_my_DFF OF my_DFF IS
BEGIN
PROCESS(clk,rst,write_enable)
BEGIN
IF(rst = '1') THEN
q <= (others =>'0');
ELSIF rising_edge(clk) and clk = '1' and write_enable='1' THEN
q <= d;

END IF;
END PROCESS;
END a_my_DFF;
