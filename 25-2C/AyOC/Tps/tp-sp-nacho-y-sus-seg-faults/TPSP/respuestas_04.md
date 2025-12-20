## Primera Parte 
1. Si queremos definir un sistema que utilice sólo dos tareas, ¿Qué nuevas estructuras, cantidad de nuevas entradas en las estructuras ya definidas, y registros tenemos que configurar?¿Qué formato tienen? ¿Dónde se encuentran almacenadas?

Debemos definir una nueva estructura de Datos, el TSS (Task-State Segment). Por cada tarea tendremos que definit una instancia de la misma. El TSS es una estructura de memoria que el procesador utiliza para salvar y restaurar automáticamente el contexto completo de una tarea.
Es una estructura de 104 bytes que contiene campos para guardar todos los registros de la CPU. Se almacenan en cualquier lugar de la memoria RAM al que el kernel tenga acceso (generalmente, en el área de datos del kernel).

Debemos actualizar la GDT agregandole los descriptores por cada TSS. Estos son descriptor de sistema de 8 bytes en la GDT. Sus campos principales son: 
* Base Address: La dirección de memoria física donde comienza el TSS.
* Limit: El tamaño del TSS (debe ser al menos 103).
* Type : Se debe configurar como "Available 32-bit TSS".
* DPL : Generalmente 0, ya que solo el kernel debe gestionar las tareas.

Solo necesitas configurar un registro especial para que el sistema de tareas comience a funcionar, TR (Task Register). Es un registro de 16 bits. No almacena la dirección del TSS, sino el selector de segmento del descriptor del TSS de la tarea activa. Se configura una sola vez al arrancar el sistema (o al iniciar el scheduler). Se utiliza la instrucción LTR (Load Task Register) para cargar el selector de la primera tarea que se ejecutará.

2. ¿A qué llamamos cambio de contexto? ¿Cuándo se produce? ¿Qué efecto tiene sobre los registros del procesador? Expliquen en sus palabras que almacena el registro TR y cómo obtiene la información necesaria para ejecutar una tarea después de un cambio de contexto.

Un cambio de contexto es el proceso que realiza la CPU para detener la ejecución de una tarea y reanudar la ejecución de otra. El contexto es basicamente el valor de los registros en un istante dado. Realizar un cambio de contexto implica: Salvar el contexto de la tarea que deja de ejecutarse y cargar el contexto de la tarea que entra a ejecutarse.

El cambio de contexto se produce principalmente por una interrupción de hardware. La interrupción del reloj (_isr32) se dispara periódicamente, dentor de esta se llama a una que funciona como schedule, este luego decide si se debe cambiar de tarea. También puede ocurrir si una tarea realiza una syscall que voluntariamente cede la CPU.

El TR almacena el selector de segmento del descriptor de el TSS, es basicamente un puntero a un puntero al contexto de la tarea. Cuando se realiza un cambio de tarea se utiliza el TR para guardar el contexto de la tarea actual en el TSS. Luego con el selector de la Tarea entrante se obtiene el contexto de la tarea en su TSS y se carga en los registros. Por ultimo se actualiza el TR con el nuevo selector.

3. Al momento de realizar un cambio de contexto el procesador va almacenar el estado actual de acuerdo al selector indicado en el registro TR y ha de restaurar aquel almacenado en la TSS cuyo selector se asigna en el jmp far. ¿Qué consideraciones deberíamos tener para poder realizar el primer cambio de contexto? ¿Y cuáles cuando no tenemos tareas que ejecutar o se encuentran todas suspendidas?

Para realizar el primer cambio de contexto tenemos que tener en cuenta que no venimos ejecutando ninguna tarea y por tanto no tenemos un estado que guardar. Para esto se necesita una tarea inicial y una tarea idle (también necesaria para cuando el sistema operativo no hace nada) a la que saltar desde la inicial. Una vez que hicimos ltr al selector de segmento de la tarea inicial debemos asegurarnos de que el TSS (task state segment) esté inicializado como la tarea idle lo requiere, es decir: EIP, ESP, EBP, ESP0, los selectores de segmento CS, DS, ES, FS, GS, SS, SS0, el CR3 con su directorio de paginas asociado y EFLAGS en 0x00000202 para tener las interrupciones habilitadas. 
Cuando no tenemos tareas que ejecutar entra en juego la ya mencionada tarea Idle ya que el procesador siempre debe tener al menos una tarea a la que saltar. Debe ser una tarea con su propia TSS, pila y el scheduler la debe tratar como cualquier otra

4. ¿Qué hace el scheduler de un Sistema Operativo? ¿A qué nos referimos con que usa una política?
El scheduler es el componente del kernel que decide que tarea se debe ejecutar a continuación y tiene un rol esencial en un sistema operativo ya que el procesador solo puede ejecutar una tarea a la vez. Administra la lista de tareas que se pueden ejecutar y elige la siguiente a ser ejecutada. Toma una decision cuando una tarea termina, bloquea, su tiempo signado se acaba o cuando una tarea de mayor prioridad está lista.

Cuando decimos que usa una politica queremos decir que tiene un algoritmo o conjunto de reglas que utiliza para tomar decisiones. Dependiendo del proposito del sistema operativo del que se habla el scheduler del mismo usa una politica u otra.

5. En un sistema de una única CPU, ¿cómo se hace para que los programas parezcan ejecutarse en simultáneo?

Se logra mediante lo que se llama context switching. Es decir, se va cambiando de contexto segun tiempo y prioridades de las tareas listas y la que se esta ejecutando actualmente. El proceso es resumidamente: el scheduler le asigna una pequeña porcion de tiempo a una tarea, una vez que se termina ese tiempo el timer genera una interrupcion de hardware lo que hace que el kernel con el scheduler intervenga, luego se guarda el contexto de la tarea interrumpida, se carga el nuevo contexto y se repite el proceso constantemente.

9. Utilizando info tss, verifiquen el valor del TR. También, verifiquen los valores de los registros CR3 con creg y de los registros de segmento CS, DS, SS con sreg. ¿Por qué hace falta tener definida la pila de nivel 0 en la tss?

Hace falta pues a la hora de la llamada de una interrupción el kernel necesita poder acceder a una pila segura desde la cual guardar el estado de las tareas de usuario sin tener problemas de acceso. Si no tuviese una pila de nivel 0, cuando se llama a una interrupcion el procesador no va a poder usar la pila de nivel 3 y puede llegar a ocasionar problemas de seguridad y/o estabilidad.

## Segunda Parte 

11 . 

a) Expliquen con sus palabras que se estaría ejecutando en cada tic del reloj línea por línea

```
global _isr32
  
_isr32:
    pushad                ;prologo: guarda los registros de proposito general en la pila
    call pic_finish1      ;
    
    call sched_next_task  ;llama al scheduler para ver a que tarea le toca ejecutarse. 
                          ;devuelve el selector de TSS de la próxima tarea en el registro AX.
    
    str cx                ;Guarda el contenido de TR en el registro CX
    cmp ax, cx            ;Se fija si la proxima tarea es la misma que la actual
    je .fin               ;Si es la misma tarea salta directamente al final por que no hay que hacer cambio de contecto

    mov word [sched_task_selector], ax ; Guarda el selector de la nueva tarea en la variable global sched_task_selector
    jmp far [sched_task_offset] ;utiliza la dirección de memoria (sched_task_offset y sched_task_selector) para apuntar al descriptor de TSS de la nueva tarea:
    ;El hardware del procesador detiene la ejecución actual.
    ;Salva el contexto completo de la tarea actual en su TSS.
    ;Carga el contexto completo de la nueva tarea desde el TSS apuntado por AX.
    ;Actualiza el registro TR para que apunte al TSS de la nueva tarea.
    ;La ejecución de la nueva tarea se reanuda donde la había dejado.

    .fin:
    popad ;epilogo: restaura todos los registros de propósito general
    iret  ;restaura EFLAGS, CS y EIP desde la pila, devolviendo el control a la tarea que ahora está activa como si nada hubiera pasado.

```

b) En la línea que dice jmp far [sched_task_offset] ¿De que tamaño es el dato que estaría leyendo desde la memoria? ¿Qué indica cada uno de estos valores? ¿Tiene algún efecto el offset elegido?


La instrucción jmp far [dirección] espera encontrar en memoria un puntero largo. En modo protegido de 32 bits, un puntero largo consta de un offset de 32 bits y un selector de 16 bits. Es decir el tamaño del dato es de 48 bits (6 Bytes)

En el codigo tenemos:

``` 
sched_task_offset:   dd 0xFFFFFFFF  
sched_task_selector: dw 0xFFFF      
```

Estas dos variables están definidas de forma contigua en la memoria. Cuando se ejecuta jmp far [sched_task_offset], el procesador lee los 6 bytes que comienzan en sched_task_offset

Los primeros 4 Bytes (sched_task_offset) se cargan en el EIP. Los siguientes 2 Bytes (sched_task_selecto) se cargan en el CS. Justo antes del salto, la línea mov word [sched_task_selector], ax actualizó este valor, por lo que el selector que se lee es el que la función sched_next_task devolvió en AX.


El offset elegido no tiene ningún efecto. El selector que se carga no apunta a un segmento de código normal, sino a un Descriptor de TSS en la GDT, esto lo detecta el procesador lo que inicia el cambio de tarea ignorando el campo offset del puntero.

c) ¿A dónde regresa la ejecución (eip) de una tarea cuando vuelve a ser puesta en ejecución?

Cuando se guarda el contexto se guardan todo los regsitros. El EIP que guarda en el TSS de esta tarea es la dirección de la instrucción inmediatamente siguiente al jmp far. Al cargar el contexto carga el EIP guardado en la TSS. Por lo tanto cuando el scheduler decide volver a ejecutar una tarea que había sido desalojada, esta reanuda su ejecución en la etiqueta '.fin'.

12. Para este Taller la cátedra ha creado un scheduler que devuelve la próxima tarea a ejecutar.

a) En los archivos sched.c y sched.h se encuentran definidos los métodos necesarios para el Scheduler. Expliquen cómo funciona el mismo, es decir, cómo decide cuál es la próxima tarea a ejecutar. Pueden encontrarlo en la función sched_next_task.

La función sched_next_task primero itera sobre las tareas disponibles para ver si alguna esta activa (o si su estado es runnable como dice en el codigo), si se encuentra una se sale del ciclo. Despues el indice usado para recorrer la lista de scheduled tasks se actualiza para estar entre 0 y la cantidad maxima de tareas menos uno.
La forma en que se accede a las scheduled tasks tiene que ver con la política elegida para el scheduler: es round-robin y por tanto se vuelve al principio una vez que se llego al final. Implementativamente se ve reflejado en el uso del operador modulo. En el caso de la condicion del for se usa para ver que no volvamos exactamente al mismo punto desde el que partimos, si no fuese asi la condicion terminariamos en un bucle infinito de no haber una task "runnable".
Una vez que se encuentra una tarea ejecutable la corremos y de no encontrar ser el caso entonces volvemos a la tarea idle.

## Tercera Parte

14. Como parte de la inicialización del kernel, en kernel.asm se pide agregar una llamada a la función tasks_init de task.c que a su vez llama a create_task. Observe las siguientes líneas:

```
int8_t task_id = sched_add_task(gdt_id << 3);

tss_tasks[task_id] = tss_create_user_task(task_code_start[tipo]);

gdt[gdt_id] = tss_gdt_entry_for_task(&tss_tasks[task_id]);
```

a) ¿Qué está haciendo la función tss_gdt_entry_for_task?

La funcion tss_gdt_entry_for_task le esta asignando a la tarea dada un descriptor de segmento de sistema (es de sistema ya que define una estructura de control del procesador que debe interpretar para realizar una operacion especial para el sistema). De esta manera el procesador sabe donde esta ese TSS, que atributos tiene y que tamaño tiene.

b) ¿Por qué motivo se realiza el desplazamiento a izquierda de gdt_id al pasarlo como parámetro de sched_add_task?

Porque gdt_id es el indice y no el selector de segmento completo. Los bits 15:3 del selector son gdt_id pero faltan los bits 3:0, que constan de Table Indicator (TI) y el RPL (Requested Privilege Level). Como el TI debe ir en 0, indicando que es un selector de segmento de la GDT y el RPL debe ser 0 por ser un selector de segmento de nivel del kernel entonces basta con un shift de 3 bits para poder tener la estructura completa como queremos.

15. Ejecuten las tareas en qemu y observen el código de estas superficialmente.

a) ¿Qué mecanismos usan para comunicarse con el kernel?

Hace uso de interfaces controladas por el sistema operativo, estas son: syscalls, páginas compartidas de memoria y estructuras de entorno (ENVIRONMENT).
Las syscalls son wrappers dados por el sistema operativo para que la tarea invoque rutinas del kernel. La que se usa en por ejemplo taskPong.c es syscall_draw.
El ENVIRONMENT es una estructura mapeada en una pagina de memoria compartida entre el kernel y cada tarea. Tiene informacion de solo lectura que el kernel usa y las tareas pueden usar como el estado del teclado, el ID de la tarea y demás.


b) ¿Por qué creen que no hay uso de variables globales? ¿Qué pasaría si una tarea intentase escribir en su .data con nuestro sistema?

Creemos que no hay uso de variables globales porque las variables de la tarea se guardan en su pila de usuario, ademas de que no tienen acceso de escritura al .data. Siguiendo en linea con esto, si una tarea intentase escribir en su .data con nuestro sistema causaria un Page Fault pues el procesador va a detectar que el proceso de modo usuario intento escribir en una pagina con permisos de solo lectura.

16. Observen tareas/task_prelude.asm. El código de este archivo se ubica al principio de las tareas.

a. ¿Por qué la tarea termina en un loop infinito?

Porque al final de todo esta la instruccion jmp $, que lo que hace es saltar a su misma posición asi generando un loop infinito. Se hace esto porque no hay una syscall para terminar la tarea y devolver el control de manera limpia. La CPU necesita tener un lugar a donde saltar y no ejecutar basura o provocar un page fault, entonces se hace uso de este jmp.

## Cuarta Parte 

18. Analicen el Makefile provisto. ¿Por qué se definen 2 "tipos" de tareas? ¿Como harían para ejecutar una tarea distinta? Cambien la tarea Snake por una tarea PongScoreboard.

Los dos "tipos" de tareas que hay son aquellas que estan escritas en assembly (idle) y aquellas que estan escritas en C (pong, snake). Al estar escritas en lenguajes diferentes tienen metodos de compliacion diferentes.

Para cambiar una tarea simplemente debemos cambiar el valor de TASKA o TASKB para que apunte al archivo .tsk de la nueva tarea.

```
TASKB=taskSnake.tsk
```

```
TASKB=taskPongScoreboard.tsk
```

19. Mirando la tarea Pong, ¿En que posición de memoria escribe esta tarea el puntaje que queremos imprimir? ¿Cómo funciona el mecanismo propuesto para compartir datos entre tareas?

La tarea taskPong escribe su puntaje en una dirección de memoria virtual que se calcula dinámicamente.

En el archivo taskPong.c se define la deireccion base:

```C
#define SHARED_SCORE_BASE_VADDR (PAGE_ON_DEMAND_BASE_VADDR + 0xF00)
```

A su vez en task_lib.h define PAGE_ON_DEMAND_BASE_VADDR como 0x07000000, por lo que la dirección base para los puntajes es 0x07000F00.

En la funcion update_shared_record_score la tarea usa su task_id para encontrar donde debe escribir el puntaje:

```C
uint32_t* current_task_record = (uint32_t*) (SHARED_SCORE_BASE_VADDR + ((uint32_t) task_id * sizeof(uint32_t)*2));
current_task_record[0] = pong->player1.score;
current_task_record[1] = pong->player2.score;
```
La tarea escribe en la dirección virtual 0x07000F00 + (task_id * 8).

Para compartir memoria usan la memoria compartida de la paginacion. Todas las tareas utilizan la misma dirección virtual base (0x07000000) para acceder a la memoria compartida. El kernel configura las Tablas de Páginas de todas estas tareas para que esa dirección virtual 0x07000000 se traduzca a la misma página de memoria física en la RAM. Cuando la Tarea A (ID 0) escribe en 0x07000F00, la MMU traduce esa dirección y escribe el dato en la página física compartida. Cuando la Tarea B (ID 1) escribe en 0x07000F04, la MMU escribe en la misma página física.

