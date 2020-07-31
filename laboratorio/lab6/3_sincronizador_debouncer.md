# 2.3 Sincronizador y Debouncer para pulsadores mecánicos
## Antes de realizar la actividad
Investigue por fenomenos asociados a pulsadores mecánicos usados como entradas.

En general se requieren etapas de sincronización y filtro de rebotes.

## Ahora si
Revise PushButton_debouncer

Analice el código del FSM 

- identifique entradas y salidas
- obtenga diagrama de estados
- analice funcionalidad de los parámetros.

Considere reloj base de 100 MHz

Determine un valor adecuado para DELAY para capturar correctamente la presión del botón.

## Timed FSM y Factorización de máquinas
Esta máquina de estados ocupa estos conceptos

Timed: La transición de estados ocurre solo después de transcurrido un tiempo predefinido.

Factorized: El diseño de una máquina compleja se puede simplificar interconectando 2 máquinas pequeñas.

La máquina de estados principal tiene:
- una máquina que determina la secuencia a seguir a partir de los datos de entrada
- un contador que permite definir tiempos en que se mantiene en un estado, su salida se conecta como entrada a la primera máquina.

## FSM con Contador
Descripción Alternativa que no ocupa máquinas de estado

Compare ambos códigos, simule funcionalmente y verifique equivalencia.

### Solucion
Tengo un TB que muestra como funcionan. Hay una diferencia muy interesante
