
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

ENTITY Reg_File IS
generic (n:integer :=16)
PORT( 
    d: in std_logic_vector (n-1 downto 0);
    read_add, write_add: in std_logic_vector (1 downto 0);
    write_en, clk, reset: in std_logic;
    output : OUT std_logic_vector (n-1 downto 0));
END Reg_File;

ARCHITECTURE Reg_File_arch OF Reg_File IS

-- Regs Memory Array
type regs is array(0 to 3) of std_logic_vector(n-1 down to 0);

-- -- Components
-- COMPONENT mux_generic IS
-- Generic ( n : Integer:=16);
-- PORT ( in0,in1,in2,in3 : IN std_logic_vector (n-1 DOWNTO 0);
--         sel : IN  std_logic_vector (1 DOWNTO 0);
--         out1 : OUT std_logic_vector (n-1 DOWNTO 0));
-- END COMPONENT ;

-- COMPONENT decoder_generic IS
-- PORT (output: out std_logic_vector (3 downto 0);
-- 	sel : IN  std_logic_vector (1 DOWNTO 0);
--     w_e: in std_logic);
-- END COMPONENT ;

-- -- Signals
-- signal out0,out1,out2,out3: std_logic_vector (n-1 downto 0);
-- -- signal write_en0,write_en1,write_en2,write_en3: std_logic;
-- signal out_decoder: std_logic_vector (3 downto 0);
signal my_regs: regs;

BEGIN

process(clk)
begin 
-- if clock is rising
    if(rising_edge(clk)) then
        -- if reseting smth
        if(reset) then
            reset_loop: for i in 0 to 3 loop
                my_regs(i) <= others => '0';
            end reset_loop   
        -- if we want to write smth
        else if (write_en) then
            my_regs(to_integer(unsigned(write_add))) <= d;
        end if;
    end if;
end process

output <=  my_regs(to_integer(unsigned(read_add))) 


END Reg_File_arch;