# Uso de estos Testbenchs

He identificado 3 tipos de testbenchs:
- diseños combinacionanes
- diseños secuenciales cuyas únicas entradas son un relog y un reset
- diseños secuenciales con varias entradas.

La diferencia entre los dos secuenciales radica en que el reloj y el reset son
entregados por el testbench top, no por el bloque reader, que es el generador de señales.
