## Primera parte

1. 
a) Observen que la macro IDT_ENTRY0 corresponde a cada entrada de la IDT de nivel 0 ¿A qué se refiere cada campo? ¿Qué valores toma el campo offset?

Los campos se refieren a:

* offset_31_16: Bits 16–31 del offset de la ISR.
* offset_15_0: Bits 0–15 del offset.
* segsel: Selector del segmento de código en la GDT que se usa para saltar al handler.  
* reserved: Campo reservado, debe ser 0.  
* should_be_zero: Debe permanecer en 0 según la especificación.  
* type: Tipo de puerta.  
* dpl: Nivel de privilegio requerido para invocar la interrupción.  
* present: Indica si el descriptor está activo.  

El campo offset toma como valor la dirección de la rutina correspondiente a esa interrupción. El offset de divide en parte baja y parte alta.

b) Completar los campos de Selector de Segmento (segsel) y los atributos (attr) de manera que al usarse la macro defina una Interrupt Gate de nivel 0. Para el Selector de Segmento, recuerden que la rutina de atención de interrupción es un código que corre en el nivel del kernel. ¿Cuál sería un selector de segmento apropiado acorde a los índices definidos en la GDT[segsel]? ¿Y el valor de los atributos si usamos Gate Size de 32 bits?

* Selector de Segmento: el valor apropiado para segsel es `0x0008`, apunta al descriptor del segmento de código del kernel, que esta definido en el índice 1 de la GDT.

*  El valor de los atibutos para un Gate Size de 32 bits es:
    - present = 1: Descriptor presente.
    - DPL = 0: Nivel de privilegio 0 (requerido para excepciones de hardware).
    - S (Bit 4) = 0: Indica que es una compuerta del sistema.
    - Type (Bits 3-0) = 1110: Define el tipo como "32-bit Interrupt Gate".

c) Completar la función idt_init() con las entradas correspondientes a las interrupciones de reloj y teclado ¿Qué macro utilizarían?

Utilizamos la macro IDT_ENTRY0 ya que se trata de interrupciones de hardware que se ejecutan en modo kernel

## Segunda Parte

3. ¿Qué oficiaría de prólogo y epílogo de estas rutinas? ¿Qué marca el iret y por qué no usamos ret?

En las rutinas de atención: 

* Prólogo: Es la instrucción pushad. Su función es salvar el contexto (guardar todos los registros generales) en la pila. Esto asegura que la tarea interrumpida no pierda los valores de sus registros.
* Epílogo: Son las instrucciones popad e iret. Su función es restaurar el contexto (mediante popad, que recupera los registros guardados) y ceder el control (mediante `iret`) a la tarea que fue interrumpida.

La instrucción iret se usa para volver de un manejador de interrupción o excepción. La diferencia con `ret` esta en lo que el procesador guarda en la pila y cómo se restaura:

Al llamar a una interrupción se guarda en la pila el EFLAGS, CS y EIP a diferencia de cuando hacemos call que solo se guarda el EIP. Si usáramos ret en una interrupción, solo se restauraría el EIP y la pila quedaría desbalanceada. Con iret se restaura el tambien el EFLAGS y CS, dejando la pila balanceada. 
