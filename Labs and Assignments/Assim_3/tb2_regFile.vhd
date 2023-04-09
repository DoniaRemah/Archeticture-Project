
library IEEE;
use IEEE.std_logic_1164.all;


entity tb2_regFile is

end entity;


Architecture testingReg of tb2_regFile is

component Reg_File is 
generic (n:integer :=16);
PORT( 
	d: in std_logic_vector (n-1 downto 0);
    read_add, write_add: in std_logic_vector (1 downto 0);
    write_en, clk, reset: in std_logic;
    output : OUT std_logic_vector (n-1 downto 0));
end component;

signal d:  std_logic_vector (15 downto 0);
signal read_add, write_add:  std_logic_vector (1 downto 0);
signal write_en, clk, reset:  std_logic;
signal output :  std_logic_vector (15 downto 0);

Begin

U1:  Reg_File generic map(16) port map (d,read_add,write_add,write_en,clk,reset,output);

process

begin
clk<='0'; 
wait for 5 ns;
clk<='1'; 
wait for 5 ns;
end process;


process
begin

-- test case 1:
d <= x"0000";
read_add <= "00";
reset <= '1';

wait for  10 ns;

assert (output=x"0000")
	report "Failed Case 1";
	

-- test case 2:
d <= x"f00f";
write_add <= "00";
write_en <= '1';
reset <= '0';

wait for  10 ns;

assert (output=x"f00f")
	report "Failed Case 2";

-- test case 3:
d <= x"1001";
write_add <= "01";
write_en <= '1';

wait for  10 ns;

assert (output=x"f00f")
	report "Failed Case 3";


-- test case 4:
d <= x"0003";
read_add <= "01";
write_add <= "00";
write_en <= '1';

wait for  10 ns;

assert (output=x"1001")
	report "Failed Case 4";


-- test case 5:

read_add <= "10";
write_en <= '0';

wait for  10 ns;

assert (output=x"0000")
	report "Failed Case 5";

-- test case 6:

d <= x"a00a";
read_add <= "00";
write_add <= "10";
write_en <= '1';


wait for  10 ns;

assert (output=x"0003")
	report "Failed Case 6";


-- test case 7:
d <= x"b00b";
read_add <= "01";
write_add <= "11";
write_en <= '1';


wait for  10 ns;
assert (output=x"1001")
	report "Failed Case 7";

-- test case 8:

read_add <= "10";
write_en <= '0';

wait for  10 ns;

assert (output=x"a00a")
	report "Failed Case 8";

wait;



end process;



end testingReg;

