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
-- CREATED		"Wed Dec 21 10:43:05 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY tanhw IS 
	PORT
	(
		ck :  IN  STD_LOGIC;
		sico :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ta :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END tanhw;

ARCHITECTURE bdf_type OF tanhw IS 

COMPONENT sinhw
	PORT(clock : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT coshw
	PORT(clock : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT fpdiv
	PORT(clock : IN STD_LOGIC;
		 dataa : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 datab : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(31 DOWNTO 0);


BEGIN 



b2v_inst : sinhw
PORT MAP(clock => ck,
		 data => sico,
		 result => SYNTHESIZED_WIRE_0);


b2v_inst1 : coshw
PORT MAP(clock => ck,
		 data => sico,
		 result => SYNTHESIZED_WIRE_1);


b2v_inst2 : fpdiv
PORT MAP(clock => ck,
		 dataa => SYNTHESIZED_WIRE_0,
		 datab => SYNTHESIZED_WIRE_1,
		 result => ta);


END bdf_type;