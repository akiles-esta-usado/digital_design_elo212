# Información Previa al documento.
Sería genial si pudieran verificar que este documento resume bien la tarea, pero no voy a pedirles hacer eso.

Lo que si voy a exigir es lo siguiente:
- Leer ya sea el documento o este 'resumen'.
- Verificar que los nombres y lista de sensibilidad de cada módulo coincida con lo que se pide.

Lo que les recomiendo hacer:
- Verificar con un testbench la funcionalidad de cada módulo antes de verificar el módulo top.
- Si tienen que hacer un módulo interno sería bueno que antepusieran un 'i_' para entradas y 'o_' para salidas


*Sincronizar* es traer al dominio de reloj del sistema usando el double flopping (2 FF).

# Beta de la Guía de Actividades Sesión 7

## 1 Objetivos
Aplicar conocimientos para diseñar y verificar una calculadora de 16 bits con notación polaca inversa.

## 2 Indicaciones Generales
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

## 3 Indicaciones Específicas
No cumplir con estas especificaciones hará que la descripción esté incorrecta.

1. Los módulos top deben seguir exactamente el nombre del template.
2. Las señales múltibit deben seguir exactamente el orden especificado.
3. Considere un reloj global para toda lógica, no incorpore dividores de reloj.
4. Mantenga N=10 en los ciclos de debouncer para considerar presión válida del botón.

Las indicaciones (3) y (4) son para comprobar funcionalidad, en la práctica no se aplican estos criterios.

### Indicaciones para la entrega
1. Incluya todos los archivos .sv de hardware sintetizable en una carpeta por actividad. No es necesario incluir testbenches.
2. El archivo asociado a top module de cada actividad debe tener el mismo nombre del template entregado.
3. Los submodulos pueden tener cualquier nombre.
4. Genere un archivo .zip de la carpeta principal. Se envia al enlace entregado en la sesión.

## 4 Actividad Evaluada

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
