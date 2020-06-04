# Objetivos

* Entender conceptos prácticos sobre frecuencia, periodo de reloj y su utilización
* Experimentar con concepto de aritmética en circuitos digitales
* Diseñar, implementar y verificar un esqueleto de ALU (Unidad Aritmética Lógica)

# Trabajo Previo
No incide en la evaluación, pero entenderlo ayudará a entender el resto del trabajo.

### A
¿Qué significa RTL en el contexto de diseños digitales?

### B
Código que describe un divisor de frecuencias.

COUNTER_MAX es un parámetro que permite al usuario setear un número entero positivo arbitrario.

Una vez entendido el código, derive una expresión general que permita obtener la frecuencia de relog de salida clk_out como función del a frecuencia de reloj de entrada clk_in y el parámetro COUNTER_MAX.

Utilizando la expresión obtenida, indique el valor de COUNTER_MAX para obtener un reloj de salida de 30Hz a partir de un relog de entrada de 10ns

¿Cuántos bits se necesitarían como mínimo para representar este número.

### C
¿Qué significa la directiva '`timescale 1ps / 1 ns'? qué sucede si no se incluye la directiva de compilación?

* Esta directiva se hereda de verilog, para diseños nuevos se recomienza utilizar timespace y timeprecision

### D
Explique la diferencia entre el reset sincrónico y el asincrónico.

Escriba un snippet de código en SystemVerilog que describa la funcionalidad de un flip flop con ambos tipos.

¿Qué tipo debería ocupar en el curso?

### E
Explique que es un latch y como se diferencia del flip flop.

Investigue y ejemplifique con código que provoque que la herramienta lógica genere latches.

¿Porqué los Latches se consideran inadecuados para implementaciones en FPGA?
¿Por qué existen como componente de circuito si no se recomienda su uso?
Discuta, Justifique y reporte sus fuentes de información.

# Actividades Evaluadas

### Revisión de Cada Etapa
Todo o nada, tener una actividad lista es requisito para pasar a la siguiente.

Además de Verificar, durante la revisión se pueden solicitar reportes que deben explicar

Toda actividad debe tener su diagrama de bloques y estar sin latches.

Deben seguir especificaciones de diseño.

Decisiones tomadas deben quedar explicitas con comentarios en el código

Cualquier integrante del grupo debe ser capaz de responder las preguntas.

### Entrega
Una vez el diseño esté terminado, debe enviar los archivos fuente del proyecto al profesor del paralelo. La nota se asignará con una evaluación exhaustiva

Un proyecto Vivado con nombre GPNN, en nuestro caso: "G301"

Cada actividad debe tener su top module independiente nombrado de la siguiente forma: "S4-ActividadN", con N el número de cada actividad.

### Verificación Exhaustiva
Si una actividad no la pasa, se considera no entregada. Y se avisará al grupo para que la entregue la clase siguiente corregida.

Se aplicarán los descuentos por atraso definidos en el reglamento.

## 3.1 Multiplexación Temporal para controlador de Múltiples Displays (25)

### Funcionalidad
DESCRIBA, SINTETICE Y VERIFIQUE la funcionalidad de un módulo que controle el display de 7 segmentos de la tarjeta.

Debe mostrar el valor hexadecimal de un número de N bits.

FIGURA 2: Caja negra de un display de 8 dígitos de 7 segmentos.

Las salidas corresponden a señales necesarias para mostrar el valor hexadecimal den número de entrada en los displays de la tarjeta.

Utilice TDM para compartir las señales de la salida en todos los displays

### Supuestos
Asuma que el módulo recibe como entrada de datos un número codificado BCD de N bits. (N=32)

Asuma reloj de entrada ajustado a la frecuencia necesaria para que el número se vea estático en los displays considerando el TDD.

### Criterios de Éxito

Utilice exactamente los mismos nombres y señales de la figura 2.

Ocupe el mismo orden en la declaración de señales multibit

si considera necesario agregar señales adicionales, agreguelas y explique porqué.

### Consejos
Revise el datasheet para determinar la polaridad de las señales.

No siempre un 1 significa encendido.

## 3.2 Generación de relojes de distinta frecuencia a partir de un reloj base (25)

### Contexto
El módulo de división de reloj es una implementación del concepto de generación de relojes de distinta frecuencia a partir de una frecuencia base.

El parámetro representa el número máximo de cuentas

Solo genera frecuencias aproximadas en función del parámetro de entrada.

Presenta limitantes en términos de usabilidad, el usuario debe realizar cálculos para ingresar los parámetros correctos.

### Funcionalidad del Módulo
Modifique el archivo base del divisor de reloj para que el usuario ingrese la frecuencia del relog base y la frecuencia deseada del relog en MHz.

En base a los dos parámetros, el módulo debe calcular los valores necesarios para obtener la frecuencia de salida aproximada a la indicada en el parámetro

### Testbenches
Asuma que el reloj de entrada es de 100 MHz.

Describa un módulo que instancie múltiples copias del módulo base, utilizando en cada instancia los parámetros para generar relojes de:
- 50 MHz
- 30 MHz
- 10 MHz
- 1  MHz

FIGURA 3: Diagrama de Alto nivel para el módulo generador de frecuencias de reloj.

## 3.3 ALU básica (50)
