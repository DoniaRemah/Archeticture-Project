
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

ENTITY Reg_File IS
generic (n:integer :=16);
PORT( 
    d: in std_logic_vector (n-1 downto 0);
    read_add1,read_add2, write_add: in std_logic_vector (2 downto 0);
    write_en, clk, reset: in std_logic;
    output1,output2 : OUT std_logic_vector (n-1 downto 0));
END Reg_File;

-- Archeticture
ARCHITECTURE Reg_File_arch OF Reg_File IS

-- Regs Memory Array
type regs is array(0 to 3) of std_logic_vector(n-1 downto 0);

-- Signal
signal my_regs: regs;

BEGIN

process(clk,reset)
begin 
-- if reseting smth
    if reset = '1' then
        for i in 0 to 3 loop
            my_regs(i) <= (others => '0');
        end loop;  
-- if clock is rising
    elsif (falling_edge(clk)) then
        -- if we want to write smth
        if write_en = '1' then
            my_regs(to_integer(unsigned(write_add))) <= d;
        end if;

    end if;
end process;

output1 <= my_regs(to_integer(unsigned(read_add1)));
output2 <= my_regs(to_integer(unsigned(read_add2)));

END Reg_File_arch;