LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

-- This is NOT GENERIC

ENTITY decoder_generic IS 
PORT (output: out std_logic_vector (3 downto 0);
	sel : IN  std_logic_vector (1 DOWNTO 0);
    w_e: in std_logic);
END decoder_generic;


ARCHITECTURE decoder OF decoder_generic is
	BEGIN	

    output <= "0001" when sel= "00" and w_e = '1'
    else "0010" when sel= "01" and w_e = '1'
    else "0100" when sel= "10" and w_e = '1'
    else "1000" when sel= "11" and w_e = '1'
    else "0000";
END decoder;

