# 2.1 Revisión de códigos de ejemplo y templates de máquinas de estado.
Revisión de ejemplos de máquinas de estado del repo.

Haga las consultas pertinentes

* Solo es necesario que respondan las observaciones que encontramos en las máquinas
* LISTO

## Respuestas

### Moore
Puede ser conveniente separar la lógica de transición de la lógica de valores de salida.

### Moore Timer
Existen varios timers especificos para cada estado. es necesario definir un timer máximo en donde el contador deje de contar. así no se da la vuelta.

porqué t >= TN-1? no tiene más coherencia que t >= TN o t > TN?.

| T-2 | T-1 | T | T+1 | T+2 |
| x   | v   | v | v   | v   |

### Mealy
Aquí no es posible separar la lógica de cambio de estado de la lógica de transición, porque es en la transición donde se define el estado.
