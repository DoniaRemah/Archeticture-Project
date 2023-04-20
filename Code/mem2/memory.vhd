library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory is
    port (
        clk: in std_logic;
        reset: in std_logic;

        memOp: in std_logic;
        memRead: in std_logic;
        memWrite: in std_logic;
        dataBusSelector: in std_logic;

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

    signal write_address_internal: unsigned(15 downto 0);
    -- signal read_address_internal: unsigned(15 downto 0);
    
    signal flags_internal: std_logic_vector(15 downto 0);
    -- signal data_read_internal: std_logic_vector(15 downto 0);
begin

-- try if something happened
-- always read and write on the rising edge

process(clk)
begin
        -- if memOp = '1' then
        --     if memRead = '1' then
        --         if dataBusSelector = '0' then
        --             -- read 16 bits from readAddress
        --             -- read_address_internal <= unsigned(readAddress);
        --             dataRead <= memory_array(to_integer(unsigned(readAddress)));
        --             flags_internal <= (others => '0');
        --         -- rti
        --         -- this here is sp 
        --         elsif dataBusSelector = '1' then
        --             -- read_address_internal <= unsigned(readAddress);
        --             flags_internal <=  memory_array(to_integer(unsigned(readAddress)));
        --             -- -- flagsRead <= flags_internal(15 downto 13);
        --             -- read_address_internal <= read_address_internal + 1;
        --             -- dataRead <= memory_array(to_integer(read_address_internal));    
        --         end if;
        --     end if;
        -- end if;
    if falling_edge(clk) then
        if memOp = '1' then
            if memWrite = '1' then
                    -- write dataToBeWritten to writeAddress
                    write_address_internal <= unsigned(writeAddress);
                    memory_array(to_integer(write_address_internal)) <= dataToBeWritten;
                -- interrupt
                -- elsif dataBusSelector = '1' then
                --     -- write dataToBeWritten to writeAddress and update flags
                --     write_address_internal <= unsigned(writeAddress);
                --     memory_array(to_integer(write_address_internal)) <= dataToBeWritten;
                --     -- add one to write_address_internal
                --     write_address_internal <= write_address_internal + 1;
                --     memory_array(to_integer(write_address_internal)) <= newFlags & "0000000000000";
            end if;
        end if;
    -- else
    --     -- if memOp is '0', set data_read_internal and flagsRead to all zeros
    --     data_read_internal <= (others => '0');
    --     flagsRead <= (others => '0');
    end if;
end process;


    -- dataRead <= data_read_internal;
    dataRead <= memory_array(to_integer(unsigned(readAddress))) when memOp = '1' and memRead = '1' and dataBusSelector = '0' else (others => '0');
    flagsRead <= flags_internal(15 downto 13);
end architecture behavioral;
