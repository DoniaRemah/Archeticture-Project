Library ieee;
Use ieee.std_logic_1164.all;
entity PartA is 
port  (
	A : in std_logic_vector (15 downto 0); 
	B:  in std_logic_vector (15 downto 0);
	Cin : in std_logic;
	S: in std_logic_vector (1 downto 0);
	Cout: out std_logic;
	F: out std_logic_vector (15 downto 0)
	
);
end entity;

Architecture PartA_arch of PartA is

    COMPONENT FullAdder IS
        port  (
            A : in std_logic_vector (15 downto 0); 
            B:  in std_logic_vector (15 downto 0);
            Cin : in std_logic;
            Cout: out std_logic;
            F: out std_logic_vector (15 downto 0)
        );
    END COMPONENT ;

    signal sum0,sum1,sum2,sum3,sum4 : std_logic_vector(15 downto 0);
    signal cout0,cout1,cout2,cout3,cout4: std_logic;
    signal notb:std_logic_vector(15 downto 0);

begin

    notb <= not b;
    f0: FullAdder port map(a,x"0000",cin,cout0,sum0);
    f1: FullAdder port map(a,b,cin,cout1,sum1);
    f2: FullAdder port map(a,notb,cin,cout2,sum2);
    f3: FullAdder port map(a,x"FFFF",'0',cout3,sum3);

    sum4 <= b;
    cout4 <= '0';

    F <= sum0 when s="00"
    else sum1 when s= "01"
    else sum2 when s="10"
    else sum3 when s="11" and cin ='0'
    else sum4 when s="11" and cin ='1';

    cout <= cout0 when s="00"
    else cout1 when s= "01"
    else cout2 when s="10"
    else cout3 when s="11" and cin ='0'
    else cout4 when s="11" and cin ='1';

end PartA_arch;
