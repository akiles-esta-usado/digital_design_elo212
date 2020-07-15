# Beta de la Guía de Actividades Sesión 7

## Objetivos
Aplicar conocimientos para diseñar y verificar una calculadora de 16 bits con notación polaca inversa.

## Actividades Evaluadas
Todo diseño debe empezar por un plan y una descripción breve sobre que se debe implementar.

Realizar diagrama de alto nivel de módulos usados y conexiones

Las actividades no se revisarán si no se tiene este diagrama.

* Revisión en formato TODO o NADA
* Antes de Verificar hay que mostrar reportes de síntesis lógica
* Requisitos de revisión: Mostrar diagrama de bloques y no tener latches
* No se asigna puntaje a una actividad si no se completan las anteriores
* Si las entradas son P y Q, no utilice A y B
* Para requisitos no explicitos, tome desiciones que estime conveniente, Documentelas.
* En cada presentación se realizarán preguntas, cada integrante debe ser capaz de responderlas. Si la respuesta no es satisfactoria no se revisará.
* La evaluación final está sujeta a una verificación funcional exhaustiva posterior a la sesión.
* Para que una actividad esté correcta, debe cumplir con:
    * Funcionalidad lógica
    * Apegada a las especificaciones
    * Salidas con polaridades correctas
* Actividades que no pasen verificación exhaustiva se evaluan como no entregada.
* Hay más detalles en el reglamento.

### 2.1 Calculadora Notación Polaca Inversa (40 ptos)

#### Definición del módulo
La funcionalidad se debe integrar bajo el siguiente módulo.

~~~ Act1_RPCalculator.sv
module Act1_RPCalculator #(parameter N_debouncer = 10) (
        input  logic        clk, resetN, Enter, // La N viene de NEGADO
        input  logic [15:0] DataIn,
        output logic [3:0]  ALUFlags,
        output logic [15:0] ToDisplay
    );
~~~

#### Diagrama del módulo
FIGURA 1 muestra un diagrama de alto nivel como referencia.
Incluye valores de salida para cada estado.

El diagrama es solo referencial. Puede realizar los cambios que se estimen necesarios.

* Operandos y resultado son de 16 bits.
* Toda lógica secuencial síncrona ocupa clk como reloj.
* Asuma que Enter y resetN se generan por pulsadores electromecánicos. Deben sincronizarse y filtrarse.
* El parámetro N_debouncer especifica un número mínimo de ciclos que la entrada debe mantenerse estable para detectar pulso válido.
* Ocupe una ALU Retentora
* La señal resetN genera una señal reset global. ese reset está negado.

#### Máquina de estados propuesta.
Figura 2 muestra diagrama referencial de la calculadora de notación polaca inversa.
Se pueden agregar y quitar señales para implementar la funcionalidad del módulo.

En todos los estados se muestra el valor de los flags, y estos cambian solo en Show_Result o con un Reset Global.

* Wait_OPA: Permite ingresar el valor del primer operando de la ALU. la señal toDisplay muestra la señal DataIn. Al pulsar Enter el valor se guarda en la ALU Retentora
* Wait_OPB: Lo mismo que OPA.
* Wait_OpCode: Ingresa el código de la operación y mientras se está así, toDisplay muestra el valor de DataIn y al Enter se cambia de estado y se registra el valor. Considere:
    * 00 - SUMA
    * 01 - RESTA
    * 10 - AND      // Esto no es como el lab 4
    * 11 - OR
* Show_Result: muestra el resultado de la operación especificada en los pasos anteriores.

La salida Current_State indica el estado actual.

### 2.2 Agregue funcionalidad UNDO (40 Ptos)
Añada la funcionalidad UNDO, la cual permite retroceder en la máquina de estados para modificar los datos ingresados.

#### Definición del módulo
Modifique el módulo a lo siguiente.

~~~ Act2_RPCalculator.sv
module Act2_RPCalculator #(parameter N_debouncer = 10) (
        input  logic        clk, resetN, Enter, Undo,
        input  logic [15:0] DataIn,
        output logic [3:0]  ALUFlags,
        output logic [15:0] ToDisplay
    );
~~~

Undo también viene de un pulsador.

Modifique la máquina de estados para devolverse a un estado anterior.

Si la máquina está en Wait_OPA no puede retroceder.

### 2.3 Agregue funcionalidad para visualizar en display (20 Ptos)
Agrege la capacidad de enviar valores al display de 7 segmentos.

FIGURA 3 Indica como debería quedar el módulo, solo hay que agregar funcionalidad.

~~~ Act3_RPCalculator.sv
module Act3_RPCalculator #(parameter N_debouncer = 10) (
        input  logic        clk, resetN, Enter, Undo, DisplayFormat
        input  logic [15:0] DataIn,
        output logic [3:0]  ALUFlags,
        output logic [6:0]  Segments, // Segments[0] = CA
        output logic [4:0]  Anodes    // Anodes[0] = AN0
    );
~~~

La señal DisplayFormat permite cambiar la representación de la salida entre hexadecimal (0) y decimal sin signo (1).

Utilice el algoritmo Double Dabble. en el repositorio está el módulo en Verilog.

Reutilice diseños anteriores para implementar el módulo de conversión binaria a display de 7 segmentos.

OBS: Al operar con 16 bits, requiere 4 displays para mostrar valor hex y 5 dec sin signo.

en el driver del display utilice el mismo reloj base del sistema. No es necesario un divisor de frecuencias.

### 2.4 Indicadores de Formato de Entrega.
