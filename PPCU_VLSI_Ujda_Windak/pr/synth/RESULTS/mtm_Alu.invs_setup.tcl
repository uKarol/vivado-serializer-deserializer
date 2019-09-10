#####################################################################
#
# Innovus setup file
# Created by Genus(TM) Synthesis Solution on 09/09/2019 23:41:12
#
# This file can only be run in Innovus Common UI mode.
#
#####################################################################


# Design Import
###########################################################
## Reading FlowKit settings file
source /home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/synth/RESULTS/mtm_Alu.flowkit_settings.tcl

source /home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/synth/RESULTS/mtm_Alu.invs_init.tcl
update_constraint_mode -name standard_cm -sdc_files {/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/synth/RESULTS/mtm_Alu.standard_cm.sdc /home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/synth/RESULTS/mtm_Alu.loopbreaker.sdc}

# Reading metrics file
######################
read_metric -id current /home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/synth/RESULTS/mtm_Alu.metrics.json 



# Mode Setup
###########################################################
source /home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/synth/RESULTS/mtm_Alu.mode

# Reading write_name_mapping file
#################################
if {[is_attribute -obj_type port original_name] && [is_attribute -obj_type pin original_name] && [is_attribute -obj_type pin is_phase_inverted]} {
  source /home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/synth/RESULTS/mtm_Alu.wnm_attrs.tcl
}

eval_enc { set edi_pe::pegConsiderMacroLayersUnblocked 1 }
eval_enc { set edi_pe::pegPreRouteWireWidthBasedDensityCalModel 1 }
