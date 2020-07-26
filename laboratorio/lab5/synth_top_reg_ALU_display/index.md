# Síntesis del módulo top_reg_ALU_display.sv

*** Running vivado
    with args -log top_reg_ALU_display.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source top_reg_ALU_display.tcl


****** Vivado v2019.2 (64-bit)
  **** SW Build 2708876 on Wed Nov  6 21:39:14 MST 2019
  **** IP Build 2700528 on Thu Nov  7 00:09:20 MST 2019
    ** Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.

source top_reg_ALU_display.tcl -notrace
Command: synth_design -top top_reg_ALU_display -part xc7a100tcsg324-1
Starting synth_design
Attempting to get a license for feature 'Synthesis' and/or device 'xc7a100t'
INFO: [Common 17-349] Got license for feature 'Synthesis' and/or device 'xc7a100t'
INFO: [Device 21-403] Loading part xc7a100tcsg324-1
INFO: Launching helper process for spawning children vivado projesses
INFO: Helper process launched with PID 1549 



## Inicio de elaboración RTL
---------------------------------------------------------------------------------
Starting RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:08 . Memory (MB): peak = 1836.047 ; gain = 201.715 ; free physical = 196 ; free virtual = 3253
---------------------------------------------------------------------------------
INFO: [Synth 8-6157] synthesizing module 'top_reg_ALU_display' [/apps/projects/sources/lab5/reg_ALU_display/top_reg_ALU_display.sv:1]

    INFO: [Synth 8-6157] synthesizing module 'reg_ALU_display' [/apps/projects/sources/lab5/reg_ALU_display/reg_ALU_display.sv:1]
	    Parameter WIDTH bound to: 4 - type: integer 
    
        INFO: [Synth 8-6157] synthesizing module 'hex_to_7seg' [/apps/projects/sources/lab4/hex_to_7seg/hex_to_7seg.sv:3]
        	Parameter N bound to: 4 - type: integer 
        	Parameter N_BLOCKS bound to: 1 - type: integer 

            INFO: [Synth 8-6157] synthesizing module 'mux' [/apps/projects/sources/lab3/mux/mux.sv:1]
            	Parameter N_IN bound to: 8 - type: integer 
            	Parameter WIDTH bound to: 4 - type: integer 
            INFO: [Synth 8-6155] done synthesizing module 'mux' (1#1) [/apps/projects/sources/lab3/mux/mux.sv:1]

            INFO: [Synth 8-6157] synthesizing module 'counter_N' [/apps/projects/sources/lab2/counter_N/counter_N.sv:3]
            	Parameter N bound to: 3 - type: integer 
            INFO: [Synth 8-6155] done synthesizing module 'counter_N' (2#1) [/apps/projects/sources/lab2/counter_N/counter_N.sv:3]

            INFO: [Synth 8-6157] synthesizing module 'BCD_to_seven_seg' [/apps/projects/sources/lab1/BCD_seven_seg/BCD_to_seven_seg.sv:3]
            INFO: [Synth 8-6155] done synthesizing module 'BCD_to_seven_seg' (3#1) [/apps/projects/sources/lab1/BCD_seven_seg/BCD_to_seven_seg.sv:3]

            INFO: [Synth 8-6157] synthesizing module 'decoder_one_cold' [/apps/projects/sources/lab4/decoder_one_cold/decoder_one_cold.sv:3]
    	    Parameter N bound to: 3 - type: integer 
            INFO: [Synth 8-6155] done synthesizing module 'decoder_one_cold' (4#1) [/apps/projects/sources/lab4/decoder_one_cold/decoder_one_cold.sv:3]
            
        INFO: [Synth 8-6155] done synthesizing module 'hex_to_7seg' (5#1) [/apps/projects/sources/lab4/hex_to_7seg/hex_to_7seg.sv:3]

        INFO: [Synth 8-6157] synthesizing module 'reg_ALU' [/apps/projects/sources/lab5/reg_ALU/reg_ALU.sv:1]
        	Parameter WIDTH bound to: 4 - type: integer 
            
            INFO: [Synth 8-6157] synthesizing module 'ALU' [/apps/projects/sources/lab4/ALU/ALU.sv:1]
            	Parameter WIDTH bound to: 4 - type: integer 
            	Parameter ADD bound to: 2'b00 
            	Parameter SUBTRACT bound to: 2'b01 
            	Parameter OR bound to: 2'b10 
            	Parameter AND bound to: 2'b11 
            INFO: [Synth 8-226] default block is never used [/apps/projects/sources/lab4/ALU/ALU.sv:24]
            INFO: [Synth 8-6155] done synthesizing module 'ALU' (6#1) [/apps/projects/sources/lab4/ALU/ALU.sv:1]

        INFO: [Synth 8-6155] done synthesizing module 'reg_ALU' (7#1) [/apps/projects/sources/lab5/reg_ALU/reg_ALU.sv:1]

    INFO: [Synth 8-6155] done synthesizing module 'reg_ALU_display' (8#1) [/apps/projects/sources/lab5/reg_ALU_display/reg_ALU_display.sv:1]


INFO: [Synth 8-6155] done synthesizing module 'top_reg_ALU_display' (9#1) [/apps/projects/sources/lab5/reg_ALU_display/top_reg_ALU_display.sv:1]
---------------------------------------------------------------------------------
Finished RTL Elaboration : Time (s): cpu = 00:00:08 ; elapsed = 00:00:11 . Memory (MB): peak = 1898.797 ; gain = 264.465 ; free physical = 235 ; free virtual = 3288
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
Finished Handling Custom Attributes : Time (s): cpu = 00:00:09 ; elapsed = 00:00:12 . Memory (MB): peak = 1898.797 ; gain = 264.465 ; free physical = 230 ; free virtual = 3282
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:12 . Memory (MB): peak = 1898.797 ; gain = 264.465 ; free physical = 230 ; free virtual = 3282
---------------------------------------------------------------------------------
Netlist sorting complete. Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00 . Memory (MB): peak = 1898.797 ; gain = 0.000 ; free physical = 222 ; free virtual = 3275
INFO: [Project 1-570] Preparing netlist for logic optimization

Processing XDC Constraints
Initializing timing engine
Parsing XDC File [/apps/projects/sources/lab5/reg_ALU_display/Nexys4DDR_reg_ALU_display.xdc]
Finished Parsing XDC File [/apps/projects/sources/lab5/reg_ALU_display/Nexys4DDR_reg_ALU_display.xdc]
INFO: [Project 1-236] Implementation specific constraints were found while reading constraint file [/apps/projects/sources/lab5/reg_ALU_display/Nexys4DDR_reg_ALU_display.xdc]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [.Xil/top_reg_ALU_display_propImpl.xdc].
Resolution: To avoid this warning, move constraints listed in [.Xil/top_reg_ALU_display_propImpl.xdc] to another XDC file and exclude this new file from synthesis with the used_in_synthesis property (File Properties dialog in GUI) and re-run elaboration/synthesis.
Completed Processing XDC Constraints

Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2013.562 ; gain = 0.000 ; free physical = 140 ; free virtual = 3192
INFO: [Project 1-111] Unisim Transformation Summary:
No Unisim elements were transformed.

Constraint Validation Runtime : Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.01 . Memory (MB): peak = 2013.562 ; gain = 0.000 ; free physical = 140 ; free virtual = 3192
---------------------------------------------------------------------------------
Finished Constraint Validation : Time (s): cpu = 00:00:18 ; elapsed = 00:00:24 . Memory (MB): peak = 2013.562 ; gain = 379.230 ; free physical = 199 ; free virtual = 3257
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Loading Part and Timing Information
---------------------------------------------------------------------------------
Loading part: xc7a100tcsg324-1
---------------------------------------------------------------------------------
Finished Loading Part and Timing Information : Time (s): cpu = 00:00:18 ; elapsed = 00:00:24 . Memory (MB): peak = 2013.562 ; gain = 379.230 ; free physical = 199 ; free virtual = 3257
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Applying 'set_property' XDC Constraints
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:18 ; elapsed = 00:00:24 . Memory (MB): peak = 2013.562 ; gain = 379.230 ; free physical = 199 ; free virtual = 3257
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:19 ; elapsed = 00:00:24 . Memory (MB): peak = 2013.562 ; gain = 379.230 ; free physical = 190 ; free virtual = 3249
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
+---Adders : 
	   2 Input      5 Bit       Adders := 2     
	   2 Input      4 Bit       Adders := 1     
	   2 Input      3 Bit       Adders := 1     
+---Registers : 
	                4 Bit    Registers := 3     
	                3 Bit    Registers := 1     
	                2 Bit    Registers := 1     
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
Module counter_N 
Detailed RTL Component Info : 
+---Adders : 
	   2 Input      3 Bit       Adders := 1     
+---Registers : 
	                3 Bit    Registers := 1     
Module ALU 
Detailed RTL Component Info : 
+---Adders : 
	   2 Input      5 Bit       Adders := 2     
	   2 Input      4 Bit       Adders := 1     
+---Muxes : 
	   4 Input      4 Bit        Muxes := 1     
	   2 Input      1 Bit        Muxes := 1     
	   4 Input      1 Bit        Muxes := 2     
Module reg_ALU 
Detailed RTL Component Info : 
+---Registers : 
	                4 Bit    Registers := 3     
	                2 Bit    Registers := 1     
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
Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:20 ; elapsed = 00:00:26 . Memory (MB): peak = 2013.562 ; gain = 379.230 ; free physical = 174 ; free virtual = 3236
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
Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:31 ; elapsed = 00:00:39 . Memory (MB): peak = 2013.562 ; gain = 379.230 ; free physical = 307 ; free virtual = 3118
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Timing Optimization
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Timing Optimization : Time (s): cpu = 00:00:31 ; elapsed = 00:00:39 . Memory (MB): peak = 2013.562 ; gain = 379.230 ; free physical = 307 ; free virtual = 3117
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
Finished Technology Mapping : Time (s): cpu = 00:00:31 ; elapsed = 00:00:39 . Memory (MB): peak = 2013.562 ; gain = 379.230 ; free physical = 307 ; free virtual = 3117
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
Finished IO Insertion : Time (s): cpu = 00:00:37 ; elapsed = 00:00:45 . Memory (MB): peak = 2013.562 ; gain = 379.230 ; free physical = 311 ; free virtual = 3117
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Renaming Generated Instances
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Renaming Generated Instances : Time (s): cpu = 00:00:37 ; elapsed = 00:00:45 . Memory (MB): peak = 2013.562 ; gain = 379.230 ; free physical = 311 ; free virtual = 3117
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
Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:37 ; elapsed = 00:00:45 . Memory (MB): peak = 2013.562 ; gain = 379.230 ; free physical = 311 ; free virtual = 3117
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Renaming Generated Ports
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Renaming Generated Ports : Time (s): cpu = 00:00:37 ; elapsed = 00:00:45 . Memory (MB): peak = 2013.562 ; gain = 379.230 ; free physical = 311 ; free virtual = 3117
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Handling Custom Attributes
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Handling Custom Attributes : Time (s): cpu = 00:00:37 ; elapsed = 00:00:45 . Memory (MB): peak = 2013.562 ; gain = 379.230 ; free physical = 311 ; free virtual = 3117
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start Renaming Generated Nets
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Finished Renaming Generated Nets : Time (s): cpu = 00:00:37 ; elapsed = 00:00:45 . Memory (MB): peak = 2013.562 ; gain = 379.230 ; free physical = 311 ; free virtual = 3117
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
|2     |LUT2 |     3|
|3     |LUT3 |     9|
|4     |LUT4 |     4|
|5     |LUT6 |    13|
|6     |FDRE |    17|
|7     |IBUF |    10|
|8     |OBUF |    15|
+------+-----+------+

Report Instance Areas: 
+------+--------------------+----------------+------+
|      |Instance            |Module          |Cells |
+------+--------------------+----------------+------+
|1     |top                 |                |    72|
|2     |  nolabel_line26    |reg_ALU_display |    46|
|3     |    ALU_inst        |reg_ALU         |    31|
|4     |    to_7seg         |hex_to_7seg     |    15|
|5     |      counter_block |counter_N       |    15|
+------+--------------------+----------------+------+
---------------------------------------------------------------------------------
Finished Writing Synthesis Report : Time (s): cpu = 00:00:37 ; elapsed = 00:00:45 . Memory (MB): peak = 2013.562 ; gain = 379.230 ; free physical = 311 ; free virtual = 3117
---------------------------------------------------------------------------------
Synthesis finished with 0 errors, 0 critical warnings and 0 warnings.
Synthesis Optimization Runtime : Time (s): cpu = 00:00:34 ; elapsed = 00:00:41 . Memory (MB): peak = 2013.562 ; gain = 264.465 ; free physical = 363 ; free virtual = 3170
Synthesis Optimization Complete : Time (s): cpu = 00:00:37 ; elapsed = 00:00:45 . Memory (MB): peak = 2013.570 ; gain = 379.230 ; free physical = 363 ; free virtual = 3170
INFO: [Project 1-571] Translating synthesized netlist
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.01 . Memory (MB): peak = 2013.570 ; gain = 0.000 ; free physical = 432 ; free virtual = 3238
INFO: [Project 1-570] Preparing netlist for logic optimization
INFO: [Opt 31-138] Pushed 0 inverter(s) to 0 load pin(s).
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2016.531 ; gain = 0.000 ; free physical = 378 ; free virtual = 3185
INFO: [Project 1-111] Unisim Transformation Summary:
No Unisim elements were transformed.

INFO: [Common 17-83] Releasing license: Synthesis
29 Infos, 0 Warnings, 0 Critical Warnings and 0 Errors encountered.
synth_design completed successfully
synth_design: Time (s): cpu = 00:00:49 ; elapsed = 00:00:58 . Memory (MB): peak = 2016.531 ; gain = 546.555 ; free physical = 512 ; free virtual = 3319
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2016.531 ; gain = 0.000 ; free physical = 512 ; free virtual = 3319
WARNING: [Constraints 18-5210] No constraints selected for write.
Resolution: This message can indicate that there are no constraints for the design, or it can indicate that the used_in flags are set such that the constraints are ignored. This later case is used when running synth_design to not write synthesis constraints to the resulting checkpoint. Instead, project constraints are read when the synthesized design is opened.
INFO: [Common 17-1381] The checkpoint '/apps/projects/ELO212-lab5/ELO212-lab5.runs/synth_1/top_reg_ALU_display.dcp' has been generated.
INFO: [runtcl-4] Executing : report_utilization -file top_reg_ALU_display_utilization_synth.rpt -pb top_reg_ALU_display_utilization_synth.pb
INFO: [Common 17-206] Exiting Vivado at Fri Jul 24 03:28:18 2020...
