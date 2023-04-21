LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY instCache IS
	PORT(
		address : IN  std_logic_vector(15 DOWNTO 0);
		dataout: OUT std_logic_vector(31 DOWNTO 0);
		reset_value : OUT std_logic_vector(15 DOWNTO 0));
END ENTITY instCache;

ARCHITECTURE cache_arc OF instCache IS

	-- All instructions I have
	TYPE ram_type IS ARRAY(0 TO 1023) OF std_logic_vector(15 DOWNTO 0);
	SIGNAL ram : ram_type ;
	
	
	BEGIN
		-- insturction that this is its turn
		dataout <= ram(to_integer(unsigned(address))) &  ram(to_integer(unsigned(address)+1));
		reset_value <= ram(0);
END cache_arc;