---------------------------------------------------------------------------------
Start Cross Boundary and Area Optimization
---------------------------------------------------------------------------------
Warning: Parallel synthesis criteria is not met 

INFO: [Synth 8-3886] merging instance 'status_button/state_reg[5]' (FDR) to 'status_button_undo/state_reg[3]'
INFO: [Synth 8-3886] merging instance 'status_button/state_reg[4]' (FDR) to 'status_button_undo/state_reg[3]'
INFO: [Synth 8-3886] merging instance 'status_button/state_reg[3]' (FDR) to 'status_button_undo/state_reg[3]'

INFO: [Synth 8-3886] merging instance 'status_button_undo/state_reg[5]' (FDR) to 'status_button_undo/state_reg[3]'
INFO: [Synth 8-3886] merging instance 'status_button_undo/state_reg[4]' (FDR) to 'status_button_undo/state_reg[3]'

INFO: [Synth 8-3333] propagating constant 0 across sequential element (\status_button_undo/state_reg[3] )

INFO: [Synth 8-3886] merging instance 'pol_cal/ALU_inst/o_Result_reg[15]' (FDRE) to 'pol_cal/ALU_inst/o_Flags_reg[3]'
---------------------------------------------------------------------------------
Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:17 ; elapsed = 00:00:24 . Memory (MB): peak = 1817.766 ; gain = 346.582 ; free physical = 177 ; free virtual = 3273
---------------------------------------------------------------------------------


## Observaciones

Los primeros mensajes de INFOs están asociados al circuito que nos entregaron, por lo que no revisamos en profundidad que puede estar ocurriendo.

El último indica que se une la señal Result[15], el MSB, con Flags[3], que corresponde a N.

Esto tiene todo el sentido, dado que cuado Result[15] es 1, indica que el resultado es negativo.

