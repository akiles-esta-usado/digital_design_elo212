# Guía de Actividades Sesión 6


## 2 Actividades

### 2.1 Revisión de códigos de ejemplo y templates de máquinas de estado.
Revisión de ejemplos de máquinas de estado del repo.

Haga las consultas pertinentes

### 2.2 FSM para conversor nivel a pulso y controlador de semáforo
Se entregaron 2 módulos

- Detector de Canto, conversor de nivel a pulso (Slides)
- Semáforo Básico (Código en Repo)

Para cada ejemplo debe de:

#### 1. Analizar, describir y simular funcionalidad básica. 
Familizarse con la forma de verificar y depurar las máquinas de estado con los testbench

Supuse que la parte de 'unidad de tiempo arbitraria' era que no le dieramos importancia a esa parte.

----

#### 2. Revisar reportes de síntesis
Analizar warnings e infos asociadas al paso de HDL a netlist.

Preste especial atención a las inferencias de vivado.

Identifique codificación exacta inferida para los estados.

Módifique el código para ver efectos y cambios en la descripción.

Averigüe como forzar una codificación específica en:

- SystemVerilog
- Vivado

----

#### 3. Revise Datasheet
Identifique periféricos de entrada y salida que permitan implementar la funcionalidad de las FSM

Para el semáforo, identifique periféricos de para representar los colores

#### 4. Incorpore salidas a los periféricos.
Modifique las FSM para conectarlas a los periféricos identificados en el punto anterior.

Añada constraints necesarios para conectar salidas del módulo a los perifericos correspondientes.

### 2.3 Sincronizador y Debouncer para pulsadores mecánicos


### 2.4 Modificación de controlador del Semáforo
La funcionalidad del semáforo del ejemplo asume que los valores de entrada se miden en cada ciclo de reloj.
Se asumió que el reloj tiene un periodo de varios segundos.

Ahora, asuma que se opera a 100 MHz.

Utilizando el molde de Timed FSM, modifique 'semaforo_FSM' para que los sensores muestreen cada 5 segundos.

En otras palabras, la máquina permanece en un estado por 5 segundos.

### 2.5 Base de Máquina de Estado para Notación Polaca Inversa
