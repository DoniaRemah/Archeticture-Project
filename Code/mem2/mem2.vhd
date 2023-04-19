library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mem2 is
    port(
        clk: in std_logic;
        reset: in std_logic;

        -- wb signals 
        dataSelector, inDataSelector, flagSelector, flagEnable, regFileEnable:in std_logic;

        -- mem signals
        memOp,memRead, memWrite, dataBusSelector, propRetRti: in std_logic;

        dataToBeWritten,writeAddress,readAddress, ALU_Imm: in std_logic_vector(15 downto 0);
        RdAddress: in std_logic_vector(2 downto 0);
        newFlags: in std_logic_vector(2 downto 0)
    );
end mem2;

architecture behavioral of mem2 is
    signal extendedNewFlags: std_logic_vector(7 downto 0);
    begin
        extendedNewFLags <= newFlags & "0000000000000";
        process(clk, reset)
            begin
                if reset='1' then
                    dataSelector <= '0';
                    inDataSelector <= '0';
                    flagSelector <= '0';
                    flagEnable <= '0';
                    regFileEnable <= '0';
                    memOp <= '0';
                    memRead <= '0';
                    memWrite <= '0';
                    dataBusSelector <= '0';
                    propRetRti <= '0';
                    dataToBeWritten <= (others => '0');
                    writeAddress <= (others => '0');
                    readAddress <= (others => '0');
                    ALU_Imm <= (others => '0');
                    RdAddress <= (others => '0');
                    newFlags <= (others => '0');

end behavioral;