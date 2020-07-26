# Síntesis de top_semaforo_led

*** Running vivado
    with args -log top_semaforo_led.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source top_semaforo_led.tcl


****** Vivado v2019.2 (64-bit)
  **** SW Build 2708876 on Wed Nov  6 21:39:14 MST 2019
  **** IP Build 2700528 on Thu Nov  7 00:09:20 MST 2019
    ** Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.

source top_semaforo_led.tcl -notrace
Command: synth_design -top top_semaforo_led -part xc7a100tcsg324-1
Starting synth_design
Attempting to get a license for feature 'Synthesis' and/or device 'xc7a100t'
INFO: [Common 17-349] Got license for feature 'Synthesis' and/or device 'xc7a100t'
INFO: [Device 21-403] Loading part xc7a100tcsg324-1
INFO: Launching helper process for spawning children vivado processes
INFO: Helper process launched with PID 3868 







---------------------------------------------------------------------------------
Starting RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:08 . Memory (MB): peak = 1836.047 ; gain = 203.684 ; free physical = 454 ; free virtual = 3024
---------------------------------------------------------------------------------
INFO: [Synth 8-6157] synthesizing module 'top_semaforo_led' [/apps/projects/sources/lab6/semaforo/top_semaforo_led.sv:1]
INFO: [Synth 8-6157] synthesizing module 'semaforo_led' [/apps/projects/sources/lab6/semaforo/semaforo_led.sv:1]
INFO: [Synth 8-6157] synthesizing module 'semaforo' [/apps/projects/sources/lab6/semaforo/semaforo_FSM.sv:3]
	Parameter GREEN bound to: 2'b00 
	Parameter YELLOW bound to: 2'b01 
	Parameter RED bound to: 2'b10 
INFO: [Synth 8-155] case statement is not full and has no default [/apps/projects/sources/lab6/semaforo/semaforo_FSM.sv:24]
INFO: [Synth 8-155] case statement is not full and has no default [/apps/projects/sources/lab6/semaforo/semaforo_FSM.sv:36]
INFO: [Synth 8-6155] done synthesizing module 'semaforo' (1#1) [/apps/projects/sources/lab6/semaforo/semaforo_FSM.sv:3]
INFO: [Synth 8-6157] synthesizing module 'to_tricolor' [/apps/projects/sources/lab6/semaforo/to_tricolor.sv:1]
	Parameter GREEN bound to: 2'b00 
	Parameter YELLOW bound to: 2'b01 
	Parameter RED bound to: 2'b10 
INFO: [Synth 8-155] case statement is not full and has no default [/apps/projects/sources/lab6/semaforo/to_tricolor.sv:15]
INFO: [Synth 8-6155] done synthesizing module 'to_tricolor' (2#1) [/apps/projects/sources/lab6/semaforo/to_tricolor.sv:1]
INFO: [Synth 8-6155] done synthesizing module 'semaforo_led' (3#1) [/apps/projects/sources/lab6/semaforo/semaforo_led.sv:1]
INFO: [Synth 8-6155] done synthesizing module 'top_semaforo_led' (4#1) [/apps/projects/sources/lab6/semaforo/top_semaforo_led.sv:1]
---------------------------------------------------------------------------------
Finished RTL Elaboration : Time (s): cpu = 00:00:08 ; elapsed = 00:00:11 . Memory (MB): peak = 1897.797 ; gain = 265.434 ; free physical = 487 ; free virtual = 3058
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
Finished Handling Custom Attributes : Time (s): cpu = 00:00:09 ; elapsed = 00:00:12 . Memory (MB): peak = 1900.766 ; gain = 268.402 ; free physical = 484 ; free virtual = 3055
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:12 . Memory (MB): peak = 1900.766 ; gain = 268.402 ; free physical = 484 ; free virtual = 3055
---------------------------------------------------------------------------------





Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 1900.766 ; gain = 0.000 ; free physical = 477 ; free virtual = 3048
INFO: [Project 1-570] Preparing netlist for logic optimization

Processing XDC Constraints
Initializing timing engine
Parsing XDC File [/apps/projects/sources/lab6/semaforo/Nexis4DDR_semaforo.xdc]
Finished Parsing XDC File [/apps/projects/sources/lab6/semaforo/Nexis4DDR_semaforo.xdc]
INFO: [Project 1-236] Implementation specific constraints were found while reading constraint file [/apps/projects/sources/lab6/semaforo/Nexis4DDR_semaforo.xdc]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [.Xil/top_semaforo_led_propImpl.xdc].
Resolution: To avoid this warning, move constraints listed in [.Xil/top_semaforo_led_propImpl.xdc] to another XDC file and exclude this new file from synthesis with the used_in_synthesis property (File Properties dialog in GUI) and re-run elaboration/synthesis.
Completed Processing XDC Constraints

Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2013.562 ; gain = 0.000 ; free physical = 393 ; free virtual = 2964
INFO: [Project 1-111] Unisim Transformation Summary:
No Unisim elements were transformed.

Constraint Validation Runtime : Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2013.562 ; gain = 0.000 ; free physical = 393 ; free virtual = 2964
---------------------------------------------------------------------------------
Finished Constraint Validation : Time (s): cpu = 00:00:18 ; elapsed = 00:00:24 . Memory (MB): peak = 2013.562 ; gain = 381.199 ; free physical = 443 ; free virtual = 3031
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Loading Part and Timing Information
---------------------------------------------------------------------------------
Loading part: xc7a100tcsg324-1
---------------------------------------------------------------------------------
Finished Loading Part and Timing Information : Time (s): cpu = 00:00:18 ; elapsed = 00:00:24 . Memory (MB): peak = 2013.562 ; gain = 381.199 ; free physical = 443 ; free virtual = 3031
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Applying 'set_property' XDC Constraints
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:19 ; elapsed = 00:00:24 . Memory (MB): peak = 2013.562 ; gain = 381.199 ; free physical = 443 ; free virtual = 3031
---------------------------------------------------------------------------------






INFO: [Synth 8-802] inferred FSM for state register 'state_reg' in module 'semaforo'
INFO: [Synth 8-5544] ROM "LB" won't be mapped to Block RAM because address size (4) smaller than threshold (5)
INFO: [Synth 8-5544] ROM "LA" won't be mapped to Block RAM because address size (4) smaller than threshold (5)
---------------------------------------------------------------------------------------------------
                   State |                     New Encoding |                Previous Encoding 
---------------------------------------------------------------------------------------------------
              A_CROSSING |                             0001 |                             0000
                  A_TO_B |                             0010 |                             0001
              B_CROSSING |                             0100 |                             0010
                  B_TO_A |                             1000 |                             0011
---------------------------------------------------------------------------------------------------
INFO: [Synth 8-3354] encoded FSM with state register 'state_reg' using encoding 'one-hot' in module 'semaforo'
---------------------------------------------------------------------------------
Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:19 ; elapsed = 00:00:24 . Memory (MB): peak = 2013.562 ; gain = 381.199 ; free physical = 435 ; free virtual = 3023
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
	   4 Input      2 Bit        Muxes := 2     
	   4 Input      1 Bit        Muxes := 5     
---------------------------------------------------------------------------------
Finished RTL Component Statistics 
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start RTL Hierarchical Component Statistics 
---------------------------------------------------------------------------------
Hierarchical RTL Component report 
Module semaforo 
Detailed RTL Component Info : 
+---Muxes : 
	   4 Input      2 Bit        Muxes := 2     
	   4 Input      1 Bit        Muxes := 1     
Module to_tricolor 
Detailed RTL Component Info : 
+---Muxes : 
	   4 Input      1 Bit        Muxes := 2     
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
WARNING: [Synth 8-3917] design top_semaforo_led has port LED16_B driven by constant 0
WARNING: [Synth 8-3917] design top_semaforo_led has port LED17_B driven by constant 0
---------------------------------------------------------------------------------
Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:20 ; elapsed = 00:00:25 . Memory (MB): peak = 2013.562 ; gain = 381.199 ; free physical = 424 ; free virtual = 3014
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
Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:31 ; elapsed = 00:00:39 . Memory (MB): peak = 2013.562 ; gain = 381.199 ; free physical = 312 ; free virtual = 2893
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Timing Optimization
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Timing Optimization : Time (s): cpu = 00:00:31 ; elapsed = 00:00:39 . Memory (MB): peak = 2013.562 ; gain = 381.199 ; free physical = 311 ; free virtual = 2892
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
Finished Technology Mapping : Time (s): cpu = 00:00:31 ; elapsed = 00:00:39 . Memory (MB): peak = 2013.562 ; gain = 381.199 ; free physical = 311 ; free virtual = 2892
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
Finished IO Insertion : Time (s): cpu = 00:00:37 ; elapsed = 00:00:45 . Memory (MB): peak = 2013.562 ; gain = 381.199 ; free physical = 306 ; free virtual = 2892
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Renaming Generated Instances
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Renaming Generated Instances : Time (s): cpu = 00:00:37 ; elapsed = 00:00:45 . Memory (MB): peak = 2013.562 ; gain = 381.199 ; free physical = 306 ; free virtual = 2892
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
Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:37 ; elapsed = 00:00:45 . Memory (MB): peak = 2013.562 ; gain = 381.199 ; free physical = 306 ; free virtual = 2892
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Renaming Generated Ports
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Renaming Generated Ports : Time (s): cpu = 00:00:37 ; elapsed = 00:00:45 . Memory (MB): peak = 2013.562 ; gain = 381.199 ; free physical = 306 ; free virtual = 2892
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Handling Custom Attributes
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Handling Custom Attributes : Time (s): cpu = 00:00:37 ; elapsed = 00:00:45 . Memory (MB): peak = 2013.562 ; gain = 381.199 ; free physical = 306 ; free virtual = 2892
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Renaming Generated Nets
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Renaming Generated Nets : Time (s): cpu = 00:00:37 ; elapsed = 00:00:45 . Memory (MB): peak = 2013.562 ; gain = 381.199 ; free physical = 306 ; free virtual = 2892
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
|5     |LUT6 |     1|
|6     |FDRE |     3|
|7     |FDSE |     1|
|8     |IBUF |     4|
|9     |OBUF |     6|
+------+-----+------+

Report Instance Areas: 
+------+-------------+-------------+------+
|      |Instance     |Module       |Cells |
+------+-------------+-------------+------+
|1     |top          |             |    21|
|2     |  sem_inst   |semaforo_led |    10|
|3     |    sem_inst |semaforo     |    10|
+------+-------------+-------------+------+
---------------------------------------------------------------------------------
Finished Writing Synthesis Report : Time (s): cpu = 00:00:37 ; elapsed = 00:00:45 . Memory (MB): peak = 2013.562 ; gain = 381.199 ; free physical = 306 ; free virtual = 2892
---------------------------------------------------------------------------------






Synthesis finished with 0 errors, 0 critical warnings and 2 warnings.
Synthesis Optimization Runtime : Time (s): cpu = 00:00:34 ; elapsed = 00:00:42 . Memory (MB): peak = 2013.562 ; gain = 268.402 ; free physical = 363 ; free virtual = 2947
Synthesis Optimization Complete : Time (s): cpu = 00:00:37 ; elapsed = 00:00:46 . Memory (MB): peak = 2013.570 ; gain = 381.199 ; free physical = 363 ; free virtual = 2947
INFO: [Project 1-571] Translating synthesized netlist
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2013.570 ; gain = 0.000 ; free physical = 431 ; free virtual = 3015
INFO: [Project 1-570] Preparing netlist for logic optimization
INFO: [Opt 31-138] Pushed 0 inverter(s) to 0 load pin(s).
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2016.531 ; gain = 0.000 ; free physical = 377 ; free virtual = 2961
INFO: [Project 1-111] Unisim Transformation Summary:
No Unisim elements were transformed.

INFO: [Common 17-83] Releasing license: Synthesis
25 Infos, 2 Warnings, 0 Critical Warnings and 0 Errors encountered.
synth_design completed successfully
synth_design: Time (s): cpu = 00:00:49 ; elapsed = 00:00:58 . Memory (MB): peak = 2016.531 ; gain = 546.555 ; free physical = 511 ; free virtual = 3095
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2016.531 ; gain = 0.000 ; free physical = 511 ; free virtual = 3095
WARNING: [Constraints 18-5210] No constraints selected for write.
Resolution: This message can indicate that there are no constraints for the design, or it can indicate that the used_in flags are set such that the constraints are ignored. This later case is used when running synth_design to not write synthesis constraints to the resulting checkpoint. Instead, project constraints are read when the synthesized design is opened.
INFO: [Common 17-1381] The checkpoint '/apps/projects/ELO212_lab6/ELO212_lab6.runs/synth_1/top_semaforo_led.dcp' has been generated.
INFO: [runtcl-4] Executing : report_utilization -file top_semaforo_led_utilization_synth.rpt -pb top_semaforo_led_utilization_synth.pb
INFO: [Common 17-206] Exiting Vivado at Fri Jul 24 06:15:26 2020...
