# Guía de Actividades Sesión 6

## 2 Actividades

### 2.1 Revisión de códigos de ejemplo y templates de máquinas de estado.
Revisión de ejemplos de máquinas de estado del repo.

Haga las consultas pertinentes

* Solo es necesario que respondan las observaciones que encontramos en las máquinas
* LISTO

### 2.2 FSM para conversor nivel a pulso y controlador de semáforo
Se entregaron 2 módulos

- Detector de Canto, conversor de nivel a pulso (Slides)
- Semáforo Básico (Código en Repo)

Para cada ejemplo debe de:

#### 1. Analizar, describir y simular funcionalidad básica. 
Familizarse con la forma de verificar y depurar las máquinas de estado con los testbench

Supuse que la parte de 'unidad de tiempo arbitraria' era que no le dieramos importancia a eso.

* Mostrar imágenes de testbench

#### 2. Revisar reportes de síntesis
Analizar warnings e infos asociadas al paso de HDL a netlist.

Preste especial atención a las inferencias de vivado.

Identifique codificación exacta inferida para los estados.

Modifique el código para ver efectos y cambios en la descripción.

Averigüe como forzar una codificación específica en:

- SystemVerilog
- Vivado

* Mostrar los info y warnings en los logs
* Marcar cuando vivado hace inferencias, codificaciones
* Mostrar apuntes de ug901 4.22 y 2.2

#### 3. Revise Datasheet
Identifique periféricos de entrada y salida que permitan implementar la funcionalidad de las FSM

Para el semáforo, identifique periféricos de para representar los colores

* Tengo apuntes donde indico como utilizarlas, sacados de documentación nexys:
    * Botones
    * Leds tricolores
* Con los leds, se recomienda ocupar PWM

#### 4. Incorpore salidas a los periféricos.
Modifique las FSM para conectarlas a los periféricos identificados en el punto anterior.

Añada constraints necesarios para conectar salidas del módulo a los perifericos correspondientes.

* Cada elemento tiene un Constraint y un Top module
* Tal vez haga falta una fotito.

### 2.3 Sincronizador y Debouncer para pulsadores mecánicos
#### Antes de realizar la actividad
Investigue por fenomenos asociados a pulsadores mecánicos usados como entradas.

En general se requieren etapas de sincronización y filtro de rebotes.

#### Ahora si
Revise PushButton_debouncer

Analice el código del FSM 
- identifique entradas y salidas
- obtenga diagrama de estados
- analice funcionalidad de los parámetros.

Considere reloj base de 100 MHz

Determine un valor adecuado para DELAY para capturar correctamente la presión del botón.

#### Timed FSM y Factorización de máquinas
Esta máquina de estados ocupa estos conceptos

Timed: La transición de estados ocurre solo después de transcurrido un tiempo predefinido.

Factorized: El diseño de una máquina compleja se puede simplificar interconectando 2 máquinas pequeñas.

La máquina de estados principal tiene:
- una máquina que determina la secuencia a seguir a partir de los datos de entrada
- un contador que permite definir tiempos en que se mantiene en un estado, su salida se conecta como entrada a la primera máquina.

#### FSM con Contador
Descripción Alternativa que no ocupa máquinas de estado

Compare ambos códigos, simule funcionalmente y verifique equivalencia.

### 2.4 Modificación de controlador del Semáforo
La funcionalidad del semáforo del ejemplo asume que los valores de entrada se miden en cada ciclo de reloj.
Se asumió que el reloj tiene un periodo de varios segundos.

Ahora, asuma que se opera a 100 MHz.

Utilizando el molde de Timed FSM, modifique 'semaforo_FSM' para que los sensores muestreen cada 5 segundos.

En otras palabras, la máquina permanece en un estado por 5 segundos.

* Delay indica cuantos clock tienen que pasar para que el cambio de estado sea efectivo

### 2.5 Base de Máquina de Estado para Notación Polaca Inversa
