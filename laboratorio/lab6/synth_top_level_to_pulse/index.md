# Síntesis de top_level_to_pulse
*** Running vivado
    with args -log top_level_to_pulse.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source top_level_to_pulse.tcl


****** Vivado v2019.2 (64-bit)
  **** SW Build 2708876 on Wed Nov  6 21:39:14 MST 2019
  **** IP Build 2700528 on Thu Nov  7 00:09:20 MST 2019
    ** Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.

source top_level_to_pulse.tcl -notrace
Command: synth_design -top top_level_to_pulse -part xc7a100tcsg324-1
Starting synth_design
Attempting to get a license for feature 'Synthesis' and/or device 'xc7a100t'
INFO: [Common 17-349] Got license for feature 'Synthesis' and/or device 'xc7a100t'
INFO: [Device 21-403] Loading part xc7a100tcsg324-1
INFO: Launching helper process for spawning children vivado processes
INFO: Helper process launched with PID 26779 







---------------------------------------------------------------------------------
Starting RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:08 . Memory (MB): peak = 1836.047 ; gain = 201.715 ; free physical = 279 ; free virtual = 3028
---------------------------------------------------------------------------------
INFO: [Synth 8-6157] synthesizing module 'top_level_to_pulse' [/apps/projects/sources/lab6/level_pulse_conv/top_level_to_pulse.sv:1]
INFO: [Synth 8-6157] synthesizing module 'level_to_pulse' [/apps/projects/sources/lab6/level_pulse_conv/level_to_pulse.sv:2]
INFO: [Synth 8-5534] Detected attribute (* fsm_encoding = "one_hot" *) [/apps/projects/sources/lab6/level_pulse_conv/level_to_pulse.sv:15]
INFO: [Synth 8-155] case statement is not full and has no default [/apps/projects/sources/lab6/level_pulse_conv/level_to_pulse.sv:27]
INFO: [Synth 8-6155] done synthesizing module 'level_to_pulse' (1#1) [/apps/projects/sources/lab6/level_pulse_conv/level_to_pulse.sv:2]
INFO: [Synth 8-6155] done synthesizing module 'top_level_to_pulse' (2#1) [/apps/projects/sources/lab6/level_pulse_conv/top_level_to_pulse.sv:1]
---------------------------------------------------------------------------------
Finished RTL Elaboration : Time (s): cpu = 00:00:08 ; elapsed = 00:00:11 . Memory (MB): peak = 1897.797 ; gain = 263.465 ; free physical = 234 ; free virtual = 3017
---------------------------------------------------------------------------------







Report Check Netlist: 
+------+------------------+-------+---------+-------+------------------+
|      |Item              |Errors |Warnings |Status |Description       |
+------+------------------+-------+---------+-------+------------------+
|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
+------+------------------+-------+---------+-------+------------------+
---------------------------------------------------------------------------------
Start Handling Custom Attributes
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Handling Custom Attributes : Time (s): cpu = 00:00:09 ; elapsed = 00:00:12 . Memory (MB): peak = 1900.766 ; gain = 266.434 ; free physical = 251 ; free virtual = 3038
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:12 . Memory (MB): peak = 1900.766 ; gain = 266.434 ; free physical = 251 ; free virtual = 3038
---------------------------------------------------------------------------------






Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 1900.766 ; gain = 0.000 ; free physical = 244 ; free virtual = 3031
INFO: [Project 1-570] Preparing netlist for logic optimization

Processing XDC Constraints
Initializing timing engine
Parsing XDC File [/apps/projects/sources/lab6/level_pulse_conv/Nexys4DDR_level_to_pulse.xdc]
Finished Parsing XDC File [/apps/projects/sources/lab6/level_pulse_conv/Nexys4DDR_level_to_pulse.xdc]
INFO: [Project 1-236] Implementation specific constraints were found while reading constraint file [/apps/projects/sources/lab6/level_pulse_conv/Nexys4DDR_level_to_pulse.xdc]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [.Xil/top_level_to_pulse_propImpl.xdc].
Resolution: To avoid this warning, move constraints listed in [.Xil/top_level_to_pulse_propImpl.xdc] to another XDC file and exclude this new file from synthesis with the used_in_synthesis property (File Properties dialog in GUI) and re-run elaboration/synthesis.
Completed Processing XDC Constraints

Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 1990.562 ; gain = 0.000 ; free physical = 172 ; free virtual = 2946
INFO: [Project 1-111] Unisim Transformation Summary:
No Unisim elements were transformed.

Constraint Validation Runtime : Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 1990.562 ; gain = 0.000 ; free physical = 172 ; free virtual = 2946




---------------------------------------------------------------------------------
Finished Constraint Validation : Time (s): cpu = 00:00:19 ; elapsed = 00:00:24 . Memory (MB): peak = 1990.562 ; gain = 356.230 ; free physical = 243 ; free virtual = 3013
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Loading Part and Timing Information
---------------------------------------------------------------------------------
Loading part: xc7a100tcsg324-1
---------------------------------------------------------------------------------
Finished Loading Part and Timing Information : Time (s): cpu = 00:00:19 ; elapsed = 00:00:24 . Memory (MB): peak = 1990.562 ; gain = 356.230 ; free physical = 243 ; free virtual = 3013
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Applying 'set_property' XDC Constraints
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:19 ; elapsed = 00:00:24 . Memory (MB): peak = 1990.562 ; gain = 356.230 ; free physical = 243 ; free virtual = 3013









---------------------------------------------------------------------------------
INFO: [Synth 8-802] inferred FSM for state register 'pr_state_reg' in module 'level_to_pulse'
---------------------------------------------------------------------------------------------------
                   State |                     New Encoding |                Previous Encoding 
---------------------------------------------------------------------------------------------------
                    DOWN |                             0001 |                             0000
                    RISE |                             0010 |                             0001
                      UP |                             0100 |                             0010
                    FALL |                             1000 |                             0011
---------------------------------------------------------------------------------------------------
INFO: [Synth 8-3354] encoded FSM with state register 'pr_state_reg' using encoding 'one-hot' in module 'level_to_pulse'
---------------------------------------------------------------------------------
Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:19 ; elapsed = 00:00:24 . Memory (MB): peak = 1990.562 ; gain = 356.230 ; free physical = 233 ; free virtual = 3004
---------------------------------------------------------------------------------











Report RTL Partitions: 
+-+--------------+------------+----------+
| |RTL Partition |Replication |Instances |
+-+--------------+------------+----------+
+-+--------------+------------+----------+
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
---------------------------------------------------------------------------------
Start Cross Boundary and Area Optimization
---------------------------------------------------------------------------------
Warning: Parallel synthesis criteria is not met 
---------------------------------------------------------------------------------
Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:20 ; elapsed = 00:00:25 . Memory (MB): peak = 1990.562 ; gain = 356.230 ; free physical = 221 ; free virtual = 2994
---------------------------------------------------------------------------------

Report RTL Partitions: 
+-+--------------+------------+----------+
| |RTL Partition |Replication |Instances |
+-+--------------+------------+----------+
+-+--------------+------------+----------+
---------------------------------------------------------------------------------
Start Applying XDC Timing Constraints
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:31 ; elapsed = 00:00:38 . Memory (MB): peak = 1990.562 ; gain = 356.230 ; free physical = 184 ; free virtual = 2761
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Timing Optimization
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Timing Optimization : Time (s): cpu = 00:00:31 ; elapsed = 00:00:38 . Memory (MB): peak = 1998.570 ; gain = 364.238 ; free physical = 183 ; free virtual = 2760
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
Finished Technology Mapping : Time (s): cpu = 00:00:31 ; elapsed = 00:00:38 . Memory (MB): peak = 1998.570 ; gain = 364.238 ; free physical = 183 ; free virtual = 2760
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
Finished IO Insertion : Time (s): cpu = 00:00:36 ; elapsed = 00:00:44 . Memory (MB): peak = 2007.477 ; gain = 373.145 ; free physical = 185 ; free virtual = 2761
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Renaming Generated Instances
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Renaming Generated Instances : Time (s): cpu = 00:00:36 ; elapsed = 00:00:44 . Memory (MB): peak = 2007.477 ; gain = 373.145 ; free physical = 185 ; free virtual = 2761
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
Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:36 ; elapsed = 00:00:44 . Memory (MB): peak = 2007.477 ; gain = 373.145 ; free physical = 185 ; free virtual = 2761
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Renaming Generated Ports
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Renaming Generated Ports : Time (s): cpu = 00:00:36 ; elapsed = 00:00:44 . Memory (MB): peak = 2007.477 ; gain = 373.145 ; free physical = 185 ; free virtual = 2761
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Handling Custom Attributes
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Handling Custom Attributes : Time (s): cpu = 00:00:36 ; elapsed = 00:00:44 . Memory (MB): peak = 2007.477 ; gain = 373.145 ; free physical = 185 ; free virtual = 2761
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Renaming Generated Nets
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Renaming Generated Nets : Time (s): cpu = 00:00:36 ; elapsed = 00:00:44 . Memory (MB): peak = 2007.477 ; gain = 373.145 ; free physical = 185 ; free virtual = 2761
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
|2     |LUT1 |     1|
|3     |LUT2 |     2|
|4     |LUT3 |     2|
|5     |LUT5 |     1|
|6     |FDRE |     3|
|7     |FDSE |     1|
|8     |IBUF |     3|
|9     |OBUF |     2|
+------+-----+------+

Report Instance Areas: 
+------+----------------+---------------+------+
|      |Instance        |Module         |Cells |
+------+----------------+---------------+------+
|1     |top             |               |    16|
|2     |  to_pulse_inst |level_to_pulse |    10|
+------+----------------+---------------+------+
---------------------------------------------------------------------------------
Finished Writing Synthesis Report : Time (s): cpu = 00:00:36 ; elapsed = 00:00:44 . Memory (MB): peak = 2007.477 ; gain = 373.145 ; free physical = 185 ; free virtual = 2761
---------------------------------------------------------------------------------
Synthesis finished with 0 errors, 0 critical warnings and 0 warnings.
Synthesis Optimization Runtime : Time (s): cpu = 00:00:33 ; elapsed = 00:00:40 . Memory (MB): peak = 2007.477 ; gain = 283.348 ; free physical = 239 ; free virtual = 2816
Synthesis Optimization Complete : Time (s): cpu = 00:00:36 ; elapsed = 00:00:44 . Memory (MB): peak = 2007.484 ; gain = 373.145 ; free physical = 239 ; free virtual = 2816
INFO: [Project 1-571] Translating synthesized netlist
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2007.484 ; gain = 0.000 ; free physical = 308 ; free virtual = 2884
INFO: [Project 1-570] Preparing netlist for logic optimization
INFO: [Opt 31-138] Pushed 0 inverter(s) to 0 load pin(s).
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2015.414 ; gain = 0.000 ; free physical = 253 ; free virtual = 2829
INFO: [Project 1-111] Unisim Transformation Summary:
No Unisim elements were transformed.

INFO: [Common 17-83] Releasing license: Synthesis
18 Infos, 0 Warnings, 0 Critical Warnings and 0 Errors encountered.
synth_design completed successfully
synth_design: Time (s): cpu = 00:00:48 ; elapsed = 00:00:57 . Memory (MB): peak = 2015.414 ; gain = 545.438 ; free physical = 387 ; free virtual = 2963
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2015.414 ; gain = 0.000 ; free physical = 387 ; free virtual = 2963
WARNING: [Constraints 18-5210] No constraints selected for write.
Resolution: This message can indicate that there are no constraints for the design, or it can indicate that the used_in flags are set such that the constraints are ignored. This later case is used when running synth_design to not write synthesis constraints to the resulting checkpoint. Instead, project constraints are read when the synthesized design is opened.
INFO: [Common 17-1381] The checkpoint '/apps/projects/ELO212_lab6/ELO212_lab6.runs/synth_1/top_level_to_pulse.dcp' has been generated.
INFO: [runtcl-4] Executing : report_utilization -file top_level_to_pulse_utilization_synth.rpt -pb top_level_to_pulse_utilization_synth.pb
INFO: [Common 17-206] Exiting Vivado at Fri Jul 24 05:59:52 2020...
