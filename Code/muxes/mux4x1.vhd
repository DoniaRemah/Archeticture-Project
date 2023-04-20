LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

-- entity for dataIn0 4*1 mux
entity mux4x1 is
    generic (
        DATA_WIDTH : integer := 16
        );
        port (
        -- input data and output data are 16 bits 
        dataIn0, dataIn1,dataIn2,dataIn3 : in std_logic_vector(DATA_WIDTH-1 downto 0);
        -- selector is 1 bit
        selector0, selector1: in std_logic;
        dataOut : out std_logic_vector(DATA_WIDTH -1 downto 0));
end mux4x1;


-- architecture for the 4*1 mux
architecture mux4x1_arch of mux4x1 is
begin
        process (dataIn0, dataIn1,dataIn2,dataIn3, selector0,selector1)
        variable selector:std_logic_vector(1 downto 0);
        begin
                selector := selector0 & selector1;
                if (selector = "00") then
                    dataOut <= dataIn0;
                elsif (selector = "01") then
                    dataOut <= dataIn1;
                elsif (selector = "10") then
                    dataOut <= dataIn2;
                else 
                dataOut <= dataIn3;
                end if;
        end process;
end mux4x1_arch;

