LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY instCache IS
	PORT(
		clk : IN std_logic;
		address : IN  std_logic_vector(5 DOWNTO 0);
		dataout : OUT std_logic_vector(15 DOWNTO 0));
END ENTITY instCache;

ARCHITECTURE syncrama OF instCache IS

	-- All instructions I have
	TYPE ram_type IS ARRAY(0 TO 63) OF std_logic_vector(15 DOWNTO 0);
	SIGNAL ram : ram_type ;
	
	BEGIN
		-- insturction that this is its turn
		dataout <= ram(to_integer(unsigned(address)));
END syncrama;