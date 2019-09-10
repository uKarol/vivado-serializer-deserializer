#################################################################################
#
# Created by Genus(TM) Synthesis Solution 17.13-s033_1 on Mon Sep 09 23:41:11 CEST 2019
#
#################################################################################

## library_sets
create_library_set -name WC_libs \
    -timing { /cad/dk/umc180/SUS/SUSLIB_UCL_ss.lib }
create_library_set -name BC_libs \
    -timing { /cad/dk/umc180/SUS/SUSLIB_UCL_ff.lib }

## opcond
create_opcond -name op_cond_slow -process 1.0 -voltage 1.7 -temperature 80.0
create_opcond -name op_cond_fast -process 1.0 -voltage 1.9 -temperature 0.0

## timing_condition
create_timing_condition -name WC_tc \
    -opcond op_cond_slow \
    -library_sets { WC_libs }
create_timing_condition -name BC_tc \
    -opcond op_cond_fast \
    -library_sets { BC_libs }

## rc_corner
create_rc_corner -name WC_rc \
    -temperature 80.0 \
    -qrc_tech /cad/dk/umc180oa/Rulefiles/QRC/G-DF-MIXED_MODE_RFCMOS18-1.8V_3.3V-1P6M-MMC/qrcTechFile \
    -pre_route_res 1.0 \
    -pre_route_cap 1.0 \
    -pre_route_clock_res 0.0 \
    -pre_route_clock_cap 0.0 \
    -post_route_res {1.0 1.0 1.0} \
    -post_route_cap {1.0 1.0 1.0} \
    -post_route_cross_cap {1.0 1.0 1.0} \
    -post_route_clock_res {1.0 1.0 1.0} \
    -post_route_clock_cap {1.0 1.0 1.0}
create_rc_corner -name BC_rc \
    -temperature 0.0 \
    -qrc_tech /cad/dk/umc180oa/Rulefiles/QRC/G-DF-MIXED_MODE_RFCMOS18-1.8V_3.3V-1P6M-MMC/qrcTechFile \
    -pre_route_res 1.0 \
    -pre_route_cap 1.0 \
    -pre_route_clock_res 0.0 \
    -pre_route_clock_cap 0.0 \
    -post_route_res {1.0 1.0 1.0} \
    -post_route_cap {1.0 1.0 1.0} \
    -post_route_cross_cap {1.0 1.0 1.0} \
    -post_route_clock_res {1.0 1.0 1.0} \
    -post_route_clock_cap {1.0 1.0 1.0}

## delay_corner
create_delay_corner -name WC_dc \
    -early_timing_condition { WC_tc } \
    -late_timing_condition { WC_tc } \
    -early_rc_corner WC_rc \
    -late_rc_corner WC_rc
create_delay_corner -name BC_dc \
    -early_timing_condition { BC_tc } \
    -late_timing_condition { BC_tc } \
    -early_rc_corner BC_rc \
    -late_rc_corner BC_rc

## constraint_mode
create_constraint_mode -name standard_cm \
    -sdc_files { /home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/synth/RESULTS//mtm_Alu.standard_cm.sdc }

## analysis_view
create_analysis_view -name WC_av \
    -constraint_mode standard_cm \
    -delay_corner WC_dc
create_analysis_view -name BC_av \
    -constraint_mode standard_cm \
    -delay_corner BC_dc

## set_analysis_view
set_analysis_view -setup { WC_av } \
                  -hold { BC_av }
