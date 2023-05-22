library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- memory
entity memory is
    port (
        clk: in std_logic;
        Stack_Op: in std_logic;
        memOp: in std_logic;
        memRead: in std_logic;
        memWrite: in std_logic;
        dataBusSelector: in std_logic;
        interrupt : in std_logic;

        dataToBeWritten: in std_logic_vector(15 downto 0);
        writeAddress: in std_logic_vector(15 downto 0);
        readAddress: in std_logic_vector(15 downto 0);
        newFlags: in std_logic_vector(2 downto 0);

        dataRead: out std_logic_vector(15 downto 0);
        flagsRead: out std_logic_vector(2 downto 0)
    );
end entity memory;

architecture behavioral of memory is
    type mem_array_t is array (0 to 1023) of std_logic_vector(15 downto 0);
    signal memory_array: mem_array_t;
begin

-- try if something happened
-- always read and write on the rising edge

process(clk)
begin
    if falling_edge(clk) then
        if memOp = '1' then
            if memWrite = '1' then
                    memory_array(to_integer(unsigned(writeAddress))) <= dataToBeWritten;
                -- interrupt
                if interrupt = '1' then
                    memory_array(to_integer(unsigned(writeAddress))-1) <= newFlags & "0000000000000";
            end if;
        end if;
    end if;
    end if;
end process;

    dataRead <= memory_array(to_integer(unsigned(readAddress))) when memOp = '1' and memRead = '1' and dataBusSelector = '0' and Stack_Op = '0' else 
    memory_array(to_integer(unsigned(readAddress))+1) when memOp = '1' and memRead = '1' and dataBusSelector = '0' and Stack_Op = '1' else
    memory_array(to_integer(unsigned(readAddress))+2) when memOp = '1' and memRead = '1' and dataBusSelector = '1' and Stack_Op = '1'
    else (others => '0');
    
    flagsRead <= memory_array(to_integer(unsigned(readAddress))+1)(15 downto 13) when memOp = '1' and memRead = '1' and dataBusSelector = '1' else (others => '0');
end architecture behavioral;
