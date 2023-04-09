
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY Reg_File IS
PORT( 
    d: in std_logic_vector (15 downto 0);
read_add, write_add: in std_logic_vector (1 downto 0);
write_en, clk, reset: in std_logic;
output : OUT std_logic_vector (15 downto 0));
END Reg_File;

ARCHITECTURE Reg_File_arch OF Reg_File IS
COMPONENT my_DFF IS
PORT( clk,rst : IN std_logic; 
write_enable: in  std_logic;
d: in std_logic_vector (15 downto 0);
q : OUT std_logic_vector (15 downto 0));
END COMPONENT ;

COMPONENT mux_generic IS
Generic ( n : Integer:=16);
PORT ( in0,in1,in2,in3 : IN std_logic_vector (n-1 DOWNTO 0);
        sel : IN  std_logic_vector (1 DOWNTO 0);
        out1 : OUT std_logic_vector (n-1 DOWNTO 0));
END COMPONENT ;

COMPONENT decoder_generic IS
PORT (output: out std_logic_vector (3 downto 0);
	sel : IN  std_logic_vector (1 DOWNTO 0);
    w_e: in std_logic);
END COMPONENT ;

signal out0,out1,out2,out3: std_logic_vector (15 downto 0);
signal write_en0,write_en1,write_en2,write_en3: std_logic;
signal out_decoder: std_logic_vector (3 downto 0);



BEGIN



decoder: decoder_generic  Port Map (out_decoder,write_add,write_en);

reg0: my_DFF  Port Map (clk,reset,out_decoder(0),d,out0);
reg1: my_DFF  Port Map (clk,reset,out_decoder(1),d,out1);
reg2: my_DFF  Port Map (clk,reset,out_decoder(2),d,out2);
reg3: my_DFF  Port Map (clk,reset,out_decoder(3),d,out3);
    

mux: mux_generic  generic map(16) Port Map (out0,out1,out2,out3,read_add,output);





END Reg_File_arch;