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
+---Adders : 
	   2 Input     17 Bit       Adders := 2     
	   2 Input     16 Bit       Adders := 1     
	   2 Input      6 Bit       Adders := 1     
	   2 Input      4 Bit       Adders := 11    
	   2 Input      3 Bit       Adders := 1     
+---Registers : 
	               32 Bit    Registers := 2     
	               16 Bit    Registers := 4     
	                6 Bit    Registers := 4     
	                4 Bit    Registers := 4     
	                3 Bit    Registers := 1     
	                2 Bit    Registers := 1     
	                1 Bit    Registers := 10    
+---Muxes : 
	   4 Input     32 Bit        Muxes := 2     
	   2 Input     20 Bit        Muxes := 1     
	   4 Input     16 Bit        Muxes := 1     
	   2 Input     16 Bit        Muxes := 1     
	   9 Input      8 Bit        Muxes := 1     
	   2 Input      6 Bit        Muxes := 1     
	   4 Input      6 Bit        Muxes := 1     
	   2 Input      5 Bit        Muxes := 1     
	   2 Input      4 Bit        Muxes := 1     
	   2 Input      3 Bit        Muxes := 10    
	   4 Input      3 Bit        Muxes := 2     
	   2 Input      2 Bit        Muxes := 7     
	   2 Input      1 Bit        Muxes := 15    
	   6 Input      1 Bit        Muxes := 14    
	   4 Input      1 Bit        Muxes := 7     
	   9 Input      1 Bit        Muxes := 1     
---------------------------------------------------------------------------------
Finished RTL Component Statistics 
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
Start RTL Hierarchical Component Statistics 
---------------------------------------------------------------------------------
Hierarchical RTL Component report 
Module synchronizer 
Detailed RTL Component Info : 
+---Registers : 
	                1 Bit    Registers := 2     
Module debouncer_FSM 
Detailed RTL Component Info : 
+---Adders : 
	   2 Input      4 Bit       Adders := 1     
+---Registers : 
	                6 Bit    Registers := 1     
	                4 Bit    Registers := 1     
	                1 Bit    Registers := 2     
+---Muxes : 
	   2 Input      3 Bit        Muxes := 3     
	   2 Input      2 Bit        Muxes := 2     
	   2 Input      1 Bit        Muxes := 4     
	   6 Input      1 Bit        Muxes := 3     
Module ALU 
Detailed RTL Component Info : 
+---Adders : 
	   2 Input     17 Bit       Adders := 2     
	   2 Input     16 Bit       Adders := 1     
+---Muxes : 
	   4 Input     16 Bit        Muxes := 1     
	   4 Input      1 Bit        Muxes := 2     
Module reg_ALU 
Detailed RTL Component Info : 
+---Registers : 
	               16 Bit    Registers := 3     
	                4 Bit    Registers := 1     
	                2 Bit    Registers := 1     
Module polish_calculator_undo 
Detailed RTL Component Info : 
+---Muxes : 
	   9 Input      8 Bit        Muxes := 1     
	   2 Input      6 Bit        Muxes := 1     
	   2 Input      5 Bit        Muxes := 1     
	   2 Input      4 Bit        Muxes := 1     
	   2 Input      1 Bit        Muxes := 1     
	   6 Input      1 Bit        Muxes := 5     
	   9 Input      1 Bit        Muxes := 1     
Module display_selector 
Detailed RTL Component Info : 
+---Muxes : 
	   2 Input     16 Bit        Muxes := 1     
Module translator_internal_fsm 
Detailed RTL Component Info : 
+---Muxes : 
	   4 Input      3 Bit        Muxes := 1     
	   2 Input      2 Bit        Muxes := 1     
	   2 Input      1 Bit        Muxes := 1     
	   4 Input      1 Bit        Muxes := 1     
Module unsigned_to_bcd 
Detailed RTL Component Info : 
+---Adders : 
	   2 Input      6 Bit       Adders := 1     
	   2 Input      4 Bit       Adders := 8     
+---Registers : 
	               32 Bit    Registers := 2     
	                6 Bit    Registers := 1     
+---Muxes : 
	   4 Input     32 Bit        Muxes := 2     
	   4 Input      6 Bit        Muxes := 1     
	   4 Input      3 Bit        Muxes := 1     
	   2 Input      3 Bit        Muxes := 1     
	   2 Input      1 Bit        Muxes := 1     
	   4 Input      1 Bit        Muxes := 4     
Module translator_conversion 
Detailed RTL Component Info : 
+---Registers : 
	               16 Bit    Registers := 1     
Module counter_N 
Detailed RTL Component Info : 
+---Adders : 
	   2 Input      3 Bit       Adders := 1     
+---Registers : 
	                3 Bit    Registers := 1     
Module translator 
Detailed RTL Component Info : 
+---Muxes : 
	   2 Input     20 Bit        Muxes := 1     
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

