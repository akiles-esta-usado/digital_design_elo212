# Síntesis de semaforo_FSM

*** Running vivado
    with args -log semaforo_FSM.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source semaforo_FSM.tcl


****** Vivado v2019.2 (64-bit)
  **** SW Build 2708876 on Wed Nov  6 21:39:14 MST 2019
  **** IP Build 2700528 on Thu Nov  7 00:09:20 MST 2019
    ** Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.

source semaforo_FSM.tcl -notrace
Command: synth_design -top semaforo_FSM -part xc7a100tcsg324-1
Starting synth_design
Attempting to get a license for feature 'Synthesis' and/or device 'xc7a100t'
INFO: [Common 17-349] Got license for feature 'Synthesis' and/or device 'xc7a100t'
INFO: Launching helper process for spawning children vivado processes
INFO: Helper process launched with PID 10879 





---------------------------------------------------------------------------------
Starting Synthesize : Time (s): cpu = 00:00:06 ; elapsed = 00:00:08 . Memory (MB): peak = 1607.660 ; gain = 137.445 ; free physical = 455 ; free virtual = 3429
---------------------------------------------------------------------------------
INFO: [Synth 8-6157] synthesizing module 'semaforo_FSM' [/apps/projects/sources/reference_modules/semaforo/semaforo_FSM.sv:4]
	Parameter GREEN bound to: 2'b00 
	Parameter YELLOW bound to: 2'b01 
	Parameter RED bound to: 2'b10 
INFO: [Synth 8-155] case statement is not full and has no default [/apps/projects/sources/reference_modules/semaforo/semaforo_FSM.sv:26]
INFO: [Synth 8-6155] done synthesizing module 'semaforo_FSM' (1#1) [/apps/projects/sources/reference_modules/semaforo/semaforo_FSM.sv:4]
---------------------------------------------------------------------------------
Finished Synthesize : Time (s): cpu = 00:00:08 ; elapsed = 00:00:11 . Memory (MB): peak = 1668.410 ; gain = 198.195 ; free physical = 486 ; free virtual = 3465
---------------------------------------------------------------------------------




---------------------------------------------------------------------------------
Finished Constraint Validation : Time (s): cpu = 00:00:08 ; elapsed = 00:00:11 . Memory (MB): peak = 1668.410 ; gain = 198.195 ; free physical = 482 ; free virtual = 3462
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Loading Part and Timing Information
---------------------------------------------------------------------------------
Loading part: xc7a100tcsg324-1
---------------------------------------------------------------------------------
INFO: [Device 21-403] Loading part xc7a100tcsg324-1
Finished Loading Part and Timing Information : Time (s): cpu = 00:00:09 ; elapsed = 00:00:11 . Memory (MB): peak = 1676.414 ; gain = 206.199 ; free physical = 482 ; free virtual = 3461




---------------------------------------------------------------------------------
INFO: [Synth 8-802] inferred FSM for state register 'state_reg' in module 'semaforo_FSM'
INFO: [Synth 8-5544] ROM "LB" won't be mapped to Block RAM because address size (4) smaller than threshold (5)
INFO: [Synth 8-5544] ROM "LA" won't be mapped to Block RAM because address size (4) smaller than threshold (5)
---------------------------------------------------------------------------------------------------
                   State |                     New Encoding |                Previous Encoding 
---------------------------------------------------------------------------------------------------
                 STATE_0 |                             0001 |                             0000
                 STATE_1 |                             0010 |                             0001
                 STATE_2 |                             0100 |                             0010
                 STATE_3 |                             1000 |                             0011
---------------------------------------------------------------------------------------------------
INFO: [Synth 8-3354] encoded FSM with state register 'state_reg' using encoding 'one-hot' in module 'semaforo_FSM'
---------------------------------------------------------------------------------
Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:11 . Memory (MB): peak = 1685.320 ; gain = 215.105 ; free physical = 473 ; free virtual = 3454
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
	   4 Input      2 Bit        Muxes := 2     
	   4 Input      1 Bit        Muxes := 1     
---------------------------------------------------------------------------------
Finished RTL Component Statistics 
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start RTL Hierarchical Component Statistics 
---------------------------------------------------------------------------------
Hierarchical RTL Component report 
Module semaforo_FSM 
Detailed RTL Component Info : 
+---Muxes : 
	   4 Input      2 Bit        Muxes := 2     
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
Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:15 ; elapsed = 00:00:20 . Memory (MB): peak = 1825.672 ; gain = 355.457 ; free physical = 255 ; free virtual = 3237
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
Finished Timing Optimization : Time (s): cpu = 00:00:16 ; elapsed = 00:00:21 . Memory (MB): peak = 1825.672 ; gain = 355.457 ; free physical = 253 ; free virtual = 3235
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
Finished Technology Mapping : Time (s): cpu = 00:00:16 ; elapsed = 00:00:21 . Memory (MB): peak = 1825.672 ; gain = 355.457 ; free physical = 253 ; free virtual = 3235
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
Finished IO Insertion : Time (s): cpu = 00:00:21 ; elapsed = 00:00:27 . Memory (MB): peak = 1825.672 ; gain = 355.457 ; free physical = 254 ; free virtual = 3236
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Renaming Generated Instances
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Renaming Generated Instances : Time (s): cpu = 00:00:21 ; elapsed = 00:00:27 . Memory (MB): peak = 1825.672 ; gain = 355.457 ; free physical = 254 ; free virtual = 3236
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
Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:21 ; elapsed = 00:00:27 . Memory (MB): peak = 1825.672 ; gain = 355.457 ; free physical = 254 ; free virtual = 3236
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Renaming Generated Ports
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Renaming Generated Ports : Time (s): cpu = 00:00:21 ; elapsed = 00:00:27 . Memory (MB): peak = 1825.672 ; gain = 355.457 ; free physical = 254 ; free virtual = 3236
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Handling Custom Attributes
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Handling Custom Attributes : Time (s): cpu = 00:00:21 ; elapsed = 00:00:27 . Memory (MB): peak = 1825.672 ; gain = 355.457 ; free physical = 254 ; free virtual = 3236
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Renaming Generated Nets
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Renaming Generated Nets : Time (s): cpu = 00:00:21 ; elapsed = 00:00:27 . Memory (MB): peak = 1825.672 ; gain = 355.457 ; free physical = 254 ; free virtual = 3236
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
|3     |LUT6 |     1|
|4     |FDRE |     3|
|5     |FDSE |     1|
|6     |IBUF |     4|
|7     |OBUF |     4|
+------+-----+------+

Report Instance Areas: 
+------+---------+-------+------+
|      |Instance |Module |Cells |
+------+---------+-------+------+
|1     |top      |       |    16|
+------+---------+-------+------+
---------------------------------------------------------------------------------
Finished Writing Synthesis Report : Time (s): cpu = 00:00:21 ; elapsed = 00:00:27 . Memory (MB): peak = 1825.672 ; gain = 355.457 ; free physical = 254 ; free virtual = 3236
---------------------------------------------------------------------------------



Synthesis finished with 0 errors, 0 critical warnings and 0 warnings.
Synthesis Optimization Runtime : Time (s): cpu = 00:00:21 ; elapsed = 00:00:27 . Memory (MB): peak = 1825.672 ; gain = 355.457 ; free physical = 255 ; free virtual = 3237
Synthesis Optimization Complete : Time (s): cpu = 00:00:21 ; elapsed = 00:00:27 . Memory (MB): peak = 1825.680 ; gain = 355.457 ; free physical = 255 ; free virtual = 3237
INFO: [Project 1-571] Translating synthesized netlist
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 1831.609 ; gain = 0.000 ; free physical = 326 ; free virtual = 3304
INFO: [Project 1-570] Preparing netlist for logic optimization
INFO: [Opt 31-138] Pushed 0 inverter(s) to 0 load pin(s).
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 1904.297 ; gain = 0.000 ; free physical = 244 ; free virtual = 3222
INFO: [Project 1-111] Unisim Transformation Summary:
No Unisim elements were transformed.

INFO: [Common 17-83] Releasing license: Synthesis
14 Infos, 0 Warnings, 0 Critical Warnings and 0 Errors encountered.
synth_design completed successfully
synth_design: Time (s): cpu = 00:00:29 ; elapsed = 00:00:33 . Memory (MB): peak = 1904.297 ; gain = 434.324 ; free physical = 378 ; free virtual = 3356
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 1904.297 ; gain = 0.000 ; free physical = 378 ; free virtual = 3356
WARNING: [Constraints 18-5210] No constraints selected for write.
Resolution: This message can indicate that there are no constraints for the design, or it can indicate that the used_in flags are set such that the constraints are ignored. This later case is used when running synth_design to not write synthesis constraints to the resulting checkpoint. Instead, project constraints are read when the synthesized design is opened.
INFO: [Common 17-1381] The checkpoint '/apps/projects/ELO212_lab6/ELO212_lab6.runs/synth_1/semaforo_FSM.dcp' has been generated.
INFO: [runtcl-4] Executing : report_utilization -file semaforo_FSM_utilization_synth.rpt -pb semaforo_FSM_utilization_synth.pb
INFO: [Common 17-206] Exiting Vivado at Fri Jul 24 05:32:17 2020...
