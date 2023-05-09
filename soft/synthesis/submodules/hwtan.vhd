-- Copyright (C) 2018  Intel Corporation. All rights reserved.
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

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
-- CREATED		"Wed Dec 21 15:55:03 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY hwtan IS 
	PORT
	(
		read :  IN  STD_LOGIC;
		write :  IN  STD_LOGIC;
		chipselect :  IN  STD_LOGIC;
		clock :  IN  STD_LOGIC;
		reset_n :  IN  STD_LOGIC;
		byteenable :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		writedata :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		conduit :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		readdata :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END hwtan;

ARCHITECTURE bdf_type OF hwtan IS 

COMPONENT tanhw
	PORT(ck : IN STD_LOGIC;
		 sico : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT reg32_avamap
	PORT(clock : IN STD_LOGIC;
		 resetn : IN STD_LOGIC;
		 rd : IN STD_LOGIC;
		 wr : IN STD_LOGIC;
		 chipselect : IN STD_LOGIC;
		 byteenable : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 writedata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Q_export : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 readdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(31 DOWNTO 0);


BEGIN 



b2v_inst : tanhw
PORT MAP(ck => clock,
		 sico => writedata,
		 ta => SYNTHESIZED_WIRE_0);


b2v_inst1 : reg32_avamap
PORT MAP(clock => clock,
		 resetn => reset_n,
		 rd => read,
		 wr => write,
		 chipselect => chipselect,
		 byteenable => byteenable,
		 writedata => SYNTHESIZED_WIRE_0,
		 Q_export => conduit,
		 readdata => readdata);


END bdf_type;