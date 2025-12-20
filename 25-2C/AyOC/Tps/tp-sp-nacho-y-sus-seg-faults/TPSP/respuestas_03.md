## Primera parte

a) ¿Cuántos niveles de privilegio podemos definir en las estructuras de paginación?

Son los mismos 4 niveles que estaban en segmentación. Aunque se puede dividir en dos: Supervisor y User. Si en la Page Directory Entry (PDE) está el bit de U/S (User/ Supervisor) en 0, solo el codigo de nivel de privilegio 0, 1 o 2 puede acceder a la tabla de paginas apuntada. Ocurre algo similar en las Page Table Entry (PTE), si el bit U/S está en 0 solo el codigo de nivel de privilegio 0, 1 o 2 puede acceder a la pagina apuntada. A esto se le llama modo supervisor. En cambio si ese mismo bit esta en 1, el codigo de los niveles incluidos en el modo supervisor y además el 3 (o sea de todos los niveles) pueden acceder a las tablas de paginas/paginas apuntadas.

b) ¿Cómo se traduce una dirección lógica en una dirección física? ¿Cómo participan la dirección lógica, el registro de control CR3, el directorio y la tabla de páginas? Recomendación: describan el proceso en pseudocódigo

Primero vamos a explicar que es una direccion lógica: los bits 11-0 son el offset dentro de la página fisica final, los bits 21-12 es el índice dentro de la Tabla de Paginas (PTI) y los bits 31-22 son el indice dentro del directorio de páginas (PDI). Ahora bien, el CR3 contiene la direccion fisica de la base del Directorio de Paginas de la tarea actual. 
Una vez que ya sabemos la direccion fisica del PD tenemos que buscar la PDI de la direccion logica y calcula: dir base de CR3 + (PDI * 4 bytes). Así, llega a la PDE que apunta a la direccion fisica de una PT. 
Ahora hay que leer el PTI y calcular: dir base del PT + (PTI * 4 bytes) asi obtenemos el PTE buscado, que apunta a la direccion fisica de la pagina final menos el offset.
Por ultimo, calculamos la direccion final haciendo la suma: dir base del frame + offset.


c) ¿Cuál es el efecto de los siguientes atributos en las entradas de la tabla de página?
   * D
   * A
   * PCD
   * PWT
   * U/S
   * R/W
   * P

* D: Es el bit de Dirty. Si está en 1 significa que la pagina ya está escrita, si está en 0 indica lo contrario. Se usa para saber si el contenido de la pagina ha sido modificado y en ese caso debe guardarlo en el disco antes de reemplazarla.

* A: Es el bit de Accessed. Indica si la página ha sido accedida, es decir leida o escrita. Es importante para algoritmos de reemplazo como LRU (Least Recently Used).

* PCD: Es el bit de Page Cache Disable. Como dice el nombre controla si una pagina puede ser cacheada, si está en 0 se permite y sino, se desabilita. Es útil en caso de querer acceder a dispositios mapeados en memoria

* PWT: Es el bit de Page Write Through. Éste es el que controla el modo de escritura de la caché. Si está en 0 el modo es write-back y sino el modo es write-through

* U/S: Es el bit de User/Supervisor y como mencionamos en el punto a) es el que controla el nivel de privilegio necesario para acceder a la tabla.

* R/W: Es el bit de Read/Write y controla los permisos de escritura/lectura. Si está en 0 está en modo solo lectura y si está en 1 también se habilita el modo escritura. En caso de querer escribir en una pagina solamente con el modo lectura se genera una page fault.

* P: Es el bit de Present (Presente). Si es 0, la entrada no es válida y se va a generar una Page Fault si se intenta acceder a la direccion. Sin embargo, si es 1 significa que la tabla de página está presente en la memoria física.

d) ¿Qué sucede si los atributos U/S y R/W del directorio y de la tabla de páginas difieren? ¿Cuáles terminan siendo los atributos de una página determinada en ese caso? Hint: buscar la tabla Combined Page-Directory and Page-Table Protection del manual 3 de Intel

Siempre se aplica el nivel de privilegio/permiso más restrictivo. O sea, si queremos que una página sea User, tanto la PDE como la PTE deben estar marcadas como User. Si cualquiera de las dos está como Supervisor, queda como Supervisor. Es analogo lo que ocurre con el atributo R/W, para que la página sea R/W tanto en el PDE como el PTE deben estar marcados como R/W. Sino, queda como read only. Aunque hay excepciones respecto de este segundo atributo y es que si en CR0 está el Write Protect desactivado, el kernel puede escribir en la página igual. Si en cambio está activado, se obedece el read only y cualquier intento de escritura arrojará un Page Fault.

e) Suponiendo que el código de la tarea ocupa dos páginas y utilizaremos una página para la pila de la tarea. ¿Cuántas páginas hace falta pedir a la unidad de manejo de memoria para el directorio, tablas de páginas y la memoria de una tarea?

Para el directorio se necesita una página, este es un costo fijo por tarea. Como dijimos que el stack va en la página siguiente al código y el código y stack en conjunto suman 3 páginas entonces tenemos un total de 8KB+4KB+4KB=16KB ocupados por la tarea. Como todas estas direcciones virtuales caen dentro del mismo bloque de 4MB, se necesita una sola tabla de paginas, lo que representa una página más. Y por último para la memoria compartida se necesita una página más. Entonces el total de páginas necesarias es 6. 

g)  ¿Qué es el buffer auxiliar de traducción (translation lookaside buffer o TLB) y por qué es necesario purgarlo (tlbflush) al introducir modificaciones a nuestras estructuras de paginación (directorio, tabla de páginas)? ¿Qué atributos posee cada traducción en la TLB? Al desalojar una entrada determinada de la TLB ¿Se ve afectada la homóloga en la tabla original para algún caso?

El TLB una memoria caché dentro de la MMU que se encarga de recordar las traducciones de direcciones virtuales a fisicas que se han realizado recientemente.
Es necesario purgarlo porque si se modifica la estructura podemos tener datos obsoletos (los que correspondian a las traducciones de la vieja estructura por ejemplo).
Cada traduccion de la TLB tiene la direccion fisica del numero de página fisico (los 20 bits superiores de la direccion fisica), los atributos que determinan el nivel de permisos (U/S, R/W, P) en su combinacion más restrictiva y despues otros atributos de la estructura que identifican al marco de pagina final por el numero de pagina como la flag de Dirty y el tipo de memoria.
El desalojo de una entrada nunca hace que la tabla original se vea afectada pues es una copia.