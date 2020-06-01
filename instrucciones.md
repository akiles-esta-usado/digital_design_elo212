# Como trabajar con test vectors

Cuando se crea un archivo para ser utilizado por un testbench, tiene que tener extensión .mem.

El archivo debe ser agregado al Workspace de la siguiente manera

Add Sources -> Add or create design source -> Add files -> Agrega todos los archivos .mem que vayas a ocupar.

Cuando se valla a ocupar la función readmemh o readmemb se debe anotar el nombre solamente, nada de ubicación.

como buenas prácticas, separar cada campo por underscore y la separación entre entradas y salidas con sobre underscore

en_tra_da__sa_li_da
