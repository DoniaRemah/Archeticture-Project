library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WB is
    port(
        -- INPUTS
        -- the write back signals
        dataSelector, inDataSelector, flagSelector, flagEnable, regFileEnable: in std_logic;

        memResult, ALUResult, InPortData: in std_logic_vector(15 downto 0);

        memFlags, ALUFlags, WBAddress: in std_logic_vector(2 downto 0);

        -- OUTPUTS
        flagEnableOut, regFileEnableOut: out std_logic;
        WBData, WBFlags: out std_logic_vector(15 downto 0);
        WBAddressOut: out std_logic_vector(2 downto 0)
    );
end entity WB;

architecture Behavioral of WB is
    signal outOfMux1: std_logic_vector(15 downto 0);
begin
    flagEnableOut <= flagEnable;
    regFileEnableOut <= regFileEnable;
    WBAddressOut <= WBAddress;

            mux2x1_1: entity work.mux2x1
            port map(
                dataIn0 => ALUResult,
                dataIn1 => memResult,
                selector => dataSelector,
                dataOut => outOfMux1
            );

            mux2x1_2: entity work.mux2x1
            port map(
                dataIn0 => outOfMux1,
                dataIn1 => InPortData,
                selector => inDataSelector,
                dataOut => WBData
            );




end architecture Behavioral;