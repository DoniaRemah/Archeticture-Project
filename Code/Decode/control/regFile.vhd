library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regFile is
    port (
        clk: in std_logic;
        reset: in std_logic;
        interrupt: in std_logic;

        rs1Address,rs2Address,rdAddress,WBAddress: in std_logic_vector(2 downto 0);

        WBData: in std_logic_vector(15 downto 0);
        regFileEnable: in std_logic;

        rdData,rs1Data,rs2Data: out std_logic_vector(15 downto 0)

    );
end entity regFile;

architecture behavioral of regFile is
    type mem_array_t is array (0 to 7) of std_logic_vector(15 downto 0);
    signal memory_array: mem_array_t;

    begin

    process (clk,reset)
    begin
        if reset = '1' then
            for i in 0 to 7 loop
                memory_array(i) <= (others => '0');
            end loop;  
        elsif falling_edge(clk) then
                if regFileEnable = '1' then
                    memory_array(to_integer(unsigned(WBAddress))) <= WBData;
                end if;
        end if;
    end process;
        rdData <= memory_array(to_integer(unsigned(rdAddress)));
        rs1Data <= memory_array(to_integer(unsigned(rs1Address)));
        rs2Data <= memory_array(to_integer(unsigned(rs2Address)));
end behavioral;











