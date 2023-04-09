-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "03/04/2023 15:58:26"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Reg_File IS
    PORT (
	d : IN std_logic_vector(15 DOWNTO 0);
	read_add : IN std_logic_vector(1 DOWNTO 0);
	write_add : IN std_logic_vector(1 DOWNTO 0);
	write_en : IN std_logic;
	clk : IN std_logic;
	reset : IN std_logic;
	output : OUT std_logic_vector(15 DOWNTO 0)
	);
END Reg_File;

-- Design Ports Information
-- output[0]	=>  Location: PIN_U20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[1]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[2]	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[3]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[4]	=>  Location: PIN_P17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[5]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[6]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[7]	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[8]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[9]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[10]	=>  Location: PIN_P19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[11]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[12]	=>  Location: PIN_P18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[13]	=>  Location: PIN_T19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[14]	=>  Location: PIN_U16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[15]	=>  Location: PIN_U17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- read_add[0]	=>  Location: PIN_T18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- read_add[1]	=>  Location: PIN_T20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[0]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_R21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- write_add[1]	=>  Location: PIN_T17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- write_add[0]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- write_en	=>  Location: PIN_V19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[1]	=>  Location: PIN_T22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[2]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[3]	=>  Location: PIN_R22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[4]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[5]	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[6]	=>  Location: PIN_R15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[7]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[8]	=>  Location: PIN_P22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[9]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[10]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[11]	=>  Location: PIN_R17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[12]	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[13]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[14]	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[15]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Reg_File IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_d : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_read_add : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_write_add : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_write_en : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_output : std_logic_vector(15 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \d[0]~input_o\ : std_logic;
SIGNAL \my_regs[0][0]~feeder_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \write_en~input_o\ : std_logic;
SIGNAL \write_add[1]~input_o\ : std_logic;
SIGNAL \write_add[0]~input_o\ : std_logic;
SIGNAL \my_regs[0][1]~0_combout\ : std_logic;
SIGNAL \my_regs[0][0]~q\ : std_logic;
SIGNAL \my_regs[2][0]~feeder_combout\ : std_logic;
SIGNAL \my_regs[2][10]~2_combout\ : std_logic;
SIGNAL \my_regs[2][0]~q\ : std_logic;
SIGNAL \my_regs[1][0]~feeder_combout\ : std_logic;
SIGNAL \my_regs[1][13]~1_combout\ : std_logic;
SIGNAL \my_regs[1][0]~q\ : std_logic;
SIGNAL \read_add[0]~input_o\ : std_logic;
SIGNAL \my_regs[3][11]~3_combout\ : std_logic;
SIGNAL \my_regs[3][0]~q\ : std_logic;
SIGNAL \read_add[1]~input_o\ : std_logic;
SIGNAL \Mux15~0_combout\ : std_logic;
SIGNAL \d[1]~input_o\ : std_logic;
SIGNAL \my_regs[0][1]~q\ : std_logic;
SIGNAL \my_regs[1][1]~q\ : std_logic;
SIGNAL \my_regs[3][1]~q\ : std_logic;
SIGNAL \my_regs[2][1]~q\ : std_logic;
SIGNAL \Mux14~0_combout\ : std_logic;
SIGNAL \d[2]~input_o\ : std_logic;
SIGNAL \my_regs[1][2]~q\ : std_logic;
SIGNAL \my_regs[0][2]~q\ : std_logic;
SIGNAL \my_regs[2][2]~q\ : std_logic;
SIGNAL \my_regs[3][2]~q\ : std_logic;
SIGNAL \Mux13~0_combout\ : std_logic;
SIGNAL \d[3]~input_o\ : std_logic;
SIGNAL \my_regs[2][3]~feeder_combout\ : std_logic;
SIGNAL \my_regs[2][3]~q\ : std_logic;
SIGNAL \my_regs[0][3]~feeder_combout\ : std_logic;
SIGNAL \my_regs[0][3]~q\ : std_logic;
SIGNAL \my_regs[3][3]~q\ : std_logic;
SIGNAL \my_regs[1][3]~feeder_combout\ : std_logic;
SIGNAL \my_regs[1][3]~q\ : std_logic;
SIGNAL \Mux12~0_combout\ : std_logic;
SIGNAL \d[4]~input_o\ : std_logic;
SIGNAL \my_regs[0][4]~feeder_combout\ : std_logic;
SIGNAL \my_regs[0][4]~q\ : std_logic;
SIGNAL \my_regs[1][4]~q\ : std_logic;
SIGNAL \my_regs[2][4]~q\ : std_logic;
SIGNAL \my_regs[3][4]~q\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \d[5]~input_o\ : std_logic;
SIGNAL \my_regs[1][5]~q\ : std_logic;
SIGNAL \my_regs[0][5]~feeder_combout\ : std_logic;
SIGNAL \my_regs[0][5]~q\ : std_logic;
SIGNAL \my_regs[3][5]~q\ : std_logic;
SIGNAL \my_regs[2][5]~q\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \d[6]~input_o\ : std_logic;
SIGNAL \my_regs[1][6]~feeder_combout\ : std_logic;
SIGNAL \my_regs[1][6]~q\ : std_logic;
SIGNAL \my_regs[2][6]~feeder_combout\ : std_logic;
SIGNAL \my_regs[2][6]~q\ : std_logic;
SIGNAL \my_regs[3][6]~q\ : std_logic;
SIGNAL \my_regs[0][6]~q\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \d[7]~input_o\ : std_logic;
SIGNAL \my_regs[1][7]~feeder_combout\ : std_logic;
SIGNAL \my_regs[1][7]~q\ : std_logic;
SIGNAL \my_regs[2][7]~feeder_combout\ : std_logic;
SIGNAL \my_regs[2][7]~q\ : std_logic;
SIGNAL \my_regs[3][7]~q\ : std_logic;
SIGNAL \my_regs[0][7]~q\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \d[8]~input_o\ : std_logic;
SIGNAL \my_regs[1][8]~feeder_combout\ : std_logic;
SIGNAL \my_regs[1][8]~q\ : std_logic;
SIGNAL \my_regs[0][8]~feeder_combout\ : std_logic;
SIGNAL \my_regs[0][8]~q\ : std_logic;
SIGNAL \my_regs[3][8]~q\ : std_logic;
SIGNAL \my_regs[2][8]~feeder_combout\ : std_logic;
SIGNAL \my_regs[2][8]~q\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \d[9]~input_o\ : std_logic;
SIGNAL \my_regs[0][9]~q\ : std_logic;
SIGNAL \my_regs[2][9]~q\ : std_logic;
SIGNAL \my_regs[3][9]~q\ : std_logic;
SIGNAL \my_regs[1][9]~feeder_combout\ : std_logic;
SIGNAL \my_regs[1][9]~q\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \d[10]~input_o\ : std_logic;
SIGNAL \my_regs[0][10]~q\ : std_logic;
SIGNAL \my_regs[2][10]~feeder_combout\ : std_logic;
SIGNAL \my_regs[2][10]~q\ : std_logic;
SIGNAL \my_regs[1][10]~q\ : std_logic;
SIGNAL \my_regs[3][10]~q\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \d[11]~input_o\ : std_logic;
SIGNAL \my_regs[0][11]~feeder_combout\ : std_logic;
SIGNAL \my_regs[0][11]~q\ : std_logic;
SIGNAL \my_regs[2][11]~feeder_combout\ : std_logic;
SIGNAL \my_regs[2][11]~q\ : std_logic;
SIGNAL \my_regs[3][11]~q\ : std_logic;
SIGNAL \my_regs[1][11]~q\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \d[12]~input_o\ : std_logic;
SIGNAL \my_regs[0][12]~feeder_combout\ : std_logic;
SIGNAL \my_regs[0][12]~q\ : std_logic;
SIGNAL \my_regs[2][12]~feeder_combout\ : std_logic;
SIGNAL \my_regs[2][12]~q\ : std_logic;
SIGNAL \my_regs[1][12]~q\ : std_logic;
SIGNAL \my_regs[3][12]~q\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \d[13]~input_o\ : std_logic;
SIGNAL \my_regs[0][13]~q\ : std_logic;
SIGNAL \my_regs[2][13]~q\ : std_logic;
SIGNAL \my_regs[3][13]~q\ : std_logic;
SIGNAL \my_regs[1][13]~feeder_combout\ : std_logic;
SIGNAL \my_regs[1][13]~q\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \d[14]~input_o\ : std_logic;
SIGNAL \my_regs[1][14]~q\ : std_logic;
SIGNAL \my_regs[0][14]~feeder_combout\ : std_logic;
SIGNAL \my_regs[0][14]~q\ : std_logic;
SIGNAL \my_regs[2][14]~q\ : std_logic;
SIGNAL \my_regs[3][14]~q\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \d[15]~input_o\ : std_logic;
SIGNAL \my_regs[2][15]~feeder_combout\ : std_logic;
SIGNAL \my_regs[2][15]~q\ : std_logic;
SIGNAL \my_regs[0][15]~feeder_combout\ : std_logic;
SIGNAL \my_regs[0][15]~q\ : std_logic;
SIGNAL \my_regs[1][15]~feeder_combout\ : std_logic;
SIGNAL \my_regs[1][15]~q\ : std_logic;
SIGNAL \my_regs[3][15]~q\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_d[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_d[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_d[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_d[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_d[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_d[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_d[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_d[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_d[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_d[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_write_en~input_o\ : std_logic;
SIGNAL \ALT_INV_write_add[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_write_add[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_d[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_read_add[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_read_add[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_my_regs[3][15]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[2][15]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[1][15]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[0][15]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[3][14]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[2][14]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[1][14]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[0][14]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[3][13]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[2][13]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[1][13]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[0][13]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[3][12]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[2][12]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[1][12]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[0][12]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[3][11]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[2][11]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[1][11]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[0][11]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[3][10]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[2][10]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[1][10]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[0][10]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[3][9]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[2][9]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[1][9]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[0][9]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[3][8]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[2][8]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[1][8]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[0][8]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[3][7]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[2][7]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[1][7]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[0][7]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[3][6]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[2][6]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[1][6]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[0][6]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[3][5]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[2][5]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[1][5]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[0][5]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[3][4]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[2][4]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[1][4]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[0][4]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[3][3]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[2][3]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[1][3]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[0][3]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[3][2]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[2][2]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[1][2]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[0][2]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[3][1]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[2][1]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[1][1]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[0][1]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[3][0]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[2][0]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[1][0]~q\ : std_logic;
SIGNAL \ALT_INV_my_regs[0][0]~q\ : std_logic;
SIGNAL \ALT_INV_d[15]~input_o\ : std_logic;
SIGNAL \ALT_INV_d[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_d[13]~input_o\ : std_logic;

BEGIN

ww_d <= d;
ww_read_add <= read_add;
ww_write_add <= write_add;
ww_write_en <= write_en;
ww_clk <= clk;
ww_reset <= reset;
output <= ww_output;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_d[12]~input_o\ <= NOT \d[12]~input_o\;
\ALT_INV_d[11]~input_o\ <= NOT \d[11]~input_o\;
\ALT_INV_d[10]~input_o\ <= NOT \d[10]~input_o\;
\ALT_INV_d[9]~input_o\ <= NOT \d[9]~input_o\;
\ALT_INV_d[8]~input_o\ <= NOT \d[8]~input_o\;
\ALT_INV_d[7]~input_o\ <= NOT \d[7]~input_o\;
\ALT_INV_d[6]~input_o\ <= NOT \d[6]~input_o\;
\ALT_INV_d[5]~input_o\ <= NOT \d[5]~input_o\;
\ALT_INV_d[4]~input_o\ <= NOT \d[4]~input_o\;
\ALT_INV_d[3]~input_o\ <= NOT \d[3]~input_o\;
\ALT_INV_write_en~input_o\ <= NOT \write_en~input_o\;
\ALT_INV_write_add[0]~input_o\ <= NOT \write_add[0]~input_o\;
\ALT_INV_write_add[1]~input_o\ <= NOT \write_add[1]~input_o\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_d[0]~input_o\ <= NOT \d[0]~input_o\;
\ALT_INV_read_add[1]~input_o\ <= NOT \read_add[1]~input_o\;
\ALT_INV_read_add[0]~input_o\ <= NOT \read_add[0]~input_o\;
\ALT_INV_my_regs[3][15]~q\ <= NOT \my_regs[3][15]~q\;
\ALT_INV_my_regs[2][15]~q\ <= NOT \my_regs[2][15]~q\;
\ALT_INV_my_regs[1][15]~q\ <= NOT \my_regs[1][15]~q\;
\ALT_INV_my_regs[0][15]~q\ <= NOT \my_regs[0][15]~q\;
\ALT_INV_my_regs[3][14]~q\ <= NOT \my_regs[3][14]~q\;
\ALT_INV_my_regs[2][14]~q\ <= NOT \my_regs[2][14]~q\;
\ALT_INV_my_regs[1][14]~q\ <= NOT \my_regs[1][14]~q\;
\ALT_INV_my_regs[0][14]~q\ <= NOT \my_regs[0][14]~q\;
\ALT_INV_my_regs[3][13]~q\ <= NOT \my_regs[3][13]~q\;
\ALT_INV_my_regs[2][13]~q\ <= NOT \my_regs[2][13]~q\;
\ALT_INV_my_regs[1][13]~q\ <= NOT \my_regs[1][13]~q\;
\ALT_INV_my_regs[0][13]~q\ <= NOT \my_regs[0][13]~q\;
\ALT_INV_my_regs[3][12]~q\ <= NOT \my_regs[3][12]~q\;
\ALT_INV_my_regs[2][12]~q\ <= NOT \my_regs[2][12]~q\;
\ALT_INV_my_regs[1][12]~q\ <= NOT \my_regs[1][12]~q\;
\ALT_INV_my_regs[0][12]~q\ <= NOT \my_regs[0][12]~q\;
\ALT_INV_my_regs[3][11]~q\ <= NOT \my_regs[3][11]~q\;
\ALT_INV_my_regs[2][11]~q\ <= NOT \my_regs[2][11]~q\;
\ALT_INV_my_regs[1][11]~q\ <= NOT \my_regs[1][11]~q\;
\ALT_INV_my_regs[0][11]~q\ <= NOT \my_regs[0][11]~q\;
\ALT_INV_my_regs[3][10]~q\ <= NOT \my_regs[3][10]~q\;
\ALT_INV_my_regs[2][10]~q\ <= NOT \my_regs[2][10]~q\;
\ALT_INV_my_regs[1][10]~q\ <= NOT \my_regs[1][10]~q\;
\ALT_INV_my_regs[0][10]~q\ <= NOT \my_regs[0][10]~q\;
\ALT_INV_my_regs[3][9]~q\ <= NOT \my_regs[3][9]~q\;
\ALT_INV_my_regs[2][9]~q\ <= NOT \my_regs[2][9]~q\;
\ALT_INV_my_regs[1][9]~q\ <= NOT \my_regs[1][9]~q\;
\ALT_INV_my_regs[0][9]~q\ <= NOT \my_regs[0][9]~q\;
\ALT_INV_my_regs[3][8]~q\ <= NOT \my_regs[3][8]~q\;
\ALT_INV_my_regs[2][8]~q\ <= NOT \my_regs[2][8]~q\;
\ALT_INV_my_regs[1][8]~q\ <= NOT \my_regs[1][8]~q\;
\ALT_INV_my_regs[0][8]~q\ <= NOT \my_regs[0][8]~q\;
\ALT_INV_my_regs[3][7]~q\ <= NOT \my_regs[3][7]~q\;
\ALT_INV_my_regs[2][7]~q\ <= NOT \my_regs[2][7]~q\;
\ALT_INV_my_regs[1][7]~q\ <= NOT \my_regs[1][7]~q\;
\ALT_INV_my_regs[0][7]~q\ <= NOT \my_regs[0][7]~q\;
\ALT_INV_my_regs[3][6]~q\ <= NOT \my_regs[3][6]~q\;
\ALT_INV_my_regs[2][6]~q\ <= NOT \my_regs[2][6]~q\;
\ALT_INV_my_regs[1][6]~q\ <= NOT \my_regs[1][6]~q\;
\ALT_INV_my_regs[0][6]~q\ <= NOT \my_regs[0][6]~q\;
\ALT_INV_my_regs[3][5]~q\ <= NOT \my_regs[3][5]~q\;
\ALT_INV_my_regs[2][5]~q\ <= NOT \my_regs[2][5]~q\;
\ALT_INV_my_regs[1][5]~q\ <= NOT \my_regs[1][5]~q\;
\ALT_INV_my_regs[0][5]~q\ <= NOT \my_regs[0][5]~q\;
\ALT_INV_my_regs[3][4]~q\ <= NOT \my_regs[3][4]~q\;
\ALT_INV_my_regs[2][4]~q\ <= NOT \my_regs[2][4]~q\;
\ALT_INV_my_regs[1][4]~q\ <= NOT \my_regs[1][4]~q\;
\ALT_INV_my_regs[0][4]~q\ <= NOT \my_regs[0][4]~q\;
\ALT_INV_my_regs[3][3]~q\ <= NOT \my_regs[3][3]~q\;
\ALT_INV_my_regs[2][3]~q\ <= NOT \my_regs[2][3]~q\;
\ALT_INV_my_regs[1][3]~q\ <= NOT \my_regs[1][3]~q\;
\ALT_INV_my_regs[0][3]~q\ <= NOT \my_regs[0][3]~q\;
\ALT_INV_my_regs[3][2]~q\ <= NOT \my_regs[3][2]~q\;
\ALT_INV_my_regs[2][2]~q\ <= NOT \my_regs[2][2]~q\;
\ALT_INV_my_regs[1][2]~q\ <= NOT \my_regs[1][2]~q\;
\ALT_INV_my_regs[0][2]~q\ <= NOT \my_regs[0][2]~q\;
\ALT_INV_my_regs[3][1]~q\ <= NOT \my_regs[3][1]~q\;
\ALT_INV_my_regs[2][1]~q\ <= NOT \my_regs[2][1]~q\;
\ALT_INV_my_regs[1][1]~q\ <= NOT \my_regs[1][1]~q\;
\ALT_INV_my_regs[0][1]~q\ <= NOT \my_regs[0][1]~q\;
\ALT_INV_my_regs[3][0]~q\ <= NOT \my_regs[3][0]~q\;
\ALT_INV_my_regs[2][0]~q\ <= NOT \my_regs[2][0]~q\;
\ALT_INV_my_regs[1][0]~q\ <= NOT \my_regs[1][0]~q\;
\ALT_INV_my_regs[0][0]~q\ <= NOT \my_regs[0][0]~q\;
\ALT_INV_d[15]~input_o\ <= NOT \d[15]~input_o\;
\ALT_INV_d[14]~input_o\ <= NOT \d[14]~input_o\;
\ALT_INV_d[13]~input_o\ <= NOT \d[13]~input_o\;

-- Location: IOOBUF_X72_Y0_N36
\output[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~0_combout\,
	devoe => ww_devoe,
	o => ww_output(0));

-- Location: IOOBUF_X89_Y38_N39
\output[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux14~0_combout\,
	devoe => ww_devoe,
	o => ww_output(1));

-- Location: IOOBUF_X89_Y37_N22
\output[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux13~0_combout\,
	devoe => ww_devoe,
	o => ww_output(2));

-- Location: IOOBUF_X89_Y9_N5
\output[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux12~0_combout\,
	devoe => ww_devoe,
	o => ww_output(3));

-- Location: IOOBUF_X89_Y9_N22
\output[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux11~0_combout\,
	devoe => ww_devoe,
	o => ww_output(4));

-- Location: IOOBUF_X89_Y38_N22
\output[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux10~0_combout\,
	devoe => ww_devoe,
	o => ww_output(5));

-- Location: IOOBUF_X89_Y38_N56
\output[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux9~0_combout\,
	devoe => ww_devoe,
	o => ww_output(6));

-- Location: IOOBUF_X89_Y38_N5
\output[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux8~0_combout\,
	devoe => ww_devoe,
	o => ww_output(7));

-- Location: IOOBUF_X89_Y36_N39
\output[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux7~0_combout\,
	devoe => ww_devoe,
	o => ww_output(8));

-- Location: IOOBUF_X89_Y37_N56
\output[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_output(9));

-- Location: IOOBUF_X89_Y9_N39
\output[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_output(10));

-- Location: IOOBUF_X68_Y0_N53
\output[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_output(11));

-- Location: IOOBUF_X89_Y9_N56
\output[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_output(12));

-- Location: IOOBUF_X89_Y4_N79
\output[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_output(13));

-- Location: IOOBUF_X72_Y0_N19
\output[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_output(14));

-- Location: IOOBUF_X72_Y0_N2
\output[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_output(15));

-- Location: IOIBUF_X89_Y35_N61
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X89_Y36_N21
\d[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(0),
	o => \d[0]~input_o\);

-- Location: LABCELL_X88_Y21_N30
\my_regs[0][0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[0][0]~feeder_combout\ = ( \d[0]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_d[0]~input_o\,
	combout => \my_regs[0][0]~feeder_combout\);

-- Location: IOIBUF_X89_Y8_N38
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: IOIBUF_X70_Y0_N18
\write_en~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_write_en,
	o => \write_en~input_o\);

-- Location: IOIBUF_X89_Y4_N61
\write_add[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_write_add(1),
	o => \write_add[1]~input_o\);

-- Location: IOIBUF_X70_Y0_N35
\write_add[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_write_add(0),
	o => \write_add[0]~input_o\);

-- Location: MLABCELL_X87_Y20_N3
\my_regs[0][1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[0][1]~0_combout\ = ( \write_add[0]~input_o\ & ( \reset~input_o\ ) ) # ( !\write_add[0]~input_o\ & ( \reset~input_o\ ) ) # ( !\write_add[0]~input_o\ & ( !\reset~input_o\ & ( (\write_en~input_o\ & !\write_add[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_write_en~input_o\,
	datac => \ALT_INV_write_add[1]~input_o\,
	datae => \ALT_INV_write_add[0]~input_o\,
	dataf => \ALT_INV_reset~input_o\,
	combout => \my_regs[0][1]~0_combout\);

-- Location: FF_X88_Y21_N32
\my_regs[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[0][0]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[0][1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[0][0]~q\);

-- Location: LABCELL_X88_Y21_N36
\my_regs[2][0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[2][0]~feeder_combout\ = ( \d[0]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_d[0]~input_o\,
	combout => \my_regs[2][0]~feeder_combout\);

-- Location: MLABCELL_X87_Y20_N12
\my_regs[2][10]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[2][10]~2_combout\ = ( \write_add[0]~input_o\ & ( \reset~input_o\ ) ) # ( !\write_add[0]~input_o\ & ( \reset~input_o\ ) ) # ( !\write_add[0]~input_o\ & ( !\reset~input_o\ & ( (\write_add[1]~input_o\ & \write_en~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_write_add[1]~input_o\,
	datac => \ALT_INV_write_en~input_o\,
	datae => \ALT_INV_write_add[0]~input_o\,
	dataf => \ALT_INV_reset~input_o\,
	combout => \my_regs[2][10]~2_combout\);

-- Location: FF_X88_Y21_N37
\my_regs[2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[2][0]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[2][10]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[2][0]~q\);

-- Location: MLABCELL_X87_Y21_N33
\my_regs[1][0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[1][0]~feeder_combout\ = \d[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_d[0]~input_o\,
	combout => \my_regs[1][0]~feeder_combout\);

-- Location: MLABCELL_X87_Y20_N36
\my_regs[1][13]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[1][13]~1_combout\ = ( \write_add[0]~input_o\ & ( \reset~input_o\ ) ) # ( !\write_add[0]~input_o\ & ( \reset~input_o\ ) ) # ( \write_add[0]~input_o\ & ( !\reset~input_o\ & ( (!\write_add[1]~input_o\ & \write_en~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011000000110011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_write_add[1]~input_o\,
	datac => \ALT_INV_write_en~input_o\,
	datae => \ALT_INV_write_add[0]~input_o\,
	dataf => \ALT_INV_reset~input_o\,
	combout => \my_regs[1][13]~1_combout\);

-- Location: FF_X87_Y21_N35
\my_regs[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[1][0]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[1][13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[1][0]~q\);

-- Location: IOIBUF_X89_Y4_N44
\read_add[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_read_add(0),
	o => \read_add[0]~input_o\);

-- Location: MLABCELL_X87_Y20_N48
\my_regs[3][11]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[3][11]~3_combout\ = ( \write_add[0]~input_o\ & ( \reset~input_o\ ) ) # ( !\write_add[0]~input_o\ & ( \reset~input_o\ ) ) # ( \write_add[0]~input_o\ & ( !\reset~input_o\ & ( (\write_add[1]~input_o\ & \write_en~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000110000001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_write_add[1]~input_o\,
	datac => \ALT_INV_write_en~input_o\,
	datae => \ALT_INV_write_add[0]~input_o\,
	dataf => \ALT_INV_reset~input_o\,
	combout => \my_regs[3][11]~3_combout\);

-- Location: FF_X87_Y21_N8
\my_regs[3][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[0]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[3][11]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[3][0]~q\);

-- Location: IOIBUF_X89_Y4_N95
\read_add[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_read_add(1),
	o => \read_add[1]~input_o\);

-- Location: MLABCELL_X87_Y21_N6
\Mux15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux15~0_combout\ = ( \my_regs[3][0]~q\ & ( \read_add[1]~input_o\ & ( (\read_add[0]~input_o\) # (\my_regs[2][0]~q\) ) ) ) # ( !\my_regs[3][0]~q\ & ( \read_add[1]~input_o\ & ( (\my_regs[2][0]~q\ & !\read_add[0]~input_o\) ) ) ) # ( \my_regs[3][0]~q\ & ( 
-- !\read_add[1]~input_o\ & ( (!\read_add[0]~input_o\ & (\my_regs[0][0]~q\)) # (\read_add[0]~input_o\ & ((\my_regs[1][0]~q\))) ) ) ) # ( !\my_regs[3][0]~q\ & ( !\read_add[1]~input_o\ & ( (!\read_add[0]~input_o\ & (\my_regs[0][0]~q\)) # (\read_add[0]~input_o\ 
-- & ((\my_regs[1][0]~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100001111010101010000111100110011000000000011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_my_regs[0][0]~q\,
	datab => \ALT_INV_my_regs[2][0]~q\,
	datac => \ALT_INV_my_regs[1][0]~q\,
	datad => \ALT_INV_read_add[0]~input_o\,
	datae => \ALT_INV_my_regs[3][0]~q\,
	dataf => \ALT_INV_read_add[1]~input_o\,
	combout => \Mux15~0_combout\);

-- Location: IOIBUF_X89_Y6_N38
\d[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(1),
	o => \d[1]~input_o\);

-- Location: FF_X88_Y21_N13
\my_regs[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[1]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[0][1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[0][1]~q\);

-- Location: FF_X88_Y22_N1
\my_regs[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[1]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[1][13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[1][1]~q\);

-- Location: FF_X88_Y22_N14
\my_regs[3][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[1]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[3][11]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[3][1]~q\);

-- Location: FF_X88_Y22_N8
\my_regs[2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[1]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[2][10]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[2][1]~q\);

-- Location: LABCELL_X88_Y22_N12
\Mux14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux14~0_combout\ = ( \my_regs[3][1]~q\ & ( \my_regs[2][1]~q\ & ( ((!\read_add[0]~input_o\ & (\my_regs[0][1]~q\)) # (\read_add[0]~input_o\ & ((\my_regs[1][1]~q\)))) # (\read_add[1]~input_o\) ) ) ) # ( !\my_regs[3][1]~q\ & ( \my_regs[2][1]~q\ & ( 
-- (!\read_add[1]~input_o\ & ((!\read_add[0]~input_o\ & (\my_regs[0][1]~q\)) # (\read_add[0]~input_o\ & ((\my_regs[1][1]~q\))))) # (\read_add[1]~input_o\ & (((!\read_add[0]~input_o\)))) ) ) ) # ( \my_regs[3][1]~q\ & ( !\my_regs[2][1]~q\ & ( 
-- (!\read_add[1]~input_o\ & ((!\read_add[0]~input_o\ & (\my_regs[0][1]~q\)) # (\read_add[0]~input_o\ & ((\my_regs[1][1]~q\))))) # (\read_add[1]~input_o\ & (((\read_add[0]~input_o\)))) ) ) ) # ( !\my_regs[3][1]~q\ & ( !\my_regs[2][1]~q\ & ( 
-- (!\read_add[1]~input_o\ & ((!\read_add[0]~input_o\ & (\my_regs[0][1]~q\)) # (\read_add[0]~input_o\ & ((\my_regs[1][1]~q\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000001001100010000110100111101110000011111000111001101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_my_regs[0][1]~q\,
	datab => \ALT_INV_read_add[1]~input_o\,
	datac => \ALT_INV_read_add[0]~input_o\,
	datad => \ALT_INV_my_regs[1][1]~q\,
	datae => \ALT_INV_my_regs[3][1]~q\,
	dataf => \ALT_INV_my_regs[2][1]~q\,
	combout => \Mux14~0_combout\);

-- Location: IOIBUF_X72_Y0_N52
\d[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(2),
	o => \d[2]~input_o\);

-- Location: FF_X87_Y21_N34
\my_regs[1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[2]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[1][13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[1][2]~q\);

-- Location: FF_X88_Y21_N35
\my_regs[0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[2]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[0][1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[0][2]~q\);

-- Location: FF_X88_Y21_N40
\my_regs[2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[2]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[2][10]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[2][2]~q\);

-- Location: FF_X88_Y21_N50
\my_regs[3][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[2]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[3][11]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[3][2]~q\);

-- Location: LABCELL_X88_Y21_N48
\Mux13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux13~0_combout\ = ( \my_regs[3][2]~q\ & ( \read_add[1]~input_o\ & ( (\my_regs[2][2]~q\) # (\read_add[0]~input_o\) ) ) ) # ( !\my_regs[3][2]~q\ & ( \read_add[1]~input_o\ & ( (!\read_add[0]~input_o\ & \my_regs[2][2]~q\) ) ) ) # ( \my_regs[3][2]~q\ & ( 
-- !\read_add[1]~input_o\ & ( (!\read_add[0]~input_o\ & ((\my_regs[0][2]~q\))) # (\read_add[0]~input_o\ & (\my_regs[1][2]~q\)) ) ) ) # ( !\my_regs[3][2]~q\ & ( !\read_add[1]~input_o\ & ( (!\read_add[0]~input_o\ & ((\my_regs[0][2]~q\))) # 
-- (\read_add[0]~input_o\ & (\my_regs[1][2]~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100000000101010100101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_read_add[0]~input_o\,
	datab => \ALT_INV_my_regs[1][2]~q\,
	datac => \ALT_INV_my_regs[0][2]~q\,
	datad => \ALT_INV_my_regs[2][2]~q\,
	datae => \ALT_INV_my_regs[3][2]~q\,
	dataf => \ALT_INV_read_add[1]~input_o\,
	combout => \Mux13~0_combout\);

-- Location: IOIBUF_X89_Y6_N55
\d[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(3),
	o => \d[3]~input_o\);

-- Location: LABCELL_X88_Y21_N54
\my_regs[2][3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[2][3]~feeder_combout\ = \d[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_d[3]~input_o\,
	combout => \my_regs[2][3]~feeder_combout\);

-- Location: FF_X88_Y21_N56
\my_regs[2][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[2][3]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[2][10]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[2][3]~q\);

-- Location: LABCELL_X88_Y21_N12
\my_regs[0][3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[0][3]~feeder_combout\ = \d[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_d[3]~input_o\,
	combout => \my_regs[0][3]~feeder_combout\);

-- Location: FF_X88_Y21_N14
\my_regs[0][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[0][3]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[0][1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[0][3]~q\);

-- Location: FF_X88_Y21_N2
\my_regs[3][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[3]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[3][11]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[3][3]~q\);

-- Location: LABCELL_X88_Y22_N3
\my_regs[1][3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[1][3]~feeder_combout\ = \d[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_d[3]~input_o\,
	combout => \my_regs[1][3]~feeder_combout\);

-- Location: FF_X88_Y22_N4
\my_regs[1][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[1][3]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[1][13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[1][3]~q\);

-- Location: LABCELL_X88_Y21_N0
\Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux12~0_combout\ = ( \my_regs[3][3]~q\ & ( \my_regs[1][3]~q\ & ( ((!\read_add[1]~input_o\ & ((\my_regs[0][3]~q\))) # (\read_add[1]~input_o\ & (\my_regs[2][3]~q\))) # (\read_add[0]~input_o\) ) ) ) # ( !\my_regs[3][3]~q\ & ( \my_regs[1][3]~q\ & ( 
-- (!\read_add[0]~input_o\ & ((!\read_add[1]~input_o\ & ((\my_regs[0][3]~q\))) # (\read_add[1]~input_o\ & (\my_regs[2][3]~q\)))) # (\read_add[0]~input_o\ & (((!\read_add[1]~input_o\)))) ) ) ) # ( \my_regs[3][3]~q\ & ( !\my_regs[1][3]~q\ & ( 
-- (!\read_add[0]~input_o\ & ((!\read_add[1]~input_o\ & ((\my_regs[0][3]~q\))) # (\read_add[1]~input_o\ & (\my_regs[2][3]~q\)))) # (\read_add[0]~input_o\ & (((\read_add[1]~input_o\)))) ) ) ) # ( !\my_regs[3][3]~q\ & ( !\my_regs[1][3]~q\ & ( 
-- (!\read_add[0]~input_o\ & ((!\read_add[1]~input_o\ & ((\my_regs[0][3]~q\))) # (\read_add[1]~input_o\ & (\my_regs[2][3]~q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000001010000001100000101111100111111010100000011111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_my_regs[2][3]~q\,
	datab => \ALT_INV_my_regs[0][3]~q\,
	datac => \ALT_INV_read_add[0]~input_o\,
	datad => \ALT_INV_read_add[1]~input_o\,
	datae => \ALT_INV_my_regs[3][3]~q\,
	dataf => \ALT_INV_my_regs[1][3]~q\,
	combout => \Mux12~0_combout\);

-- Location: IOIBUF_X89_Y6_N4
\d[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(4),
	o => \d[4]~input_o\);

-- Location: LABCELL_X88_Y21_N15
\my_regs[0][4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[0][4]~feeder_combout\ = ( \d[4]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_d[4]~input_o\,
	combout => \my_regs[0][4]~feeder_combout\);

-- Location: FF_X88_Y21_N17
\my_regs[0][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[0][4]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[0][1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[0][4]~q\);

-- Location: FF_X87_Y21_N31
\my_regs[1][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[4]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[1][13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[1][4]~q\);

-- Location: FF_X88_Y21_N59
\my_regs[2][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[4]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[2][10]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[2][4]~q\);

-- Location: FF_X88_Y21_N8
\my_regs[3][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[4]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[3][11]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[3][4]~q\);

-- Location: LABCELL_X88_Y21_N6
\Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = ( \my_regs[3][4]~q\ & ( \read_add[1]~input_o\ & ( (\my_regs[2][4]~q\) # (\read_add[0]~input_o\) ) ) ) # ( !\my_regs[3][4]~q\ & ( \read_add[1]~input_o\ & ( (!\read_add[0]~input_o\ & \my_regs[2][4]~q\) ) ) ) # ( \my_regs[3][4]~q\ & ( 
-- !\read_add[1]~input_o\ & ( (!\read_add[0]~input_o\ & (\my_regs[0][4]~q\)) # (\read_add[0]~input_o\ & ((\my_regs[1][4]~q\))) ) ) ) # ( !\my_regs[3][4]~q\ & ( !\read_add[1]~input_o\ & ( (!\read_add[0]~input_o\ & (\my_regs[0][4]~q\)) # (\read_add[0]~input_o\ 
-- & ((\my_regs[1][4]~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010011100100111001001110010011100000000101010100101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_read_add[0]~input_o\,
	datab => \ALT_INV_my_regs[0][4]~q\,
	datac => \ALT_INV_my_regs[1][4]~q\,
	datad => \ALT_INV_my_regs[2][4]~q\,
	datae => \ALT_INV_my_regs[3][4]~q\,
	dataf => \ALT_INV_read_add[1]~input_o\,
	combout => \Mux11~0_combout\);

-- Location: IOIBUF_X89_Y37_N38
\d[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(5),
	o => \d[5]~input_o\);

-- Location: FF_X88_Y22_N5
\my_regs[1][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[5]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[1][13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[1][5]~q\);

-- Location: MLABCELL_X87_Y21_N12
\my_regs[0][5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[0][5]~feeder_combout\ = ( \d[5]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_d[5]~input_o\,
	combout => \my_regs[0][5]~feeder_combout\);

-- Location: FF_X87_Y21_N13
\my_regs[0][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[0][5]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[0][1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[0][5]~q\);

-- Location: FF_X88_Y22_N20
\my_regs[3][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[5]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[3][11]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[3][5]~q\);

-- Location: FF_X88_Y22_N11
\my_regs[2][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[5]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[2][10]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[2][5]~q\);

-- Location: LABCELL_X88_Y22_N18
\Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = ( \my_regs[3][5]~q\ & ( \my_regs[2][5]~q\ & ( ((!\read_add[0]~input_o\ & ((\my_regs[0][5]~q\))) # (\read_add[0]~input_o\ & (\my_regs[1][5]~q\))) # (\read_add[1]~input_o\) ) ) ) # ( !\my_regs[3][5]~q\ & ( \my_regs[2][5]~q\ & ( 
-- (!\read_add[1]~input_o\ & ((!\read_add[0]~input_o\ & ((\my_regs[0][5]~q\))) # (\read_add[0]~input_o\ & (\my_regs[1][5]~q\)))) # (\read_add[1]~input_o\ & (((!\read_add[0]~input_o\)))) ) ) ) # ( \my_regs[3][5]~q\ & ( !\my_regs[2][5]~q\ & ( 
-- (!\read_add[1]~input_o\ & ((!\read_add[0]~input_o\ & ((\my_regs[0][5]~q\))) # (\read_add[0]~input_o\ & (\my_regs[1][5]~q\)))) # (\read_add[1]~input_o\ & (((\read_add[0]~input_o\)))) ) ) ) # ( !\my_regs[3][5]~q\ & ( !\my_regs[2][5]~q\ & ( 
-- (!\read_add[1]~input_o\ & ((!\read_add[0]~input_o\ & ((\my_regs[0][5]~q\))) # (\read_add[0]~input_o\ & (\my_regs[1][5]~q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110001000100000011000111011100111111010001000011111101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_my_regs[1][5]~q\,
	datab => \ALT_INV_read_add[1]~input_o\,
	datac => \ALT_INV_my_regs[0][5]~q\,
	datad => \ALT_INV_read_add[0]~input_o\,
	datae => \ALT_INV_my_regs[3][5]~q\,
	dataf => \ALT_INV_my_regs[2][5]~q\,
	combout => \Mux10~0_combout\);

-- Location: IOIBUF_X89_Y6_N21
\d[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(6),
	o => \d[6]~input_o\);

-- Location: LABCELL_X88_Y22_N24
\my_regs[1][6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[1][6]~feeder_combout\ = \d[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_d[6]~input_o\,
	combout => \my_regs[1][6]~feeder_combout\);

-- Location: FF_X88_Y22_N26
\my_regs[1][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[1][6]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[1][13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[1][6]~q\);

-- Location: LABCELL_X88_Y22_N30
\my_regs[2][6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[2][6]~feeder_combout\ = ( \d[6]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_d[6]~input_o\,
	combout => \my_regs[2][6]~feeder_combout\);

-- Location: FF_X88_Y22_N32
\my_regs[2][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[2][6]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[2][10]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[2][6]~q\);

-- Location: FF_X88_Y22_N38
\my_regs[3][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[6]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[3][11]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[3][6]~q\);

-- Location: FF_X88_Y21_N46
\my_regs[0][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[6]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[0][1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[0][6]~q\);

-- Location: LABCELL_X88_Y22_N36
\Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = ( \my_regs[3][6]~q\ & ( \my_regs[0][6]~q\ & ( (!\read_add[0]~input_o\ & (((!\read_add[1]~input_o\) # (\my_regs[2][6]~q\)))) # (\read_add[0]~input_o\ & (((\read_add[1]~input_o\)) # (\my_regs[1][6]~q\))) ) ) ) # ( !\my_regs[3][6]~q\ & ( 
-- \my_regs[0][6]~q\ & ( (!\read_add[0]~input_o\ & (((!\read_add[1]~input_o\) # (\my_regs[2][6]~q\)))) # (\read_add[0]~input_o\ & (\my_regs[1][6]~q\ & ((!\read_add[1]~input_o\)))) ) ) ) # ( \my_regs[3][6]~q\ & ( !\my_regs[0][6]~q\ & ( (!\read_add[0]~input_o\ 
-- & (((\my_regs[2][6]~q\ & \read_add[1]~input_o\)))) # (\read_add[0]~input_o\ & (((\read_add[1]~input_o\)) # (\my_regs[1][6]~q\))) ) ) ) # ( !\my_regs[3][6]~q\ & ( !\my_regs[0][6]~q\ & ( (!\read_add[0]~input_o\ & (((\my_regs[2][6]~q\ & 
-- \read_add[1]~input_o\)))) # (\read_add[0]~input_o\ & (\my_regs[1][6]~q\ & ((!\read_add[1]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110000000001010011111111110101001100001111010100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_my_regs[1][6]~q\,
	datab => \ALT_INV_my_regs[2][6]~q\,
	datac => \ALT_INV_read_add[0]~input_o\,
	datad => \ALT_INV_read_add[1]~input_o\,
	datae => \ALT_INV_my_regs[3][6]~q\,
	dataf => \ALT_INV_my_regs[0][6]~q\,
	combout => \Mux9~0_combout\);

-- Location: IOIBUF_X89_Y36_N55
\d[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(7),
	o => \d[7]~input_o\);

-- Location: LABCELL_X88_Y22_N27
\my_regs[1][7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[1][7]~feeder_combout\ = ( \d[7]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_d[7]~input_o\,
	combout => \my_regs[1][7]~feeder_combout\);

-- Location: FF_X88_Y22_N29
\my_regs[1][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[1][7]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[1][13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[1][7]~q\);

-- Location: LABCELL_X88_Y22_N33
\my_regs[2][7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[2][7]~feeder_combout\ = ( \d[7]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_d[7]~input_o\,
	combout => \my_regs[2][7]~feeder_combout\);

-- Location: FF_X88_Y22_N34
\my_regs[2][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[2][7]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[2][10]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[2][7]~q\);

-- Location: FF_X88_Y22_N44
\my_regs[3][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[7]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[3][11]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[3][7]~q\);

-- Location: FF_X88_Y21_N16
\my_regs[0][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[7]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[0][1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[0][7]~q\);

-- Location: LABCELL_X88_Y22_N42
\Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = ( \my_regs[3][7]~q\ & ( \my_regs[0][7]~q\ & ( (!\read_add[0]~input_o\ & ((!\read_add[1]~input_o\) # ((\my_regs[2][7]~q\)))) # (\read_add[0]~input_o\ & (((\my_regs[1][7]~q\)) # (\read_add[1]~input_o\))) ) ) ) # ( !\my_regs[3][7]~q\ & ( 
-- \my_regs[0][7]~q\ & ( (!\read_add[0]~input_o\ & ((!\read_add[1]~input_o\) # ((\my_regs[2][7]~q\)))) # (\read_add[0]~input_o\ & (!\read_add[1]~input_o\ & (\my_regs[1][7]~q\))) ) ) ) # ( \my_regs[3][7]~q\ & ( !\my_regs[0][7]~q\ & ( (!\read_add[0]~input_o\ & 
-- (\read_add[1]~input_o\ & ((\my_regs[2][7]~q\)))) # (\read_add[0]~input_o\ & (((\my_regs[1][7]~q\)) # (\read_add[1]~input_o\))) ) ) ) # ( !\my_regs[3][7]~q\ & ( !\my_regs[0][7]~q\ & ( (!\read_add[0]~input_o\ & (\read_add[1]~input_o\ & 
-- ((\my_regs[2][7]~q\)))) # (\read_add[0]~input_o\ & (!\read_add[1]~input_o\ & (\my_regs[1][7]~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000100110000101010011011110001100101011101001110110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_read_add[0]~input_o\,
	datab => \ALT_INV_read_add[1]~input_o\,
	datac => \ALT_INV_my_regs[1][7]~q\,
	datad => \ALT_INV_my_regs[2][7]~q\,
	datae => \ALT_INV_my_regs[3][7]~q\,
	dataf => \ALT_INV_my_regs[0][7]~q\,
	combout => \Mux8~0_combout\);

-- Location: IOIBUF_X89_Y8_N55
\d[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(8),
	o => \d[8]~input_o\);

-- Location: LABCELL_X88_Y22_N0
\my_regs[1][8]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[1][8]~feeder_combout\ = \d[8]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_d[8]~input_o\,
	combout => \my_regs[1][8]~feeder_combout\);

-- Location: FF_X88_Y22_N2
\my_regs[1][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[1][8]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[1][13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[1][8]~q\);

-- Location: LABCELL_X88_Y21_N33
\my_regs[0][8]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[0][8]~feeder_combout\ = \d[8]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_d[8]~input_o\,
	combout => \my_regs[0][8]~feeder_combout\);

-- Location: FF_X88_Y21_N34
\my_regs[0][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[0][8]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[0][1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[0][8]~q\);

-- Location: FF_X88_Y22_N56
\my_regs[3][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[8]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[3][11]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[3][8]~q\);

-- Location: LABCELL_X88_Y22_N48
\my_regs[2][8]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[2][8]~feeder_combout\ = \d[8]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_d[8]~input_o\,
	combout => \my_regs[2][8]~feeder_combout\);

-- Location: FF_X88_Y22_N50
\my_regs[2][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[2][8]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[2][10]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[2][8]~q\);

-- Location: LABCELL_X88_Y22_N54
\Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = ( \my_regs[3][8]~q\ & ( \my_regs[2][8]~q\ & ( ((!\read_add[0]~input_o\ & ((\my_regs[0][8]~q\))) # (\read_add[0]~input_o\ & (\my_regs[1][8]~q\))) # (\read_add[1]~input_o\) ) ) ) # ( !\my_regs[3][8]~q\ & ( \my_regs[2][8]~q\ & ( 
-- (!\read_add[0]~input_o\ & (((\my_regs[0][8]~q\)) # (\read_add[1]~input_o\))) # (\read_add[0]~input_o\ & (!\read_add[1]~input_o\ & (\my_regs[1][8]~q\))) ) ) ) # ( \my_regs[3][8]~q\ & ( !\my_regs[2][8]~q\ & ( (!\read_add[0]~input_o\ & 
-- (!\read_add[1]~input_o\ & ((\my_regs[0][8]~q\)))) # (\read_add[0]~input_o\ & (((\my_regs[1][8]~q\)) # (\read_add[1]~input_o\))) ) ) ) # ( !\my_regs[3][8]~q\ & ( !\my_regs[2][8]~q\ & ( (!\read_add[1]~input_o\ & ((!\read_add[0]~input_o\ & 
-- ((\my_regs[0][8]~q\))) # (\read_add[0]~input_o\ & (\my_regs[1][8]~q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010010001100000101011001110100100110101011100011011110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_read_add[0]~input_o\,
	datab => \ALT_INV_read_add[1]~input_o\,
	datac => \ALT_INV_my_regs[1][8]~q\,
	datad => \ALT_INV_my_regs[0][8]~q\,
	datae => \ALT_INV_my_regs[3][8]~q\,
	dataf => \ALT_INV_my_regs[2][8]~q\,
	combout => \Mux7~0_combout\);

-- Location: IOIBUF_X89_Y36_N4
\d[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(9),
	o => \d[9]~input_o\);

-- Location: FF_X88_Y21_N43
\my_regs[0][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[9]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[0][1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[0][9]~q\);

-- Location: FF_X88_Y21_N38
\my_regs[2][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[9]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[2][10]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[2][9]~q\);

-- Location: FF_X88_Y21_N20
\my_regs[3][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[9]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[3][11]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[3][9]~q\);

-- Location: MLABCELL_X87_Y21_N51
\my_regs[1][9]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[1][9]~feeder_combout\ = ( \d[9]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_d[9]~input_o\,
	combout => \my_regs[1][9]~feeder_combout\);

-- Location: FF_X87_Y21_N52
\my_regs[1][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[1][9]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[1][13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[1][9]~q\);

-- Location: LABCELL_X88_Y21_N18
\Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = ( \my_regs[3][9]~q\ & ( \my_regs[1][9]~q\ & ( ((!\read_add[1]~input_o\ & (\my_regs[0][9]~q\)) # (\read_add[1]~input_o\ & ((\my_regs[2][9]~q\)))) # (\read_add[0]~input_o\) ) ) ) # ( !\my_regs[3][9]~q\ & ( \my_regs[1][9]~q\ & ( 
-- (!\read_add[0]~input_o\ & ((!\read_add[1]~input_o\ & (\my_regs[0][9]~q\)) # (\read_add[1]~input_o\ & ((\my_regs[2][9]~q\))))) # (\read_add[0]~input_o\ & (((!\read_add[1]~input_o\)))) ) ) ) # ( \my_regs[3][9]~q\ & ( !\my_regs[1][9]~q\ & ( 
-- (!\read_add[0]~input_o\ & ((!\read_add[1]~input_o\ & (\my_regs[0][9]~q\)) # (\read_add[1]~input_o\ & ((\my_regs[2][9]~q\))))) # (\read_add[0]~input_o\ & (((\read_add[1]~input_o\)))) ) ) ) # ( !\my_regs[3][9]~q\ & ( !\my_regs[1][9]~q\ & ( 
-- (!\read_add[0]~input_o\ & ((!\read_add[1]~input_o\ & (\my_regs[0][9]~q\)) # (\read_add[1]~input_o\ & ((\my_regs[2][9]~q\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000001010001000100101111101110111000010100111011101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_read_add[0]~input_o\,
	datab => \ALT_INV_my_regs[0][9]~q\,
	datac => \ALT_INV_my_regs[2][9]~q\,
	datad => \ALT_INV_read_add[1]~input_o\,
	datae => \ALT_INV_my_regs[3][9]~q\,
	dataf => \ALT_INV_my_regs[1][9]~q\,
	combout => \Mux6~0_combout\);

-- Location: IOIBUF_X89_Y35_N44
\d[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(10),
	o => \d[10]~input_o\);

-- Location: FF_X87_Y21_N14
\my_regs[0][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[10]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[0][1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[0][10]~q\);

-- Location: LABCELL_X88_Y22_N51
\my_regs[2][10]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[2][10]~feeder_combout\ = ( \d[10]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_d[10]~input_o\,
	combout => \my_regs[2][10]~feeder_combout\);

-- Location: FF_X88_Y22_N53
\my_regs[2][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[2][10]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[2][10]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[2][10]~q\);

-- Location: FF_X87_Y21_N49
\my_regs[1][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[10]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[1][13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[1][10]~q\);

-- Location: FF_X87_Y21_N56
\my_regs[3][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[10]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[3][11]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[3][10]~q\);

-- Location: MLABCELL_X87_Y21_N54
\Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = ( \my_regs[3][10]~q\ & ( \read_add[1]~input_o\ & ( (\my_regs[2][10]~q\) # (\read_add[0]~input_o\) ) ) ) # ( !\my_regs[3][10]~q\ & ( \read_add[1]~input_o\ & ( (!\read_add[0]~input_o\ & \my_regs[2][10]~q\) ) ) ) # ( \my_regs[3][10]~q\ & ( 
-- !\read_add[1]~input_o\ & ( (!\read_add[0]~input_o\ & (\my_regs[0][10]~q\)) # (\read_add[0]~input_o\ & ((\my_regs[1][10]~q\))) ) ) ) # ( !\my_regs[3][10]~q\ & ( !\read_add[1]~input_o\ & ( (!\read_add[0]~input_o\ & (\my_regs[0][10]~q\)) # 
-- (\read_add[0]~input_o\ & ((\my_regs[1][10]~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001110111010001000111011100001100000011000011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_my_regs[0][10]~q\,
	datab => \ALT_INV_read_add[0]~input_o\,
	datac => \ALT_INV_my_regs[2][10]~q\,
	datad => \ALT_INV_my_regs[1][10]~q\,
	datae => \ALT_INV_my_regs[3][10]~q\,
	dataf => \ALT_INV_read_add[1]~input_o\,
	combout => \Mux5~0_combout\);

-- Location: IOIBUF_X89_Y8_N21
\d[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(11),
	o => \d[11]~input_o\);

-- Location: LABCELL_X88_Y21_N45
\my_regs[0][11]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[0][11]~feeder_combout\ = \d[11]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_d[11]~input_o\,
	combout => \my_regs[0][11]~feeder_combout\);

-- Location: FF_X88_Y21_N47
\my_regs[0][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[0][11]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[0][1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[0][11]~q\);

-- Location: LABCELL_X88_Y21_N39
\my_regs[2][11]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[2][11]~feeder_combout\ = \d[11]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_d[11]~input_o\,
	combout => \my_regs[2][11]~feeder_combout\);

-- Location: FF_X88_Y21_N41
\my_regs[2][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[2][11]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[2][10]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[2][11]~q\);

-- Location: FF_X87_Y21_N2
\my_regs[3][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[11]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[3][11]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[3][11]~q\);

-- Location: FF_X87_Y21_N53
\my_regs[1][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[11]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[1][13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[1][11]~q\);

-- Location: MLABCELL_X87_Y21_N0
\Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = ( \my_regs[3][11]~q\ & ( \my_regs[1][11]~q\ & ( ((!\read_add[1]~input_o\ & (\my_regs[0][11]~q\)) # (\read_add[1]~input_o\ & ((\my_regs[2][11]~q\)))) # (\read_add[0]~input_o\) ) ) ) # ( !\my_regs[3][11]~q\ & ( \my_regs[1][11]~q\ & ( 
-- (!\read_add[0]~input_o\ & ((!\read_add[1]~input_o\ & (\my_regs[0][11]~q\)) # (\read_add[1]~input_o\ & ((\my_regs[2][11]~q\))))) # (\read_add[0]~input_o\ & (((!\read_add[1]~input_o\)))) ) ) ) # ( \my_regs[3][11]~q\ & ( !\my_regs[1][11]~q\ & ( 
-- (!\read_add[0]~input_o\ & ((!\read_add[1]~input_o\ & (\my_regs[0][11]~q\)) # (\read_add[1]~input_o\ & ((\my_regs[2][11]~q\))))) # (\read_add[0]~input_o\ & (((\read_add[1]~input_o\)))) ) ) ) # ( !\my_regs[3][11]~q\ & ( !\my_regs[1][11]~q\ & ( 
-- (!\read_add[0]~input_o\ & ((!\read_add[1]~input_o\ & (\my_regs[0][11]~q\)) # (\read_add[1]~input_o\ & ((\my_regs[2][11]~q\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010000001100010001000011111101110111000011000111011100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_my_regs[0][11]~q\,
	datab => \ALT_INV_read_add[0]~input_o\,
	datac => \ALT_INV_my_regs[2][11]~q\,
	datad => \ALT_INV_read_add[1]~input_o\,
	datae => \ALT_INV_my_regs[3][11]~q\,
	dataf => \ALT_INV_my_regs[1][11]~q\,
	combout => \Mux4~0_combout\);

-- Location: IOIBUF_X89_Y35_N78
\d[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(12),
	o => \d[12]~input_o\);

-- Location: MLABCELL_X87_Y21_N15
\my_regs[0][12]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[0][12]~feeder_combout\ = ( \d[12]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_d[12]~input_o\,
	combout => \my_regs[0][12]~feeder_combout\);

-- Location: FF_X87_Y21_N17
\my_regs[0][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[0][12]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[0][1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[0][12]~q\);

-- Location: LABCELL_X88_Y22_N6
\my_regs[2][12]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[2][12]~feeder_combout\ = \d[12]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_d[12]~input_o\,
	combout => \my_regs[2][12]~feeder_combout\);

-- Location: FF_X88_Y22_N7
\my_regs[2][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[2][12]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[2][10]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[2][12]~q\);

-- Location: FF_X88_Y22_N25
\my_regs[1][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[12]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[1][13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[1][12]~q\);

-- Location: FF_X87_Y21_N38
\my_regs[3][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[12]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[3][11]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[3][12]~q\);

-- Location: MLABCELL_X87_Y21_N36
\Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = ( \my_regs[3][12]~q\ & ( \read_add[1]~input_o\ & ( (\my_regs[2][12]~q\) # (\read_add[0]~input_o\) ) ) ) # ( !\my_regs[3][12]~q\ & ( \read_add[1]~input_o\ & ( (!\read_add[0]~input_o\ & \my_regs[2][12]~q\) ) ) ) # ( \my_regs[3][12]~q\ & ( 
-- !\read_add[1]~input_o\ & ( (!\read_add[0]~input_o\ & (\my_regs[0][12]~q\)) # (\read_add[0]~input_o\ & ((\my_regs[1][12]~q\))) ) ) ) # ( !\my_regs[3][12]~q\ & ( !\read_add[1]~input_o\ & ( (!\read_add[0]~input_o\ & (\my_regs[0][12]~q\)) # 
-- (\read_add[0]~input_o\ & ((\my_regs[1][12]~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001001110111001000100111011100001010000010100101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_read_add[0]~input_o\,
	datab => \ALT_INV_my_regs[0][12]~q\,
	datac => \ALT_INV_my_regs[2][12]~q\,
	datad => \ALT_INV_my_regs[1][12]~q\,
	datae => \ALT_INV_my_regs[3][12]~q\,
	dataf => \ALT_INV_read_add[1]~input_o\,
	combout => \Mux3~0_combout\);

-- Location: IOIBUF_X89_Y8_N4
\d[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(13),
	o => \d[13]~input_o\);

-- Location: FF_X88_Y21_N31
\my_regs[0][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[13]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[0][1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[0][13]~q\);

-- Location: FF_X88_Y21_N55
\my_regs[2][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[13]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[2][10]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[2][13]~q\);

-- Location: FF_X88_Y21_N26
\my_regs[3][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[13]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[3][11]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[3][13]~q\);

-- Location: MLABCELL_X87_Y21_N30
\my_regs[1][13]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[1][13]~feeder_combout\ = \d[13]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_d[13]~input_o\,
	combout => \my_regs[1][13]~feeder_combout\);

-- Location: FF_X87_Y21_N32
\my_regs[1][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[1][13]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[1][13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[1][13]~q\);

-- Location: LABCELL_X88_Y21_N24
\Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = ( \my_regs[3][13]~q\ & ( \my_regs[1][13]~q\ & ( ((!\read_add[1]~input_o\ & (\my_regs[0][13]~q\)) # (\read_add[1]~input_o\ & ((\my_regs[2][13]~q\)))) # (\read_add[0]~input_o\) ) ) ) # ( !\my_regs[3][13]~q\ & ( \my_regs[1][13]~q\ & ( 
-- (!\read_add[0]~input_o\ & ((!\read_add[1]~input_o\ & (\my_regs[0][13]~q\)) # (\read_add[1]~input_o\ & ((\my_regs[2][13]~q\))))) # (\read_add[0]~input_o\ & (((!\read_add[1]~input_o\)))) ) ) ) # ( \my_regs[3][13]~q\ & ( !\my_regs[1][13]~q\ & ( 
-- (!\read_add[0]~input_o\ & ((!\read_add[1]~input_o\ & (\my_regs[0][13]~q\)) # (\read_add[1]~input_o\ & ((\my_regs[2][13]~q\))))) # (\read_add[0]~input_o\ & (((\read_add[1]~input_o\)))) ) ) ) # ( !\my_regs[3][13]~q\ & ( !\my_regs[1][13]~q\ & ( 
-- (!\read_add[0]~input_o\ & ((!\read_add[1]~input_o\ & (\my_regs[0][13]~q\)) # (\read_add[1]~input_o\ & ((\my_regs[2][13]~q\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000000110000010100000011111101011111001100000101111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_my_regs[0][13]~q\,
	datab => \ALT_INV_my_regs[2][13]~q\,
	datac => \ALT_INV_read_add[0]~input_o\,
	datad => \ALT_INV_read_add[1]~input_o\,
	datae => \ALT_INV_my_regs[3][13]~q\,
	dataf => \ALT_INV_my_regs[1][13]~q\,
	combout => \Mux2~0_combout\);

-- Location: IOIBUF_X89_Y37_N4
\d[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(14),
	o => \d[14]~input_o\);

-- Location: FF_X88_Y22_N28
\my_regs[1][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[14]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[1][13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[1][14]~q\);

-- Location: MLABCELL_X87_Y21_N42
\my_regs[0][14]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[0][14]~feeder_combout\ = ( \d[14]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_d[14]~input_o\,
	combout => \my_regs[0][14]~feeder_combout\);

-- Location: FF_X87_Y21_N43
\my_regs[0][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[0][14]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[0][1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[0][14]~q\);

-- Location: FF_X88_Y22_N49
\my_regs[2][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[14]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[2][10]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[2][14]~q\);

-- Location: FF_X87_Y21_N20
\my_regs[3][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[14]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[3][11]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[3][14]~q\);

-- Location: MLABCELL_X87_Y21_N18
\Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = ( \my_regs[3][14]~q\ & ( \read_add[1]~input_o\ & ( (\my_regs[2][14]~q\) # (\read_add[0]~input_o\) ) ) ) # ( !\my_regs[3][14]~q\ & ( \read_add[1]~input_o\ & ( (!\read_add[0]~input_o\ & \my_regs[2][14]~q\) ) ) ) # ( \my_regs[3][14]~q\ & ( 
-- !\read_add[1]~input_o\ & ( (!\read_add[0]~input_o\ & ((\my_regs[0][14]~q\))) # (\read_add[0]~input_o\ & (\my_regs[1][14]~q\)) ) ) ) # ( !\my_regs[3][14]~q\ & ( !\read_add[1]~input_o\ & ( (!\read_add[0]~input_o\ & ((\my_regs[0][14]~q\))) # 
-- (\read_add[0]~input_o\ & (\my_regs[1][14]~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100000000101010100101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_read_add[0]~input_o\,
	datab => \ALT_INV_my_regs[1][14]~q\,
	datac => \ALT_INV_my_regs[0][14]~q\,
	datad => \ALT_INV_my_regs[2][14]~q\,
	datae => \ALT_INV_my_regs[3][14]~q\,
	dataf => \ALT_INV_read_add[1]~input_o\,
	combout => \Mux1~0_combout\);

-- Location: IOIBUF_X89_Y35_N95
\d[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(15),
	o => \d[15]~input_o\);

-- Location: LABCELL_X88_Y21_N57
\my_regs[2][15]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[2][15]~feeder_combout\ = \d[15]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_d[15]~input_o\,
	combout => \my_regs[2][15]~feeder_combout\);

-- Location: FF_X88_Y21_N58
\my_regs[2][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[2][15]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[2][10]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[2][15]~q\);

-- Location: LABCELL_X88_Y21_N42
\my_regs[0][15]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[0][15]~feeder_combout\ = ( \d[15]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_d[15]~input_o\,
	combout => \my_regs[0][15]~feeder_combout\);

-- Location: FF_X88_Y21_N44
\my_regs[0][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[0][15]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[0][1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[0][15]~q\);

-- Location: MLABCELL_X87_Y21_N48
\my_regs[1][15]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \my_regs[1][15]~feeder_combout\ = ( \d[15]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_d[15]~input_o\,
	combout => \my_regs[1][15]~feeder_combout\);

-- Location: FF_X87_Y21_N50
\my_regs[1][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \my_regs[1][15]~feeder_combout\,
	sclr => \reset~input_o\,
	ena => \my_regs[1][13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[1][15]~q\);

-- Location: FF_X87_Y21_N26
\my_regs[3][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[15]~input_o\,
	sclr => \reset~input_o\,
	sload => VCC,
	ena => \my_regs[3][11]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_regs[3][15]~q\);

-- Location: MLABCELL_X87_Y21_N24
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ( \my_regs[3][15]~q\ & ( \read_add[1]~input_o\ & ( (\read_add[0]~input_o\) # (\my_regs[2][15]~q\) ) ) ) # ( !\my_regs[3][15]~q\ & ( \read_add[1]~input_o\ & ( (\my_regs[2][15]~q\ & !\read_add[0]~input_o\) ) ) ) # ( \my_regs[3][15]~q\ & ( 
-- !\read_add[1]~input_o\ & ( (!\read_add[0]~input_o\ & (\my_regs[0][15]~q\)) # (\read_add[0]~input_o\ & ((\my_regs[1][15]~q\))) ) ) ) # ( !\my_regs[3][15]~q\ & ( !\read_add[1]~input_o\ & ( (!\read_add[0]~input_o\ & (\my_regs[0][15]~q\)) # 
-- (\read_add[0]~input_o\ & ((\my_regs[1][15]~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100001111001100110000111101010101000000000101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_my_regs[2][15]~q\,
	datab => \ALT_INV_my_regs[0][15]~q\,
	datac => \ALT_INV_my_regs[1][15]~q\,
	datad => \ALT_INV_read_add[0]~input_o\,
	datae => \ALT_INV_my_regs[3][15]~q\,
	dataf => \ALT_INV_read_add[1]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: LABCELL_X46_Y11_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


