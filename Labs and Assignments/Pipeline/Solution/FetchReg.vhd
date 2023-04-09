LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY FetchReg IS
PORT( clk,rst : IN std_logic; 
write_enable: in  std_logic;
data_in: in std_logic_vector (15 downto 0);
Op_code: out  std_logic_vector (2 downto 0);
Src_1: out std_logic_vector (2 downto 0);
Src_2: out std_logic_vector (2 downto 0);
dst: out std_logic_vector (2 downto 0)
);
END FetchReg;

ARCHITECTURE FetchReg_arch OF FetchReg IS
signal data_out : std_logic_vector (15 downto 0);

BEGIN


PROCESS(clk,rst,write_enable)
BEGIN
IF(rst = '1') THEN
data_out <= (others =>'0');
ELSIF rising_edge(clk) and write_enable='1' THEN
data_out <= data_in;
END IF;
END PROCESS;

-- seperating operands of the instruction 
Op_code <= data_out(15 downto 13);
Src_1 <= data_out(12 downto 10);
Src_2 <= data_out(9 downto 7);
dst <= data_out(6 downto 4);

END FetchReg_arch;
