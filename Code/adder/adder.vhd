library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- this is a 16-bit adder that uses the signed data type to perform its addition
entity adder is
  port (
    A, B : in std_logic_vector(15 downto 0);
    C : out std_logic_vector(15 downto 0)
  );
end entity adder;

architecture Behavioral of adder is
begin
  process (A, B)
    variable A_signed, B_signed, C_signed : signed(15 downto 0);
  begin
    A_signed := signed(A);
    B_signed := signed(B);
    C_signed := A_signed + B_signed;
    C <= std_logic_vector(C_signed);
  end process;
end architecture Behavioral;
