## Generated SDC file "ALU_N64.sdc"

## Copyright (C) 2018  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"

## DATE    "Fri Aug 31 20:26:33 2018"

##
## DEVICE  "5CSEMA5F31C6"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clock} -period 10.000 -waveform { 0.000 5.000 } [get_ports {clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clock}] -rise_to [get_clocks {clock}] -setup 0.180  
set_clock_uncertainty -rise_from [get_clocks {clock}] -rise_to [get_clocks {clock}] -hold 0.080  
set_clock_uncertainty -rise_from [get_clocks {clock}] -fall_to [get_clocks {clock}] -setup 0.180  
set_clock_uncertainty -rise_from [get_clocks {clock}] -fall_to [get_clocks {clock}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {clock}] -rise_to [get_clocks {clock}] -setup 0.180  
set_clock_uncertainty -fall_from [get_clocks {clock}] -rise_to [get_clocks {clock}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {clock}] -fall_to [get_clocks {clock}] -setup 0.180  
set_clock_uncertainty -fall_from [get_clocks {clock}] -fall_to [get_clocks {clock}] -hold 0.080  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[0]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[1]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[2]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[3]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[4]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[5]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[6]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[7]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[8]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[9]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[10]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[11]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[12]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[13]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[14]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[15]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[16]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[17]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[18]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[19]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[20]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[21]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[22]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[23]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[24]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[25]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[26]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[27]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[28]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[29]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[30]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[31]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[32]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[33]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[34]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[35]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[36]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[37]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[38]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[39]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[40]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[41]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[42]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[43]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[44]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[45]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[46]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[47]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[48]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[49]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[50]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[51]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[52]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[53]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[54]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[55]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[56]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[57]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[58]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[59]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[60]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[61]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[62]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {A[63]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[0]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[1]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[2]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[3]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[4]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[5]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[6]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[7]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[8]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[9]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[10]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[11]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[12]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[13]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[14]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[15]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[16]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[17]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[18]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[19]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[20]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[21]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[22]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[23]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[24]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[25]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[26]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[27]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[28]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[29]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[30]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[31]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[32]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[33]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[34]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[35]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[36]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[37]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[38]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[39]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[40]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[41]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[42]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[43]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[44]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[45]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[46]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[47]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[48]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[49]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[50]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[51]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[52]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[53]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[54]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[55]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[56]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[57]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[58]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[59]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[60]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[61]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[62]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  5.000 [get_ports {Y[63]}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

