LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

-- This is a generic register with only one data in and one data out.
-- VERY IMPORTANT 
-- *********THIS REGISTER UPDATES ON FALLING CLOCK EDGE***********

ENTITY generic_reg IS
generic (n: integer := 16);
PORT( clk,rst : IN std_logic; 
data_in: in std_logic_vector (n downto 0);
we: in  std_logic;
data_out: OUT std_logic_vector (n downto 0));
END generic_reg;

ARCHITECTURE reg_arch OF generic_reg IS
signal data_out_sig: std_logic_vector(n downto 0);
BEGIN
PROCESS(clk,rst,we)
BEGIN
IF(rst = '1') THEN
    data_out_sig <= (others =>'0');
ELSIF rising_edge(clk) and we='1' THEN
    data_out_sig<= data_in;
END IF;
END PROCESS;
data_out <= data_out_sig;
END reg_arch;
