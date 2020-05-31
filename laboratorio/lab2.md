# Laboratorio de Sistemas Digitales

## 1. Requisitos de Entrada
- Se debe haber terminado las actividades de la sesión previa, tener dominio sobre las tareas básicas de descripción y simulación
- Entender el funcionamiento de:
    - Flip Flop tipo D
    - Latch
    - Diferencias entre los dos
- Dominio en representación de números en distintas báses, en particular binario y Hexadecimal

## 2. Objetivos
- Reforzar conceptos fundamentales sobre descripción y simulación de hardware
- Estudiar la diferencia entre niveles de abstracción
- Estudiar asignaciones continuas y procedurales en SystemVerilog
- Aplicar jerarquía, modularidad, regularidad para desarrollar un sistema complejo

## 3. Actividades Guiadas
### 3.1 Revisión de reconocedor de Números fibbinarios de 4 bits
En Piazza hay un enlace a un repositorio de github. Obtener una copia del proyecto 'fib_example_project'

Dentro hay2 reconocedores de números fibbinarios descritas de distinta manera.

Descargue, analice y simule las descripciones, debe entender todo sobre:
- Descripción
- Simulación
- Estructura del proyecto
- Interpretación de los resultados

HAGA TODAS LAS PREGUNTAS NECESARIAS. NO HAY PREGUNTAS DEMASIADO SIMPLES O TONTAS

#### introducción a visualizar, leer, e interpretar mensajes y reportes para las distintas etapas de diseño

#### Diferencias entre entornos de descripción para síntesis lógica y simulación

### 3.2 BCD y display de 7 segmentos
Determine como opera cada uno de los displays de 7 segmentos
[display_7_seg md](display_7_seg.md)

Describa la funcionalidad de un circuito que reciba un número de 4 bits (BCD) y muestre en el display el símbolo en decimal.

#### BCD_to_sevenSeg
este circuito solamente convierte de BCD al código 7 segmentos, no trabaja directamente con el display

BCD_in [0:3] representa un número binario típico

sevenSeg[6:0] representa una traducción del número binario al 7 segmentos, si bien el circuito del display trabaja considerando los 0 como el valor acertado, el circuito que diseñamos ahora no considerará eso para hacerlo más estandar.

~~~
Anódo común: AN{0-7}
  |
==A==
F   B
==G==
E   C
==D== H
|||||||
Varios Cátodos: C{A-G}
~~~

Entonces: //Esto hay que corregirlo
     ABCDEFGH
- 0: 00000011
- 1: 0110000
- 2: 1101101
- 3: 1111001
- 4: 0110011
- 5: 1011011
- 6: 0011111
- 7: 1110000
- 8: 1111111
- 9: 1110011
- D: 0000000

Revise el Elaborated Design, vea lo que la herramienta infiere.

Luego de diseñar y sintetizar, hay que revisar:
- Warnings
- Errors


Elabore un testbench exhaustivo para el diseño.

### 3.3 Contador de 4 bits
Se diseña un circuito secuencial con 2 entradas de 1 bit (clk, reset), y una salida de 4 (count)

es necesario saber como funciona el FF tipo D

#### counter_4bit

#### tb_counter_4bit
Se declaran las variables internas

El Dummy Test

always indica una acción que siempre se realizará, pero no me gusta la forma en que se anotó.

initial muestra el bloque


### 3.4 Contador de n bits
Busque como parametrizar el contador para describir N bits.

Módulos parametrizables

Implemente un testbench que isntancie multiples módulos con distinto N

Visualice resultados en el tiempo y explore opciones para facilitar la visualización de resultados

p.e. agrupación de señales

### 3.5 Diseño modular de reconocedor de números fibbinarios
Fig 2

Debemos crear un top module que integre los módulos utilizados hasta ahora para crear un reconocedor de números fibinarios que los muestre por el display

### 3.6 Discusión y Actividades Adicionales
Las actividades de la sesión son simples e ilustrativas para facilitar el trabajo en el semestre

Es importante clarificar las dudas cuanto antes

Hay que aplicar los conceptos de modularidad, regularidad y jerarquía en los proximos proyectos, donde la complejidad irá aumentando

La dificultad del diseño digital se basa en encontrar los diagramas de alto nivel que reutilicen los módulos ya probados.
Es importante documentar todo (y hacerle testbench a todo tambien). En caso de realizar cambios al diagrama, documentar permite aprender de los errores e integrar nuevas perspetivas.
