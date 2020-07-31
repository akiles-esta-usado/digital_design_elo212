INFO: [Synth 8-802] inferred FSM for state register 'pr_state_reg' in module 'polish_calculator_undo'
---------------------------------------------------------------------------------------------------
                   State |                     New Encoding |                Previous Encoding 
---------------------------------------------------------------------------------------------------
*
                Wait_OPA |                         00000001 |                         00000001
                Load_OPA |                         00000010 |                         00000010
                Wait_OPB |                         00000100 |                         00000100
                Load_OPB |                         00001000 |                         00001000
             Wait_OpCode |                         00010000 |                         00010000
             Load_OpCode |                         00100000 |                         00100000
             Load_Result |                         01000000 |                         01000000
             Show_Result |                         10000000 |                         10000000
---------------------------------------------------------------------------------------------------
INFO: [Synth 8-3898] No Re-encoding of one hot register 'pr_state_reg' in module 'polish_calculator_undo'

