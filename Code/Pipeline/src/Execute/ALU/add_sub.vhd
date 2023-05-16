library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity add_sub is 
port  (
    first_src : in std_logic_vector (15 downto 0); 
    second_src : in std_logic_vector (15 downto 0); 
    flags : in std_logic_vector (2 downto 0);
    add_sub_sel:in std_logic;
    add_sub_res : out std_logic_vector (15 downto 0);
    new_flags : out std_logic_vector (2 downto 0)
);
end add_sub;

Architecture Archadd_sub of add_sub is

    signal zeroflag , carryflag , negativeflag , tempcin : std_logic ;

    signal tempres , notsecond_src , temp_second_src : std_logic_vector (15 downto 0);



    component my_nadder IS
    generic (n: integer := 16);
	PORT (a,b : IN  std_logic_vector(n-1 downto 0);
          cin : in std_logic;
		  s : out std_logic_vector(n-1 downto 0);
           cout : OUT std_logic );
END component;
begin

notsecond_src <= not second_src;

temp_second_src <= notsecond_src when add_sub_sel = '0' else second_src;

tempcin <= '1' when add_sub_sel = '0' else '0';

adder:my_nadder generic map(16) PORT MAP (first_src , temp_second_src , tempcin , tempres , carryflag);

zeroflag <= '1' when tempres = x"0000" else '0';

negativeflag <= '1' when tempres(15) = '1' else '0';

add_sub_res <= tempres;

new_flags <= carryflag & negativeflag & zeroflag;

end Archadd_sub;