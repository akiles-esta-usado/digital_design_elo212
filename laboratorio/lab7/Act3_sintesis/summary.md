Synthesis finished with 0 errors, 0 critical warnings and 3 warnings.
Synthesis Optimization Runtime : Time (s): cpu = 00:00:24 ; elapsed = 00:00:30 . Memory (MB): peak = 1849.289 ; gain = 382.535 ; free physical = 188 ; free virtual = 2724
Synthesis Optimization Complete : Time (s): cpu = 00:00:24 ; elapsed = 00:00:30 . Memory (MB): peak = 1849.297 ; gain = 382.535 ; free physical = 188 ; free virtual = 2724
INFO: [Project 1-571] Translating synthesized netlist
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.01 . Memory (MB): peak = 1861.195 ; gain = 0.000 ; free physical = 249 ; free virtual = 2790
INFO: [Netlist 29-17] Analyzing 16 Unisim elements for replacement
INFO: [Netlist 29-28] Unisim Transformation completed in 0 CPU seconds
INFO: [Project 1-570] Preparing netlist for logic optimization
INFO: [Opt 31-138] Pushed 0 inverter(s) to 0 load pin(s).
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 1949.957 ; gain = 0.000 ; free physical = 161 ; free virtual = 2714
INFO: [Project 1-111] Unisim Transformation Summary:
No Unisim elements were transformed.

INFO: [Common 17-83] Releasing license: Synthesis
69 Infos, 3 Warnings, 0 Critical Warnings and 0 Errors encountered.
synth_design completed successfully
synth_design: Time (s): cpu = 00:00:32 ; elapsed = 00:00:38 . Memory (MB): peak = 1949.957 ; gain = 483.445 ; free physical = 294 ; free virtual = 2848
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 1949.957 ; gain = 0.000 ; free physical = 294 ; free virtual = 2848
WARNING: [Constraints 18-5210] No constraints selected for write.
Resolution: This message can indicate that there are no constraints for the design, or it can indicate that the used_in flags are set such that the constraints are ignored. This later case is used when running synth_design to not write synthesis constraints to the resulting checkpoint. Instead, project constraints are read when the synthesized design is opened.
INFO: [Common 17-1381] The checkpoint '/apps/projects/ELO212-lab7_2_3/ELO212-lab7_2_3.runs/synth_1/Act3_RPCalculator.dcp' has been generated.
INFO: [runtcl-4] Executing : report_utilization -file Act3_RPCalculator_utilization_synth.rpt -pb Act3_RPCalculator_utilization_synth.pb
INFO: [Common 17-206] Exiting Vivado at Fri Jul 31 13:08:22 2020...

