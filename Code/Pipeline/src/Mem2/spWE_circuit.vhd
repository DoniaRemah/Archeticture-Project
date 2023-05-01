library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity spWE_circuit is
port(
    readAddressSelector, writeAddressSelector,memOP : in std_logic;
    spWE: out std_logic

);

end spWE_circuit;

architecture spWE_circuit_arch of spWE_circuit is
signal out_of_or: std_logic;

begin
    process(readAddressSelector, writeAddressSelector,memOP)
    begin
    out_of_or <= readAddressSelector or writeAddressSelector;
    spWE <= out_of_or and memOP;
    end process;
end spWE_circuit_arch;