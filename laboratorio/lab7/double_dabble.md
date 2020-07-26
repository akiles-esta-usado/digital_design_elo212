# Algoritmo Double Dabble
https://www.youtube.com/watch?v=eXIfZ1yKFlA

## Según Wikipedia
Algoritmo de conversión de números binario a Binary Coded Decimal BCD.

También se conoce como Shift-&-add-3

### Algoritmo
Supone un registro de 'n' bits de ancho que contiene un número binario.

Asigna un espacio con capacidad suficiente para almacenar el valor y su representacion en BCD, n + 4 * ceil(n/3).
Toma 4 bits en binario almacenar cada dígito decimal.



## Video de Computerphile


### Dudas
#### Por qué 4*ceil(n/3) es la cantidad de dígitos que ocupa la representación BCD?


## Implementación

Revisaré que ocurre en cada una de los estados

### S_IDLE
counter_next = 'd1;
shift_next = 'd0;
idle = 1'b1;

Si ocurre un trigger entonces state_next = S_SHIFT

### S_SHIFT
shift_next = {
    shift[30:0], 
    in[COUNTER_MAX - counter_next]
};


Si el contador llega al máximo, que coincide con el tamaño del bus de entrada, entonces
    bcd_next = shift_next;
    state_next = S_IDLE;

Si aún estamos contando, tenemos que verificar el valor de los bloques
   state_next = S_ADD3 



counter_next = counter + 'd1;

### S_ADD3
A cada bloque de 4 bits que tenga un valor superior a 5 se le suma 3.
