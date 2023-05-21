library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sp_reg is
    port (
        clk : in std_logic;         
        reset : in std_logic;       
        writeEnable : in std_logic;          
        dataIn : in std_logic_vector(15 downto 0);  
        dataOut : out std_logic_vector(15 downto 0) 
    );
end sp_reg;

architecture Behavioral of sp_reg is
    signal storedData : std_logic_vector(15 downto 0); 

begin
    process (clk, reset)
    begin
        if reset = '1' then   
            -- the reset value of the register is 1023 in decimal
            storedData <= std_logic_vector(to_signed(1023, 16));
        elsif falling_edge(clk) then     
            if writeEnable = '1' then            
                storedData <= dataIn;          
            end if;
        end if;
    end process;

    dataOut <= storedData;    
end Behavioral;
