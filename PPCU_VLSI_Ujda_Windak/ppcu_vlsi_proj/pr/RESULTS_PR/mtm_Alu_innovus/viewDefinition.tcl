if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name WC_libs\
   -timing\
    [list ${::IMEX::libVar}/mmmc/SUSLIB_UCL_ss.lib]
create_library_set -name BC_libs\
   -timing\
    [list ${::IMEX::libVar}/mmmc/SUSLIB_UCL_ff.lib]
create_opcond -name op_cond_fast -process 1 -voltage 1.9 -temperature 0
create_opcond -name op_cond_slow -process 1 -voltage 1.7 -temperature 80
create_timing_condition -name BC_tc\
   -library_sets [list BC_libs]\
   -opcond op_cond_fast
create_timing_condition -name WC_tc\
   -library_sets [list WC_libs]\
   -opcond op_cond_slow
create_rc_corner -name WC_rc\
   -pre_route_res 1\
   -post_route_res {1 1 1}\
   -pre_route_cap 1\
   -post_route_cap {1 1 1}\
   -post_route_cross_cap {1 1 1}\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0\
   -post_route_clock_cap {1 1 1}\
   -post_route_clock_res {1 1 1}\
   -temperature 80\
   -qrc_tech ${::IMEX::libVar}/mmmc/qrcTechFile
create_rc_corner -name BC_rc\
   -pre_route_res 1\
   -post_route_res {1 1 1}\
   -pre_route_cap 1\
   -post_route_cap {1 1 1}\
   -post_route_cross_cap {1 1 1}\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0\
   -post_route_clock_cap {1 1 1}\
   -post_route_clock_res {1 1 1}\
   -temperature 0\
   -qrc_tech ${::IMEX::libVar}/mmmc/qrcTechFile
create_delay_corner -name WC_dc\
   -early_timing_condition {WC_tc}\
   -late_timing_condition {WC_tc}\
   -rc_corner WC_rc
create_delay_corner -name BC_dc\
   -early_timing_condition {BC_tc}\
   -late_timing_condition {BC_tc}\
   -rc_corner BC_rc
create_constraint_mode -name standard_cm\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/standard_cm/standard_cm.sdc]
create_analysis_view -name BC_av -constraint_mode standard_cm -delay_corner BC_dc -latency_file ${::IMEX::dataVar}/mmmc/views/BC_av/latency.sdc
create_analysis_view -name WC_av -constraint_mode standard_cm -delay_corner WC_dc -latency_file ${::IMEX::dataVar}/mmmc/views/WC_av/latency.sdc
set_analysis_view -setup [list WC_av] -hold [list BC_av]
catch {set_interactive_constraint_mode [list standard_cm] } 
