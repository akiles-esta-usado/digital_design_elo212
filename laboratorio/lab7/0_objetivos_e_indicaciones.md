## 1 Objetivos
Aplicar conocimientos para diseñar y verificar una calculadora de 16 bits con notación polaca inversa.

## 2 Indicaciones Generales
Todo diseño debe empezar por un plan y una descripción breve sobre que se debe implementar.

Realizar diagrama de alto nivel de módulos usados y conexiones

Las actividades no se revisarán si no se tiene este diagrama.

* Revisión en formato TODO o NADA
* Antes de Verificar hay que mostrar reportes de síntesis lógica
* Requisitos de revisión: Mostrar diagrama de bloques y no tener latches
* No se asigna puntaje a una actividad si no se completan las anteriores
* Si las entradas son P y Q, no utilice A y B
* Para requisitos no explicitos, tome desiciones que estime conveniente, Documentelas.
* En cada presentación se realizarán preguntas, cada integrante debe ser capaz de responderlas. Si la respuesta no es satisfactoria no se revisará.
* La evaluación final está sujeta a una verificación funcional exhaustiva posterior a la sesión.
* Para que una actividad esté correcta, debe cumplir con:
    * Funcionalidad lógica
    * Apegada a las especificaciones
    * Salidas con polaridades correctas
* Actividades que no pasen verificación exhaustiva se evaluan como no entregada.
* Hay más detalles en el reglamento.


## 3 Indicaciones Específicas
No cumplir con estas especificaciones hará que la descripción esté incorrecta.

1. Los módulos top deben seguir exactamente el nombre del template.
2. Las señales múltibit deben seguir exactamente el orden especificado.
3. Considere un reloj global para toda lógica, no incorpore dividores de reloj.
4. Mantenga N=10 en los ciclos de debouncer para considerar presión válida del botón.

Las indicaciones (3) y (4) son para comprobar funcionalidad, en la práctica no se aplican estos criterios.

### Indicaciones para la entrega
1. Incluya todos los archivos .sv de hardware sintetizable en una carpeta por actividad. No es necesario incluir testbenches.
2. El archivo asociado a top module de cada actividad debe tener el mismo nombre del template entregado.
3. Los submodulos pueden tener cualquier nombre.
4. Genere un archivo .zip de la carpeta principal. Se envia al enlace entregado en la sesión.

