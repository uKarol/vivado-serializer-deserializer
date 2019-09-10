# ####################################################################

#  Created by Genus(TM) Synthesis Solution 17.13-s033_1 on Mon Sep 09 23:41:11 CEST 2019

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design mtm_Alu

create_clock -name "clk" -add -period 20.0 -waveform {0.0 10.0} [get_ports clk]
set_load -pin_load 0.1 [get_ports sout]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 10.0 [get_ports rst_n]
set_input_delay -clock [get_clocks clk] -add_delay 10.0 [get_ports sin]
set_output_delay -clock [get_clocks clk] -add_delay 10.0 [get_ports sout]
set_max_fanout 1.000 [get_ports clk]
set_max_fanout 1.000 [get_ports rst_n]
set_max_fanout 1.000 [get_ports sin]
set_input_transition 0.2 [get_ports clk]
set_input_transition 0.2 [get_ports rst_n]
set_input_transition 0.2 [get_ports sin]
set_dont_use [get_lib_cells SUSLIB_UCL_SS/UCL_BUF16]
set_dont_use [get_lib_cells SUSLIB_UCL_SS/UCL_DFF_LP]
set_dont_use [get_lib_cells SUSLIB_UCL_SS/UCL_DFF_LP2]
set_dont_use [get_lib_cells SUSLIB_UCL_SS/UCL_DFF_LP4]
set_dont_use [get_lib_cells SUSLIB_UCL_SS/UCL_INV_LP]
set_dont_use [get_lib_cells SUSLIB_UCL_SS/UCL_INV_LP2]
set_dont_use [get_lib_cells SUSLIB_UCL_SS/UCL_CAP5]
set_dont_use [get_lib_cells SUSLIB_UCL_SS/UCL_CAP6]
set_dont_use [get_lib_cells SUSLIB_UCL_SS/UCL_CAP7]
set_dont_use [get_lib_cells SUSLIB_UCL_SS/UCL_CAP8]
set_dont_use [get_lib_cells SUSLIB_UCL_SS/UCL_CAP9]
set_clock_uncertainty -setup 0.3 [get_clocks clk]
set_clock_uncertainty -hold 0.1 [get_clocks clk]
