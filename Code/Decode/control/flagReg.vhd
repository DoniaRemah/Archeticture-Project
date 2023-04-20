library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity flagReg is
    port (
        clk : in std_logic;         
        reset : in std_logic;       
        flagEnable : in std_logic;    

        WBFlags : in std_logic_vector(2 downto 0);  
        outFlags : out std_logic_vector(2 downto 0) 
    );
end flagReg;

architecture Behavioral of flagReg is
    signal storedData : std_logic_vector(2 downto 0); 

begin
    process (clk, reset)
    begin
        if reset = '1' then   
            storedData <= (others => '0');
        elsif rising_edge(clk) then     
            if flagEnable = '1' then            
                storedData <= WBFlags;          
            end if;
        end if;
    end process;

    outFlags <= storedData;    
end Behavioral;
