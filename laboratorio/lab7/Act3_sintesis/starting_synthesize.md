---------------------------------------------------------------------------------
Starting Synthesize : Time (s): cpu = 00:00:06 ; elapsed = 00:00:08 . Memory (MB): peak = 1623.199 ; gain = 156.445 ; free physical = 212 ; free virtual = 2936
---------------------------------------------------------------------------------
Act3_RPCalculator {
    INFO: [Synth 8-6157] synthesizing module 'Act3_RPCalculator' 
        Parameter N_debouncer bound to: 10 - type: integer 
        Parameter STATE_BITS bound to: 8 - type: integer 

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

        INFO: [Synth 8-6155] done synthesizing module 'Act2_RPCalculator' (7#1) 
    }
    translator {
        INFO: [Synth 8-6157] synthesizing module 'translator' 
            Parameter STATE_BITS bound to: 8 - type: integer 

        translator_conversion {
            INFO: [Synth 8-6157] synthesizing module 'translator_conversion' 
                Parameter STATE_BITS bound to: 8 - type: integer 

            translator_internal_fsm {
                INFO: [Synth 8-6157] synthesizing module 'translator_internal_fsm' 
                INFO: [Synth 8-155] case statement is not full and has no default 
                INFO: [Synth 8-6155] done synthesizing module 'translator_internal_fsm' (8#1)
            }

            unsigned_to_bcd {
                INFO: [Synth 8-6157] synthesizing module 'unsigned_to_bcd'
                    Parameter S_IDLE bound to: 1 - type: integer 
                    Parameter S_SHIFT bound to: 2 - type: integer 
                    Parameter S_ADD3 bound to: 4 - type: integer 
                    Parameter COUNTER_MAX bound to: 32 - type: integer 
                INFO: [Synth 8-6155] done synthesizing module 'unsigned_to_bcd' (9#1)
            }

            INFO: [Synth 8-6155] done synthesizing module 'translator_conversion' (10#1)
        }

        hex_to_7seg {
            INFO: [Synth 8-6157] synthesizing module 'hex_to_7seg'
                Parameter N bound to: 20 - type: integer 
                Parameter N_BLOCKS bound to: 5 - type: integer 

            mux {
                INFO: [Synth 8-6157] synthesizing module 'mux'
                    Parameter N_IN bound to: 8 - type: integer 
                    Parameter WIDTH bound to: 4 - type: integer 
                INFO: [Synth 8-6155] done synthesizing module 'mux' (11#1)
            }

            counter_N {
                INFO: [Synth 8-6157] synthesizing module 'counter_N'
                    Parameter N bound to: 3 - type: integer 
                INFO: [Synth 8-6155] done synthesizing module 'counter_N' (12#1)
            }

            BCD_to_seven_seg {
                INFO: [Synth 8-6157] synthesizing module 'BCD_to_seven_seg'
                INFO: [Synth 8-6155] done synthesizing module 'BCD_to_seven_seg' (13#1)
            }

            decoder_one_cold {
                INFO: [Synth 8-6157] synthesizing module 'decoder_one_cold'
                    Parameter N bound to: 3 - type: integer 
                INFO: [Synth 8-6155] done synthesizing module 'decoder_one_cold' (14#1)
            }

            INFO: [Synth 8-6155] done synthesizing module 'hex_to_7seg' (15#1)
        }

        INFO: [Synth 8-6155] done synthesizing module 'translator' (16#1)
    }

    INFO: [Synth 8-6155] done synthesizing module 'Act3_RPCalculator' (17#1)
}
---------------------------------------------------------------------------------
Finished Synthesize : Time (s): cpu = 00:00:08 ; elapsed = 00:00:11 . Memory (MB): peak = 1684.949 ; gain = 218.195 ; free physical = 245 ; free virtual = 2971
---------------------------------------------------------------------------------
