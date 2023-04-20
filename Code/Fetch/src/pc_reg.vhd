LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

-- This is a generic register with only one data in and one data out.
-- VERY IMPORTANT 
-- *********THIS REGISTER UPDATES ON FALLING CLOCK EDGE***********

ENTITY pc_reg IS
PORT( clk,rst : IN std_logic; 
data_in: in std_logic_vector (15 downto 0);
we: in  std_logic;
reset_value: in std_logic_vector(15 downto 0);
data_out: OUT std_logic_vector (15 downto 0));
END pc_reg;

ARCHITECTURE pc_reg_arch OF pc_reg IS
signal data_out_sig: std_logic_vector(15 downto 0);
BEGIN
PROCESS(clk,rst,we)
variable temp_reset_value:std_logic_vector(15 downto 0);
variable temp_data_in:std_logic_vector(15 downto 0);
BEGIN
    temp_reset_value := reset_value;
    temp_data_in := data_in;
IF(rst = '1') THEN
    data_out <= temp_reset_value;
ELSIF rising_edge(clk) and we='1' THEN
    data_out<= temp_data_in;
END IF;
END PROCESS;
END pc_reg_arch;
