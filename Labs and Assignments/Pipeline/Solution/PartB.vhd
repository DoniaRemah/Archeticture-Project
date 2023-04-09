Library ieee;
Use ieee.std_logic_1164.all;
entity PartB is 
port  (
	A : in std_logic_vector (15 downto 0); 
	B:  in std_logic_vector (15 downto 0);
	Cin : in std_logic;
	S: in std_logic_vector (1 downto 0);
	Cout: out std_logic;
	F: out std_logic_vector (15 downto 0)
	
);
end entity;

Architecture PartB_arch of PartB is


begin
	F <= not A when S="11" 
	else A or B when S="00"
	else A nor B  when S="10"
	else A and B  when S="01";

	Cout <= '0';

end PartB_arch;
