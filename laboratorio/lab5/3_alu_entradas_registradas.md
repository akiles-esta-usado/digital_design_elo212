## 2.3 ALU con entradas registradas.
Utilizando módulos anteriores, extienda el diseño anterior para agregar la funcionalizad de la FIGURA 2

El comportamiento de esta ALU es el siguiente.

### Bus de entrada data_in
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
Xilinx tiene laboratorios donde se desarrollan módulos que pueden ser de ayuda.


### Una vez descrito el diseño...
Observe, Analice y Compare
- Elaborated Design
- Síntesis Lógica

Revise cuidadosamente mensajes entregados, Diferencie warnings informativos de los críticos.

### Constraint
Mapee pines a interfaces de la placa.

Analice y discuta diferencias en términos de restricciones en datos de entrada con el diseño anterior.



## Respuesta 2.3
Se implementaron los módulos reg_ALU_display y top_reg_ALU_display

### evidencias
#### Sintesis
[synth_top_reg_ALU_display index md](synth_top_reg_ALU_display/index.md)
Seguimos con el 

#### Fotografia simulacion_tb_alu_display.png



OBS: Cuando reset=0, las entradas internas de la ALU mapean el valor de next_*, los que están indefinidos al encender el asunto.


#### Fotografia Elaborated Design
Cosas a destacar:
- reg_ALU y los registros anotados en las entradas y salidas.
- Explicar la disposición de los switches:
    - SW[3:0] -> data_in
    - SW[4]   -> update_Res
    - SW[5]   -> load_OP
    - SW[6]   -> load_B
    - SW[7]   -> load_A

### Restricciones
#### Display
Seguimos teniendo la restriccion de los 8 dígitos y por ende 32 bits.

#### SWITCHES
En este caso, dado que se pueden ingresar datos en distintos momentos temporales, podemos ocupar los 16 switches para ingresar los valores.

También se podría crear otra máquina de estados que permita ingresar más datos para A y B.
