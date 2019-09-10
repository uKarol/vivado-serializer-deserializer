#------------------------------------------------------------------------------
# (#01) INITIALIZE DESIGN
#------------------------------------------------------------------------------
# Do not modify this file.
#------------------------------------------------------------------------------
source tcl/00_common_settings.tcl

# Specify power net names
# The library has separated bulks for both vdd and gnd:
# vddd - digital power supply
# vddb - bulk of PMOS transistors
# gndd - digital ground
# gndb - bulk of NMOS transistors
set_db init_power_nets  {vddd vddb}
set_db init_ground_nets {gndd gndb}

#------------------------------------------------------------------------------
# Read the data prepared by genus with the write_design command.
# This will load the netlist, constraints, libraries and MMMC (multi-mode
# multi-corner) configuration.
# 
# TODO: link the synthesis RESULT directory locally with the same name, e.g.:
# ln -s ../synth/RESULTS .

ln -s ../synth/RESULTS /home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/pr/RESULTS

source /home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/synth/RESULTS/mtm_Alu.invs_setup.tcl
