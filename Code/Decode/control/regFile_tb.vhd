library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regFile_tb is
end entity;

architecture tb_arch of regFile_tb is
    -- Import the DUT
    component regFile is
        port (
            clk: in std_logic;
            reset: in std_logic;
            interrupt: in std_logic;

            rs1Address, rs2Address, rdAddress, WBAddress: in std_logic_vector(2 downto 0);

            WBData: in std_logic_vector(15 downto 0);
            regFileEnable: in std_logic;

            rdData, rs1Data, rs2Data: out std_logic_vector(15 downto 0)
        );
    end component;

    -- Declare the signals used for testing
    signal clk, reset, interrupt, rs1Address, rs2Address, rdAddress, WBAddress: std_logic_vector(2 downto 0);
    signal WBData: std_logic_vector(15 downto 0);
    signal regFileEnable: std_logic;
    signal rdData, rs1Data, rs2Data: std_logic_vector(15 downto 0);

begin

    -- Instantiate the DUT
    uut: regFile
        port map (
            clk => clk,
            reset => reset,
            interrupt => interrupt,
            rs1Address => rs1Address,
            rs2Address => rs2Address,
            rdAddress => rdAddress,
            WBAddress => WBAddress,
            WBData => WBData,
            regFileEnable => regFileEnable,
            rdData => rdData,
            rs1Data => rs1Data,
            rs2Data => rs2Data
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize inputs
        reset <= '1';
        clk <= '0';
        interrupt <= '0';
        rs1Address <= (others => '0');
        rs2Address <= (others => '0');
        rdAddress <= (others => '0');
        WBAddress <= (others => '0');
        WBData <= (others => '0');
        regFileEnable <= '0';

        -- Reset
        wait for 10 ns;
        reset <= '0';
        wait for 10 ns;

        -- Test case 1: Write to memory
        WBAddress <= "000";
        WBData <= x"1234";
        regFileEnable <= '1';
        wait for 10 ns;
        assert memory_array(0) = x"1234" report "Test case 1 failed" severity error;

        -- Test case 2: Read from memory
        rs1Address <= "001";
        rs2Address <= "010";
        rdAddress <= "011";
        memory_array(1) <= x"5678";
        memory_array(2) <= x"9ABC";
        wait for 10 ns;
        assert data_read1_internal = x"5678" report "Test case 2 failed" severity error;
        assert data_read2_internal = x"9ABC" report "Test case 2 failed" severity error;
        assert rdData = x"0000" report "Test case 2 failed" severity error;

    ------------------------------------------
    -- Test case 3: Write to memory and read from memory
    ------------------------------------------
    report "Starting Test case 3: Write to memory and read from memory" severity note;

    -- Initialize inputs
    rs1Address <= "000";
    rs2Address <= "001";
    rdAddress <= "010";
    WBAddress <= "011";
    WBData <= X"1234";
    regFileEnable <= '1';
    reset <= '1';
    interrupt <= '0';
    wait for 10 ns;

    -- Deassert reset
    reset <= '0';
    wait for 10 ns;

    -- Write to memory
    WBAddress <= "001";
    WBData <= X"5678";
    wait for 10 ns;

    -- Read from memory
    rs1Address <= "001";
    rs2Address <= "000";
    rdAddress <= "010";
    wait for 10 ns;

    -- Check results
    assert rdData = X"5678"
        report "Test case 3 failed: Unexpected value for rdData" severity error;
    assert rs1Data = X"5678"
        report "Test case 3 failed: Unexpected value for rs1Data" severity error;
    assert rs2Data = X"1234"
        report "Test case 3 failed: Unexpected value for rs2Data" severity error;

    report "Test case 3 passed!" severity note;
    wait;

