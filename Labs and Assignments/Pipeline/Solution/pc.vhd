LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY pc IS
	PORT(
		clk : IN std_logic;
        rst: In std_logic;
        counter: Out std_logic_vector(5 downto 0);
        enable: in std_logic
        );

END ENTITY pc;

ARCHITECTURE pcArch OF pc IS
    signal wire: std_logic_vector(5 downto 0);
	BEGIN
    process(clk,rst)
    begin 
        IF(rst = '1') THEN
            wire <= (others => '0');
        ELSIF rising_edge(clk) THEN
            if (enable = '1') then
                wire <= std_logic_vector(unsigned(wire) +1);
            end if;
        end if;
    end process;

    counter <= wire;

END pcArch;