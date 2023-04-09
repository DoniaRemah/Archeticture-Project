Library ieee;
Use ieee.std_logic_1164.all;

------ Part A Entity--------

ENTITY FullAdder IS
port  (
	A : in std_logic_vector (15 downto 0); 
	B:  in std_logic_vector (15 downto 0);
	Cin : in std_logic;
	Cout: out std_logic;
	F: out std_logic_vector (15 downto 0)
);
END FullAdder;

------ Part A Arch--------
Architecture FullAdder_arch of FullAdder is


------ n Adder Component -------
    COMPONENT my_nadder IS
        generic (n: integer := 3);
        PORT (a,b : IN  std_logic_vector(n-1 downto 0);
        cin : in std_logic;
		s : out std_logic_vector(n-1 downto 0);
        cout : OUT std_logic );
    END COMPONENT ;

------ Select Adder Component -------
    COMPONENT select_adder IS
        generic (n: integer := 8);
        PORT (a,b : IN  std_logic_vector(n-1 downto 0);
        cin : in std_logic;
        s : out std_logic_vector(n-1 downto 0);
        cout : OUT std_logic );
    END COMPONENT ;

--------- Signals --------------

    signal sum0,sum1,sum2,sum3 : std_logic_vector(3 downto 0);
    signal cout0,cout1,cout2,cout3: std_logic;

---------- Begining of part A Arch ------------ 
    begin

        f0:my_nadder generic map(4) port map(a(3 downto 0),b(3 downto 0),cin,sum0,cout0);
        f1:select_adder generic map(4) port map(a(7 downto 4),b(7 downto 4),cout0,sum1,cout1);
        f2:select_adder generic map(4) port map(a(11 downto 8),b(11 downto 8),cout1,sum2,cout2);
        f3:select_adder generic map(4) port map(a(15 downto 12),b(15 downto 12),cout2,sum3,cout3);

        Cout <= cout3;
        F <= sum3 & sum2 & sum1 & sum0;

end FullAdder_arch;
    
