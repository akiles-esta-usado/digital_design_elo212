### 2.4 Modificación de controlador del Semáforo
La funcionalidad del semáforo del ejemplo asume que los valores de entrada se miden en cada ciclo de reloj.
Se asumió que el reloj tiene un periodo de varios segundos.

Ahora, asuma que se opera a 100 MHz.

Utilizando el molde de Timed FSM, modifique 'semaforo_FSM' para que los sensores muestreen cada 5 segundos.

En otras palabras, la máquina permanece en un estado por 5 segundos.

* Delay indica cuantos clock tienen que pasar para que el cambio de estado sea efectivo


