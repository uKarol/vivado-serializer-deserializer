######################################################################

# Created by Genus(TM) Synthesis Solution 17.13-s033_1 on Wed Sep 11 16:24:14 CEST 2019

# This file contains the RC script for design:mtm_Alu

######################################################################

set_db -quiet information_level 7
set_db -quiet design_mode_process 240.0
set_db -quiet phys_assume_met_fill 0.0
set_db -quiet map_placed_for_hum false
set_db -quiet phys_use_invs_extraction true
set_db -quiet phys_route_time_out 120.0
set_db -quiet phys_use_extraction_kit false
set_db -quiet capacitance_per_unit_length_mmmc {}
set_db -quiet resistance_per_unit_length_mmmc {}
set_db -quiet runtime_by_stage { {to_generic 4 13 4 13}  {first_condense 3 17 2 16}  {reify 3 20 2 19} }
set_db -quiet tinfo_tstamp_file .rs_awindak.tstamp
set_db -quiet metric_enable true
set_db -quiet design_process_node 180
set_db -quiet syn_generic_effort express
set_db -quiet syn_map_effort express
set_db -quiet syn_opt_effort express
set_db -quiet remove_assigns true
set_db -quiet optimize_merge_flops false
set_db -quiet max_cpus_per_server 1
set_db -quiet wlec_set_cdn_synth_root true
set_db -quiet hdl_track_filename_row_col true
set_db -quiet verification_directory_naming_style ./LEC
set_db -quiet use_area_from_lef true
set_db -quiet flow_metrics_snapshot_uuid 0a7bb4f8
set_db -quiet read_qrc_tech_file_rc_corner true
set_db -quiet init_ground_nets {gndd gndb}
set_db -quiet init_power_nets {vddd vddb}
if {[vfind design:mtm_Alu -mode WC_av] eq ""} {
 create_mode -name WC_av -design design:mtm_Alu 
}
set_db -quiet phys_use_segment_parasitics true
set_db -quiet probabilistic_extraction true
set_db -quiet ple_correlation_factors {1.9000 2.0000}
set_db -quiet maximum_interval_of_vias inf
set_db -quiet ple_mode global
set_db -quiet lib_cell:WC_libs/SUSLIB_UCL_SS/UCL_BUF16 .avoid true
set_db -quiet lib_cell:WC_libs/SUSLIB_UCL_SS/UCL_DFF_LP .avoid true
set_db -quiet lib_cell:WC_libs/SUSLIB_UCL_SS/UCL_DFF_LP2 .avoid true
set_db -quiet lib_cell:WC_libs/SUSLIB_UCL_SS/UCL_DFF_LP4 .avoid true
set_db -quiet lib_cell:WC_libs/SUSLIB_UCL_SS/UCL_INV_LP .avoid true
set_db -quiet lib_cell:WC_libs/SUSLIB_UCL_SS/UCL_INV_LP2 .avoid true
set_db -quiet lib_cell:WC_libs/physical_cells/UCL_BUF16B .avoid true
set_db -quiet lib_cell:WC_libs/physical_cells/UCL_DFF_SCAN .avoid true
set_db -quiet operating_condition:WC_libs/SUSLIB_UCL_SS/worst .tree_type balanced_tree
set_db -quiet operating_condition:WC_libs/SUSLIB_UCL_SS/_nominal_ .tree_type balanced_tree
# BEGIN MSV SECTION
# END MSV SECTION
define_clock -name clk -mode mode:mtm_Alu/WC_av -domain domain_1 -period 20000.0 -divide_period 1 -rise 0 -divide_rise 1 -fall 1 -divide_fall 2 -design design:mtm_Alu port:mtm_Alu/clk
set_db -quiet clock:mtm_Alu/WC_av/clk .clock_setup_uncertainty {300.0 300.0}
set_db -quiet clock:mtm_Alu/WC_av/clk .clock_hold_uncertainty {100.0 100.0}
define_cost_group -design design:mtm_Alu -name clk
external_delay -accumulate -input {0.0 no_value 0.0 no_value} -clock clock:mtm_Alu/WC_av/clk -name create_clock_delay_domain_1_clk_R_0 port:mtm_Alu/clk
set_db -quiet external_delay:mtm_Alu/WC_av/create_clock_delay_domain_1_clk_R_0 .clock_network_latency_included true
external_delay -accumulate -input {no_value 0.0 no_value 0.0} -clock clock:mtm_Alu/WC_av/clk -edge_fall -name create_clock_delay_domain_1_clk_F_0 port:mtm_Alu/clk
set_db -quiet external_delay:mtm_Alu/WC_av/create_clock_delay_domain_1_clk_F_0 .clock_network_latency_included true
external_delay -accumulate -input {10000.0 10000.0 10000.0 10000.0} -clock clock:mtm_Alu/WC_av/clk -name mtmAlu.sdc_line_56 port:mtm_Alu/rst_n
external_delay -accumulate -input {10000.0 10000.0 10000.0 10000.0} -clock clock:mtm_Alu/WC_av/clk -name mtmAlu.sdc_line_56_1_1 port:mtm_Alu/sin
external_delay -accumulate -output {10000.0 10000.0 10000.0 10000.0} -clock clock:mtm_Alu/WC_av/clk -name mtmAlu.sdc_line_71 port:mtm_Alu/sout
path_group -paths [specify_paths -mode mode:mtm_Alu/WC_av -to clock:mtm_Alu/WC_av/clk]  -name clk -group cost_group:mtm_Alu/clk -user_priority -1047552
# BEGIN DFT SECTION
set_db -quiet dft_scan_style muxed_scan
set_db -quiet dft_scanbit_waveform_analysis false
do_with_constant_dft_setup -design design:mtm_Alu {
}
do_with_constant_dft_setup -design design:mtm_Alu {
}
# END DFT SECTION
set_db -quiet design:mtm_Alu .qos_by_stage {{to_generic {wns -11111111} {tns -111111111} {vep -111111111} {area 90989} {cell_count 2949} {utilization  0.00} {runtime 4 13 4 13} }{first_condense {wns -11111111} {tns -111111111} {vep -111111111} {area 81571} {cell_count 2732} {utilization  0.00} {runtime 3 17 2 16} }{reify {wns 2065} {tns 0} {vep 0} {area 52702} {cell_count 1735} {utilization  0.00} {runtime 3 20 2 19} }}
set_db -quiet design:mtm_Alu .active_dont_use_by_mode {{mode:mtm_Alu/WC_av {lib_cell:WC_libs/SUSLIB_UCL_SS/UCL_INV_LP lib_cell:WC_libs/SUSLIB_UCL_SS/UCL_INV_LP2 lib_cell:WC_libs/SUSLIB_UCL_SS/UCL_BUF16 lib_cell:WC_libs/physical_cells/UCL_BUF16B lib_cell:WC_libs/SUSLIB_UCL_SS/UCL_DFF_LP lib_cell:WC_libs/SUSLIB_UCL_SS/UCL_DFF_LP2 lib_cell:WC_libs/SUSLIB_UCL_SS/UCL_DFF_LP4 lib_cell:WC_libs/physical_cells/UCL_DFF_SCAN}}}
set_db -quiet design:mtm_Alu .hdl_user_name mtm_Alu
set_db -quiet design:mtm_Alu .hdl_filelist {{default -v2001 {SYNTHESIS} {/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu.v /home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v /home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v /home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v} {. ./rtl}}}
set_db -quiet design:mtm_Alu .verification_directory ./LEC
set_db -quiet design:mtm_Alu .arch_filename /home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu.v
set_db -quiet design:mtm_Alu .entity_filename /home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu.v
set_db -quiet port:mtm_Alu/clk .input_slew_max_rise 200.0
set_db -quiet port:mtm_Alu/clk .input_slew_max_fall 200.0
set_db -quiet port:mtm_Alu/clk .input_slew_min_rise 200.0
set_db -quiet port:mtm_Alu/clk .input_slew_min_fall 200.0
set_db -quiet port:mtm_Alu/clk .fixed_slew_by_mode {{mode:mtm_Alu/WC_av {200.0 200.0 200.0 200.0}}}
set_db -quiet port:mtm_Alu/clk .min_transition no_value
set_db -quiet port:mtm_Alu/clk .max_fanout 1.000
set_db -quiet port:mtm_Alu/clk .max_fanout_by_mode {{mode:mtm_Alu/WC_av 1.000}}
set_db -quiet port:mtm_Alu/clk .original_name clk
set_db -quiet port:mtm_Alu/rst_n .input_slew_max_rise 200.0
set_db -quiet port:mtm_Alu/rst_n .input_slew_max_fall 200.0
set_db -quiet port:mtm_Alu/rst_n .input_slew_min_rise 200.0
set_db -quiet port:mtm_Alu/rst_n .input_slew_min_fall 200.0
set_db -quiet port:mtm_Alu/rst_n .fixed_slew_by_mode {{mode:mtm_Alu/WC_av {200.0 200.0 200.0 200.0}}}
set_db -quiet port:mtm_Alu/rst_n .min_transition no_value
set_db -quiet port:mtm_Alu/rst_n .max_fanout 1.000
set_db -quiet port:mtm_Alu/rst_n .max_fanout_by_mode {{mode:mtm_Alu/WC_av 1.000}}
set_db -quiet port:mtm_Alu/rst_n .original_name rst_n
set_db -quiet port:mtm_Alu/sin .input_slew_max_rise 200.0
set_db -quiet port:mtm_Alu/sin .input_slew_max_fall 200.0
set_db -quiet port:mtm_Alu/sin .input_slew_min_rise 200.0
set_db -quiet port:mtm_Alu/sin .input_slew_min_fall 200.0
set_db -quiet port:mtm_Alu/sin .fixed_slew_by_mode {{mode:mtm_Alu/WC_av {200.0 200.0 200.0 200.0}}}
set_db -quiet port:mtm_Alu/sin .min_transition no_value
set_db -quiet port:mtm_Alu/sin .max_fanout 1.000
set_db -quiet port:mtm_Alu/sin .max_fanout_by_mode {{mode:mtm_Alu/WC_av 1.000}}
set_db -quiet port:mtm_Alu/sin .original_name sin
set_db -quiet port:mtm_Alu/sout .external_pin_cap_min 100.0
set_db -quiet port:mtm_Alu/sout .external_capacitance_max {100.0 100.0}
set_db -quiet port:mtm_Alu/sout .external_capacitance_min 100.0
set_db -quiet port:mtm_Alu/sout .external_pin_cap_min_by_mode {{mode:mtm_Alu/WC_av 100.0}}
set_db -quiet port:mtm_Alu/sout .external_capacitance_min_by_mode {{mode:mtm_Alu/WC_av 100.0}}
set_db -quiet port:mtm_Alu/sout .external_pin_cap_by_mode {{mode:mtm_Alu/WC_av {100.0 100.0}}}
set_db -quiet port:mtm_Alu/sout .external_capacitance_max_by_mode {{mode:mtm_Alu/WC_av {100.0 100.0}}}
set_db -quiet port:mtm_Alu/sout .min_transition no_value
set_db -quiet port:mtm_Alu/sout .original_name sout
set_db -quiet port:mtm_Alu/sout .external_pin_cap {100.0 100.0}
set_db -quiet module:mtm_Alu/mtm_Alu_core .is_sop_cluster true
set_db -quiet module:mtm_Alu/mtm_Alu_core .hdl_user_name mtm_Alu_core
set_db -quiet module:mtm_Alu/mtm_Alu_core .hdl_filelist {{default -v2001 {SYNTHESIS} {/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v} {. ./rtl}}}
set_db -quiet module:mtm_Alu/mtm_Alu_core .arch_filename //home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v
set_db -quiet module:mtm_Alu/mtm_Alu_core .entity_filename //home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v
set_db -quiet module:mtm_Alu/add_unsigned_carry .logical_hier false
set_db -quiet hinst:mtm_Alu/u_mtm_Alu_core/addinc_add_59_36 .rtlop_info {{} 0 0 0 3 0 8 0 3 1 1 0}
set_db -quiet module:mtm_Alu/gt_unsigned_643 .logical_hier false
set_db -quiet hinst:mtm_Alu/u_mtm_Alu_core/gt_172_90 .rtlop_info {{} 0 0 0 3 0 120 0 2 1 1 0}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/ack_reg .original_name u_mtm_Alu_core/ack
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/ack_reg .orig_hdl_instantiated false
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/ack_reg .single_bit_orig_name u_mtm_Alu_core/ack
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/ack_reg .gint_phase_inversion false
set_db -quiet pin:mtm_Alu/u_mtm_Alu_core/ack_reg/NQ .original_name u_mtm_Alu_core/ack/q
set_db -quiet pin:mtm_Alu/u_mtm_Alu_core/ack_reg/Q .original_name u_mtm_Alu_core/ack/q
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[0]} .original_name {{u_mtm_Alu_core/ALUFlags[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[0]} .single_bit_orig_name {u_mtm_Alu_core/ALUFlags[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[0]/NQ} .original_name {u_mtm_Alu_core/ALUFlags[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[0]/Q} .original_name {u_mtm_Alu_core/ALUFlags[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[1]} .original_name {{u_mtm_Alu_core/ALUFlags[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[1]} .single_bit_orig_name {u_mtm_Alu_core/ALUFlags[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[1]/NQ} .original_name {u_mtm_Alu_core/ALUFlags[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[1]/Q} .original_name {u_mtm_Alu_core/ALUFlags[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[2]} .original_name {{u_mtm_Alu_core/ALUFlags[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[2]} .single_bit_orig_name {u_mtm_Alu_core/ALUFlags[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[2]/NQ} .original_name {u_mtm_Alu_core/ALUFlags[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[2]/Q} .original_name {u_mtm_Alu_core/ALUFlags[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[3]} .original_name {{u_mtm_Alu_core/ALUFlags[3]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[3]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[3]} .single_bit_orig_name {u_mtm_Alu_core/ALUFlags[3]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[3]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[3]/NQ} .original_name {u_mtm_Alu_core/ALUFlags[3]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[3]/Q} .original_name {u_mtm_Alu_core/ALUFlags[3]/q}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/OP_Err_reg .original_name u_mtm_Alu_core/OP_Err
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/OP_Err_reg .orig_hdl_instantiated false
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/OP_Err_reg .single_bit_orig_name u_mtm_Alu_core/OP_Err
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/OP_Err_reg .gint_phase_inversion false
set_db -quiet pin:mtm_Alu/u_mtm_Alu_core/OP_Err_reg/NQ .original_name u_mtm_Alu_core/OP_Err/q
set_db -quiet pin:mtm_Alu/u_mtm_Alu_core/OP_Err_reg/Q .original_name u_mtm_Alu_core/OP_Err/q
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[0]} .original_name {{u_mtm_Alu_core/Result[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[0]} .single_bit_orig_name {u_mtm_Alu_core/Result[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[0]/NQ} .original_name {u_mtm_Alu_core/Result[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[0]/Q} .original_name {u_mtm_Alu_core/Result[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[1]} .original_name {{u_mtm_Alu_core/Result[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[1]} .single_bit_orig_name {u_mtm_Alu_core/Result[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[1]/NQ} .original_name {u_mtm_Alu_core/Result[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[1]/Q} .original_name {u_mtm_Alu_core/Result[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[2]} .original_name {{u_mtm_Alu_core/Result[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[2]} .single_bit_orig_name {u_mtm_Alu_core/Result[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[2]/NQ} .original_name {u_mtm_Alu_core/Result[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[2]/Q} .original_name {u_mtm_Alu_core/Result[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[3]} .original_name {{u_mtm_Alu_core/Result[3]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[3]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[3]} .single_bit_orig_name {u_mtm_Alu_core/Result[3]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[3]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[3]/NQ} .original_name {u_mtm_Alu_core/Result[3]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[3]/Q} .original_name {u_mtm_Alu_core/Result[3]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[4]} .original_name {{u_mtm_Alu_core/Result[4]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[4]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[4]} .single_bit_orig_name {u_mtm_Alu_core/Result[4]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[4]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[4]/NQ} .original_name {u_mtm_Alu_core/Result[4]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[4]/Q} .original_name {u_mtm_Alu_core/Result[4]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[5]} .original_name {{u_mtm_Alu_core/Result[5]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[5]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[5]} .single_bit_orig_name {u_mtm_Alu_core/Result[5]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[5]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[5]/NQ} .original_name {u_mtm_Alu_core/Result[5]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[5]/Q} .original_name {u_mtm_Alu_core/Result[5]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[6]} .original_name {{u_mtm_Alu_core/Result[6]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[6]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[6]} .single_bit_orig_name {u_mtm_Alu_core/Result[6]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[6]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[6]/NQ} .original_name {u_mtm_Alu_core/Result[6]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[6]/Q} .original_name {u_mtm_Alu_core/Result[6]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[7]} .original_name {{u_mtm_Alu_core/Result[7]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[7]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[7]} .single_bit_orig_name {u_mtm_Alu_core/Result[7]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[7]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[7]/NQ} .original_name {u_mtm_Alu_core/Result[7]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[7]/Q} .original_name {u_mtm_Alu_core/Result[7]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[8]} .original_name {{u_mtm_Alu_core/Result[8]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[8]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[8]} .single_bit_orig_name {u_mtm_Alu_core/Result[8]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[8]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[8]/NQ} .original_name {u_mtm_Alu_core/Result[8]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[8]/Q} .original_name {u_mtm_Alu_core/Result[8]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[9]} .original_name {{u_mtm_Alu_core/Result[9]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[9]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[9]} .single_bit_orig_name {u_mtm_Alu_core/Result[9]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[9]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[9]/NQ} .original_name {u_mtm_Alu_core/Result[9]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[9]/Q} .original_name {u_mtm_Alu_core/Result[9]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[10]} .original_name {{u_mtm_Alu_core/Result[10]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[10]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[10]} .single_bit_orig_name {u_mtm_Alu_core/Result[10]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[10]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[10]/NQ} .original_name {u_mtm_Alu_core/Result[10]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[10]/Q} .original_name {u_mtm_Alu_core/Result[10]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[11]} .original_name {{u_mtm_Alu_core/Result[11]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[11]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[11]} .single_bit_orig_name {u_mtm_Alu_core/Result[11]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[11]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[11]/NQ} .original_name {u_mtm_Alu_core/Result[11]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[11]/Q} .original_name {u_mtm_Alu_core/Result[11]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[12]} .original_name {{u_mtm_Alu_core/Result[12]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[12]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[12]} .single_bit_orig_name {u_mtm_Alu_core/Result[12]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[12]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[12]/NQ} .original_name {u_mtm_Alu_core/Result[12]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[12]/Q} .original_name {u_mtm_Alu_core/Result[12]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[13]} .original_name {{u_mtm_Alu_core/Result[13]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[13]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[13]} .single_bit_orig_name {u_mtm_Alu_core/Result[13]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[13]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[13]/NQ} .original_name {u_mtm_Alu_core/Result[13]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[13]/Q} .original_name {u_mtm_Alu_core/Result[13]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[14]} .original_name {{u_mtm_Alu_core/Result[14]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[14]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[14]} .single_bit_orig_name {u_mtm_Alu_core/Result[14]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[14]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[14]/NQ} .original_name {u_mtm_Alu_core/Result[14]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[14]/Q} .original_name {u_mtm_Alu_core/Result[14]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[15]} .original_name {{u_mtm_Alu_core/Result[15]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[15]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[15]} .single_bit_orig_name {u_mtm_Alu_core/Result[15]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[15]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[15]/NQ} .original_name {u_mtm_Alu_core/Result[15]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[15]/Q} .original_name {u_mtm_Alu_core/Result[15]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[16]} .original_name {{u_mtm_Alu_core/Result[16]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[16]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[16]} .single_bit_orig_name {u_mtm_Alu_core/Result[16]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[16]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[16]/NQ} .original_name {u_mtm_Alu_core/Result[16]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[16]/Q} .original_name {u_mtm_Alu_core/Result[16]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[17]} .original_name {{u_mtm_Alu_core/Result[17]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[17]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[17]} .single_bit_orig_name {u_mtm_Alu_core/Result[17]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[17]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[17]/NQ} .original_name {u_mtm_Alu_core/Result[17]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[17]/Q} .original_name {u_mtm_Alu_core/Result[17]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[18]} .original_name {{u_mtm_Alu_core/Result[18]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[18]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[18]} .single_bit_orig_name {u_mtm_Alu_core/Result[18]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[18]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[18]/NQ} .original_name {u_mtm_Alu_core/Result[18]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[18]/Q} .original_name {u_mtm_Alu_core/Result[18]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[19]} .original_name {{u_mtm_Alu_core/Result[19]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[19]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[19]} .single_bit_orig_name {u_mtm_Alu_core/Result[19]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[19]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[19]/NQ} .original_name {u_mtm_Alu_core/Result[19]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[19]/Q} .original_name {u_mtm_Alu_core/Result[19]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[20]} .original_name {{u_mtm_Alu_core/Result[20]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[20]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[20]} .single_bit_orig_name {u_mtm_Alu_core/Result[20]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[20]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[20]/NQ} .original_name {u_mtm_Alu_core/Result[20]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[20]/Q} .original_name {u_mtm_Alu_core/Result[20]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[21]} .original_name {{u_mtm_Alu_core/Result[21]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[21]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[21]} .single_bit_orig_name {u_mtm_Alu_core/Result[21]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[21]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[21]/NQ} .original_name {u_mtm_Alu_core/Result[21]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[21]/Q} .original_name {u_mtm_Alu_core/Result[21]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[22]} .original_name {{u_mtm_Alu_core/Result[22]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[22]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[22]} .single_bit_orig_name {u_mtm_Alu_core/Result[22]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[22]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[22]/NQ} .original_name {u_mtm_Alu_core/Result[22]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[22]/Q} .original_name {u_mtm_Alu_core/Result[22]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[23]} .original_name {{u_mtm_Alu_core/Result[23]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[23]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[23]} .single_bit_orig_name {u_mtm_Alu_core/Result[23]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[23]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[23]/NQ} .original_name {u_mtm_Alu_core/Result[23]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[23]/Q} .original_name {u_mtm_Alu_core/Result[23]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[24]} .original_name {{u_mtm_Alu_core/Result[24]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[24]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[24]} .single_bit_orig_name {u_mtm_Alu_core/Result[24]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[24]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[24]/NQ} .original_name {u_mtm_Alu_core/Result[24]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[24]/Q} .original_name {u_mtm_Alu_core/Result[24]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[25]} .original_name {{u_mtm_Alu_core/Result[25]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[25]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[25]} .single_bit_orig_name {u_mtm_Alu_core/Result[25]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[25]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[25]/NQ} .original_name {u_mtm_Alu_core/Result[25]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[25]/Q} .original_name {u_mtm_Alu_core/Result[25]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[26]} .original_name {{u_mtm_Alu_core/Result[26]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[26]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[26]} .single_bit_orig_name {u_mtm_Alu_core/Result[26]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[26]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[26]/NQ} .original_name {u_mtm_Alu_core/Result[26]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[26]/Q} .original_name {u_mtm_Alu_core/Result[26]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[27]} .original_name {{u_mtm_Alu_core/Result[27]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[27]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[27]} .single_bit_orig_name {u_mtm_Alu_core/Result[27]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[27]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[27]/NQ} .original_name {u_mtm_Alu_core/Result[27]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[27]/Q} .original_name {u_mtm_Alu_core/Result[27]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[28]} .original_name {{u_mtm_Alu_core/Result[28]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[28]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[28]} .single_bit_orig_name {u_mtm_Alu_core/Result[28]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[28]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[28]/NQ} .original_name {u_mtm_Alu_core/Result[28]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[28]/Q} .original_name {u_mtm_Alu_core/Result[28]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[29]} .original_name {{u_mtm_Alu_core/Result[29]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[29]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[29]} .single_bit_orig_name {u_mtm_Alu_core/Result[29]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[29]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[29]/NQ} .original_name {u_mtm_Alu_core/Result[29]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[29]/Q} .original_name {u_mtm_Alu_core/Result[29]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[30]} .original_name {{u_mtm_Alu_core/Result[30]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[30]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[30]} .single_bit_orig_name {u_mtm_Alu_core/Result[30]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[30]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[30]/NQ} .original_name {u_mtm_Alu_core/Result[30]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[30]/Q} .original_name {u_mtm_Alu_core/Result[30]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[31]} .original_name {{u_mtm_Alu_core/Result[31]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[31]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[31]} .single_bit_orig_name {u_mtm_Alu_core/Result[31]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[31]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[31]/NQ} .original_name {u_mtm_Alu_core/Result[31]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/Result_reg[31]/Q} .original_name {u_mtm_Alu_core/Result[31]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/alu_state_reg[0]} .original_name {{u_mtm_Alu_core/alu_state[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/alu_state_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/alu_state_reg[0]} .single_bit_orig_name {u_mtm_Alu_core/alu_state[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/alu_state_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/alu_state_reg[0]/NQ} .original_name {u_mtm_Alu_core/alu_state[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/alu_state_reg[0]/Q} .original_name {u_mtm_Alu_core/alu_state[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/alu_state_reg[1]} .original_name {{u_mtm_Alu_core/alu_state[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/alu_state_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/alu_state_reg[1]} .single_bit_orig_name {u_mtm_Alu_core/alu_state[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/alu_state_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/alu_state_reg[1]/NQ} .original_name {u_mtm_Alu_core/alu_state[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/alu_state_reg[1]/Q} .original_name {u_mtm_Alu_core/alu_state[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/alu_state_reg[2]} .original_name {{u_mtm_Alu_core/alu_state[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/alu_state_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/alu_state_reg[2]} .single_bit_orig_name {u_mtm_Alu_core/alu_state[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/alu_state_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/alu_state_reg[2]/NQ} .original_name {u_mtm_Alu_core/alu_state[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/alu_state_reg[2]/Q} .original_name {u_mtm_Alu_core/alu_state[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/crc_out_reg[0]} .original_name {{u_mtm_Alu_core/crc_out[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/crc_out_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/crc_out_reg[0]} .single_bit_orig_name {u_mtm_Alu_core/crc_out[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/crc_out_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/crc_out_reg[0]/NQ} .original_name {u_mtm_Alu_core/crc_out[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/crc_out_reg[0]/Q} .original_name {u_mtm_Alu_core/crc_out[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/crc_out_reg[1]} .original_name {{u_mtm_Alu_core/crc_out[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/crc_out_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/crc_out_reg[1]} .single_bit_orig_name {u_mtm_Alu_core/crc_out[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/crc_out_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/crc_out_reg[1]/NQ} .original_name {u_mtm_Alu_core/crc_out[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/crc_out_reg[1]/Q} .original_name {u_mtm_Alu_core/crc_out[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/crc_out_reg[2]} .original_name {{u_mtm_Alu_core/crc_out[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/crc_out_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/crc_out_reg[2]} .single_bit_orig_name {u_mtm_Alu_core/crc_out[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/crc_out_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/crc_out_reg[2]/NQ} .original_name {u_mtm_Alu_core/crc_out[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_core/crc_out_reg[2]/Q} .original_name {u_mtm_Alu_core/crc_out[2]/q}
set_db -quiet module:mtm_Alu/mtm_Alu_deserializer .is_sop_cluster true
set_db -quiet module:mtm_Alu/mtm_Alu_deserializer .hdl_user_name mtm_Alu_deserializer
set_db -quiet module:mtm_Alu/mtm_Alu_deserializer .hdl_filelist {{default -v2001 {SYNTHESIS} {/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v} {. ./rtl}}}
set_db -quiet module:mtm_Alu/mtm_Alu_deserializer .arch_filename /home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v
set_db -quiet module:mtm_Alu/mtm_Alu_deserializer .entity_filename /home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/ack_reg .original_name u_mtm_Alu_deserializer/ack
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/ack_reg .orig_hdl_instantiated false
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/ack_reg .single_bit_orig_name u_mtm_Alu_deserializer/ack
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/ack_reg .gint_phase_inversion false
set_db -quiet pin:mtm_Alu/u_mtm_Alu_deserializer/ack_reg/NQ .original_name u_mtm_Alu_deserializer/ack/q
set_db -quiet pin:mtm_Alu/u_mtm_Alu_deserializer/ack_reg/Q .original_name u_mtm_Alu_deserializer/ack/q
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/frame_error_reg .original_name u_mtm_Alu_deserializer/frame_error
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/frame_error_reg .orig_hdl_instantiated false
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/frame_error_reg .single_bit_orig_name u_mtm_Alu_deserializer/frame_error
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/frame_error_reg .gint_phase_inversion false
set_db -quiet pin:mtm_Alu/u_mtm_Alu_deserializer/frame_error_reg/NQ .original_name u_mtm_Alu_deserializer/frame_error/q
set_db -quiet pin:mtm_Alu/u_mtm_Alu_deserializer/frame_error_reg/Q .original_name u_mtm_Alu_deserializer/frame_error/q
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/crc_error_reg .original_name u_mtm_Alu_deserializer/crc_error
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/crc_error_reg .orig_hdl_instantiated false
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/crc_error_reg .single_bit_orig_name u_mtm_Alu_deserializer/crc_error
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/crc_error_reg .gint_phase_inversion false
set_db -quiet pin:mtm_Alu/u_mtm_Alu_deserializer/crc_error_reg/NQ .original_name u_mtm_Alu_deserializer/crc_error/q
set_db -quiet pin:mtm_Alu/u_mtm_Alu_deserializer/crc_error_reg/Q .original_name u_mtm_Alu_deserializer/crc_error/q
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[0]} .original_name {{u_mtm_Alu_deserializer/bit_counter[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[0]} .single_bit_orig_name {u_mtm_Alu_deserializer/bit_counter[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[0]/NQ} .original_name {u_mtm_Alu_deserializer/bit_counter[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[0]/Q} .original_name {u_mtm_Alu_deserializer/bit_counter[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[1]} .original_name {{u_mtm_Alu_deserializer/bit_counter[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[1]} .single_bit_orig_name {u_mtm_Alu_deserializer/bit_counter[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[1]/NQ} .original_name {u_mtm_Alu_deserializer/bit_counter[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[1]/Q} .original_name {u_mtm_Alu_deserializer/bit_counter[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[2]} .original_name {{u_mtm_Alu_deserializer/bit_counter[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[2]} .single_bit_orig_name {u_mtm_Alu_deserializer/bit_counter[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[2]/NQ} .original_name {u_mtm_Alu_deserializer/bit_counter[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[2]/Q} .original_name {u_mtm_Alu_deserializer/bit_counter[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[3]} .original_name {{u_mtm_Alu_deserializer/bit_counter[3]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[3]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[3]} .single_bit_orig_name {u_mtm_Alu_deserializer/bit_counter[3]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[3]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[3]/NQ} .original_name {u_mtm_Alu_deserializer/bit_counter[3]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[3]/Q} .original_name {u_mtm_Alu_deserializer/bit_counter[3]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[4]} .original_name {{u_mtm_Alu_deserializer/bit_counter[4]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[4]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[4]} .single_bit_orig_name {u_mtm_Alu_deserializer/bit_counter[4]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[4]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[4]/NQ} .original_name {u_mtm_Alu_deserializer/bit_counter[4]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[4]/Q} .original_name {u_mtm_Alu_deserializer/bit_counter[4]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[5]} .original_name {{u_mtm_Alu_deserializer/bit_counter[5]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[5]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[5]} .single_bit_orig_name {u_mtm_Alu_deserializer/bit_counter[5]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[5]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[5]/NQ} .original_name {u_mtm_Alu_deserializer/bit_counter[5]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[5]/Q} .original_name {u_mtm_Alu_deserializer/bit_counter[5]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[0]} .original_name {{u_mtm_Alu_deserializer/crc_calc[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[0]} .single_bit_orig_name {u_mtm_Alu_deserializer/crc_calc[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[0]/NQ} .original_name {u_mtm_Alu_deserializer/crc_calc[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[0]/Q} .original_name {u_mtm_Alu_deserializer/crc_calc[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[1]} .original_name {{u_mtm_Alu_deserializer/crc_calc[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[1]} .single_bit_orig_name {u_mtm_Alu_deserializer/crc_calc[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[1]/NQ} .original_name {u_mtm_Alu_deserializer/crc_calc[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[1]/Q} .original_name {u_mtm_Alu_deserializer/crc_calc[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[2]} .original_name {{u_mtm_Alu_deserializer/crc_calc[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[2]} .single_bit_orig_name {u_mtm_Alu_deserializer/crc_calc[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[2]/NQ} .original_name {u_mtm_Alu_deserializer/crc_calc[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[2]/Q} .original_name {u_mtm_Alu_deserializer/crc_calc[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[3]} .original_name {{u_mtm_Alu_deserializer/crc_calc[3]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[3]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[3]} .single_bit_orig_name {u_mtm_Alu_deserializer/crc_calc[3]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[3]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[3]/NQ} .original_name {u_mtm_Alu_deserializer/crc_calc[3]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[3]/Q} .original_name {u_mtm_Alu_deserializer/crc_calc[3]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[0]} .original_name {{u_mtm_Alu_deserializer/data_out_A[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[0]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[0]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[0]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[1]} .original_name {{u_mtm_Alu_deserializer/data_out_A[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[1]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[1]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[1]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[2]} .original_name {{u_mtm_Alu_deserializer/data_out_A[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[2]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[2]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[2]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[3]} .original_name {{u_mtm_Alu_deserializer/data_out_A[3]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[3]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[3]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[3]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[3]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[3]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[3]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[3]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[3]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[4]} .original_name {{u_mtm_Alu_deserializer/data_out_A[4]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[4]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[4]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[4]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[4]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[4]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[4]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[4]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[4]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[5]} .original_name {{u_mtm_Alu_deserializer/data_out_A[5]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[5]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[5]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[5]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[5]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[5]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[5]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[5]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[5]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[6]} .original_name {{u_mtm_Alu_deserializer/data_out_A[6]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[6]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[6]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[6]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[6]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[6]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[6]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[6]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[6]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[7]} .original_name {{u_mtm_Alu_deserializer/data_out_A[7]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[7]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[7]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[7]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[7]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[7]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[7]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[7]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[7]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[8]} .original_name {{u_mtm_Alu_deserializer/data_out_A[8]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[8]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[8]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[8]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[8]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[8]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[8]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[8]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[8]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[9]} .original_name {{u_mtm_Alu_deserializer/data_out_A[9]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[9]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[9]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[9]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[9]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[9]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[9]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[9]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[9]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[10]} .original_name {{u_mtm_Alu_deserializer/data_out_A[10]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[10]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[10]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[10]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[10]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[10]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[10]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[10]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[10]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[11]} .original_name {{u_mtm_Alu_deserializer/data_out_A[11]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[11]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[11]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[11]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[11]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[11]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[11]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[11]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[11]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[12]} .original_name {{u_mtm_Alu_deserializer/data_out_A[12]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[12]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[12]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[12]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[12]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[12]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[12]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[12]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[12]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[13]} .original_name {{u_mtm_Alu_deserializer/data_out_A[13]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[13]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[13]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[13]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[13]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[13]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[13]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[13]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[13]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[14]} .original_name {{u_mtm_Alu_deserializer/data_out_A[14]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[14]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[14]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[14]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[14]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[14]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[14]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[14]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[14]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[15]} .original_name {{u_mtm_Alu_deserializer/data_out_A[15]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[15]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[15]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[15]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[15]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[15]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[15]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[15]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[15]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[16]} .original_name {{u_mtm_Alu_deserializer/data_out_A[16]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[16]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[16]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[16]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[16]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[16]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[16]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[16]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[16]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[17]} .original_name {{u_mtm_Alu_deserializer/data_out_A[17]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[17]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[17]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[17]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[17]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[17]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[17]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[17]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[17]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[18]} .original_name {{u_mtm_Alu_deserializer/data_out_A[18]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[18]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[18]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[18]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[18]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[18]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[18]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[18]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[18]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[19]} .original_name {{u_mtm_Alu_deserializer/data_out_A[19]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[19]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[19]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[19]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[19]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[19]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[19]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[19]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[19]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[20]} .original_name {{u_mtm_Alu_deserializer/data_out_A[20]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[20]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[20]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[20]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[20]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[20]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[20]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[20]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[20]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[21]} .original_name {{u_mtm_Alu_deserializer/data_out_A[21]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[21]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[21]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[21]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[21]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[21]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[21]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[21]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[21]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[22]} .original_name {{u_mtm_Alu_deserializer/data_out_A[22]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[22]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[22]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[22]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[22]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[22]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[22]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[22]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[22]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[23]} .original_name {{u_mtm_Alu_deserializer/data_out_A[23]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[23]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[23]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[23]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[23]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[23]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[23]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[23]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[23]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[24]} .original_name {{u_mtm_Alu_deserializer/data_out_A[24]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[24]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[24]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[24]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[24]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[24]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[24]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[24]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[24]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[25]} .original_name {{u_mtm_Alu_deserializer/data_out_A[25]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[25]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[25]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[25]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[25]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[25]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[25]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[25]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[25]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[26]} .original_name {{u_mtm_Alu_deserializer/data_out_A[26]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[26]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[26]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[26]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[26]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[26]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[26]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[26]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[26]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[27]} .original_name {{u_mtm_Alu_deserializer/data_out_A[27]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[27]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[27]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[27]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[27]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[27]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[27]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[27]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[27]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[28]} .original_name {{u_mtm_Alu_deserializer/data_out_A[28]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[28]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[28]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[28]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[28]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[28]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[28]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[28]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[28]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[29]} .original_name {{u_mtm_Alu_deserializer/data_out_A[29]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[29]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[29]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[29]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[29]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[29]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[29]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[29]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[29]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[30]} .original_name {{u_mtm_Alu_deserializer/data_out_A[30]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[30]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[30]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[30]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[30]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[30]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[30]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[30]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[30]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[31]} .original_name {{u_mtm_Alu_deserializer/data_out_A[31]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[31]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[31]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_A[31]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[31]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[31]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_A[31]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[31]/Q} .original_name {u_mtm_Alu_deserializer/data_out_A[31]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[0]} .original_name {{u_mtm_Alu_deserializer/data_out_B[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[0]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[0]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[0]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[1]} .original_name {{u_mtm_Alu_deserializer/data_out_B[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[1]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[1]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[1]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[2]} .original_name {{u_mtm_Alu_deserializer/data_out_B[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[2]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[2]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[2]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[3]} .original_name {{u_mtm_Alu_deserializer/data_out_B[3]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[3]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[3]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[3]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[3]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[3]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[3]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[3]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[3]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[4]} .original_name {{u_mtm_Alu_deserializer/data_out_B[4]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[4]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[4]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[4]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[4]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[4]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[4]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[4]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[4]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[5]} .original_name {{u_mtm_Alu_deserializer/data_out_B[5]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[5]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[5]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[5]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[5]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[5]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[5]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[5]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[5]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[6]} .original_name {{u_mtm_Alu_deserializer/data_out_B[6]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[6]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[6]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[6]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[6]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[6]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[6]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[6]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[6]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[7]} .original_name {{u_mtm_Alu_deserializer/data_out_B[7]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[7]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[7]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[7]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[7]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[7]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[7]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[7]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[7]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[8]} .original_name {{u_mtm_Alu_deserializer/data_out_B[8]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[8]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[8]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[8]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[8]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[8]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[8]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[8]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[8]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[9]} .original_name {{u_mtm_Alu_deserializer/data_out_B[9]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[9]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[9]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[9]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[9]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[9]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[9]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[9]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[9]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[10]} .original_name {{u_mtm_Alu_deserializer/data_out_B[10]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[10]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[10]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[10]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[10]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[10]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[10]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[10]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[10]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[11]} .original_name {{u_mtm_Alu_deserializer/data_out_B[11]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[11]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[11]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[11]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[11]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[11]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[11]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[11]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[11]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[12]} .original_name {{u_mtm_Alu_deserializer/data_out_B[12]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[12]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[12]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[12]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[12]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[12]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[12]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[12]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[12]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[13]} .original_name {{u_mtm_Alu_deserializer/data_out_B[13]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[13]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[13]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[13]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[13]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[13]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[13]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[13]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[13]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[14]} .original_name {{u_mtm_Alu_deserializer/data_out_B[14]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[14]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[14]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[14]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[14]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[14]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[14]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[14]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[14]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[15]} .original_name {{u_mtm_Alu_deserializer/data_out_B[15]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[15]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[15]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[15]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[15]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[15]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[15]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[15]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[15]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[16]} .original_name {{u_mtm_Alu_deserializer/data_out_B[16]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[16]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[16]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[16]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[16]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[16]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[16]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[16]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[16]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[17]} .original_name {{u_mtm_Alu_deserializer/data_out_B[17]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[17]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[17]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[17]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[17]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[17]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[17]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[17]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[17]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[18]} .original_name {{u_mtm_Alu_deserializer/data_out_B[18]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[18]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[18]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[18]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[18]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[18]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[18]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[18]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[18]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[19]} .original_name {{u_mtm_Alu_deserializer/data_out_B[19]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[19]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[19]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[19]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[19]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[19]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[19]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[19]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[19]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[20]} .original_name {{u_mtm_Alu_deserializer/data_out_B[20]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[20]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[20]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[20]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[20]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[20]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[20]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[20]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[20]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[21]} .original_name {{u_mtm_Alu_deserializer/data_out_B[21]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[21]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[21]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[21]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[21]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[21]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[21]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[21]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[21]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[22]} .original_name {{u_mtm_Alu_deserializer/data_out_B[22]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[22]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[22]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[22]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[22]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[22]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[22]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[22]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[22]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[23]} .original_name {{u_mtm_Alu_deserializer/data_out_B[23]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[23]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[23]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[23]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[23]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[23]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[23]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[23]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[23]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[24]} .original_name {{u_mtm_Alu_deserializer/data_out_B[24]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[24]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[24]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[24]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[24]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[24]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[24]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[24]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[24]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[25]} .original_name {{u_mtm_Alu_deserializer/data_out_B[25]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[25]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[25]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[25]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[25]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[25]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[25]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[25]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[25]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[26]} .original_name {{u_mtm_Alu_deserializer/data_out_B[26]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[26]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[26]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[26]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[26]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[26]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[26]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[26]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[26]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[27]} .original_name {{u_mtm_Alu_deserializer/data_out_B[27]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[27]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[27]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[27]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[27]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[27]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[27]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[27]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[27]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[28]} .original_name {{u_mtm_Alu_deserializer/data_out_B[28]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[28]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[28]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[28]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[28]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[28]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[28]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[28]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[28]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[29]} .original_name {{u_mtm_Alu_deserializer/data_out_B[29]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[29]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[29]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[29]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[29]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[29]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[29]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[29]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[29]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[30]} .original_name {{u_mtm_Alu_deserializer/data_out_B[30]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[30]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[30]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[30]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[30]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[30]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[30]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[30]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[30]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[31]} .original_name {{u_mtm_Alu_deserializer/data_out_B[31]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[31]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[31]} .single_bit_orig_name {u_mtm_Alu_deserializer/data_out_B[31]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[31]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[31]/NQ} .original_name {u_mtm_Alu_deserializer/data_out_B[31]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[31]/Q} .original_name {u_mtm_Alu_deserializer/data_out_B[31]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[0]} .original_name {{u_mtm_Alu_deserializer/des_state[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[0]} .single_bit_orig_name {u_mtm_Alu_deserializer/des_state[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[0]/NQ} .original_name {u_mtm_Alu_deserializer/des_state[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[0]/Q} .original_name {u_mtm_Alu_deserializer/des_state[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[1]} .original_name {{u_mtm_Alu_deserializer/des_state[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[1]} .single_bit_orig_name {u_mtm_Alu_deserializer/des_state[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[1]/NQ} .original_name {u_mtm_Alu_deserializer/des_state[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[1]/Q} .original_name {u_mtm_Alu_deserializer/des_state[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[2]} .original_name {{u_mtm_Alu_deserializer/des_state[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[2]} .single_bit_orig_name {u_mtm_Alu_deserializer/des_state[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[2]/NQ} .original_name {u_mtm_Alu_deserializer/des_state[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[2]/Q} .original_name {u_mtm_Alu_deserializer/des_state[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[3]} .original_name {{u_mtm_Alu_deserializer/des_state[3]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[3]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[3]} .single_bit_orig_name {u_mtm_Alu_deserializer/des_state[3]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[3]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[3]/NQ} .original_name {u_mtm_Alu_deserializer/des_state[3]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[3]/Q} .original_name {u_mtm_Alu_deserializer/des_state[3]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[0]} .original_name {{u_mtm_Alu_deserializer/frame_counter[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[0]} .single_bit_orig_name {u_mtm_Alu_deserializer/frame_counter[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[0]/NQ} .original_name {u_mtm_Alu_deserializer/frame_counter[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[0]/Q} .original_name {u_mtm_Alu_deserializer/frame_counter[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[1]} .original_name {{u_mtm_Alu_deserializer/frame_counter[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[1]} .single_bit_orig_name {u_mtm_Alu_deserializer/frame_counter[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[1]/NQ} .original_name {u_mtm_Alu_deserializer/frame_counter[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[1]/Q} .original_name {u_mtm_Alu_deserializer/frame_counter[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[2]} .original_name {{u_mtm_Alu_deserializer/frame_counter[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[2]} .single_bit_orig_name {u_mtm_Alu_deserializer/frame_counter[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[2]/NQ} .original_name {u_mtm_Alu_deserializer/frame_counter[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[2]/Q} .original_name {u_mtm_Alu_deserializer/frame_counter[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[3]} .original_name {{u_mtm_Alu_deserializer/frame_counter[3]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[3]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[3]} .single_bit_orig_name {u_mtm_Alu_deserializer/frame_counter[3]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[3]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[3]/NQ} .original_name {u_mtm_Alu_deserializer/frame_counter[3]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[3]/Q} .original_name {u_mtm_Alu_deserializer/frame_counter[3]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/opcode_reg[0]} .original_name {{u_mtm_Alu_deserializer/opcode[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/opcode_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/opcode_reg[0]} .single_bit_orig_name {u_mtm_Alu_deserializer/opcode[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/opcode_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/opcode_reg[0]/NQ} .original_name {u_mtm_Alu_deserializer/opcode[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/opcode_reg[0]/Q} .original_name {u_mtm_Alu_deserializer/opcode[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/opcode_reg[1]} .original_name {{u_mtm_Alu_deserializer/opcode[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/opcode_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/opcode_reg[1]} .single_bit_orig_name {u_mtm_Alu_deserializer/opcode[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/opcode_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/opcode_reg[1]/NQ} .original_name {u_mtm_Alu_deserializer/opcode[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/opcode_reg[1]/Q} .original_name {u_mtm_Alu_deserializer/opcode[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/opcode_reg[2]} .original_name {{u_mtm_Alu_deserializer/opcode[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/opcode_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/opcode_reg[2]} .single_bit_orig_name {u_mtm_Alu_deserializer/opcode[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/opcode_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/opcode_reg[2]/NQ} .original_name {u_mtm_Alu_deserializer/opcode[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/opcode_reg[2]/Q} .original_name {u_mtm_Alu_deserializer/opcode[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[0]} .original_name {{u_mtm_Alu_deserializer/oversample_counter[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[0]} .single_bit_orig_name {u_mtm_Alu_deserializer/oversample_counter[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[0]/NQ} .original_name {u_mtm_Alu_deserializer/oversample_counter[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[0]/Q} .original_name {u_mtm_Alu_deserializer/oversample_counter[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[1]} .original_name {{u_mtm_Alu_deserializer/oversample_counter[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[1]} .single_bit_orig_name {u_mtm_Alu_deserializer/oversample_counter[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[1]/NQ} .original_name {u_mtm_Alu_deserializer/oversample_counter[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[1]/Q} .original_name {u_mtm_Alu_deserializer/oversample_counter[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[2]} .original_name {{u_mtm_Alu_deserializer/oversample_counter[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[2]} .single_bit_orig_name {u_mtm_Alu_deserializer/oversample_counter[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[2]/NQ} .original_name {u_mtm_Alu_deserializer/oversample_counter[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[2]/Q} .original_name {u_mtm_Alu_deserializer/oversample_counter[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[3]} .original_name {{u_mtm_Alu_deserializer/oversample_counter[3]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[3]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[3]} .single_bit_orig_name {u_mtm_Alu_deserializer/oversample_counter[3]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[3]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[3]/NQ} .original_name {u_mtm_Alu_deserializer/oversample_counter[3]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[3]/Q} .original_name {u_mtm_Alu_deserializer/oversample_counter[3]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[0]} .original_name {{u_mtm_Alu_deserializer/parallel_crc[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[0]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_crc[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[0]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_crc[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[0]/Q} .original_name {u_mtm_Alu_deserializer/parallel_crc[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[1]} .original_name {{u_mtm_Alu_deserializer/parallel_crc[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[1]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_crc[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[1]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_crc[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[1]/Q} .original_name {u_mtm_Alu_deserializer/parallel_crc[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[2]} .original_name {{u_mtm_Alu_deserializer/parallel_crc[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[2]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_crc[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[2]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_crc[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[2]/Q} .original_name {u_mtm_Alu_deserializer/parallel_crc[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[3]} .original_name {{u_mtm_Alu_deserializer/parallel_crc[3]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[3]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[3]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_crc[3]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[3]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[3]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_crc[3]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[3]/Q} .original_name {u_mtm_Alu_deserializer/parallel_crc[3]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[0]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[0]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[0]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[0]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[1]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[1]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[1]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[1]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[2]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[2]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[2]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[2]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[3]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[3]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[3]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[3]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[3]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[3]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[3]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[3]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[3]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[3]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[4]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[4]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[4]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[4]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[4]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[4]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[4]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[4]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[4]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[4]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[5]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[5]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[5]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[5]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[5]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[5]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[5]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[5]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[5]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[5]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[6]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[6]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[6]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[6]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[6]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[6]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[6]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[6]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[6]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[6]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[7]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[7]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[7]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[7]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[7]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[7]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[7]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[7]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[7]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[7]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[8]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[8]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[8]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[8]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[8]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[8]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[8]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[8]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[8]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[8]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[9]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[9]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[9]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[9]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[9]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[9]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[9]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[9]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[9]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[9]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[10]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[10]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[10]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[10]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[10]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[10]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[10]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[10]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[10]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[10]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[11]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[11]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[11]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[11]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[11]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[11]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[11]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[11]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[11]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[11]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[12]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[12]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[12]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[12]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[12]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[12]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[12]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[12]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[12]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[12]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[13]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[13]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[13]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[13]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[13]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[13]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[13]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[13]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[13]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[13]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[14]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[14]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[14]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[14]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[14]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[14]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[14]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[14]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[14]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[14]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[15]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[15]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[15]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[15]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[15]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[15]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[15]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[15]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[15]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[15]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[16]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[16]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[16]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[16]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[16]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[16]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[16]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[16]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[16]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[16]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[17]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[17]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[17]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[17]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[17]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[17]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[17]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[17]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[17]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[17]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[18]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[18]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[18]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[18]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[18]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[18]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[18]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[18]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[18]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[18]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[19]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[19]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[19]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[19]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[19]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[19]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[19]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[19]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[19]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[19]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[20]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[20]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[20]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[20]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[20]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[20]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[20]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[20]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[20]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[20]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[21]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[21]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[21]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[21]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[21]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[21]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[21]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[21]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[21]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[21]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[22]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[22]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[22]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[22]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[22]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[22]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[22]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[22]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[22]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[22]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[23]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[23]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[23]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[23]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[23]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[23]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[23]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[23]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[23]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[23]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[24]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[24]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[24]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[24]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[24]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[24]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[24]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[24]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[24]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[24]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[25]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[25]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[25]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[25]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[25]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[25]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[25]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[25]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[25]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[25]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[26]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[26]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[26]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[26]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[26]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[26]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[26]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[26]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[26]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[26]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[27]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[27]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[27]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[27]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[27]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[27]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[27]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[27]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[27]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[27]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[28]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[28]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[28]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[28]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[28]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[28]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[28]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[28]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[28]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[28]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[29]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[29]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[29]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[29]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[29]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[29]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[29]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[29]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[29]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[29]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[30]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[30]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[30]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[30]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[30]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[30]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[30]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[30]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[30]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[30]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[31]} .original_name {{u_mtm_Alu_deserializer/parallel_data_A[31]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[31]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[31]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_A[31]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[31]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[31]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_A[31]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[31]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_A[31]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[0]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[0]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[0]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[0]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[1]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[1]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[1]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[1]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[2]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[2]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[2]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[2]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[3]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[3]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[3]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[3]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[3]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[3]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[3]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[3]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[3]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[3]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[4]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[4]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[4]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[4]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[4]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[4]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[4]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[4]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[4]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[4]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[5]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[5]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[5]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[5]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[5]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[5]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[5]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[5]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[5]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[5]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[6]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[6]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[6]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[6]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[6]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[6]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[6]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[6]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[6]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[6]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[7]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[7]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[7]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[7]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[7]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[7]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[7]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[7]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[7]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[7]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[8]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[8]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[8]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[8]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[8]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[8]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[8]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[8]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[8]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[8]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[9]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[9]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[9]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[9]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[9]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[9]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[9]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[9]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[9]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[9]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[10]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[10]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[10]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[10]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[10]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[10]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[10]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[10]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[10]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[10]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[11]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[11]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[11]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[11]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[11]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[11]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[11]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[11]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[11]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[11]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[12]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[12]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[12]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[12]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[12]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[12]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[12]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[12]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[12]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[12]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[13]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[13]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[13]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[13]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[13]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[13]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[13]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[13]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[13]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[13]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[14]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[14]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[14]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[14]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[14]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[14]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[14]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[14]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[14]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[14]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[15]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[15]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[15]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[15]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[15]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[15]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[15]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[15]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[15]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[15]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[16]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[16]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[16]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[16]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[16]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[16]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[16]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[16]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[16]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[16]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[17]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[17]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[17]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[17]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[17]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[17]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[17]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[17]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[17]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[17]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[18]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[18]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[18]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[18]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[18]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[18]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[18]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[18]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[18]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[18]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[19]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[19]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[19]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[19]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[19]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[19]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[19]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[19]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[19]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[19]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[20]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[20]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[20]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[20]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[20]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[20]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[20]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[20]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[20]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[20]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[21]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[21]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[21]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[21]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[21]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[21]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[21]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[21]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[21]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[21]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[22]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[22]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[22]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[22]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[22]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[22]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[22]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[22]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[22]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[22]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[23]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[23]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[23]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[23]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[23]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[23]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[23]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[23]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[23]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[23]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[24]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[24]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[24]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[24]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[24]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[24]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[24]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[24]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[24]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[24]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[25]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[25]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[25]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[25]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[25]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[25]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[25]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[25]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[25]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[25]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[26]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[26]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[26]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[26]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[26]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[26]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[26]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[26]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[26]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[26]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[27]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[27]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[27]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[27]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[27]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[27]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[27]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[27]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[27]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[27]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[28]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[28]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[28]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[28]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[28]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[28]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[28]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[28]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[28]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[28]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[29]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[29]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[29]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[29]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[29]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[29]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[29]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[29]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[29]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[29]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[30]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[30]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[30]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[30]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[30]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[30]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[30]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[30]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[30]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[30]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[31]} .original_name {{u_mtm_Alu_deserializer/parallel_data_B[31]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[31]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[31]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_data_B[31]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[31]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[31]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_data_B[31]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[31]/Q} .original_name {u_mtm_Alu_deserializer/parallel_data_B[31]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_opcode_reg[0]} .original_name {{u_mtm_Alu_deserializer/parallel_opcode[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_opcode_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_opcode_reg[0]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_opcode[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_opcode_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_opcode_reg[0]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_opcode[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_opcode_reg[0]/Q} .original_name {u_mtm_Alu_deserializer/parallel_opcode[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_opcode_reg[1]} .original_name {{u_mtm_Alu_deserializer/parallel_opcode[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_opcode_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_opcode_reg[1]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_opcode[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_opcode_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_opcode_reg[1]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_opcode[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_opcode_reg[1]/Q} .original_name {u_mtm_Alu_deserializer/parallel_opcode[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_opcode_reg[2]} .original_name {{u_mtm_Alu_deserializer/parallel_opcode[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_opcode_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_opcode_reg[2]} .single_bit_orig_name {u_mtm_Alu_deserializer/parallel_opcode[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_opcode_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_opcode_reg[2]/NQ} .original_name {u_mtm_Alu_deserializer/parallel_opcode[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_deserializer/parallel_opcode_reg[2]/Q} .original_name {u_mtm_Alu_deserializer/parallel_opcode[2]/q}
set_db -quiet module:mtm_Alu/mtm_Alu_serializer .is_sop_cluster true
set_db -quiet module:mtm_Alu/mtm_Alu_serializer .hdl_user_name mtm_Alu_serializer
set_db -quiet module:mtm_Alu/mtm_Alu_serializer .hdl_filelist {{default -v2001 {SYNTHESIS} {/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v} {. ./rtl}}}
set_db -quiet module:mtm_Alu/mtm_Alu_serializer .arch_filename /home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v
set_db -quiet module:mtm_Alu/mtm_Alu_serializer .entity_filename /home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v
set_db -quiet inst:mtm_Alu/u_mtm_Alu_serializer/ack_reg .original_name u_mtm_Alu_serializer/ack
set_db -quiet inst:mtm_Alu/u_mtm_Alu_serializer/ack_reg .orig_hdl_instantiated false
set_db -quiet inst:mtm_Alu/u_mtm_Alu_serializer/ack_reg .single_bit_orig_name u_mtm_Alu_serializer/ack
set_db -quiet inst:mtm_Alu/u_mtm_Alu_serializer/ack_reg .gint_phase_inversion false
set_db -quiet pin:mtm_Alu/u_mtm_Alu_serializer/ack_reg/NQ .original_name u_mtm_Alu_serializer/ack/q
set_db -quiet pin:mtm_Alu/u_mtm_Alu_serializer/ack_reg/Q .original_name u_mtm_Alu_serializer/ack/q
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[0]} .original_name {{u_mtm_Alu_serializer/bit_counter[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[0]} .single_bit_orig_name {u_mtm_Alu_serializer/bit_counter[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[0]/NQ} .original_name {u_mtm_Alu_serializer/bit_counter[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[0]/Q} .original_name {u_mtm_Alu_serializer/bit_counter[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[1]} .original_name {{u_mtm_Alu_serializer/bit_counter[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[1]} .single_bit_orig_name {u_mtm_Alu_serializer/bit_counter[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[1]/NQ} .original_name {u_mtm_Alu_serializer/bit_counter[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[1]/Q} .original_name {u_mtm_Alu_serializer/bit_counter[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[2]} .original_name {{u_mtm_Alu_serializer/bit_counter[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[2]} .single_bit_orig_name {u_mtm_Alu_serializer/bit_counter[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[2]/NQ} .original_name {u_mtm_Alu_serializer/bit_counter[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[2]/Q} .original_name {u_mtm_Alu_serializer/bit_counter[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[3]} .original_name {{u_mtm_Alu_serializer/bit_counter[3]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[3]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[3]} .single_bit_orig_name {u_mtm_Alu_serializer/bit_counter[3]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[3]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[3]/NQ} .original_name {u_mtm_Alu_serializer/bit_counter[3]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[3]/Q} .original_name {u_mtm_Alu_serializer/bit_counter[3]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[4]} .original_name {{u_mtm_Alu_serializer/bit_counter[4]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[4]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[4]} .single_bit_orig_name {u_mtm_Alu_serializer/bit_counter[4]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[4]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[4]/NQ} .original_name {u_mtm_Alu_serializer/bit_counter[4]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[4]/Q} .original_name {u_mtm_Alu_serializer/bit_counter[4]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[0]} .original_name {{u_mtm_Alu_serializer/frame_counter[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[0]} .single_bit_orig_name {u_mtm_Alu_serializer/frame_counter[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[0]/NQ} .original_name {u_mtm_Alu_serializer/frame_counter[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[0]/Q} .original_name {u_mtm_Alu_serializer/frame_counter[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[1]} .original_name {{u_mtm_Alu_serializer/frame_counter[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[1]} .single_bit_orig_name {u_mtm_Alu_serializer/frame_counter[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[1]/NQ} .original_name {u_mtm_Alu_serializer/frame_counter[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[1]/Q} .original_name {u_mtm_Alu_serializer/frame_counter[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[2]} .original_name {{u_mtm_Alu_serializer/frame_counter[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[2]} .single_bit_orig_name {u_mtm_Alu_serializer/frame_counter[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[2]/NQ} .original_name {u_mtm_Alu_serializer/frame_counter[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[2]/Q} .original_name {u_mtm_Alu_serializer/frame_counter[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[3]} .original_name {{u_mtm_Alu_serializer/frame_counter[3]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[3]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[3]} .single_bit_orig_name {u_mtm_Alu_serializer/frame_counter[3]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[3]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[3]/NQ} .original_name {u_mtm_Alu_serializer/frame_counter[3]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[3]/Q} .original_name {u_mtm_Alu_serializer/frame_counter[3]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[4]} .original_name {{u_mtm_Alu_serializer/frame_counter[4]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[4]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[4]} .single_bit_orig_name {u_mtm_Alu_serializer/frame_counter[4]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[4]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[4]/NQ} .original_name {u_mtm_Alu_serializer/frame_counter[4]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[4]/Q} .original_name {u_mtm_Alu_serializer/frame_counter[4]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[0]} .original_name {{u_mtm_Alu_serializer/internal_alu_flags[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[0]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_alu_flags[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[0]/NQ} .original_name {u_mtm_Alu_serializer/internal_alu_flags[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[0]/Q} .original_name {u_mtm_Alu_serializer/internal_alu_flags[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[1]} .original_name {{u_mtm_Alu_serializer/internal_alu_flags[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[1]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_alu_flags[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[1]/NQ} .original_name {u_mtm_Alu_serializer/internal_alu_flags[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[1]/Q} .original_name {u_mtm_Alu_serializer/internal_alu_flags[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[2]} .original_name {{u_mtm_Alu_serializer/internal_alu_flags[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[2]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_alu_flags[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[2]/NQ} .original_name {u_mtm_Alu_serializer/internal_alu_flags[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[2]/Q} .original_name {u_mtm_Alu_serializer/internal_alu_flags[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[3]} .original_name {{u_mtm_Alu_serializer/internal_alu_flags[3]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[3]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[3]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_alu_flags[3]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[3]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[3]/NQ} .original_name {u_mtm_Alu_serializer/internal_alu_flags[3]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[3]/Q} .original_name {u_mtm_Alu_serializer/internal_alu_flags[3]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_crc_reg[0]} .original_name {{u_mtm_Alu_serializer/internal_crc[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_crc_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_crc_reg[0]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_crc[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_crc_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_crc_reg[0]/NQ} .original_name {u_mtm_Alu_serializer/internal_crc[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_crc_reg[0]/Q} .original_name {u_mtm_Alu_serializer/internal_crc[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_crc_reg[1]} .original_name {{u_mtm_Alu_serializer/internal_crc[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_crc_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_crc_reg[1]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_crc[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_crc_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_crc_reg[1]/NQ} .original_name {u_mtm_Alu_serializer/internal_crc[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_crc_reg[1]/Q} .original_name {u_mtm_Alu_serializer/internal_crc[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_crc_reg[2]} .original_name {{u_mtm_Alu_serializer/internal_crc[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_crc_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_crc_reg[2]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_crc[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_crc_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_crc_reg[2]/NQ} .original_name {u_mtm_Alu_serializer/internal_crc[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_crc_reg[2]/Q} .original_name {u_mtm_Alu_serializer/internal_crc[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[0]} .original_name {{u_mtm_Alu_serializer/internal_data[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[0]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[0]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[0]/Q} .original_name {u_mtm_Alu_serializer/internal_data[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[1]} .original_name {{u_mtm_Alu_serializer/internal_data[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[1]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[1]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[1]/Q} .original_name {u_mtm_Alu_serializer/internal_data[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[2]} .original_name {{u_mtm_Alu_serializer/internal_data[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[2]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[2]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[2]/Q} .original_name {u_mtm_Alu_serializer/internal_data[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[3]} .original_name {{u_mtm_Alu_serializer/internal_data[3]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[3]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[3]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[3]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[3]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[3]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[3]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[3]/Q} .original_name {u_mtm_Alu_serializer/internal_data[3]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[4]} .original_name {{u_mtm_Alu_serializer/internal_data[4]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[4]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[4]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[4]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[4]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[4]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[4]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[4]/Q} .original_name {u_mtm_Alu_serializer/internal_data[4]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[5]} .original_name {{u_mtm_Alu_serializer/internal_data[5]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[5]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[5]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[5]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[5]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[5]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[5]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[5]/Q} .original_name {u_mtm_Alu_serializer/internal_data[5]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[6]} .original_name {{u_mtm_Alu_serializer/internal_data[6]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[6]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[6]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[6]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[6]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[6]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[6]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[6]/Q} .original_name {u_mtm_Alu_serializer/internal_data[6]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[7]} .original_name {{u_mtm_Alu_serializer/internal_data[7]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[7]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[7]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[7]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[7]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[7]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[7]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[7]/Q} .original_name {u_mtm_Alu_serializer/internal_data[7]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[8]} .original_name {{u_mtm_Alu_serializer/internal_data[8]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[8]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[8]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[8]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[8]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[8]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[8]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[8]/Q} .original_name {u_mtm_Alu_serializer/internal_data[8]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[9]} .original_name {{u_mtm_Alu_serializer/internal_data[9]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[9]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[9]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[9]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[9]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[9]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[9]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[9]/Q} .original_name {u_mtm_Alu_serializer/internal_data[9]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[10]} .original_name {{u_mtm_Alu_serializer/internal_data[10]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[10]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[10]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[10]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[10]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[10]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[10]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[10]/Q} .original_name {u_mtm_Alu_serializer/internal_data[10]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[11]} .original_name {{u_mtm_Alu_serializer/internal_data[11]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[11]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[11]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[11]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[11]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[11]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[11]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[11]/Q} .original_name {u_mtm_Alu_serializer/internal_data[11]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[12]} .original_name {{u_mtm_Alu_serializer/internal_data[12]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[12]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[12]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[12]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[12]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[12]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[12]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[12]/Q} .original_name {u_mtm_Alu_serializer/internal_data[12]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[13]} .original_name {{u_mtm_Alu_serializer/internal_data[13]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[13]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[13]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[13]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[13]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[13]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[13]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[13]/Q} .original_name {u_mtm_Alu_serializer/internal_data[13]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[14]} .original_name {{u_mtm_Alu_serializer/internal_data[14]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[14]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[14]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[14]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[14]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[14]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[14]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[14]/Q} .original_name {u_mtm_Alu_serializer/internal_data[14]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[15]} .original_name {{u_mtm_Alu_serializer/internal_data[15]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[15]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[15]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[15]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[15]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[15]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[15]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[15]/Q} .original_name {u_mtm_Alu_serializer/internal_data[15]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[16]} .original_name {{u_mtm_Alu_serializer/internal_data[16]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[16]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[16]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[16]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[16]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[16]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[16]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[16]/Q} .original_name {u_mtm_Alu_serializer/internal_data[16]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[17]} .original_name {{u_mtm_Alu_serializer/internal_data[17]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[17]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[17]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[17]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[17]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[17]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[17]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[17]/Q} .original_name {u_mtm_Alu_serializer/internal_data[17]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[18]} .original_name {{u_mtm_Alu_serializer/internal_data[18]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[18]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[18]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[18]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[18]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[18]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[18]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[18]/Q} .original_name {u_mtm_Alu_serializer/internal_data[18]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[19]} .original_name {{u_mtm_Alu_serializer/internal_data[19]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[19]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[19]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[19]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[19]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[19]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[19]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[19]/Q} .original_name {u_mtm_Alu_serializer/internal_data[19]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[20]} .original_name {{u_mtm_Alu_serializer/internal_data[20]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[20]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[20]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[20]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[20]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[20]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[20]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[20]/Q} .original_name {u_mtm_Alu_serializer/internal_data[20]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[21]} .original_name {{u_mtm_Alu_serializer/internal_data[21]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[21]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[21]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[21]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[21]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[21]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[21]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[21]/Q} .original_name {u_mtm_Alu_serializer/internal_data[21]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[22]} .original_name {{u_mtm_Alu_serializer/internal_data[22]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[22]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[22]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[22]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[22]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[22]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[22]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[22]/Q} .original_name {u_mtm_Alu_serializer/internal_data[22]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[23]} .original_name {{u_mtm_Alu_serializer/internal_data[23]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[23]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[23]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[23]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[23]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[23]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[23]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[23]/Q} .original_name {u_mtm_Alu_serializer/internal_data[23]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[24]} .original_name {{u_mtm_Alu_serializer/internal_data[24]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[24]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[24]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[24]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[24]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[24]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[24]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[24]/Q} .original_name {u_mtm_Alu_serializer/internal_data[24]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[25]} .original_name {{u_mtm_Alu_serializer/internal_data[25]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[25]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[25]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[25]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[25]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[25]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[25]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[25]/Q} .original_name {u_mtm_Alu_serializer/internal_data[25]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[26]} .original_name {{u_mtm_Alu_serializer/internal_data[26]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[26]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[26]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[26]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[26]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[26]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[26]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[26]/Q} .original_name {u_mtm_Alu_serializer/internal_data[26]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[27]} .original_name {{u_mtm_Alu_serializer/internal_data[27]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[27]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[27]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[27]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[27]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[27]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[27]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[27]/Q} .original_name {u_mtm_Alu_serializer/internal_data[27]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[28]} .original_name {{u_mtm_Alu_serializer/internal_data[28]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[28]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[28]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[28]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[28]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[28]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[28]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[28]/Q} .original_name {u_mtm_Alu_serializer/internal_data[28]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[29]} .original_name {{u_mtm_Alu_serializer/internal_data[29]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[29]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[29]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[29]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[29]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[29]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[29]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[29]/Q} .original_name {u_mtm_Alu_serializer/internal_data[29]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[30]} .original_name {{u_mtm_Alu_serializer/internal_data[30]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[30]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[30]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[30]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[30]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[30]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[30]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[30]/Q} .original_name {u_mtm_Alu_serializer/internal_data[30]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[31]} .original_name {{u_mtm_Alu_serializer/internal_data[31]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[31]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[31]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_data[31]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[31]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[31]/NQ} .original_name {u_mtm_Alu_serializer/internal_data[31]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[31]/Q} .original_name {u_mtm_Alu_serializer/internal_data[31]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[0]} .original_name {{u_mtm_Alu_serializer/internal_errors[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[0]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_errors[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[0]/NQ} .original_name {u_mtm_Alu_serializer/internal_errors[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[0]/Q} .original_name {u_mtm_Alu_serializer/internal_errors[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[1]} .original_name {{u_mtm_Alu_serializer/internal_errors[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[1]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_errors[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[1]/NQ} .original_name {u_mtm_Alu_serializer/internal_errors[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[1]/Q} .original_name {u_mtm_Alu_serializer/internal_errors[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[2]} .original_name {{u_mtm_Alu_serializer/internal_errors[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[2]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_errors[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[2]/NQ} .original_name {u_mtm_Alu_serializer/internal_errors[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[2]/Q} .original_name {u_mtm_Alu_serializer/internal_errors[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[3]} .original_name {{u_mtm_Alu_serializer/internal_errors[3]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[3]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[3]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_errors[3]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[3]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[3]/NQ} .original_name {u_mtm_Alu_serializer/internal_errors[3]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[3]/Q} .original_name {u_mtm_Alu_serializer/internal_errors[3]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[4]} .original_name {{u_mtm_Alu_serializer/internal_errors[4]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[4]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[4]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_errors[4]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[4]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[4]/NQ} .original_name {u_mtm_Alu_serializer/internal_errors[4]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[4]/Q} .original_name {u_mtm_Alu_serializer/internal_errors[4]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[5]} .original_name {{u_mtm_Alu_serializer/internal_errors[5]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[5]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[5]} .single_bit_orig_name {u_mtm_Alu_serializer/internal_errors[5]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[5]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[5]/NQ} .original_name {u_mtm_Alu_serializer/internal_errors[5]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[5]/Q} .original_name {u_mtm_Alu_serializer/internal_errors[5]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[0]} .original_name {{u_mtm_Alu_serializer/pclk_ctr[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[0]} .single_bit_orig_name {u_mtm_Alu_serializer/pclk_ctr[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[0]/NQ} .original_name {u_mtm_Alu_serializer/pclk_ctr[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[0]/Q} .original_name {u_mtm_Alu_serializer/pclk_ctr[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[1]} .original_name {{u_mtm_Alu_serializer/pclk_ctr[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[1]} .single_bit_orig_name {u_mtm_Alu_serializer/pclk_ctr[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[1]/NQ} .original_name {u_mtm_Alu_serializer/pclk_ctr[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[1]/Q} .original_name {u_mtm_Alu_serializer/pclk_ctr[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[2]} .original_name {{u_mtm_Alu_serializer/pclk_ctr[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[2]} .single_bit_orig_name {u_mtm_Alu_serializer/pclk_ctr[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[2]/NQ} .original_name {u_mtm_Alu_serializer/pclk_ctr[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[2]/Q} .original_name {u_mtm_Alu_serializer/pclk_ctr[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[3]} .original_name {{u_mtm_Alu_serializer/pclk_ctr[3]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[3]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[3]} .single_bit_orig_name {u_mtm_Alu_serializer/pclk_ctr[3]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[3]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[3]/NQ} .original_name {u_mtm_Alu_serializer/pclk_ctr[3]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[3]/Q} .original_name {u_mtm_Alu_serializer/pclk_ctr[3]/q}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_serializer/serial_out_reg .original_name u_mtm_Alu_serializer/serial_out
set_db -quiet inst:mtm_Alu/u_mtm_Alu_serializer/serial_out_reg .orig_hdl_instantiated false
set_db -quiet inst:mtm_Alu/u_mtm_Alu_serializer/serial_out_reg .single_bit_orig_name u_mtm_Alu_serializer/serial_out
set_db -quiet inst:mtm_Alu/u_mtm_Alu_serializer/serial_out_reg .gint_phase_inversion false
set_db -quiet pin:mtm_Alu/u_mtm_Alu_serializer/serial_out_reg/NQ .original_name u_mtm_Alu_serializer/serial_out/q
set_db -quiet pin:mtm_Alu/u_mtm_Alu_serializer/serial_out_reg/Q .original_name u_mtm_Alu_serializer/serial_out/q
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/state_reg[0]} .original_name {{u_mtm_Alu_serializer/state[0]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/state_reg[0]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/state_reg[0]} .single_bit_orig_name {u_mtm_Alu_serializer/state[0]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/state_reg[0]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/state_reg[0]/NQ} .original_name {u_mtm_Alu_serializer/state[0]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/state_reg[0]/Q} .original_name {u_mtm_Alu_serializer/state[0]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/state_reg[1]} .original_name {{u_mtm_Alu_serializer/state[1]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/state_reg[1]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/state_reg[1]} .single_bit_orig_name {u_mtm_Alu_serializer/state[1]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/state_reg[1]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/state_reg[1]/NQ} .original_name {u_mtm_Alu_serializer/state[1]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/state_reg[1]/Q} .original_name {u_mtm_Alu_serializer/state[1]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/state_reg[2]} .original_name {{u_mtm_Alu_serializer/state[2]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/state_reg[2]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/state_reg[2]} .single_bit_orig_name {u_mtm_Alu_serializer/state[2]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/state_reg[2]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/state_reg[2]/NQ} .original_name {u_mtm_Alu_serializer/state[2]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/state_reg[2]/Q} .original_name {u_mtm_Alu_serializer/state[2]/q}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/state_reg[3]} .original_name {{u_mtm_Alu_serializer/state[3]}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/state_reg[3]} .orig_hdl_instantiated false
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/state_reg[3]} .single_bit_orig_name {u_mtm_Alu_serializer/state[3]}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/state_reg[3]} .gint_phase_inversion false
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/state_reg[3]/NQ} .original_name {u_mtm_Alu_serializer/state[3]/q}
set_db -quiet {pin:mtm_Alu/u_mtm_Alu_serializer/state_reg[3]/Q} .original_name {u_mtm_Alu_serializer/state[3]/q}
# BEGIN PHYSICAL ANNOTATION SECTION
# END PHYSICAL ANNOTATION SECTION
set_db -quiet hinst:mtm_Alu/u_mtm_Alu_core .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu.v 58 32}}
set_db -quiet hinst:mtm_Alu/u_mtm_Alu_core/addinc_add_59_36 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet hinst:mtm_Alu/u_mtm_Alu_core/gt_172_90 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/ack_reg .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 23}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2764 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 23}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2765 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2766 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2767 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2768 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2769 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2770 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2771 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2772 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2773 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2774 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2775 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2776 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2777 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2778 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2779 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2780 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 173 73}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2781 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2782 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2783 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2784 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2785 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2786 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2787 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2788 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2789 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2790 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2791 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2792 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2793 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2794 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2795 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2796 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2797 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 59 36}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2798 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 173 73}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g2799 .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 23}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[0]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 35}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[1]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 35}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[2]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 35}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/ALUFlags_reg[3]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 35}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/OP_Err_reg .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[0]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[1]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[2]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[3]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[4]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[5]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[6]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[7]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[8]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[9]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[10]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[11]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[12]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[13]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[14]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[15]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[16]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[17]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[18]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[19]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[20]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[21]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[22]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[23]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[24]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[25]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[26]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[27]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[28]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[29]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[30]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/Result_reg[31]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 34}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/alu_state_reg[0]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 25}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/alu_state_reg[1]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 25}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/alu_state_reg[2]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 25}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/crc_out_reg[0]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 9}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/crc_out_reg[1]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 9}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_core/crc_out_reg[2]} .file_row_col {{//home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_core.v 62 35}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6556 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6557 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6559 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6561 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6562 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6563 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6564 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6565 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6566 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6568 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6569 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6570 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6571 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6572 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6573 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6574 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6575 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6576 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6577 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6578 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6579 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6580 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6581 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6582 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6583 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6584 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6585 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6586 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6587 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6588 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6589 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6590 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6594 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6616 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6617 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6618 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6619 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6620 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6621 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6622 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6623 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6624 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6625 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6626 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6636 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6637 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6638 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6639 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6640 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6641 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6642 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6643 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6644 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6645 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6646 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6647 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6648 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6649 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6650 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6651 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6652 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6653 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6654 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6655 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6656 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6657 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6658 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6659 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6660 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6661 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6662 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6663 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6664 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6665 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6666 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6667 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6668 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6669 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6670 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6671 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6672 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6673 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6674 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6675 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6676 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6677 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6678 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6679 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6680 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6681 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6682 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6683 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6686 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6687 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6688 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6689 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6690 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6691 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6692 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6693 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6694 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6695 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6696 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6697 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6698 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6699 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6700 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6701 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6702 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6703 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6704 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6705 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6706 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6707 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6708 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6709 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6710 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6711 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6712 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6713 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6714 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6715 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6716 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6719 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6720 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6721 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6722 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6723 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6724 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6725 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6726 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6727 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6728 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6729 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6730 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6731 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6732 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6733 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6734 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6735 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6736 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6737 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6738 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6739 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6740 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6741 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6742 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6743 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6744 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6745 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6746 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6747 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6748 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6749 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6750 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6751 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6752 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6753 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6754 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6756 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6757 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6758 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6759 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6760 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6761 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6762 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6763 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6764 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6765 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6766 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6767 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6768 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6769 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6770 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6771 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6772 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6773 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6774 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6775 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6776 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6777 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6778 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6779 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6780 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6781 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6782 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6783 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6784 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6785 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6786 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6787 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6788 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6789 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6790 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6791 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6792 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6793 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6794 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6795 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6796 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6797 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6798 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6799 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6800 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6801 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6802 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6803 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6804 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6805 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6806 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6807 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6808 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6809 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6810 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6811 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6812 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6813 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6815 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6816 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6817 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6818 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6819 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6820 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6821 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6822 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6823 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6824 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6825 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6826 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6827 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6828 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6829 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6830 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6831 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6832 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6833 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6834 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6835 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6836 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6837 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6838 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6839 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6840 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6841 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6842 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6843 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6844 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6845 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6846 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6847 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6848 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6849 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6850 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6851 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6852 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6853 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6854 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6855 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6856 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6857 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6858 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6859 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6860 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6861 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6862 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6863 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6864 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6865 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6866 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6867 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6868 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6869 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6870 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6871 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6872 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6873 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6874 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6875 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6876 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6877 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6878 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6879 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6880 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6881 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6882 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6883 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6884 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6885 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6886 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6887 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6888 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6889 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6890 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6891 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6892 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6893 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6894 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6895 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6896 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6897 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6898 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6899 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6900 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6901 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6902 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6903 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6904 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6905 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6906 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6907 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6908 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6909 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6910 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6911 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6912 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6913 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6914 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6915 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6916 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6917 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6918 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6919 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6920 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6921 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6922 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6923 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6924 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6925 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6926 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6927 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6928 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6929 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6930 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6931 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6932 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6933 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6934 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6935 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6936 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6937 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6938 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6939 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6940 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6941 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6942 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6943 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6944 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6945 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6946 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6947 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6948 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6949 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6950 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6951 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6952 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6953 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6954 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6955 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6956 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6957 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6958 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6959 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6960 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6961 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6962 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6963 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6964 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6965 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6966 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6967 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6968 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6969 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6970 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6971 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6972 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6973 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6974 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6975 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6976 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6977 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6978 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6979 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6980 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6981 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6982 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6983 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6984 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6985 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6986 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6987 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6988 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6989 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6990 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6991 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6992 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6993 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6994 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6995 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6996 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6997 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6998 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g6999 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7000 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7001 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7002 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7003 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7004 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7005 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7006 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7007 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7008 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7009 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7010 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7011 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7012 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7013 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7014 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7015 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7016 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7017 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7018 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7019 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7020 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7021 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7022 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7023 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7024 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7025 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7026 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7027 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7028 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_core/g7029 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet hinst:mtm_Alu/u_mtm_Alu_deserializer .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu.v 45 48}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/ack_reg .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 19}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/frame_error_reg .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 27}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/crc_error_reg .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 25}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g5645 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 19}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g5646 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 27}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g5647 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 25}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g5648 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 106 16}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g5649 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 106 16}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g5650 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 106 16}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g5651 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 106 16}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g5652 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 106 16}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g5653 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 19}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[0]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[1]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[2]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[3]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 26}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[4]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 26}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/bit_counter_reg[5]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 26}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[0]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 22}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[1]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 22}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[2]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 22}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/crc_calc_reg[3]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 22}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[0]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[1]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[2]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[3]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[4]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[5]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[6]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[7]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[8]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[9]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[10]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[11]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[12]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[13]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[14]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[15]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[16]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[17]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[18]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[19]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[20]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[21]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[22]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[23]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[24]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[25]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[26]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[27]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[28]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[29]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[30]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_A_reg[31]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[0]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[1]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[2]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[3]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[4]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[5]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[6]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[7]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[8]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[9]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[10]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[11]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[12]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[13]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[14]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[15]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[16]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[17]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[18]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[19]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[20]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[21]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[22]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[23]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[24]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[25]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[26]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[27]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[28]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[29]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[30]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/data_out_B_reg[31]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 33}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[0]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 23}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[1]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 23}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[2]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 23}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/des_state_reg[3]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 600 56}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[0]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[1]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[2]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/frame_counter_reg[3]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 291 59}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/opcode_reg[0]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 5}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/opcode_reg[1]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 5}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/opcode_reg[2]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 5}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[0]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 215 36}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[1]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 215 36}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[2]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 215 36}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/oversample_counter_reg[3]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 282 36}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[0]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 38}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[1]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 38}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[2]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 38}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_crc_reg[3]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 38}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[0]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[1]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[2]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[3]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[4]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[5]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[6]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[7]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[8]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[9]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[10]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[11]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[12]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[13]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[14]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[15]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[16]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[17]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[18]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[19]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[20]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[21]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[22]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[23]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[24]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[25]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[26]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[27]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[28]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[29]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[30]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_A_reg[31]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[0]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[1]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[2]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[3]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[4]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[5]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[6]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[7]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[8]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[9]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[10]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[11]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[12]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[13]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[14]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[15]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[16]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[17]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[18]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[19]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[20]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[21]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[22]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[23]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[24]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[25]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[26]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[27]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[28]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[29]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[30]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_data_B_reg[31]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 42}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_opcode_reg[0]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 44}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_opcode_reg[1]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 104 44}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_deserializer/parallel_opcode_reg[2]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_deserializer.v 329 30}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11060 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11061 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11064 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11065 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11066 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11067 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11068 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11069 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11070 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11071 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11072 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11073 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11074 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11075 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11094 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11095 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11096 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11097 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11149 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11150 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11151 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11152 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11153 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11154 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11155 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11156 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11157 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11158 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11159 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11160 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11161 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11162 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11163 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11164 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11165 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11166 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11167 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11168 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11169 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11170 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11171 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11172 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11173 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11174 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11175 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11176 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11177 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11178 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11179 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11180 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11181 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11186 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11187 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11188 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11189 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11190 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11191 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11192 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11193 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11194 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11195 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11196 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11197 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11198 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11199 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11200 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11201 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11202 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11203 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11204 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11209 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11210 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11211 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11212 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11213 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11214 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11215 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11216 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11217 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11218 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11219 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11220 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11221 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11222 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11223 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11224 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11225 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11226 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11227 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11228 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11229 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11230 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11231 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11232 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11233 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11234 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11235 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11236 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11237 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11238 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11239 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11240 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11243 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11244 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11245 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11246 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11247 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11248 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11249 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11250 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11251 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11252 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11253 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11254 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11255 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11256 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11257 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11259 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11261 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11262 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11263 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11264 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11265 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11266 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11267 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11268 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11269 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11270 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11271 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11272 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11273 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11274 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11275 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11276 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11279 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11280 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11281 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11282 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11283 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11284 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11285 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11286 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11287 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11288 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11289 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11290 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11291 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11292 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11293 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11294 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11295 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11296 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11297 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11298 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11301 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11302 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11303 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11304 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11305 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11306 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11307 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11308 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11309 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11310 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11311 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11312 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11313 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11314 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11315 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11317 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11318 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11319 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11320 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11321 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11322 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11323 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11368 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11369 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11370 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11371 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11372 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11373 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11374 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11375 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11392 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11393 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11394 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11396 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11397 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11401 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11402 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11409 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11410 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11411 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11412 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11413 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11414 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11415 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11416 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11417 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11418 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11419 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11420 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11421 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11422 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11423 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11424 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11425 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11426 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11427 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11428 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11429 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11430 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11431 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11432 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11433 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11434 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11435 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11436 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11437 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11438 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11439 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11440 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11441 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11442 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11443 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11444 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11445 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11446 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11447 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11448 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11449 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11450 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11451 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11452 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11453 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11454 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11455 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11456 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11457 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11458 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11459 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11460 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11461 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11462 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11463 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11464 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11465 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11466 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11467 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11468 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11469 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11470 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11471 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11472 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11473 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11474 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11475 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11476 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11477 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11478 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11479 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11480 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11481 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11482 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11483 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11484 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11485 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11486 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11487 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11488 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11489 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11490 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11491 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11492 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11493 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11494 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11495 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11496 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11497 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11498 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11499 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11500 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11501 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11502 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11503 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11504 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11505 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11506 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11507 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11508 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11509 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11510 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11511 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11512 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11513 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11514 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11515 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11516 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11517 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11518 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11519 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11520 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11521 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11522 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11523 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11524 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11525 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11526 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11527 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11528 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11529 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11530 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11531 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11532 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11533 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11534 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11535 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11536 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11537 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11538 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11539 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11540 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11541 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11542 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11543 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11544 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11545 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11546 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11547 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11548 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11549 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11550 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11551 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11552 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11553 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11554 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11555 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11556 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11557 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11558 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11559 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11560 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11561 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11562 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11563 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11564 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11565 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11566 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11567 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11568 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11569 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11570 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11571 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11572 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11573 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11574 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11575 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11576 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11577 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11578 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11579 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11580 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11581 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11582 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11583 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11584 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11585 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11586 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11587 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11588 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11589 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11590 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11591 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11592 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11593 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11594 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11595 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11596 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11597 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11598 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11599 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11600 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11601 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11602 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11603 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11604 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11605 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11606 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11607 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11608 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11609 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11610 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11611 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11612 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11613 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11614 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11615 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11616 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11617 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11618 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11619 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11620 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11621 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11622 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11623 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11624 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11625 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11626 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11627 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11628 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11629 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11630 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11631 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11632 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11633 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11634 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11635 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11636 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11637 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11638 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11639 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11640 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11641 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11642 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11643 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11644 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11645 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11646 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11647 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11648 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11649 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11650 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11651 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11652 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11653 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11654 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11655 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11656 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11657 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11658 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11659 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11660 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11661 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11662 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11663 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11664 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11665 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11666 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11667 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11668 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11669 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11670 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11671 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11672 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11673 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11674 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11675 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11676 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11677 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11678 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11679 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11680 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11681 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11682 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11683 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11684 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11685 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11686 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11687 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11688 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11689 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11690 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11691 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11692 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11693 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11694 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11695 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11696 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11697 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11698 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11699 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11700 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11701 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11702 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11703 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11704 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11705 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11706 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11707 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11708 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11709 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11710 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11711 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11712 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11713 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11714 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11715 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11716 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11717 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11718 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11719 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11720 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11721 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11722 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11723 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11724 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11725 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11726 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11727 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11728 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11729 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11730 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11731 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11732 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11733 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11734 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11735 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11736 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11737 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11738 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11739 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11740 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11741 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11742 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11743 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11744 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11745 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11746 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11747 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11748 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11749 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11750 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11751 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11752 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11753 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11754 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11755 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11756 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11757 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11758 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11759 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11760 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11761 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11762 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11763 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11764 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11765 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11766 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11767 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11768 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11769 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11770 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11771 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11772 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11773 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11774 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11775 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11776 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11777 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11778 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11779 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11780 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11781 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11782 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11783 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11784 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11785 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11786 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11787 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11788 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11789 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11790 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11791 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11792 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11793 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11794 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11795 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11796 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11797 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11798 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11799 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11800 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11801 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11802 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11803 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11804 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_deserializer/g11805 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet hinst:mtm_Alu/u_mtm_Alu_serializer .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu.v 74 43}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_serializer/ack_reg .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 5}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[0]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 375 32}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[1]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 354 32}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[2]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 375 32}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[3]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 26}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/bit_counter_reg[4]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 26}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[0]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[1]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[2]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[3]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/frame_counter_reg[4]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[0]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 32}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[1]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 32}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[2]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 32}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_alu_flags_reg[3]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 32}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_crc_reg[0]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 26}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_crc_reg[1]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 26}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_crc_reg[2]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 26}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[0]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[1]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[2]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[3]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[4]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[5]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[6]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[7]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[8]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[9]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[10]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[11]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[12]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[13]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[14]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[15]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[16]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[17]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[18]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[19]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[20]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[21]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[22]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[23]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[24]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[25]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[26]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[27]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[28]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[29]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[30]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_data_reg[31]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 28}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[0]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 30}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[1]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 30}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[2]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 30}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[3]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 30}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[4]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 30}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/internal_errors_reg[5]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 30}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[0]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 21}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[1]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 21}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[2]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 21}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/pclk_ctr_reg[3]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 21}}
set_db -quiet inst:mtm_Alu/u_mtm_Alu_serializer/serial_out_reg .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 26}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/state_reg[0]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 20}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/state_reg[1]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 20}}
set_db -quiet {inst:mtm_Alu/u_mtm_Alu_serializer/state_reg[2]} .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu_serializer.v 92 20}}
set_db -quiet inst:mtm_Alu/g2 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu.v 45 48}}
set_db -quiet inst:mtm_Alu/g3 .file_row_col {{/home/student/awindak/PPCU_VLSI/projekt_ALU_U_W/rtl/mtm_Alu.v 74 43}}
# there is no file_row_col attribute information available
set_db -quiet source_verbose true
#############################################################
#####   FLOW WRITE   ########################################
##
## Written by Genus(TM) Synthesis Solution version 17.13-s033_1
## Written on 16:24:14 11-Sep 2019
#############################################################
#####   Flow Definitions   ##################################

#############################################################
#####   Step Definitions   ##################################


#############################################################
#####   Attribute Definitions   #############################

if {[is_attribute flow_edit_wildcard_end_steps -obj_type root]} {set_db flow_edit_wildcard_end_steps {}}
if {[is_attribute flow_edit_wildcard_start_steps -obj_type root]} {set_db flow_edit_wildcard_start_steps {}}
if {[is_attribute flow_footer_tcl -obj_type root]} {set_db flow_footer_tcl {}}
if {[is_attribute flow_header_tcl -obj_type root]} {set_db flow_header_tcl {}}
if {[is_attribute flow_metadata -obj_type root]} {set_db flow_metadata {}}
if {[is_attribute flow_step_begin_tcl -obj_type root]} {set_db flow_step_begin_tcl {}}
if {[is_attribute flow_step_check_tcl -obj_type root]} {set_db flow_step_check_tcl {}}
if {[is_attribute flow_step_end_tcl -obj_type root]} {set_db flow_step_end_tcl {}}
if {[is_attribute flow_step_order -obj_type root]} {set_db flow_step_order {}}
if {[is_attribute flow_summary_tcl -obj_type root]} {set_db flow_summary_tcl {}}
if {[is_attribute flow_template_feature_definition -obj_type root]} {set_db flow_template_feature_definition {}}
if {[is_attribute flow_template_type -obj_type root]} {set_db flow_template_type {}}
if {[is_attribute flow_template_version -obj_type root]} {set_db flow_template_version {}}
if {[is_attribute flow_user_templates -obj_type root]} {set_db flow_user_templates {}}


#############################################################
#####   Flow History   ######################################

if {[is_attribute flow_branch -obj_type root]} {set_db flow_branch {}}
if {[is_attribute flow_caller_data -obj_type root]} {set_db flow_caller_data {}}
if {[is_attribute flow_current -obj_type root]} {set_db flow_current {}}
if {[is_attribute flow_hier_path -obj_type root]} {set_db flow_hier_path {}}
if {[is_attribute flow_database_directory -obj_type root]} {set_db flow_database_directory dbs}
if {[is_attribute flow_exit_when_done -obj_type root]} {set_db flow_exit_when_done false}
if {[is_attribute flow_history -obj_type root]} {set_db flow_history {}}
if {[is_attribute flow_log_directory -obj_type root]} {set_db flow_log_directory logs}
if {[is_attribute flow_mail_on_error -obj_type root]} {set_db flow_mail_on_error false}
if {[is_attribute flow_mail_to -obj_type root]} {set_db flow_mail_to {}}
if {[is_attribute flow_metrics_file -obj_type root]} {set_db flow_metrics_file {}}
if {[is_attribute flow_metrics_snapshot_parent_uuid -obj_type root]} {set_db flow_metrics_snapshot_parent_uuid {}}
if {[is_attribute flow_metrics_snapshot_uuid -obj_type root]} {set_db flow_metrics_snapshot_uuid 0a7bb4f8}
if {[is_attribute flow_overwrite_database -obj_type root]} {set_db flow_overwrite_database false}
if {[is_attribute flow_report_directory -obj_type root]} {set_db flow_report_directory reports}
if {[is_attribute flow_run_tag -obj_type root]} {set_db flow_run_tag {}}
if {[is_attribute flow_schedule -obj_type root]} {set_db flow_schedule {}}
if {[is_attribute flow_script -obj_type root]} {set_db flow_script {}}
if {[is_attribute flow_starting_db -obj_type root]} {set_db flow_starting_db {}}
if {[is_attribute flow_status_file -obj_type root]} {set_db flow_status_file {}}
if {[is_attribute flow_step_canonical_current -obj_type root]} {set_db flow_step_canonical_current {}}
if {[is_attribute flow_step_current -obj_type root]} {set_db flow_step_current {}}
if {[is_attribute flow_step_last -obj_type root]} {set_db flow_step_last {}}
if {[is_attribute flow_step_last_msg -obj_type root]} {set_db flow_step_last_msg {}}
if {[is_attribute flow_step_last_status -obj_type root]} {set_db flow_step_last_status not_run}
if {[is_attribute flow_step_next -obj_type root]} {set_db flow_step_next {}}
if {[is_attribute flow_working_directory -obj_type root]} {set_db flow_working_directory .}

#############################################################
#####   User Defined Attributes   ###########################

