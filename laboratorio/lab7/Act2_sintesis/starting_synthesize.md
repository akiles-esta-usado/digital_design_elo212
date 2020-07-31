---------------------------------------------------------------------------------
Starting Synthesize : Time (s): cpu = 00:00:06 ; elapsed = 00:00:09 . Memory (MB): peak = 1606.660 ; gain = 135.477 ; free physical = 243 ; free virtual = 3476
---------------------------------------------------------------------------------
Act2_RPCalculator {
    INFO: [Synth 8-6157] synthesizing module 'Act2_RPCalculator'
        Parameter N_debouncer bound to: 10 - type: integer 
        Parameter STATE_BITS bound to: 8 - type: integer 

    synchronizer {
        INFO: [Synth 8-6157] synthesizing module 'synchronizer'
        INFO: [Synth 8-6155] done synthesizing module 'synchronizer' (1#1) 
    }

    debouncer_FSM {
        INFO: [Synth 8-6157] synthesizing module 'debouncer_FSM'
            Parameter DELAY bound to: 10 - type: integer 
            Parameter DELAY_WIDTH bound to: 4 - type: integer 
        INFO: [Synth 8-155] case statement is not full and has no default
        INFO: [Synth 8-6155] done synthesizing module 'debouncer_FSM' (2#1)
    }

    polish_calculator_undo {
        INFO: [Synth 8-6157] synthesizing module 'polish_calculator_undo' 
            Parameter WIDTH bound to: 16 - type: integer 
            Parameter STATE_BITS bound to: 8 - type: integer 
        INFO: [Synth 8-5534] Detected attribute (* fsm_encoding = "one_hot" *)

        reg_ALU {
            INFO: [Synth 8-6157] synthesizing module 'reg_ALU'
                Parameter WIDTH bound to: 16 - type: integer 
            
            ALU {
                INFO: [Synth 8-6157] synthesizing module 'ALU'
                    Parameter WIDTH bound to: 16 - type: integer 
                    Parameter ADD bound to: 2'b00 
                    Parameter SUBTRACT bound to: 2'b01 
                    Parameter OR bound to: 2'b10 
                    Parameter AND bound to: 2'b11 
                INFO: [Synth 8-226] default block is never used
                INFO: [Synth 8-6155] done synthesizing module 'ALU' (3#1)
            }

            INFO: [Synth 8-6155] done synthesizing module 'reg_ALU' (4#1)
        }
        INFO: [Synth 8-155] case statement is not full and has no default
        INFO: [Synth 8-155] case statement is not full and has no default
        INFO: [Synth 8-6155] done synthesizing module 'polish_calculator_undo' (5#1)
    }

    display_selector {
        INFO: [Synth 8-6157] synthesizing module 'display_selector'
        INFO: [Synth 8-6155] done synthesizing module 'display_selector' (6#1)
    }

    INFO: [Synth 8-6155] done synthesizing module 'Act2_RPCalculator' (7#1)|

}
---------------------------------------------------------------------------------
Finished Synthesize : Time (s): cpu = 00:00:08 ; elapsed = 00:00:11 . Memory (MB): peak = 1668.410 ; gain = 197.227 ; free physical = 277 ; free virtual = 3511
---------------------------------------------------------------------------------
