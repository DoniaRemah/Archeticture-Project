LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

-- This is a generic register with only one data in and one data out.
-- VERY IMPORTANT 
-- *********THIS REGISTER UPDATES ON FALLING CLOCK EDGE***********

ENTITY pc_reg IS
PORT( clk,rst,interrupt : IN std_logic; 
hdu_signal:in std_logic;
data_in: in std_logic_vector (15 downto 0);
we: in  std_logic;
data_out: OUT std_logic_vector (15 downto 0);
reset_value: in std_logic_vector(15 downto 0);
interrupt_value: in std_logic_vector(15 downto 0)
);
END pc_reg;

ARCHITECTURE pc_reg_arch OF pc_reg IS
signal data_out_sig: std_logic_vector(15 downto 0);
BEGIN
PROCESS(clk,rst)
BEGIN
IF(rst = '1') THEN
    data_out_sig <= reset_value;
ELSIF rising_edge(clk) THEN
    if(interrupt = '1') then
        data_out_sig <= interrupt_value;
    elsif (we='1') then
        data_out_sig<= data_in;
    end if;
else 
    data_out_sig <= data_out_sig;
END IF;
END PROCESS;
    data_out <= data_out_sig;
END pc_reg_arch;
