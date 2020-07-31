# 4.2 Agregue funcionalidad UNDO (40 Ptos)
Añada la funcionalidad UNDO, la cual permite retroceder en la máquina de estados para modificar los datos ingresados.

## Definición del módulo
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

## Ejemplo
Si estamos en `Wait_OpCode` y presionamos el botón `Undo`, la máquina volverá al estado `Wait_OPB`, permitiendo modificar su valor.

## Excepción
Si estamos en `Wait_OPA`, no podemos retroceder.

# Solución
## Planeación
Necesitamos un diagrama de estados similar al de Act1 pero con las transiciones undo

## Síntesis lógica
[Act2_sintesis index md](Act2_sintesis/index.md)

## Simulación

### Verificar que entradas y salidas corresponden
Act2 -> {Entradas, Salidas}

(Debería estar explicado) El valor que muestra ToDisplay depende del estado de la calculadora polaca
(Debería estar explicado) Por cada botón hay que esperar 10 + 2 ciclos para que el debouncer indique un pulso
(Debería estar explicado) Cada vez que se entra en un estado Load*, se actualizan los registros
(Debería estar explicado) Explicar la importancia del estado Load_Result, se debe a la señal displaySelector
(Debería estar explicado) Explicar que displaySelector se activa en Show_Result

Primero mostrar el código tb, para mostrar la operación.
(sim1) Comienza Cargando la operación 10 + 5
(sim2) Se presiona UNDO, hay una transición directa de Wait* a Wait*, sin pasar por el load. Notar que en Wait OPA se mantiene.
(sim3) La operacion que se sube es 10 - (-5)

### Si pide ver más,
(sim4) Proceso completo en que se cargan datos
