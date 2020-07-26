# Síntesis de level_to_pulse.sv

*** Running vivado
    with args -log level_to_pulse.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source level_to_pulse.tcl


****** Vivado v2019.2 (64-bit)
  **** SW Build 2708876 on Wed Nov  6 21:39:14 MST 2019
  **** IP Build 2700528 on Thu Nov  7 00:09:20 MST 2019
    ** Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.

source level_to_pulse.tcl -notrace
Command: synth_design -top level_to_pulse -part xc7a100tcsg324-1
Starting synth_design
Attempting to get a license for feature 'Synthesis' and/or device 'xc7a100t'
INFO: [Common 17-349] Got license for feature 'Synthesis' and/or device 'xc7a100t'
INFO: Launching helper process for spawning children vivado processes
INFO: Helper process launched with PID 13113 





---------------------------------------------------------------------------------
Starting Synthesize : Time (s): cpu = 00:00:06 ; elapsed = 00:00:08 . Memory (MB): peak = 1607.695 ; gain = 137.477 ; free physical = 448 ; free virtual = 3430
---------------------------------------------------------------------------------
INFO: [Synth 8-6157] synthesizing module 'level_to_pulse' [/apps/projects/sources/lab6/level_pulse_conv/level_to_pulse.sv:2]
INFO: [Synth 8-5534] Detected attribute (* fsm_encoding = "one_hot" *) [/apps/projects/sources/lab6/level_pulse_conv/level_to_pulse.sv:15]
INFO: [Synth 8-155] case statement is not full and has no default [/apps/projects/sources/lab6/level_pulse_conv/level_to_pulse.sv:27]
INFO: [Synth 8-6155] done synthesizing module 'level_to_pulse' (1#1) [/apps/projects/sources/lab6/level_pulse_conv/level_to_pulse.sv:2]
---------------------------------------------------------------------------------
Finished Synthesize : Time (s): cpu = 00:00:08 ; elapsed = 00:00:10 . Memory (MB): peak = 1668.445 ; gain = 198.227 ; free physical = 485 ; free virtual = 3468
---------------------------------------------------------------------------------





---------------------------------------------------------------------------------
Finished Constraint Validation : Time (s): cpu = 00:00:08 ; elapsed = 00:00:11 . Memory (MB): peak = 1668.445 ; gain = 198.227 ; free physical = 480 ; free virtual = 3463
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Loading Part and Timing Information
---------------------------------------------------------------------------------
Loading part: xc7a100tcsg324-1
---------------------------------------------------------------------------------
INFO: [Device 21-403] Loading part xc7a100tcsg324-1
Finished Loading Part and Timing Information : Time (s): cpu = 00:00:09 ; elapsed = 00:00:11 . Memory (MB): peak = 1676.449 ; gain = 206.230 ; free physical = 479 ; free virtual = 3462





---------------------------------------------------------------------------------
INFO: [Synth 8-802] inferred FSM for state register 'pr_state_reg' in module 'level_to_pulse'
---------------------------------------------------------------------------------------------------
                   State |                     New Encoding |                Previous Encoding 
---------------------------------------------------------------------------------------------------
                    DOWN |                             0001 |                            00000
                    RISE |                             0010 |                            00001
                      UP |                             0100 |                            00010
                    FALL |                             1000 |                            00011
---------------------------------------------------------------------------------------------------
INFO: [Synth 8-3354] encoded FSM with state register 'pr_state_reg' using encoding 'one-hot' in module 'level_to_pulse'
---------------------------------------------------------------------------------
Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:11 . Memory (MB): peak = 1685.355 ; gain = 215.137 ; free physical = 470 ; free virtual = 3454
---------------------------------------------------------------------------------







Report RTL Partitions: 
+-+--------------+------------+----------+
| |RTL Partition |Replication |Instances |
+-+--------------+------------+----------+
+-+--------------+------------+----------+
No constraint files found.
---------------------------------------------------------------------------------
Start RTL Component Statistics 
---------------------------------------------------------------------------------
Detailed RTL Component Info : 
+---Muxes : 
	   4 Input      4 Bit        Muxes := 1     
	   2 Input      4 Bit        Muxes := 2     
	   4 Input      1 Bit        Muxes := 1     
---------------------------------------------------------------------------------
Finished RTL Component Statistics 
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start RTL Hierarchical Component Statistics 
---------------------------------------------------------------------------------
Hierarchical RTL Component report 
Module level_to_pulse 
Detailed RTL Component Info : 
+---Muxes : 
	   4 Input      4 Bit        Muxes := 1     
	   2 Input      4 Bit        Muxes := 2     
	   4 Input      1 Bit        Muxes := 1     
---------------------------------------------------------------------------------
Finished RTL Hierarchical Component Statistics
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Part Resource Summary
---------------------------------------------------------------------------------
Part Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
---------------------------------------------------------------------------------
Finished Part Resource Summary
---------------------------------------------------------------------------------
No constraint files found.
---------------------------------------------------------------------------------
Start Cross Boundary and Area Optimization
---------------------------------------------------------------------------------
Warning: Parallel synthesis criteria is not met 
---------------------------------------------------------------------------------
Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:15 ; elapsed = 00:00:20 . Memory (MB): peak = 1818.668 ; gain = 348.449 ; free physical = 261 ; free virtual = 3247
---------------------------------------------------------------------------------

Report RTL Partitions: 
+-+--------------+------------+----------+
| |RTL Partition |Replication |Instances |
+-+--------------+------------+----------+
+-+--------------+------------+----------+
No constraint files found.
---------------------------------------------------------------------------------
Start Timing Optimization
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Timing Optimization : Time (s): cpu = 00:00:15 ; elapsed = 00:00:20 . Memory (MB): peak = 1818.668 ; gain = 348.449 ; free physical = 260 ; free virtual = 3245
---------------------------------------------------------------------------------

Report RTL Partitions: 
+-+--------------+------------+----------+
| |RTL Partition |Replication |Instances |
+-+--------------+------------+----------+
+-+--------------+------------+----------+
---------------------------------------------------------------------------------
Start Technology Mapping
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Technology Mapping : Time (s): cpu = 00:00:16 ; elapsed = 00:00:21 . Memory (MB): peak = 1818.668 ; gain = 348.449 ; free physical = 259 ; free virtual = 3245
---------------------------------------------------------------------------------

Report RTL Partitions: 
+-+--------------+------------+----------+
| |RTL Partition |Replication |Instances |
+-+--------------+------------+----------+
+-+--------------+------------+----------+
---------------------------------------------------------------------------------
Start IO Insertion
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Flattening Before IO Insertion
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Flattening Before IO Insertion
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Final Netlist Cleanup
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Final Netlist Cleanup
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished IO Insertion : Time (s): cpu = 00:00:21 ; elapsed = 00:00:26 . Memory (MB): peak = 1818.668 ; gain = 348.449 ; free physical = 249 ; free virtual = 3239
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Renaming Generated Instances
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Renaming Generated Instances : Time (s): cpu = 00:00:21 ; elapsed = 00:00:26 . Memory (MB): peak = 1818.668 ; gain = 348.449 ; free physical = 249 ; free virtual = 3239
---------------------------------------------------------------------------------

Report RTL Partitions: 
+-+--------------+------------+----------+
| |RTL Partition |Replication |Instances |
+-+--------------+------------+----------+
+-+--------------+------------+----------+

Report Check Netlist: 
+------+------------------+-------+---------+-------+------------------+
|      |Item              |Errors |Warnings |Status |Description       |
+------+------------------+-------+---------+-------+------------------+
|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
+------+------------------+-------+---------+-------+------------------+
---------------------------------------------------------------------------------
Start Rebuilding User Hierarchy
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:21 ; elapsed = 00:00:26 . Memory (MB): peak = 1818.668 ; gain = 348.449 ; free physical = 249 ; free virtual = 3239
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Renaming Generated Ports
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Renaming Generated Ports : Time (s): cpu = 00:00:21 ; elapsed = 00:00:26 . Memory (MB): peak = 1818.668 ; gain = 348.449 ; free physical = 248 ; free virtual = 3239
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Handling Custom Attributes
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Handling Custom Attributes : Time (s): cpu = 00:00:21 ; elapsed = 00:00:26 . Memory (MB): peak = 1818.668 ; gain = 348.449 ; free physical = 248 ; free virtual = 3239
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Renaming Generated Nets
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Renaming Generated Nets : Time (s): cpu = 00:00:21 ; elapsed = 00:00:26 . Memory (MB): peak = 1818.668 ; gain = 348.449 ; free physical = 248 ; free virtual = 3239
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Writing Synthesis Report
---------------------------------------------------------------------------------

Report BlackBoxes: 
+-+--------------+----------+
| |BlackBox name |Instances |
+-+--------------+----------+
+-+--------------+----------+

Report Cell Usage: 
+------+-----+------+
|      |Cell |Count |
+------+-----+------+
|1     |BUFG |     1|
|2     |LUT2 |     2|
|3     |LUT3 |     2|
|4     |LUT5 |     1|
|5     |FDRE |     3|
|6     |FDSE |     1|
|7     |IBUF |     3|
|8     |OBUF |     2|
+------+-----+------+

Report Instance Areas: 
+------+---------+-------+------+
|      |Instance |Module |Cells |
+------+---------+-------+------+
|1     |top      |       |    15|
+------+---------+-------+------+
---------------------------------------------------------------------------------
Finished Writing Synthesis Report : Time (s): cpu = 00:00:21 ; elapsed = 00:00:26 . Memory (MB): peak = 1818.668 ; gain = 348.449 ; free physical = 248 ; free virtual = 3239
---------------------------------------------------------------------------------




Synthesis finished with 0 errors, 0 critical warnings and 0 warnings.
Synthesis Optimization Runtime : Time (s): cpu = 00:00:21 ; elapsed = 00:00:26 . Memory (MB): peak = 1818.668 ; gain = 348.449 ; free physical = 251 ; free virtual = 3241
Synthesis Optimization Complete : Time (s): cpu = 00:00:21 ; elapsed = 00:00:26 . Memory (MB): peak = 1818.676 ; gain = 348.449 ; free physical = 251 ; free virtual = 3241
INFO: [Project 1-571] Translating synthesized netlist
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 1831.543 ; gain = 0.000 ; free physical = 314 ; free virtual = 3304
INFO: [Project 1-570] Preparing netlist for logic optimization
INFO: [Opt 31-138] Pushed 0 inverter(s) to 0 load pin(s).
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 1929.242 ; gain = 0.000 ; free physical = 232 ; free virtual = 3222
INFO: [Project 1-111] Unisim Transformation Summary:
No Unisim elements were transformed.




INFO: [Common 17-83] Releasing license: Synthesis
13 Infos, 0 Warnings, 0 Critical Warnings and 0 Errors encountered.
synth_design completed successfully
synth_design: Time (s): cpu = 00:00:29 ; elapsed = 00:00:33 . Memory (MB): peak = 1929.242 ; gain = 459.266 ; free physical = 366 ; free virtual = 3356
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 1929.242 ; gain = 0.000 ; free physical = 366 ; free virtual = 3356
WARNING: [Constraints 18-5210] No constraints selected for write.
Resolution: This message can indicate that there are no constraints for the design, or it can indicate that the used_in flags are set such that the constraints are ignored. This later case is used when running synth_design to not write synthesis constraints to the resulting checkpoint. Instead, project constraints are read when the synthesized design is opened.
INFO: [Common 17-1381] The checkpoint '/apps/projects/ELO212_lab6/ELO212_lab6.runs/synth_1/level_to_pulse.dcp' has been generated.
INFO: [runtcl-4] Executing : report_utilization -file level_to_pulse_utilization_synth.rpt -pb level_to_pulse_utilization_synth.pb
INFO: [Common 17-206] Exiting Vivado at Fri Jul 24 05:35:59 2020...
