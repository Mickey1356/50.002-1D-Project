set projDir "C:/Users/Nicholas/Desktop/Computation Structures/1D Project/50.002-1D-Project-master/50.002-1D-Project-master/work/planAhead"
set projName "1D"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Nicholas/Desktop/Computation Structures/1D Project/50.002-1D-Project-master/50.002-1D-Project-master/work/verilog/mojo_top_0.v" "C:/Users/Nicholas/Desktop/Computation Structures/1D Project/50.002-1D-Project-master/50.002-1D-Project-master/work/verilog/game_loop_1.v" "C:/Users/Nicholas/Desktop/Computation Structures/1D Project/50.002-1D-Project-master/50.002-1D-Project-master/work/verilog/state_counter_2.v" "C:/Users/Nicholas/Desktop/Computation Structures/1D Project/50.002-1D-Project-master/50.002-1D-Project-master/work/verilog/game_controller_3.v" "C:/Users/Nicholas/Desktop/Computation Structures/1D Project/50.002-1D-Project-master/50.002-1D-Project-master/work/verilog/tile_led_4.v" "C:/Users/Nicholas/Desktop/Computation Structures/1D Project/50.002-1D-Project-master/50.002-1D-Project-master/work/verilog/led_flasher_5.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/Nicholas/Desktop/Computation\ Structures/1D\ Project/50.002-1D-Project-master/50.002-1D-Project-master/constraint/game.ucf" "C:/Users/Nicholas/Desktop/Computation\ Structures/1D\ Project/50.002-1D-Project-master/50.002-1D-Project-master/constraint/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
