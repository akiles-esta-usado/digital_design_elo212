## 2.2 Proceso de síntesis lógica e implementación.
### Explicación sobre los Constraints
En base a la FIGURA 1 se explicará como agregar constraints al proyecto.
También se explicarán otras cosas de síntesis e implementación

### Implementar FIGURA 1
Se pide implementar un diseño como el de la FIGURA 1 reutilizando módulos y conectando señales a perifericos de entrada y salida. El diagrama en si es una sugerencia.

Mantenga nombres de entrada y salida

Identifique restricciones en el tamaño de los datos.

Aplique los principios de jerarquia y modularidad.

## Respuesta 2.2
Se implementaron los módulos ALU_display y top_ALU_display

### evidencias
#### Sintesis
[synth_top_ALU_display index md](synth_top_ALU_display/index.md)

#### Fotografia simulacion_tb_alu_display.png
0x11 + 0x11 = 0x22 -> {01,01,01,01,01,01,12,12}

0x11 + 0x00 = 0x11 -> {01,01,01,01,01,01,4F,4F}

0x22 - 0x11 = 0x11 -> {01,01,01,01,01,01,4F,4F}

0x22 - 0x33 =-0x11 -> {38,38,38,38,38,38,30,38},(0x11 es b00010001)

#### Fotografia Elaborated Design
No considero de interes saber que hay en ALU_inst y en BCD_to_7_seg

Se trabaja con entradas y salidas de 4 bits

### Restricciones
#### Display
Solo tenemos 8 dígitos en el display, por lo que serían 8 anodos y números de 32 bits.

A y B pueden ser de, a lo más, 32 bits si nos restringimos por los displays


#### SWITCHES
Dado que tenemos 16 switches, solo podríamos introducir números de 16 bits a menos que usemos otros perifericos o usemos una máquina de estados.

Pero el drama también es que no podemos trabajar simultaneamente con 16 bits, habría que ocupar 8 para A y B. y el opcode puede introducirse por los botones.

