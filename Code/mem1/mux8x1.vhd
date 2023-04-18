LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity mux8x1 is
        port (
        -- input data and output data are 16 bits 
        -- dataIn0=-1
        -- dataIn1=1
        -- dataIn2=-2
        -- dataIn3=2
        -- dataIn0_input, dataIn1_input, dataIn2_input,dataIn3_input: in std_logic_vector(15 downto 0);
        -- selector is 3 bit
        selector : in std_logic_vector(2 downto 0);
        dataOut : out std_logic_vector(15 downto 0));
end mux8x1;


architecture mux8x1_arch of mux8x1 is
        -- put dataIn0 to be -1
        -- put dataIn1 to be 1
        -- put dataIn2 to be -2
        -- put dataIn3 to be 2
        -- hardcode the signals
        signal dataIn0 : std_logic_vector(15 downto 0) := "1111111111111111";
        signal dataIn1 : std_logic_vector(15 downto 0) := "0000000000000001";
        signal dataIn2 : std_logic_vector(15 downto 0) := "1111111111111110";
        signal dataIn3 : std_logic_vector(15 downto 0) := "0000000000000010";
begin
        process (selector)
        begin
                -- if selector ="001" then choose dataIn0
                -- if selector ="010" then choose dataIn1
                -- if selector ="101" then choose dataIn2
                -- if selector ="110" then choose dataIn3
                -- else put zeroes
                case selector is
                        when "001" => dataOut <= dataIn0;
                        when "010" => dataOut <= dataIn1;
                        when "101" => dataOut <= dataIn2;
                        when "110" => dataOut <= dataIn3;
                        when others => dataOut <= (others => '0');
                end case;

        end process;
end mux8x1_arch;

