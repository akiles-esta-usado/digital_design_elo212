# 2.2 FSM para conversor nivel a pulso y controlador de semáforo
Se entregaron 2 módulos

- Detector de Canto, conversor de nivel a pulso (Slides)
- Semáforo Básico (Código en Repo)

Para cada ejemplo debe de:

## 1. Analizar, describir y simular funcionalidad básica. 
Familizarse con la forma de verificar y depurar las máquinas de estado con los testbench

Supuse que la parte de 'unidad de tiempo arbitraria' era que no le dieramos importancia a eso.

### Solución
images/simulacion_level_to_pulse.png
images/simulacion_semaforo_ref.png

[synth_level_to_pulse index md](synth_level_to_pulse/index.md)
[synth_semaforo_ref index md](synth_semaforo_ref/index.md)

Destaca el lugar donde se referencia la inferencia de fsm

Lo que no entiendo es porqué en el level_to_pulse si indico que ocupe one-hot, asume una codificación que después corrige.

## 2. Revisar reportes de síntesis
Analizar warnings e infos asociadas al paso de HDL a netlist.

Preste especial atención a las inferencias de vivado.

Identifique codificación exacta inferida para los estados.

Modifique el código para ver efectos y cambios en la descripción.

Averigüe como forzar una codificación específica en:

### Solución
- SystemVerilog
- Vivado

* Mostrar los info y warnings en los logs
* Marcar cuando vivado hace inferencias, codificaciones
* Mostrar apuntes de ug901 4.22 y 2.2

## 3. Revise Datasheet
Identifique periféricos de entrada y salida que permitan implementar la funcionalidad de las FSM

Para el semáforo, identifique periféricos de para representar los colores

### Solución
* Tengo apuntes donde indico como utilizarlas, sacados de documentación nexys:
    * Botones
    * Leds tricolores
* Con los leds, se recomienda ocupar PWM

## 4. Incorpore salidas a los periféricos.
Modifique las FSM para conectarlas a los periféricos identificados en el punto anterior.

Añada constraints necesarios para conectar salidas del módulo a los perifericos correspondientes.

### Solución
* Cada elemento tiene un Constraint y un Top module

Muestra los pdf de esquematicos para mostrar que hay intención de conectarse a pines de la placa.

Para demostrar que se utilizaron constraints, muestra los informes de síntesis.

en el semáforo, hay una parte interesante en Cross Boundaries

[synth_top_level_to_pulse index md](synth_top_level_to_pulse/index.md)
[synth_top_semaforo_led index md](synth_top_semaforo_led/index.md)



# 9: Basic I/O
## Botones
Se conectan a la FPGA con resistores para evitar cortocircuitos

### Configuración 'signo más'
Son 5 botones, dependiendo del estado generan las siguientes salidas:
- baja si está libres
- Alta si está presionado

## Leds
### LEDS individuales
se conectan por el ánodo a la FPGA mediante una resistencia de 330 ohm

Se encienden cuando se aplica alto voltaje

### LEDS No accesibles
Indican potencia, estado programable de la FPGA, estado del puerto ethernet y USB

## Tri-Color LED
Hay 2 leds tricolores de 3 leds internos (rojo, azul, verde) 

Poner en alto alguno el pin de algun led lo iluminará.

Se recomienda el uso de PWD. Llevarlos directamente a 1 puede resultar en un brillo molesto y disminución de vida útil.

Hay que ajustar el ciclo de trabajo para que esté en [0-50]%

## Observación
Los cortocicuitos de los switches y botónes suelen generarse al asignarlas como salidas.
