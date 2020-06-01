# 1 Requisitos de entrada

Completar las actividades de la sesión anterior

Entender el funcionamiento de:
- multiplexores
- decodificadores binarios

Entender como funcionan y se implementan:
- Contadores sincrónicos simples

Entender la asignación bloqueante y no bloqueante dentro de always_comb y always_ff

# 2 Objetivos

Definir templates y módulos genéricos

entender diferencia entre bloques combinacionales y secuenciales

Experimentar con la descripción y funcionalidad de:
- contadores sincrónicos
- Módulos parametrizados

Descripción de sistemas TDM Time Division Multiplexing


# 3 Actividades Guiadas
## 3.1 Uso de bloques combinacionales para lógica combinacional y secuencial síncrona
Se dará una breve descripción del bloque procedural combinacional y secuencial

Se entregarán indicaciones sobre su uso en la descripción de código sintetizable con asignaciones bloqueantes y no bloqueantes.

El jueves se discutiran con más detalle.

## 3.2 Multiplexor y decodificador binario
Escriba un código en SV basado en descripción procedural de:
- un multiplexor.
- un decodificador binario, aquí considere N entradas y 2^N salidas configuración one-hot.

Los diseños deben estar en un solo archivo fuente.

Prepare un testbench que realice una simulación exhaustiva. (Supongo que sería mejor preparar 2 testbenches)

Muestre resultados y discuta con el staff.

## 3.3 Contadores

### 3.3.1
Describa un módulo parametrizado para un contador free-run de N bits, N indica ancho de bits.

Debe recibir una señal de reloj y un reset sincrónico

Da como salida el valor actual del contador interno de N-bits

El incremento es en una unidad por canto de relog

El reset tira a 0

Haga un testbench, muestre resultados y discuta con el staff

Manifieste:
- Dudas
- Hallazgos fundamentales
- Observaciones

### 3.3.2
Probar con distintas variaciones

#### Reset Asincrónico
Averigue como implementar el contador con un reset asincrónico.

Investigue y analice ventajas y desventajas

En ninguna parte indica implementar.

#### Enable
Implemente un contador con enable.

Funcionamiento del enable al canto positivo:
- 1: El contador incrementa.
- 0: el contador mantiene el valor anterior.

#### Enable con entrada para valor
Añada '2' entradas nuevas:
- load: Solo un bit
- load_value: Arreglo de N bits

Si load está en alto al llegar el canto positivo, el contador se actualiza con el valor indicado en load_value

Si está bajo, el contador funciona normalmente.

#### Contador decremental e incremental
Se agrega la entrada dec de 1 bit

si dec está en alto al subir el relog, el contador opera de forma decremental.

si está bajo, el contador opera de forma incremental.

## 3.4 Revisión de diseños de referencia
El siguiente enlace continene buenas plantillas de diseño.
https://www.xilinx.com/support/university/vivado/vivado-teaching-material/hdl-design.html

revise 'Modeling registers and Counters' y compare los diseños realizados con los de la página.

## 3.5 Multiplexación Temporal

### 3.5.1 Información previa
Revise detalles de operación del 7-segmentos

Investigue el principio Time Division Multiplexing

### 3.5.2 Diseño del circuito
Diseñe y describa un sistema basado en un contador de 16 bits que muestre el valor instantaneo del contador en base hexadecimal.

Note: Un número de 16 bits corresponde a 4 símbolos hex.

Haga un diagrama de alto nivel que muestre las componentes principales del sistema y sus interconexiones.

Se necesitan:
- multiplexores
- Decodificadores
- contadores

Muestre y discuta el diagrama con el staff, explicando lo que se asume y consideraciones del diseño

### 3.5.3 Escribir el código HDL
Cuando el diseño sea aprobado, describa el circuito y verifique el comportamiento funcional.

### Observación importante

A partir de ahora, el diagrama en alto nivel será requisito para la revisión.

No hay que escribir una linea de código si no se tiene un diagrama previo

El staff no resolverá dudas ni se calificará si no se muestra el diagrama.

# 4. Actividades Adicionales :4
## 4.1 Clock Divider

Describa un módulo basado en contadores que

A partir de un relog de entrada

entregue por salida un reloj de una frecuencia menor a la del reloj de entrada

La frecuencia de salida debe estar especificada por medio de un parámetro que se puede definir al momento de instanciar el módulo.


