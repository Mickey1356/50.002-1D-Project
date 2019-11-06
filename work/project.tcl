set projDir "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/planAhead"
set projName "1D"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/mojo_top_0.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/vga_1.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/square_2.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/square_3.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/square_4.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/alu_tester_5.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/multi_seven_seg_6.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/auto_tester_7.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/manual_tester_8.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/counter_9.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/seven_seg_10.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/decoder_11.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/alu_12.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/alu_12.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/adder16_14.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/bool16_15.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/shift16_16.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/cmp16_17.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/muldiv16_18.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/adder16_14.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/bool16_15.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/shift16_16.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/cmp16_17.v" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term 4/Computational Structures/Projects/1D/work/verilog/muldiv16_18.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term\ 4/Computational\ Structures/Projects/1D/constraint/mojo.ucf" "C:/Users/jerem_000/Documents/Stuff/School/SUTD/Term\ 4/Computational\ Structures/Projects/1D/constraint/vga.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf"]
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
