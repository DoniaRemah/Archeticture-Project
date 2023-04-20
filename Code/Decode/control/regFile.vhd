library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regFile is
    port (
        clk: in std_logic;
        reset: in std_logic;

        rs1Address,rs2Address,rdAddress,WBAddress: in std_logic_vector(2 downto 0);

        WBData: in std_logic_vector(15 downto 0);
        regFileEnable: in std_logic;

        rdData,rs1Data,rs2Data: out std_logic_vector(15 downto 0)

    );
end entity regFile;

architecture behavioral of regFile is
    type mem_array_t is array (0 to 7) of std_logic_vector(15 downto 0);
    signal memory_array: mem_array_t;

    signal write_address_internal: unsigned(2 downto 0);
    signal read_addressDes_internal: unsigned(2 downto 0);
    signal read_address1_internal: unsigned(2 downto 0);
    signal read_address2_internal: unsigned(2 downto 0);
    
    signal data_read1_internal: std_logic_vector(15 downto 0);
    signal data_read2_internal: std_logic_vector(15 downto 0);
    signal data_readDes_internal: std_logic_vector(15 downto 0);
    begin

    process (clk,reset)
    begin
        if reset = '1' then
            memory_array <= (others => (others => '0'));
            rdData <= (others => '0');
            rs1Data <= (others => '0');
            rs2Data <= (others => '0');
        elsif rising_edge(clk) then
            if regFileEnable = '1' then
                write_address_internal <= (unsigned(WBAddress));
                memory_array(to_integer(write_address_internal)) <= WBData;
            end if;

            read_address1_internal <= (unsigned(rs1Address));
            read_address2_internal <= (unsigned(rs2Address));
            read_addressDes_internal <= (unsigned(rdAddress));

            data_read1_internal <= memory_array(to_integer(read_address1_internal));
            data_read2_internal <= memory_array(to_integer(read_address2_internal));
            data_readDes_internal <= memory_array(to_integer(read_addressDes_internal));

        end if;
    end process;
        rdData <= data_readDes_internal;
        rs1Data <= data_read1_internal;
        rs2Data <= data_read2_internal;
end behavioral;











