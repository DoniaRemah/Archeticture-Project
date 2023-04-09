library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tb_alu is
end entity;


Architecture testing_Alu of tb_alu is

component ALU is 
port  (
	A : in std_logic_vector (15 downto 0); 
	B:  in std_logic_vector (15 downto 0);
	Cin : in std_logic;
	S: in std_logic_vector (3 downto 0);
	Cout: out std_logic;
	F: out std_logic_vector (15 downto 0)
	
);
end component;

Signal testA: std_logic_vector (15 downto 0);
Signal testB: std_logic_vector (15 downto 0);
Signal testCin :  std_logic;
Signal testCout : std_logic;
Signal testS:  std_logic_vector (3 downto 0);
Signal testF: std_logic_vector (15 downto 0);

Begin

  alu_inst: ALU port map (testA,testB,testCin,testS,testCout,testF);

process
begin

-- Testing Part A (01_ _) -- 

testA <= x"0F0F";
testB <=  x"00B0";
testCin <= '0';
testS <=  "0000";




wait for 100 ps;

assert (testF=x"0F0F")
	report "Case of output F failed 1011" 
	severity error;
assert (testCout='0')
	report "Case of output Cout failed 1011"  
	severity error;


testA <= x"0F0F";
testB <=  x"0001";
testCin <= '0';
testS <=  "0001";




wait for 100 ps;

assert (testF=x"0F10")
	report "Case of output F failed 1011" 
	severity error;
assert (testCout='0')
	report "Case of output Cout failed 1011"  
	severity error;

testA <= x"FFFF";
testB <=  x"0001";
testCin <= '0';
testS <=  "0010";




wait for 100 ps;

assert (testF=x"FFFD")
	report "Case of output F failed 1011" 
	severity error;
assert (testCout='1')
	report "Case of output Cout failed 1011"  
	severity error;

testA <= x"FFFF";
testB <=  x"00B0";
testCin <= '0';
testS <=  "0011";




wait for 100 ps;

assert (testF=x"FFFE")
	report "Case of output F failed 1011" 
	severity error;
assert (testCout='1')
	report "Case of output Cout failed 1011"  
	severity error;

testA <= x"0F0E";
testB <=  x"00B0";
testCin <= '1';
testS <=  "0000";




wait for 100 ps;

assert (testF=x"0F0F")
	report "Case of output F failed 1011" 
	severity error;
assert (testCout='0')
	report "Case of output Cout failed 1011"  
	severity error;



-- Testing Part B (01_ _) -- 

testA <= x"F000";
testB <=  x"00B0";
testCin <= '0';
testS <=  "0100";




wait for 100 ps;

assert (testF=x"F0B0")
	report "Case of output F failed 1011" 
	severity error;
assert (testCout='0')
	report "Case of output Cout failed 1011"  
	severity error;




testA <= x"F000";
testB <=  x"000B";
testCin <= '0';
testS <=  "0101";




wait for 100 ps;

assert (testF=x"0000")
	report "Case of output F failed 1011" 
	severity error;

assert (testCout='0')
	report "Case of output Cout failed 1011"  
	severity error;


testA <= x"F000";
testB <=  x"B000";
testCin <= '0';
testS <=  "0110";




wait for 100 ps;

assert (testF=x"0FFF")
	report "Case of output F failed 1011" 
	severity error;

assert (testCout='0')
	report "Case of output Cout failed 1011"  
	severity error;


testA <= x"F000";
testB <=  x"000B";
testCin <= '0';
testS <=  "0111";




wait for 100 ps;

assert (testF=x"0FFF")
	report "Case of output F failed 1011" 
	severity error;

assert (testCout='0')
	report "Case of output Cout failed 1011"  
	severity error;




-- Testing Part C (10_ _) -- 

testA <= x"A00A";
testB <=  x"A00A";
testCin <= '0';
testS <=  "1000";




wait for 100 ps;

assert (testF=x"4014")
	report "Case of output F failed 1011" 
	severity error;

assert (testCout='1')
	report "Case of output Cout failed 1011"  
	severity error;





testA <= x"B00C";
testB <=  x"A00A";
testCin <= '0';
testS <=  "1001";




wait for 100 ps;

assert (testF=x"6019")
	report "Case of output F failed 1011" 
	severity error;

assert (testCout='1')
	report "Case of output Cout failed 1011"  
	severity error;



testA <= x"A00A";
testB <=  x"A00A";
testCin <= '0';
testS <=  "1010";




wait for 100 ps;

assert (testF=x"4014")
	report "Case of output F failed 1011" 
	severity error;

assert (testCout='1')
	report "Case of output Cout failed 1011"  
	severity error;
----------------------------------------------------


testA <= x"A00A";
testB <=  x"A00A";
testCin <= '0';
testS <=  "1011";




wait for 100 ps;

assert (testF=x"0000")
	report "Case of output F failed 1011" 
	severity error;

assert (testCout='0')
	report "Case of output Cout failed 1011"  
	severity error;












-- Testing Part D (11_ _) -- 


testA <= x"000F";
testB <=  x"A00A";
testCin <= '0';
testS <=  "1100";




wait for 100 ps;

assert (testF=x"0007")
	report "Case of output F failed 1011" 
	severity error;

assert (testCout='1')
	report "Case of output Cout failed 1011"  
	severity error;

testA <= x"0F0F";
testB <=  x"A00A";
testCin <= '0';
testS <=  "1101";




wait for 100 ps;

assert (testF=x"8787")
	report "Case of output F failed 1011" 
	severity error;

assert (testCout='1')
	report "Case of output Cout failed 1011"  
	severity error;



testA <= x"0F0F";
testB <=  x"A00A";
testCin <= '0';
testS <=  "1110";




wait for 100 ps;

assert (testF=x"0787")
	report "Case of output F failed 1011" 
	severity error;

assert (testCout='1')
	report "Case of output Cout failed 1011"  
	severity error;


testA <= x"F000";
testB <=  x"A00A";
testCin <= '0';
testS <=  "1111";




wait for 100 ps;

assert (testF=x"F800")
	report "Case of output F failed 1011" 
	severity error;

assert (testCout='0')
	report "Case of output Cout failed 1011"  
	severity error;



testA <= x"000A";
testB <=  x"A00A";
testCin <= '0';
testS <=  "1000";




wait for 100 ps;

assert (testF=x"0014")
	report "Case of output F failed 1011" 
	severity error;

assert (testCout='0')
	report "Case of output Cout failed 1011"  
	severity error;


testA <= x"000C";
testB <=  x"A00A";
testCin <= '0';
testS <=  "1001";




wait for 100 ps;

assert (testF=x"0018")
	report "Case of output F failed 1011" 
	severity error;

assert (testCout='0')
	report "Case of output Cout failed 1011"  
	severity error;


testA <= x"A00A";
testB <=  x"A00A";
testCin <= '1';
testS <=  "1010";




wait for 100 ps;

assert (testF=x"4015")
	report "Case of output F failed 1011" 
	severity error;

assert (testCout='1')
	report "Case of output Cout failed 1011"  
	severity error;



testA <= x"0F00";
testB <=  x"A00A";
testCin <= '1';
testS <=  "1110";




wait for 100 ps;

assert (testF=x"8780")
	report "Case of output F failed 1011" 
	severity error;

assert (testCout='0')
	report "Case of output Cout failed 1011"  
	severity error;
wait;



end process;



end testing_Alu;
