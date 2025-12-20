1) Explorando el manual Intel Volumen 3: System Programming. Sección 2.2 Modes of Operation. ¿A qué nos referimos con modo real y con modo protegido en un procesador Intel? ¿Qué particularidades tiene cada modo?

El modo protegido es el modo nativo del sistema donde tenemos la mayor cantidad de funcionalidades disponibles como características de la arquitectura, flexibilidad, performance y retrocompatibilidad con una base de software ya existente. Se puede direccionar hasta 4GB de memoria y trabaja por defecto en 32 o 64 bits dependiendo del procesador. La razón por la que se llama protegido a través de paginación o segmentación evitando que los programas "crasheen" a causa de acceder a memoria que le correspondía a otro proceso además de 4 niveles de privilegio. Estos niveles de privilegio inciden en la cantidad de instrucciones que tenemos disponibles. 

En cambio, el modo real es el de desarrollo del Intel 8086, con una serie de extensiones adicionales y es en el que arrancan todos los procesadores x86. Trabaja por defecto en 16 bits. Los programas tienen acceso directo y no protegido a toda la memoria. Tampoco hay niveles de privilegios y los modos de direccionamiento son más limitados. A diferencia del modo protegido, se puede direccionar como mucho 1MB de memoria.

2) Comenten en su equipo, ¿Por qué debemos hacer el pasaje de modo real a modo protegido? ¿No podríamos simplemente tener un sistema operativo en modo real? ¿Qué desventajas tendría?

Se debe hacer para que sea posible tener múltiples tareas o procesos corriendo al mismo tiempo sin que accedan a espacios de memoria que no les corresponden. A través del modo protegido podemos dedicar un espacio de memoria a un programa de manera tal que esto no ocurra. Entonces, la desventaja es la mencionada, el comportamiento de los programas sería poco predecible y podría resultar muy fácilmente en un acceso indebido a memoria de uno o más tareas.

3) Busquen el manual volumen 3 de Intel en la sección 3.4.5 Segment Descriptors. ¿Qué es la GDT? ¿Cómo es el formato de un descriptor de segmento, bit a bit? Expliquen brevemente para qué sirven los campos Limit, Base, G, P, DPL, S. También pueden referirse a los slides de la clase teórica, aunque recomendamos que se acostumbren a consultar el manual.

La GDT (Global Descriptor Table) es una tabla en memoria que contiene los descriptores de segmento, estos definen como se segmenta la memoria.

El descriptor de segmento ocupa 8 bytes y tiene el siguiente formato bit a bit: 

Primer palabra (4bytes): Limit (0:15) , Base (16:31)
Segunda palabra (4bytes): Base (0:7), Type (8:11), S (12:12), DPL (13:14), Limit (16:19),
AVL(20:20), L(21:21), D/B(22:22), G(23:23), Base(24:31)

* Limit: Especifica el tamaño del segmento. El procesador junta los dos campos de LIMIT para formar un valor de 20 bits. Puede ser interpretado de dos maneras dependiendo del valor de la granularidad (G):
    - Si G=0, el tamaño puede ir de 1Byte a 1MB con saltos de a Byte
    - Si G=1, el tamaño puede ir de 4KB a 4GB con saltos de a 4KB
Dependiendo si el segmento es expand down o expand up los ofsets de comparan de manera diferente para determinar si hay seg fault.
* Base: El procesador junta los tres campos de BASE para formar un valor de 32 bits que indica la posición de inicio del segmento. Es recomendable alinear la deirección a 16bits para mas performance.
* G: La flag de granularidad determina el escalado de LIMIT. Si es 0 salta de a Bytes y si es 1 escala de a 4KB.
Cuando es 1 chequea los 12 bits menos significativos del offset, por lo que si G=1 el offset puede ir de 0 a 4096.
* P: Indica si el segmento esta presente
    - P=1 : el segmento esta presente y puede ser usado
    - P=0: el segmento no esta presente y si se intenta acceder se lanza la excepción (NP)
* DPL: Indica el nivel de privilegio del segmento. Va de 0 a 3 siendo 0 el nivel mas privilegiado 
* S: Indica si el descriptor es para un segmento de sistema (0) o para código/datos (1)

4) La tabla de la sección 3.4.5.1 Code- and Data-Segment Descriptor Types del volumen 3 del manual del Intel nos permite completar el Type, los bits 11, 10, 9, 8. ¿Qué combinación de bits tendríamos que usar si queremos especificar un segmento para ejecución y lectura de código?

La combinación es 1010 porque: el bit mas significativo se pone en 1 pues es un segmento de codigo, el segundo mas significativo se pone en 0 pues es non-conforming (o sea no necesita acceder a procesos menos privilegiados), el segundo menos significativo es el de read enable y se activa porque el enunciado lo pide, por ultimo el menos significativo no se activa ya que no se aclara que fue accedido antes.

13) Investiguen en el manual de Intel sección 2.5 Control Registers, el registro CR0. ¿Deberíamos modificarlo para pasar a modo protegido? Si queremos modificar CR0, no podemos hacerlo directamente. Sólo mediante un MOV desde/hacia los registros de control (pueden leerlo en el manual en la sección citada).

Si, de hecho es uno de los pasos principales para pasar a modo protegido, para esto se debe prender el bit de Protection Enable (PE). Este registro de control contiene las system control flags que controlan el modo y estado del procesador. Ademas, tiene partes reservadas que deben ser escritas con 0s exclusivamente. Como dice el enunciado, no podemos modificarlo directamente, sino que tenemos que hacerlo a través de un mov. En modo protegido esto debe ser hecho por un proceso con nivel de prioridad 0, sino es una operacion no permitida.

15) Notemos que a continuación debe hacerse un jump far para posicionarse en el código de modo protegido. Miren el volumen 2 de Intel para ver los distintos tipos de JMPs disponibles y piensen cuál sería el formato adecuado. ¿Qué usarían como selector de segmento?

El JMP que tiene el formato adecuado es el jump far, es decir un jump entre segmentos distintos de mismo nivel de privilegio (aunque al estar en modo real no hay niveles de privilegio). En particular es el que aparece con una S en el operand/encoding en el manual de Intel, esto denota que se puede llegar a usar un  segment override para obtener la direccion del operando. Su sintaxis es jmp ptr16:16, aunque haya una que toma un offset de 32 bits, al estar en modo real estamos operando en 16 bits constantemente. El puntero de 16 bits es el selector de segmento mientras que el segundo parametro, como ya anticipamos, es el offset. El selector de segmento a usar es el del code segment, que en kernel.asm está escrito con la etiqueta CS_RING_0_SEL (0x08) o sea el primer selector después del nulo.

22) Observen el método screen_draw_box en screen.c y la estructura ca en screen.h . ¿Qué creen que hace el método screen_draw_box? ¿Cómo hace para acceder a la pantalla? ¿Qué estructura usa para representar cada carácter de la pantalla y cuanto ocupa en memoria?

Creemos que el metodo screen_draw_box pone en pantalla el fondo de la misma. Más especificamente pensamos que dibuja un rectangulo de tamaño fSize x cSize empezando en las coordenadas (fInit, cInit) llenandolo con el caracter pasado como parametro (character) y el atributo de color attr. Accede a la pantalla a través de un casteo de VIDEO a un puntero p bidimensional donde f es la fila y c la columna correspondiente. Se usa ca, la definida en screen.h, la cual tiene contiene un caracter y un atributo de un byte cada uno, por tanto ocupa 1 byte cada caracter y en memoria cada posicion ocupa 2 bytes (por el atributo+caracter).

24) Resumen final, discutan en el grupo qué pasos tuvieron que hacer para activar el procesador en modo protegido. Repasen todo el código que estuvieron completando y traten de comprenderlo en detalle ¿Qué cosas les parecieron más interesantes?

En modo real preparamos el entorno y pasamos a texto 80×50; luego habilitamos la línea A20 para poder direccionar por encima de 1 MiB. Definimos la GDT siguiendo el modelo flat y la cargamos; con eso activamos el modo protegido y, ya dentro de él, realizamos una impresión en pantalla para verificar que todo quedó estable.
Como cierre, nos sorprendió lo “mínimo viable” de un kernel: con muy pocos pasos bien ordenados —A20, GDT flat, cambio a protegido y una rutina de salida— ya se tiene un entorno de 32 bits funcionando.