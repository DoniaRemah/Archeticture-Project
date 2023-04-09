library IEEE;
use IEEE.std_logic_1164.all;


entity tb_myand is
end entity;


Architecture testingAnd of tb_myand is

component myand is 
port  (
	A : in std_logic; 
	B:  in std_logic;
	C : out std_logic
);
end component;

Signal testA: std_logic;
Signal testB: std_logic;
Signal testC: std_logic;

Begin

  U1: myand port map (testA,testB,testC);
process
begin

-- test case 1:
testA <= '1';
testB <= '1';

wait for 10 ns;

assert (testC='1')
	report "Failed Case: " & std_logic'image(testA) & std_logic'image(testB) & "output: " & std_logic'image(testC)  severity error;
	

testA <= '1';
testB <= '0';

wait for 10 ns;
assert (testC='0')
	report "Failed Case: " & std_logic'image(testA) & std_logic'image(testB) & "output: " & std_logic'image(testC)  severity error;
	

testA <= '0';
testB <= '1';

wait for 10 ns;
assert (testC='0')
	report "Failed Case: " & std_logic'image(testA) & std_logic'image(testB) & "output: " & std_logic'image(testC)  severity error;
	

testA <= '0';
testB <= '0';

wait for 10 ns;

assert (testC='0')
	report "Failed Case: " & std_logic'image(testA) & std_logic'image(testB) & "output: " & std_logic'image(testC)  severity error;
	
wait;



end process;



end testingAnd;
