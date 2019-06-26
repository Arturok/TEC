-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"

-- DATE "08/08/2018 09:13:16"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	seven_seg_decoder IS
    PORT (
	data : IN std_logic_vector(3 DOWNTO 0);
	segments : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END seven_seg_decoder;

-- Design Ports Information
-- segments[0]	=>  Location: PIN_AB30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[1]	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[2]	=>  Location: PIN_AA28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[3]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[4]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[5]	=>  Location: PIN_AD29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[6]	=>  Location: PIN_AE29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[0]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[1]	=>  Location: PIN_AA30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[2]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[3]	=>  Location: PIN_AC29,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF seven_seg_decoder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_data : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_segments : std_logic_vector(6 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \data[1]~input_o\ : std_logic;
SIGNAL \data[0]~input_o\ : std_logic;
SIGNAL \data[3]~input_o\ : std_logic;
SIGNAL \data[2]~input_o\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_data[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_data[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_data[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_data[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux5~0_combout\ : std_logic;

BEGIN

ww_data <= data;
segments <= ww_segments;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_data[3]~input_o\ <= NOT \data[3]~input_o\;
\ALT_INV_data[2]~input_o\ <= NOT \data[2]~input_o\;
\ALT_INV_data[1]~input_o\ <= NOT \data[1]~input_o\;
\ALT_INV_data[0]~input_o\ <= NOT \data[0]~input_o\;
\ALT_INV_Mux0~0_combout\ <= NOT \Mux0~0_combout\;
\ALT_INV_Mux1~0_combout\ <= NOT \Mux1~0_combout\;
\ALT_INV_Mux2~0_combout\ <= NOT \Mux2~0_combout\;
\ALT_INV_Mux3~0_combout\ <= NOT \Mux3~0_combout\;
\ALT_INV_Mux4~0_combout\ <= NOT \Mux4~0_combout\;
\ALT_INV_Mux5~0_combout\ <= NOT \Mux5~0_combout\;

-- Location: IOOBUF_X89_Y21_N5
\segments[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(0));

-- Location: IOOBUF_X89_Y20_N62
\segments[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(1));

-- Location: IOOBUF_X89_Y21_N56
\segments[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(2));

-- Location: IOOBUF_X89_Y23_N22
\segments[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(3));

-- Location: IOOBUF_X89_Y23_N5
\segments[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(4));

-- Location: IOOBUF_X89_Y23_N56
\segments[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(5));

-- Location: IOOBUF_X89_Y23_N39
\segments[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(6));

-- Location: IOIBUF_X89_Y21_N21
\data[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(1),
	o => \data[1]~input_o\);

-- Location: IOIBUF_X89_Y20_N44
\data[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(0),
	o => \data[0]~input_o\);

-- Location: IOIBUF_X89_Y20_N95
\data[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(3),
	o => \data[3]~input_o\);

-- Location: IOIBUF_X89_Y21_N38
\data[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(2),
	o => \data[2]~input_o\);

-- Location: LABCELL_X88_Y21_N0
\Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = ( \data[3]~input_o\ & ( \data[2]~input_o\ & ( (\data[0]~input_o\) # (\data[1]~input_o\) ) ) ) # ( !\data[3]~input_o\ & ( \data[2]~input_o\ & ( (!\data[1]~input_o\) # (!\data[0]~input_o\) ) ) ) # ( \data[3]~input_o\ & ( 
-- !\data[2]~input_o\ ) ) # ( !\data[3]~input_o\ & ( !\data[2]~input_o\ & ( \data[1]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101111111111111111111111010111110100101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data[1]~input_o\,
	datac => \ALT_INV_data[0]~input_o\,
	datae => \ALT_INV_data[3]~input_o\,
	dataf => \ALT_INV_data[2]~input_o\,
	combout => \Mux6~0_combout\);

-- Location: LABCELL_X88_Y21_N9
\Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = ( !\data[3]~input_o\ & ( \data[2]~input_o\ & ( (\data[0]~input_o\ & \data[1]~input_o\) ) ) ) # ( !\data[3]~input_o\ & ( !\data[2]~input_o\ & ( (\data[1]~input_o\) # (\data[0]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010111111111000000000000000000000000010101010000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data[0]~input_o\,
	datad => \ALT_INV_data[1]~input_o\,
	datae => \ALT_INV_data[3]~input_o\,
	dataf => \ALT_INV_data[2]~input_o\,
	combout => \Mux5~0_combout\);

-- Location: LABCELL_X88_Y21_N42
\Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = ( !\data[3]~input_o\ & ( \data[2]~input_o\ & ( (!\data[1]~input_o\) # (\data[0]~input_o\) ) ) ) # ( \data[3]~input_o\ & ( !\data[2]~input_o\ & ( (!\data[1]~input_o\ & \data[0]~input_o\) ) ) ) # ( !\data[3]~input_o\ & ( 
-- !\data[2]~input_o\ & ( \data[0]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000010100000101010101111101011110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data[1]~input_o\,
	datac => \ALT_INV_data[0]~input_o\,
	datae => \ALT_INV_data[3]~input_o\,
	dataf => \ALT_INV_data[2]~input_o\,
	combout => \Mux4~0_combout\);

-- Location: LABCELL_X88_Y21_N51
\Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = ( \data[3]~input_o\ & ( \data[2]~input_o\ & ( \data[0]~input_o\ ) ) ) # ( !\data[3]~input_o\ & ( \data[2]~input_o\ & ( !\data[0]~input_o\ $ (\data[1]~input_o\) ) ) ) # ( \data[3]~input_o\ & ( !\data[2]~input_o\ & ( !\data[0]~input_o\ $ 
-- (!\data[1]~input_o\) ) ) ) # ( !\data[3]~input_o\ & ( !\data[2]~input_o\ & ( (\data[0]~input_o\ & !\data[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000010101011010101010101010010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data[0]~input_o\,
	datad => \ALT_INV_data[1]~input_o\,
	datae => \ALT_INV_data[3]~input_o\,
	dataf => \ALT_INV_data[2]~input_o\,
	combout => \Mux3~0_combout\);

-- Location: LABCELL_X88_Y21_N54
\Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = ( \data[3]~input_o\ & ( \data[2]~input_o\ & ( (!\data[0]~input_o\) # (\data[1]~input_o\) ) ) ) # ( !\data[3]~input_o\ & ( !\data[2]~input_o\ & ( (\data[1]~input_o\ & !\data[0]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000000000000000000000000000000000001111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data[1]~input_o\,
	datac => \ALT_INV_data[0]~input_o\,
	datae => \ALT_INV_data[3]~input_o\,
	dataf => \ALT_INV_data[2]~input_o\,
	combout => \Mux2~0_combout\);

-- Location: LABCELL_X88_Y21_N33
\Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = ( \data[3]~input_o\ & ( \data[2]~input_o\ & ( (!\data[0]~input_o\) # (\data[1]~input_o\) ) ) ) # ( !\data[3]~input_o\ & ( \data[2]~input_o\ & ( !\data[0]~input_o\ $ (!\data[1]~input_o\) ) ) ) # ( \data[3]~input_o\ & ( !\data[2]~input_o\ 
-- & ( (\data[0]~input_o\ & \data[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000101010101010101101010101010101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data[0]~input_o\,
	datad => \ALT_INV_data[1]~input_o\,
	datae => \ALT_INV_data[3]~input_o\,
	dataf => \ALT_INV_data[2]~input_o\,
	combout => \Mux1~0_combout\);

-- Location: LABCELL_X88_Y21_N36
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ( !\data[3]~input_o\ & ( \data[2]~input_o\ & ( (!\data[1]~input_o\ & !\data[0]~input_o\) ) ) ) # ( \data[3]~input_o\ & ( !\data[2]~input_o\ & ( (\data[1]~input_o\ & \data[0]~input_o\) ) ) ) # ( !\data[3]~input_o\ & ( !\data[2]~input_o\ 
-- & ( (!\data[1]~input_o\ & \data[0]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000001010000010110100000101000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data[1]~input_o\,
	datac => \ALT_INV_data[0]~input_o\,
	datae => \ALT_INV_data[3]~input_o\,
	dataf => \ALT_INV_data[2]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: LABCELL_X23_Y4_N0
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


