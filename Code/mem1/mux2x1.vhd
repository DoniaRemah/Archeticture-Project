LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

-- entity for dataIn0 2*1 mux
entity mux2x1 is
        port (
        -- input data and output data are 16 bits 
        dataIn0, dataIn1 : in std_logic_vector(15 downto 0);
        -- selector is 1 bit
        selector : in std_logic;
        dataOut : out std_logic_vector(15 downto 0));
end mux2x1;


-- architecture for the 2*1 mux
architecture mux2x1_arch of mux2x1 is
begin
        process (dataIn0, dataIn1, selector)
        begin
                if (selector = '0') then
                        dataOut <= dataIn0;
                else
                        dataOut <= dataIn1;
                end if;
        end process;
end mux2x1_arch;

