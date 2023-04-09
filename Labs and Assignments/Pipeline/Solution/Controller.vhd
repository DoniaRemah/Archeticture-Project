LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY Controller IS
	PORT(
		opCode : IN  std_logic_vector(2 DOWNTO 0);
		write_enable : OUT std_logic;
        alu_select: out  std_logic_vector(3 DOWNTO 0)
        );
END ENTITY Controller;

ARCHITECTURE Controller_arch OF Controller IS
	BEGIN
		
        alu_select <= "0111" when opcode = "100"  
        else "1000" when  opcode = "000"  
        else "0000" when opcode = "010"
        else "0000"; 

        write_enable <= '0' when opcode = "010"
        else '1';

END Controller_arch;