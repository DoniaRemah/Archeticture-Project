Library ieee;
Use ieee.std_logic_1164.all;
entity PartD is 
port  (
	A : in std_logic_vector (15 downto 0); 
	B:  in std_logic_vector (15 downto 0);
	Cin : in std_logic;
	S: in std_logic_vector (1 downto 0);
	Cout: out std_logic;
	F: out std_logic_vector (15 downto 0)
	
);
end entity;


Architecture PartD_arch of PartD is


begin
	F <= A(15) & A(15 downto 1) when S="11" 
	else '0' &  A(15 downto 1)  when S="00"
	else cin &  A(15 downto 1) when S="10"
	else A(0) &  A(15 downto 1) when S="01";

	Cout <= '0' when S="11" 
	else A(0) when S="00"
	else A(0) when S="10"
	else A(0) when S="01";


end PartD_arch;
