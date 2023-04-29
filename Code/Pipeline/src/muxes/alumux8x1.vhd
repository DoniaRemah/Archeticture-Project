LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

-- entity for dataIn0 4*1 mux
entity alumux8x1 is
    generic (
        DATA_WIDTH : integer := 16
        );
        port (
        -- input data and output data are 16 bits 
        dataIn0, dataIn1,dataIn2,dataIn3,dataIn4, dataIn5,dataIn6,dataIn7 : in std_logic_vector(DATA_WIDTH-1 downto 0);
        -- selector is 1 bit
        selector2,selector1, selector0: in std_logic;
        dataOut : out std_logic_vector(DATA_WIDTH -1 downto 0));
end alumux8x1;


-- architecture for the 4*1 mux
architecture alumux8x1_arch of alumux8x1 is
begin
        process (dataIn0, dataIn1,dataIn2,dataIn3, selector0,selector1)
        variable selector:std_logic_vector(2 downto 0);
        begin
                selector := selector2 & selector1 & selector0;
                if (selector = "000") then
                    dataOut <= dataIn0;
                elsif (selector = "001") then
                    dataOut <= dataIn1;
                elsif (selector = "010") then
                    dataOut <= dataIn2;
                elsif (selector = "011") then
                    dataOut <= dataIn3;
                elsif (selector = "100") then
                    dataOut <= dataIn4;
                elsif (selector = "101") then
                    dataOut <= dataIn5;
                elsif (selector = "110") then
                    dataOut <= dataIn6;
                elsif (selector = "111") then
                    dataOut <= dataIn7;
                end if;
        end process;
end alumux8x1_arch;

