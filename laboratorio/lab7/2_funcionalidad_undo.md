### 4.2 Agregue funcionalidad UNDO (40 Ptos)
Añada la funcionalidad UNDO, la cual permite retroceder en la máquina de estados para modificar los datos ingresados.

#### Definición del módulo
Modifique el módulo a lo siguiente.

~~~ Act2_RPCalculator.sv
module Act2_RPCalculator #(parameter N_debouncer = 10) (
        input  logic        clk, resetN, 
        inpit  logic        Enter, Undo,
        input  logic [15:0] DataIn,
        output logic [3:0]  Flags,
        output logic [15:0] ToDisplay,
        output logic [x:0]  CurrentState;
    );
~~~

Undo también viene de un pulsador, debe ser sincronizado y filtrado.

Ahora la máquina de estados debe ser capaz de retroceder a un estado anterior.

#### Ejemplo
Si estamos en `Wait_OpCode` y presionamos el botón `Undo`, la máquina volverá al estado `Wait_OPB`, permitiendo modificar su valor.

#### Excepción
Si estamos en `Wait_OPA`, no podemos retroceder.


