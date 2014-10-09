#
# Vivado (TM) v2013.4 (64-bit)
#
# build_ip.tcl: Tcl script for re-creating project 'axi_hdmi_tx_v1_00_a'
#
# Generated by Vivado on Thu Feb 20 17:45:23 +1100 2014
# IP Build 208076 on Mon Dec  2 12:38:17 MST 2013
#
# This file contains the Vivado Tcl commands for re-creating the project to the state*
# when this script was generated. In order to re-create the project, please source this
# file in the Vivado Tcl Shell.
#
# * Note that the runs in the created project will be configured the same way as the
#   original project, however they will not be launched automatically. To regenerate the
#   run results please launch the synthesis/implementation runs as needed.
#
#*****************************************************************************************

# Set the original project directory path for adding/importing sources in the new project
set orig_proj_dir "../axi_hdmi_tx_v1_00_a"

# Create project
create_project -force axi_hdmi_tx_v1_00_a ../axi_hdmi_tx_v1_00_a

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [get_projects axi_hdmi_tx_v1_00_a]
set_property "board" "xilinx.com:zynq:zc706:1.1" $obj
set_property "simulator_language" "Mixed" $obj
set_property "target_language" "VHDL" $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Add files to 'sources' fileset
add_files -norecurse sources/ad_mem.v
add_files -norecurse sources/ad_rst.v
add_files -norecurse sources/ad_csc_1_mul.v
add_files -norecurse sources/ad_csc_1_add.v
add_files -norecurse sources/ad_csc_1.v
add_files -norecurse sources/ad_csc_RGB2CrYCb.v
add_files -norecurse sources/ad_ss_444to422.v
add_files -norecurse sources/up_axi.v
add_files -norecurse sources/up_xfer_cntrl.v
add_files -norecurse sources/up_xfer_status.v
add_files -norecurse sources/up_clock_mon.v
add_files -norecurse sources/up_hdmi_tx.v
add_files -norecurse sources/axi_hdmi_tx_vdma.v
add_files -norecurse sources/axi_hdmi_tx_core.v
add_files -norecurse sources/axi_hdmi_tx.v

# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property "ip_repo_paths" "../../XilinxIP" $obj
set_property "top" "axi_hdmi_tx" $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Add files to 'constrs_1' fileset
set obj [get_filesets constrs_1]
# Empty (no sources present)

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets sim_1] ""]} {
  create_fileset -simset sim_1
}

# Add files to 'sim_1' fileset
set obj [get_filesets sim_1]
# Empty (no sources present)

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property "top" "axi_hdmi_tx" $obj

# Create 'synth_1' run (if not found)
if {[string equal [get_runs synth_1] ""]} {
  create_run -name synth_1 -part xc7z045ffg900-2 -flow {Vivado Synthesis 2014} -strategy "Vivado Synthesis Defaults" -constrset constrs_1
}
set obj [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs impl_1] ""]} {
  create_run -name impl_1 -part xc7z045ffg900-2 -flow {Vivado Implementation 2014} -strategy "Vivado Implementation Defaults" -constrset constrs_1 -parent_run synth_1
}
set obj [get_runs impl_1]

ipx::package_project -root_dir {../axi_hdmi_tx_v1_00_a}

ipx::remove_memory_map {s_axi} [ipx::current_core]
ipx::add_memory_map {s_axi} [ipx::current_core]
set_property slave_memory_map_ref {s_axi} [ipx::get_bus_interface s_axi [ipx::current_core]]
ipx::add_address_block {reg0} [ipx::get_memory_map s_axi [ipx::current_core]]
set_property range {65536} [ipx::get_address_block reg0 [ipx::get_memory_map s_axi [ipx::current_core]]]

set_property vendor {kutu.com.au} [ipx::current_core]
set_property library {kutu} [ipx::current_core]
set_property taxonomy {{/Kutu}} [ipx::current_core]
set_property vendor_display_name {Kutu Pty. Ltd.} [ipx::current_core]
set_property company_url {www.kutu.com.au} [ipx::current_core]
  
set_property value {0xFFFFFFFF} [ipx::get_hdl_parameter C_HIGHADDR [ipx::current_core]]
set_property value {0x00000000} [ipx::get_hdl_parameter C_BASEADDR [ipx::current_core]]

set_property supported_families \
    {{virtex7}    {Production} \
     {qvirtex7}   {Production} \
     {kintex7}    {Production} \
     {kintex7l}   {Production} \
     {qkintex7}   {Production} \
     {qkintex7l}  {Production} \
     {artix7}     {Production} \
     {artix7l}    {Production} \
     {aartix7}    {Production} \
     {qartix7}    {Production} \
     {zynq}       {Production} \
     {qzynq}      {Production} \
     {azynq}      {Production}} \
  [ipx::current_core]

ipx::create_xgui_files [ipx::current_core]
ipx::save_core [ipx::current_core]
update_ip_catalog -rebuild -repo_path ../../XilinxIP
ipx::check_integrity -quiet [ipx::current_core]
ipx::unload_core {kutu.com.au:kutu:axi_hdmi_tx:1.0}
