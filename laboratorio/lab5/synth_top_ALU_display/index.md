# Síntesis de top_ALU_display

*** Running vivado
    with args -log top_ALU_display.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source top_ALU_display.tcl


****** Vivado v2019.2 (64-bit)
  **** SW Build 2708876 on Wed Nov  6 21:39:14 MST 2019
  **** IP Build 2700528 on Thu Nov  7 00:09:20 MST 2019
    ** Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.

source top_ALU_display.tcl -notrace
Command: synth_design -top top_ALU_display -part xc7a100tcsg324-1
Starting synth_design
Attempting to get a license for feature 'Synthesis' and/or device 'xc7a100t'
INFO: [Common 17-349] Got license for feature 'Synthesis' and/or device 'xc7a100t'
INFO: [Device 21-403] Loading part xc7a100tcsg324-1
INFO: Launching helper process for spawning children vivado processes
INFO: Helper process launched with PID 23001 


## RTL Elaboration
---------------------------------------------------------------------------------
Starting RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:09 . Memory (MB): peak = 1836.121 ; gain = 202.684 ; free physical = 627 ; free virtual = 3577
---------------------------------------------------------------------------------
INFO: [Synth 8-6157] synthesizing module 'top_ALU_display' [/apps/projects/sources/lab5/ALU_display/Top_ALU_display.sv:1]

    INFO: [Synth 8-6157] synthesizing module 'ALU_display' [/apps/projects/sources/lab5/ALU_display/ALU_display.sv:1]
    	Parameter WIDTH bound to: 4 - type: integer 

        INFO: [Synth 8-6157] synthesizing module 'ALU' [/apps/projects/sources/lab4/ALU/ALU.sv:1]
        	Parameter WIDTH bound to: 4 - type: integer 
        	Parameter ADD bound to: 2'b00 
        	Parameter SUBTRACT bound to: 2'b01 
        	Parameter OR bound to: 2'b10 
        	Parameter AND bound to: 2'b11 
        INFO: [Synth 8-226] default block is never used [/apps/projects/sources/lab4/ALU/ALU.sv:24]
        INFO: [Synth 8-6155] done synthesizing module 'ALU' (1#1) [/apps/projects/sources/lab4/ALU/ALU.sv:1]


        INFO: [Synth 8-6157] synthesizing module 'hex_to_7seg' [/apps/projects/sources/lab4/hex_to_7seg/hex_to_7seg.sv:3]
        	Parameter N bound to: 4 - type: integer 
        	Parameter N_BLOCKS bound to: 1 - type: integer 


            INFO: [Synth 8-6157] synthesizing module 'mux' [/apps/projects/sources/lab3/mux/mux.sv:1]
            	Parameter N_IN bound to: 8 - type: integer 
            	Parameter WIDTH bound to: 4 - type: integer 
            INFO: [Synth 8-6155] done synthesizing module 'mux' (2#1) [/apps/projects/sources/lab3/mux/mux.sv:1]


            INFO: [Synth 8-6157] synthesizing module 'counter_N' [/apps/projects/sources/lab2/counter_N/counter_N.sv:3]
            	Parameter N bound to: 3 - type: integer 
            INFO: [Synth 8-6155] done synthesizing module 'counter_N' (3#1) [/apps/projects/sources/lab2/counter_N/counter_N.sv:3]


            INFO: [Synth 8-6157] synthesizing module 'BCD_to_seven_seg' [/apps/projects/sources/lab1/BCD_seven_seg/BCD_to_seven_seg.sv:3]
            INFO: [Synth 8-6155] done synthesizing module 'BCD_to_seven_seg' (4#1) [/apps/projects/sources/lab1/BCD_seven_seg/BCD_to_seven_seg.sv:3]


            INFO: [Synth 8-6157] synthesizing module 'decoder_one_cold' [/apps/projects/sources/lab4/decoder_one_cold/decoder_one_cold.sv:3]
            	Parameter N bound to: 3 - type: integer 
            INFO: [Synth 8-6155] done synthesizing module 'decoder_one_cold' (5#1) [/apps/projects/sources/lab4/decoder_one_cold/decoder_one_cold.sv:3]


        INFO: [Synth 8-6155] done synthesizing module 'hex_to_7seg' (6#1) [/apps/projects/sources/lab4/hex_to_7seg/hex_to_7seg.sv:3]

    INFO: [Synth 8-6155] done synthesizing module 'ALU_display' (7#1) [/apps/projects/sources/lab5/ALU_display/ALU_display.sv:1]

INFO: [Synth 8-6155] done synthesizing module 'top_ALU_display' (8#1) [/apps/projects/sources/lab5/ALU_display/Top_ALU_display.sv:1]

---------------------------------------------------------------------------------
Finished RTL Elaboration : Time (s): cpu = 00:00:08 ; elapsed = 00:00:11 . Memory (MB): peak = 1897.871 ; gain = 264.434 ; free physical = 660 ; free virtual = 3613
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
Finished Handling Custom Attributes : Time (s): cpu = 00:00:09 ; elapsed = 00:00:12 . Memory (MB): peak = 1900.840 ; gain = 267.402 ; free physical = 654 ; free virtual = 3607
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:12 . Memory (MB): peak = 1900.840 ; gain = 267.402 ; free physical = 654 ; free virtual = 3607
---------------------------------------------------------------------------------
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.01 . Memory (MB): peak = 1900.840 ; gain = 0.000 ; free physical = 647 ; free virtual = 3600
INFO: [Project 1-570] Preparing netlist for logic optimization


## Processing XDC Constraints
Initializing timing engine
Parsing XDC File [/apps/projects/sources/lab5/ALU_display/Nexys4DDR_ALU_display.xdc]
Finished Parsing XDC File [/apps/projects/sources/lab5/ALU_display/Nexys4DDR_ALU_display.xdc]
INFO: [Project 1-236] Implementation specific constraints were found while reading constraint file [/apps/projects/sources/lab5/ALU_display/Nexys4DDR_ALU_display.xdc]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [.Xil/top_ALU_display_propImpl.xdc].
Resolution: To avoid this warning, move constraints listed in [.Xil/top_ALU_display_propImpl.xdc] to another XDC file and exclude this new file from synthesis with the used_in_synthesis property (File Properties dialog in GUI) and re-run elaboration/synthesis.
Completed Processing XDC Constraints

Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2000.637 ; gain = 0.000 ; free physical = 554 ; free virtual = 3517
INFO: [Project 1-111] Unisim Transformation Summary:
No Unisim elements were transformed.

Constraint Validation Runtime : Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2000.637 ; gain = 0.000 ; free physical = 554 ; free virtual = 3517
---------------------------------------------------------------------------------
Finished Constraint Validation : Time (s): cpu = 00:00:18 ; elapsed = 00:00:25 . Memory (MB): peak = 2000.637 ; gain = 367.199 ; free physical = 628 ; free virtual = 3591
---------------------------------------------------------------------------------

[top_ALU_display_propImpl xdc md](top_ALU_display_propImpl.xdc.md)


## Loading Part and Timing Information

---------------------------------------------------------------------------------
Start Loading Part and Timing Information
---------------------------------------------------------------------------------
Loading part: xc7a100tcsg324-1
---------------------------------------------------------------------------------
Finished Loading Part and Timing Information : Time (s): cpu = 00:00:18 ; elapsed = 00:00:25 . Memory (MB): peak = 2000.637 ; gain = 367.199 ; free physical = 628 ; free virtual = 3591
---------------------------------------------------------------------------------



## Applying XDC Constrains
---------------------------------------------------------------------------------
Start Applying 'set_property' XDC Constraints
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:18 ; elapsed = 00:00:25 . Memory (MB): peak = 2000.637 ; gain = 367.199 ; free physical = 628 ; free virtual = 3591
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:19 ; elapsed = 00:00:26 . Memory (MB): peak = 2000.637 ; gain = 367.199 ; free physical = 618 ; free virtual = 3582
---------------------------------------------------------------------------------

## 1er Reporte de Particiones RTL

Report RTL Partitions: 
+-+--------------+------------+----------+
| |RTL Partition |Replication |Instances |
+-+--------------+------------+----------+
+-+--------------+------------+----------+

---------------------------------------------------------------------------------
Start RTL Component Statistics 
---------------------------------------------------------------------------------
Detailed RTL Component Info : 
+---Adders : 
	   2 Input      5 Bit       Adders := 2     
	   2 Input      4 Bit       Adders := 1     
	   2 Input      3 Bit       Adders := 1     
+---Registers : 
	                3 Bit    Registers := 1     
+---Muxes : 
	   4 Input      4 Bit        Muxes := 1     
	   2 Input      1 Bit        Muxes := 1     
	   4 Input      1 Bit        Muxes := 2     
---------------------------------------------------------------------------------
Finished RTL Component Statistics 
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
Start RTL Hierarchical Component Statistics 
---------------------------------------------------------------------------------
Hierarchical RTL Component report 
Module ALU 
Detailed RTL Component Info : 
+---Adders : 
	   2 Input      5 Bit       Adders := 2     
	   2 Input      4 Bit       Adders := 1     
+---Muxes : 
	   4 Input      4 Bit        Muxes := 1     
	   2 Input      1 Bit        Muxes := 1     
	   4 Input      1 Bit        Muxes := 2     
Module counter_N 
Detailed RTL Component Info : 
+---Adders : 
	   2 Input      3 Bit       Adders := 1     
+---Registers : 
	                3 Bit    Registers := 1     
---------------------------------------------------------------------------------
Finished RTL Hierarchical Component Statistics
---------------------------------------------------------------------------------

## Resumen de recursos
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
Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:21 ; elapsed = 00:00:28 . Memory (MB): peak = 2000.637 ; gain = 367.199 ; free physical = 596 ; free virtual = 3564
---------------------------------------------------------------------------------

## 2do Reporte de Particiones RTL
Report RTL Partitions: 
+-+--------------+------------+----------+
| |RTL Partition |Replication |Instances |
+-+--------------+------------+----------+
+-+--------------+------------+----------+


## Aplicacipon de Constraints de Timing
---------------------------------------------------------------------------------
Start Applying XDC Timing Constraints
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:32 ; elapsed = 00:00:41 . Memory (MB): peak = 2000.637 ; gain = 367.199 ; free physical = 463 ; free virtual = 3442
---------------------------------------------------------------------------------

## Aplicación de Optimización de Timing
---------------------------------------------------------------------------------
Start Timing Optimization
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Timing Optimization : Time (s): cpu = 00:00:32 ; elapsed = 00:00:42 . Memory (MB): peak = 2011.645 ; gain = 378.207 ; free physical = 458 ; free virtual = 3437
---------------------------------------------------------------------------------


## 3er Reporte de Particiones RTL
Report RTL Partitions: 
+-+--------------+------------+----------+
| |RTL Partition |Replication |Instances |
+-+--------------+------------+----------+
+-+--------------+------------+----------+
---------------------------------------------------------------------------------
Start Technology Mapping
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Technology Mapping : Time (s): cpu = 00:00:32 ; elapsed = 00:00:42 . Memory (MB): peak = 2011.645 ; gain = 378.207 ; free physical = 457 ; free virtual = 3436
---------------------------------------------------------------------------------


## 4ro Reporte de Particiones RTL
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
Finished IO Insertion : Time (s): cpu = 00:00:38 ; elapsed = 00:00:48 . Memory (MB): peak = 2017.582 ; gain = 384.145 ; free physical = 457 ; free virtual = 3436
---------------------------------------------------------------------------------


---------------------------------------------------------------------------------
Start Renaming Generated Instances
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Renaming Generated Instances : Time (s): cpu = 00:00:38 ; elapsed = 00:00:48 . Memory (MB): peak = 2017.582 ; gain = 384.145 ; free physical = 457 ; free virtual = 3436
---------------------------------------------------------------------------------

## 4to Reporte de Particiones RTL
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
Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:38 ; elapsed = 00:00:48 . Memory (MB): peak = 2017.582 ; gain = 384.145 ; free physical = 457 ; free virtual = 3436
---------------------------------------------------------------------------------


---------------------------------------------------------------------------------
Start Renaming Generated Ports
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Renaming Generated Ports : Time (s): cpu = 00:00:38 ; elapsed = 00:00:48 . Memory (MB): peak = 2017.582 ; gain = 384.145 ; free physical = 457 ; free virtual = 3436
---------------------------------------------------------------------------------


---------------------------------------------------------------------------------
Start Handling Custom Attributes
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Handling Custom Attributes : Time (s): cpu = 00:00:38 ; elapsed = 00:00:48 . Memory (MB): peak = 2017.582 ; gain = 384.145 ; free physical = 457 ; free virtual = 3436
---------------------------------------------------------------------------------


---------------------------------------------------------------------------------
Start Renaming Generated Nets
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Renaming Generated Nets : Time (s): cpu = 00:00:38 ; elapsed = 00:00:48 . Memory (MB): peak = 2017.582 ; gain = 384.145 ; free physical = 457 ; free virtual = 3436
---------------------------------------------------------------------------------


## Reporte de Síntesis
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
|2     |LUT2 |     4|
|3     |LUT3 |     9|
|4     |LUT4 |     6|
|5     |LUT5 |     2|
|6     |LUT6 |    17|
|7     |FDRE |     3|
|8     |IBUF |    12|
|9     |OBUF |    15|
+------+-----+------+

Report Instance Areas: 
+------+--------------------+------------+------+
|      |Instance            |Module      |Cells |
+------+--------------------+------------+------+
|1     |top                 |            |    69|
|2     |  system            |ALU_display |    26|
|3     |    to_7seg         |hex_to_7seg |    26|
|4     |      counter_block |counter_N   |    26|
+------+--------------------+------------+------+
---------------------------------------------------------------------------------
Finished Writing Synthesis Report : Time (s): cpu = 00:00:38 ; elapsed = 00:00:48 . Memory (MB): peak = 2017.582 ; gain = 384.145 ; free physical = 457 ; free virtual = 3436
---------------------------------------------------------------------------------




Synthesis finished with 0 errors, 0 critical warnings and 0 warnings.
Synthesis Optimization Runtime : Time (s): cpu = 00:00:35 ; elapsed = 00:00:43 . Memory (MB): peak = 2017.582 ; gain = 284.348 ; free physical = 510 ; free virtual = 3489
Synthesis Optimization Complete : Time (s): cpu = 00:00:38 ; elapsed = 00:00:48 . Memory (MB): peak = 2017.590 ; gain = 384.145 ; free physical = 511 ; free virtual = 3490
INFO: [Project 1-571] Translating synthesized netlist
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2017.590 ; gain = 0.000 ; free physical = 502 ; free virtual = 3485
INFO: [Project 1-570] Preparing netlist for logic optimization
INFO: [Opt 31-138] Pushed 0 inverter(s) to 0 load pin(s).
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2021.551 ; gain = 0.000 ; free physical = 521 ; free virtual = 3506
INFO: [Project 1-111] Unisim Transformation Summary:
No Unisim elements were transformed.

INFO: [Common 17-83] Releasing license: Synthesis
27 Infos, 0 Warnings, 0 Critical Warnings and 0 Errors encountered.
synth_design completed successfully
synth_design: Time (s): cpu = 00:00:50 ; elapsed = 00:01:01 . Memory (MB): peak = 2021.551 ; gain = 503.523 ; free physical = 653 ; free virtual = 3638
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2021.551 ; gain = 0.000 ; free physical = 653 ; free virtual = 3638
WARNING: [Constraints 18-5210] No constraints selected for write.
Resolution: This message can indicate that there are no constraints for the design, or it can indicate that the used_in flags are set such that the constraints are ignored. This later case is used when running synth_design to not write synthesis constraints to the resulting checkpoint. Instead, project constraints are read when the synthesized design is opened.
INFO: [Common 17-1381] The checkpoint '/apps/projects/ELO212-lab5/ELO212-lab5.runs/synth_1/top_ALU_display.dcp' has been generated.
INFO: [runtcl-4] Executing : report_utilization -file top_ALU_display_utilization_synth.rpt -pb top_ALU_display_utilization_synth.pb
INFO: [Common 17-206] Exiting Vivado at Fri Jul 24 02:13:46 2020...

