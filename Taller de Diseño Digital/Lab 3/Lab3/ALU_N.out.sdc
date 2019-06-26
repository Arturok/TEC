## Generated SDC file "ALU_N.out.sdc"

## Copyright (C) 2017  Intel Corporation. All rights reserved.
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
## VERSION "Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"

## DATE    "Fri Aug 31 08:45:43 2018"

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

set_clock_uncertainty -rise_from [get_clocks {clock}] -rise_to [get_clocks {clock}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {clock}] -fall_to [get_clocks {clock}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {clock}] -rise_to [get_clocks {clock}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {clock}] -fall_to [get_clocks {clock}] -setup 0.160  


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

