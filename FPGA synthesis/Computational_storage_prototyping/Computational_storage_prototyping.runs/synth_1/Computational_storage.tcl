# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xczu7ev-ffvc1156-2-e

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {F:/Aloshka/Siemens internship/Hardware verification engineer project/Project/FPGA synthesis/Computational_storage_prototyping/Computational_storage_prototyping.cache/wt} [current_project]
set_property parent.project_path {F:/Aloshka/Siemens internship/Hardware verification engineer project/Project/FPGA synthesis/Computational_storage_prototyping/Computational_storage_prototyping.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part xilinx.com:zcu104:part0:1.1 [current_project]
set_property ip_output_repo {f:/Aloshka/Siemens internship/Hardware verification engineer project/Project/FPGA synthesis/Computational_storage_prototyping/Computational_storage_prototyping.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib -sv {
  {F:/Aloshka/Siemens internship/Hardware verification engineer project/Project/FPGA synthesis/Computational_storage_prototyping/Computational_storage_prototyping.srcs/sources_1/imports/Design/Arithmetic_unit.sv}
  {F:/Aloshka/Siemens internship/Hardware verification engineer project/Project/FPGA synthesis/Computational_storage_prototyping/Computational_storage_prototyping.srcs/sources_1/imports/Design/Controller.sv}
  {F:/Aloshka/Siemens internship/Hardware verification engineer project/Project/FPGA synthesis/Computational_storage_prototyping/Computational_storage_prototyping.srcs/sources_1/imports/Design/Dual_port_RAM.sv}
  {F:/Aloshka/Siemens internship/Hardware verification engineer project/Project/FPGA synthesis/Computational_storage_prototyping/Computational_storage_prototyping.srcs/sources_1/imports/Design/Computational_storage.sv}
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{F:/Aloshka/Siemens internship/Hardware verification engineer project/Project/FPGA synthesis/Computational_storage_prototyping/Computational_storage_prototyping.srcs/constrs_1/imports/new/timing.xdc}}
set_property used_in_implementation false [get_files {{F:/Aloshka/Siemens internship/Hardware verification engineer project/Project/FPGA synthesis/Computational_storage_prototyping/Computational_storage_prototyping.srcs/constrs_1/imports/new/timing.xdc}}]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top Computational_storage -part xczu7ev-ffvc1156-2-e -fanout_limit 100 -retiming -fsm_extraction one_hot -keep_equivalent_registers -resource_sharing off -no_lc -cascade_dsp tree


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Computational_storage.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Computational_storage_utilization_synth.rpt -pb Computational_storage_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
