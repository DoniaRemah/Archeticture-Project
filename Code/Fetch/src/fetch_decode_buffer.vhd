LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

-- This is a generic register with only one data in and one data out.
-- VERY IMPORTANT 
-- *********THIS REGISTER UPDATES ON FALLING CLOCK EDGE***********

ENTITY fetch_decode_buffer IS
PORT( clk,flush,freeze,hazard : IN std_logic; 
instruction_in: in std_logic_vector(31 downto 0);
new_pc_in: in std_logic_vector(15 downto 0);
new_pc_out: out std_logic_vector(15 downto 0);
instruction_out: out std_logic_vector(31 downto 0);
inport : in std_logic_vector(15 downto 0);
inportOut : out std_logic_vector(15 downto 0)
);
END fetch_decode_buffer;

ARCHITECTURE fetch_decode_buffer_arch OF fetch_decode_buffer IS
signal pc_out: std_logic_vector(15 downto 0);
signal ins_out: std_logic_vector(31 downto 0);
BEGIN
PROCESS(clk)
BEGIN
IF rising_edge(clk) THEN
    if (hazard /='1' ) then
        -- pc_out <= new_pc_in;
        -- ins_out <= instruction_in;
        new_pc_out <= new_pc_in;
        instruction_out <=instruction_in;
        inportOut <= inport;
    end if;
END IF;
END PROCESS;
    -- new_pc_out <= pc_out;
    -- instruction_out <= ins_out;
END fetch_decode_buffer_arch;
