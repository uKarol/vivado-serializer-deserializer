#####################################################################
#
# Init setup file
# Created by Genus(TM) Synthesis Solution on 09/09/2019 23:41:12
#
#####################################################################


read_mmmc /home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/synth/RESULTS/mtm_Alu.mmmc.tcl

read_physical -lef {/cad/dk/umc180/SUS/SUSLIB_UCL_tech.lef /cad/dk/umc180/SUS/SUSLIB_UCL.lef}

read_netlist /home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/synth/RESULTS/mtm_Alu.v

init_design -skip_sdc_read
