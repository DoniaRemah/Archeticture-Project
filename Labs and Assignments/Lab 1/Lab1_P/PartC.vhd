Library ieee;
Use ieee.std_logic_1164.all;
entity PartC is 
port  (
	A : in std_logic_vector (15 downto 0); 
	B:  in std_logic_vector (15 downto 0);
	Cin : in std_logic;
	S: in std_logic_vector (1 downto 0);
	Cout: out std_logic;
	F: out std_logic_vector (15 downto 0)
	
);
end entity;


Architecture PartC_arch of PartC is


begin
	F <= x"0000" when S="11" 
	else A(14 downto 0) & '0' when S="00"
	else A(14 downto 0) & Cin when S="10"
	else A(14 downto 0) & A(15) when S="01";

	Cout <= '0' when S="11" 
	else A(15) when S="00"
	else A(15) when S="10"
	else A(15) when S="01";


end PartC_arch;