LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity pc_reg is
    port (
        clk : in std_logic;
        rst : in std_logic;
        we : in std_logic;
        reset_value : in std_logic_vector(15 downto 0);
        data_in : in std_logic_vector(15 downto 0);
        data_out : out std_logic_vector(15 downto 0)
    );
end pc_reg;

architecture Behavioral of pc_reg is
begin
    process (clk)
    begin
        if (rst = '1') then -- reset
            data_out <= reset_value;
        elsif rising_edge(clk) then -- on rising edge of clock
            if (we = '1') then -- write
                data_out <= data_in;
            end if;
        end if;
    end process;
end Behavioral;
