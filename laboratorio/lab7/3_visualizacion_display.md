### 4.3 Agregue funcionalidad para visualizar en display (20 Ptos)
Agrege la capacidad de enviar *operandos* y *resultados* al display de 7 segmentos. Añadir esto no debería requerir modificar el diseño anterior.

FIGURA 3 Indica como debería quedar el módulo, solo hay que agregar funcionalidad.

~~~ Act3_RPCalculator.sv
module Act3_RPCalculator #(parameter N_debouncer = 10) (
        input  logic        clk, resetN, 
        input  logic        Enter, Undo, DisplayFormat
        input  logic [15:0] DataIn,
        output logic [3:0]  Flags,
        output logic [3:0]  CurrentState,
        output logic [6:0]  Segments, // Segments[0] = CA
        output logic [4:0]  Anodes    // Anodes[0] = AN0
    );
~~~

La señal `DisplayFormat` cambia la representación de la salida `ToDisplay` entre:
- hexadecimal (0)
- decimal sin signo (1).

Asuma que esta señal viene de un switch, que debe ser sincronizado... no se si se deba aplicar debouncer, no se solicita.

Utilice el algoritmo `Double Dabble`. en el repositorio está el módulo en Verilog.

Reutilice diseños anteriores para implementar el módulo de conversión binaria a display de 7 segmentos.

**OBS**: Al operar con 16 bits, requiere 4 displays para mostrar valor hex y 5 dec sin signo.

#### Última nota
Verifique cuidadosamente:
- Salidas coincidentes con el enunciado
- Señales con correcta polaridad. Revise el Datasheet.

En la validación funcional, el driver del display debe utilizar el mismo reloj base del sistema para multiplexar ánodos.

# Solución
## Sintesis
[Act3_sintesis index md](Act3_sintesis/index.md)

## Simulación
Primero explica que va a realizar el testbench, la operación 10 - -5

Indica como se relaciona el cambio de estado con update, y luego la máquina de estado FSM y como lo hace para generar Trigger

La selección de formato es algo que se puede probar cuando estamos en fast_switching

Hay que comprobar que los segmentos y ánodos coinciden con el número en hexadecimal y binario.

## VERIFICAR
Que las flags tengan un valor correcto

