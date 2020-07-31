---------------------------------------------------------------------------------
Start Cross Boundary and Area Optimization
---------------------------------------------------------------------------------
Warning: Parallel synthesis criteria is not met 
INFO: [Synth 8-4471] merging register 'sync/PB_sync_aux_reg' into 'RPCalc_inst/sync/PB_sync_aux_reg' [/apps/projects/sources/lab7/Act2_3/synchronizer.sv:12]
INFO: [Synth 8-4471] merging register 'sync/o_PB_sync_reg' into 'RPCalc_inst/sync/o_PB_sync_reg' [/apps/projects/sources/lab7/Act2_3/synchronizer.sv:13]
WARNING: [Synth 8-3936] Found unconnected internal register 'translator_inst/conv/to_bcd_inst/bcd_reg' and it is trimmed from '32' to '20' bits. [/apps/projects/sources/lab7/Act2_3/unsigned_to_bcd.sv:130]
INFO: [Synth 8-3886] merging instance 'RPCalc_inst/status_button/state_reg[5]' (FDR) to 'status_button_undo/state_reg[3]'
INFO: [Synth 8-3886] merging instance 'RPCalc_inst/status_button/state_reg[4]' (FDR) to 'status_button_undo/state_reg[3]'
INFO: [Synth 8-3886] merging instance 'RPCalc_inst/status_button/state_reg[3]' (FDR) to 'status_button_undo/state_reg[3]'
INFO: [Synth 8-3886] merging instance 'RPCalc_inst/status_button_undo/state_reg[5]' (FDR) to 'status_button_undo/state_reg[3]'
INFO: [Synth 8-3886] merging instance 'RPCalc_inst/status_button_undo/state_reg[4]' (FDR) to 'status_button_undo/state_reg[3]'
INFO: [Synth 8-3886] merging instance 'RPCalc_inst/status_button_undo/state_reg[3]' (FDR) to 'status_button_undo/state_reg[3]'
INFO: [Synth 8-3886] merging instance 'RPCalc_inst/pol_cal/ALU_inst/o_Result_reg[15]' (FDRE) to 'RPCalc_inst/pol_cal/ALU_inst/o_Flags_reg[3]'
INFO: [Synth 8-3886] merging instance 'status_button_undo/state_reg[5]' (FDR) to 'status_button_undo/state_reg[3]'
INFO: [Synth 8-3886] merging instance 'status_button_undo/state_reg[4]' (FDR) to 'status_button_undo/state_reg[3]'
INFO: [Synth 8-3333] propagating constant 0 across sequential element (\status_button_undo/state_reg[3] )
---------------------------------------------------------------------------------
Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:18 ; elapsed = 00:00:23 . Memory (MB): peak = 1828.785 ; gain = 358.566 ; free physical = 196 ; free virtual = 2834
---------------------------------------------------------------------------------
