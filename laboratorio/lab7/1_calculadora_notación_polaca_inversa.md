### 4.1 Calculadora Notación Polaca Inversa (40 ptos)

#### Definición del módulo
La funcionalidad se debe integrar bajo el siguiente módulo.

~~~ Act1_RPCalculator.sv
module Act1_RPCalculator #(parameter N_debouncer = 10) (
        input  logic        clk, resetN, Enter, // La N viene de NEGADO
        input  logic [15:0] DataIn,
        output logic [3:0]  Flags, // [3:0] = {N, Z, C, V}
        output logic [15:0] ToDisplay,
        output logic [X:0]  CurrentState
    );
~~~

#### FIGURA1: Diagrama de alto nivel del módulo

Incluye valores de salida para cada estado.

El diagrama es solo referencial. Puede realizar los cambios que se estimen necesarios.

Lo siguiente es obligatorio

* Operandos y resultado son de 16 bits. Resultado y flags deben seguir el mismo comportamiento de la ALU anterior.
* Toda lógica secuencial síncrona ocupa `clk` como reloj.
* Asuma que `Enter` y `resetN` se generan por pulsadores electromecánicos. Deben sincronizarse en base a `clk`. `Enter` debe pasar por un debouncer.
* El parámetro `N_debouncer` especifica un número mínimo de ciclos que la entrada debe mantenerse estable para detectar pulso válido.
* Ocupe ALU Retentora.
* La señal `resetN` genera una señal reset global. ese reset está negado.

#### FIGURA 2: Máquina de estados propuesta.
Figura 2 muestra diagrama referencial de una máquina que trabaja como la calculadora.
Se pueden agregar y quitar señales para implementar la funcionalidad del módulo.

En todos los estados se muestra el valor de los flags, y estos se modifican solo en el estado `Show_result` o con un Reset Global. Pero este comportamiento es causado por la ALU retentora.

* **Wait_OPA**: Permite ingresar el valor del primer operando de la ALU. la señal `toDisplay` muestra la señal `DataIn`. Al pulsar `Enter` el valor se guarda en la ALU Retentora
* **Wait_OPB**: Lo mismo que OPA pero con el segundo operando, B.
* **Wait_OpCode**: Ingresa el código de la operación y mientras se está así, `toDisplay` muestra el valor de `DataIn` y al pulsar `Enter` se cambia de estado y se registra el valor. Considere:
    * 00 - SUMA
    * 01 - RESTA
    * 10 - OR
    * 11 - AND
* **Show_result**: muestra el resultado de la operación especificada en los pasos anteriores.

La salida CurrentState indica el estado actual, la codificación se deja a nuestro criterio.

