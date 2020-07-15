# 1 Objetivos

Revisar diseños previos

Entender el proceso de:
- Especificación de Constraints
- Síntesis Lógica
- Implementación de un diseño

Describir y experimentar con circuitos retentores.

# 2 Actividades

## 2.1 Revisión de la ALU y los diseños previos.
El el repositorio de GitHub hay un archivo que describe una ALU

Se pide simular y revisar el elaborated design de esa ALU y compararlo con el nuestro.

## 2.2 Proceso de síntesis lógica e implementación.
En base a la FIGURA 1 se explicará como agregar constraints al proyecto. También se explicarán otras cosas de síntesis e implementación

Se pide implementar un diseño como el de la FIGURA 1 reutilizando módulos y conectando señales a perifericos de entrada y salida. El diagrama en si es una sugerencia.

Mantenga nombres de entrada y salida

Identifique restricciones en el tamaño de los datos.

Aplique los principios de jerarquia y modularidad.

## 2.3 ALU con entradas registradas.
Utilizando módulos anteriores, extienda el diseño anterior para agregar la funcionalizad de la FIGURA 2

El comportamiento de esta ALU es el siguiente.

### Bus de entrada
Éxiste un único bus conectado a A, B, OpCode

### Bancos de registros
Se conectan a las entradas de la ALU

Solo cuando se activa la señal de carga, el valor del registro se actualiza con el valor actual del bus de datos.

Si la señal de carga no está activada, los cambios del bus no se reflejan en la ALU

### Salida de la ALU
El resultado de la operacion actual solo se propaga a los pines de salida si se activa UpdateRes.

### Reset
lleva el valor de salida de los registros a un valor conocido.

### Recomendaciones
Xilinx tiene módulos que realizan esta tarea, pueden servir de guía.

Una vez descrito el diseño, elaborated design y Síntesis lógica.

Mapee pines a interfaces de la tarjeta.

Analice y discuta restricciones

NO TERMINO DE LEERLO

## 2.4 Notación Polaca Inversa.
Investigue que es la notación polaca inversa

Piense como integrarla en el sistema

Considere que aparte del bus de datos dispone de un boton ENTER que está dsponible en todos los registros para el ingreso de datos

Los operandos y el operador deben ser ingresados en cierto orden.

### Dudas:
- una calculadora rpn debería tener un buffer para guardar los datos anteriores, como lo hacemos?
