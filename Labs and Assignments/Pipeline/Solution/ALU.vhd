Library ieee;
Use ieee.std_logic_1164.all;

entity ALU is 
port  (
	A : in std_logic_vector (15 downto 0); 
	B:  in std_logic_vector (15 downto 0);
	Cin : in std_logic;
	S: in std_logic_vector (3 downto 0);
	Cout: out std_logic;
	F: out std_logic_vector (15 downto 0)
	
);
end entity;

ARCHITECTURE ALU_arch OF ALU IS

COMPONENT PartA IS
port  (
	A : in std_logic_vector (15 downto 0); 
	B:  in std_logic_vector (15 downto 0);
	Cin : in std_logic;
	S: in std_logic_vector (1 downto 0);
	Cout: out std_logic;
	F: out std_logic_vector (15 downto 0)
	
);
END COMPONENT ;


COMPONENT PartB IS
    port  (
	A : in std_logic_vector (15 downto 0); 
	B:  in std_logic_vector (15 downto 0);
	Cin : in std_logic;
	S: in std_logic_vector (1 downto 0);
	Cout: out std_logic;
	F: out std_logic_vector (15 downto 0)
	
	);
    END COMPONENT ;

    COMPONENT PartC IS
        port  (
	A : in std_logic_vector (15 downto 0); 
	B:  in std_logic_vector (15 downto 0);
	Cin : in std_logic;
	S: in std_logic_vector (1 downto 0);
	Cout: out std_logic;
	F: out std_logic_vector (15 downto 0)
	
	);
    END COMPONENT ;

COMPONENT PartD IS
        port  (
	A : in std_logic_vector (15 downto 0); 
	B:  in std_logic_vector (15 downto 0);
	Cin : in std_logic;
	S: in std_logic_vector (1 downto 0);
	Cout: out std_logic;
	F: out std_logic_vector (15 downto 0)
	
	);

      END COMPONENT ;


signal f_a,f_b, f_c, f_d:std_logic_vector (15 downto 0) ;

signal cout_a,cout_b, cout_c, cout_d: std_logic;

Begin

part_a: PartA Port Map (A,B,cin,s(1 downto 0),cout_a,f_a);
part_b: PartB Port Map (A,B,cin,s(1 downto 0),cout_b,f_b);
part_c: Partc Port Map (A,B,cin,s(1 downto 0),cout_c,f_c);
part_d: Partd Port Map (A,B,cin,s(1 downto 0),cout_d,f_d);

F <= f_b  when S(3 downto 2) = "01"
else f_c  when S(3 downto 2) = "10"
else f_d  when S(3 downto 2) = "11"
else f_a when S(3 downto 2) = "00";

Cout <= cout_b  when S(3 downto 2) = "01"
else cout_c  when S(3 downto 2) = "10"
else cout_d  when S(3 downto 2) = "11"
else cout_a when S(3 downto 2) = "00";


end ALU_arch;