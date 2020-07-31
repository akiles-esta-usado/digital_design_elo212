Synthesis finished with 0 errors, 0 critical warnings and 0 warnings.
Synthesis Optimization Runtime : Time (s): cpu = 00:00:23 ; elapsed = 00:00:30 . Memory (MB): peak = 1823.703 ; gain = 352.520 ; free physical = 178 ; free virtual = 3279
Synthesis Optimization Complete : Time (s): cpu = 00:00:23 ; elapsed = 00:00:30 . Memory (MB): peak = 1823.711 ; gain = 352.520 ; free physical = 178 ; free virtual = 3279
INFO: [Project 1-571] Translating synthesized netlist
Netlist sorting complete. Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.02 . Memory (MB): peak = 1836.578 ; gain = 0.000 ; free physical = 240 ; free virtual = 3344
INFO: [Netlist 29-17] Analyzing 14 Unisim elements for replacement
INFO: [Netlist 29-28] Unisim Transformation completed in 0 CPU seconds
INFO: [Project 1-570] Preparing netlist for logic optimization
INFO: [Opt 31-138] Pushed 0 inverter(s) to 0 load pin(s).
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 1933.277 ; gain = 0.000 ; free physical = 149 ; free virtual = 3267
INFO: [Project 1-111] Unisim Transformation Summary:
No Unisim elements were transformed.

INFO: [Common 17-83] Releasing license: Synthesis
37 Infos, 0 Warnings, 0 Critical Warnings and 0 Errors encountered.
synth_design completed successfully
synth_design: Time (s): cpu = 00:00:31 ; elapsed = 00:00:37 . Memory (MB): peak = 1933.277 ; gain = 462.336 ; free physical = 283 ; free virtual = 3400
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 1933.277 ; gain = 0.000 ; free physical = 283 ; free virtual = 3401
WARNING: [Constraints 18-5210] No constraints selected for write.
Resolution: This message can indicate that there are no constraints for the design, or it can indicate that the used_in flags are set such that the constraints are ignored. This later case is used when running synth_design to not write synthesis constraints to the resulting checkpoint. Instead, project constraints are read when the synthesized design is opened.
INFO: [Common 17-1381] The checkpoint '/apps/projects/ELO212-lab7_2_3/ELO212-lab7_2_3.runs/synth_1/Act2_RPCalculator.dcp' has been generated.
INFO: [runtcl-4] Executing : report_utilization -file Act2_RPCalculator_utilization_synth.rpt -pb Act2_RPCalculator_utilization_synth.pb
INFO: [Common 17-206] Exiting Vivado at Thu Jul 30 17:06:42 2020...

