; Definiciones comunes
TRUE  EQU 1
FALSE EQU 0

; Identificador del jugador rojo
JUGADOR_ROJO EQU 1
; Identificador del jugador azul
JUGADOR_AZUL EQU 2

; Ancho y alto del tablero de juego
tablero.ANCHO EQU 10
tablero.ALTO  EQU 5

; Marca un OFFSET o SIZE como no completado
; Esto no lo chequea el ABI enforcer, sirve para saber a simple vista qué cosas
; quedaron sin completar :)
NO_COMPLETADO EQU -1

extern strcmp

;########### ESTOS SON LOS OFFSETS Y TAMAÑO DE LOS STRUCTS
; Completar las definiciones (serán revisadas por ABI enforcer):
carta.en_juego EQU 0
carta.nombre   EQU 1
carta.vida     EQU 14
carta.jugador  EQU 16
carta.SIZE     EQU 18

tablero.mano_jugador_rojo EQU 0
tablero.mano_jugador_azul EQU 8
tablero.campo             EQU 16
tablero.SIZE              EQU 16 + 8 * tablero.ANCHO * tablero.ALTO ; 416

accion.invocar   EQU 0
accion.destino   EQU 8
accion.siguiente EQU 16
accion.SIZE      EQU 24

; Variables globales de sólo lectura
section .rodata

; Marca el ejercicio 1 como hecho (`true`) o pendiente (`false`).
;
; Funciones a implementar:
;   - hay_accion_que_toque
global EJERCICIO_1_HECHO
EJERCICIO_1_HECHO: db TRUE

; Marca el ejercicio 2 como hecho (`true`) o pendiente (`false`).
;
; Funciones a implementar:
;   - invocar_acciones
global EJERCICIO_2_HECHO
EJERCICIO_2_HECHO: db TRUE

; Marca el ejercicio 3 como hecho (`true`) o pendiente (`false`).
;
; Funciones a implementar:
;   - contar_cartas
global EJERCICIO_3_HECHO
EJERCICIO_3_HECHO: db TRUE

section .text

; Dada una secuencia de acciones determinar si hay alguna cuya carta tenga un
; nombre idéntico (mismos contenidos, no mismo puntero) al pasado por
; parámetro.
;
; El resultado es un valor booleano, la representación de los booleanos de C es
; la siguiente:
;   - El valor `0` es `false`
;   - Cualquier otro valor es `true`
;
; ```c
; bool hay_accion_que_toque(accion_t* accion, char* nombre);
; ```
global hay_accion_que_toque
hay_accion_que_toque:
	; Te recomendamos llenar una tablita acá con cada parámetro y su
	; ubicación según la convención de llamada. Prestá atención a qué
	; valores son de 64 bits y qué valores son de 32 bits o 8 bits.
	;
	; RDI = accion_t*  accion
	; RSI = char*      nombre

	push RBP
	mov RBP, RSP 

	push R12 
	push R13 

	mov R12,RDI 
	mov R13,RSI 

	.while:
	cmp R12,0
	je .false

	mov RDI,[R12 + accion.destino]
	add RDI,carta.nombre
	mov RSI,R13 

	call strcmp 
	cmp EAX,0
	je .true

	mov R12, [R12 + accion.siguiente]
	jmp .while


	.true:
	mov RAX,1
	jmp .fin 
	.false:
	mov RAX,0

	.fin:

	pop R13
	pop R12

	pop RBP
	ret

; Invoca las acciones que fueron encoladas en la secuencia proporcionada en el
; primer parámetro.
;
; A la hora de procesar una acción esta sólo se invoca si la carta destino
; sigue en juego.
;
; Luego de invocar una acción, si la carta destino tiene cero puntos de vida,
; se debe marcar ésta como fuera de juego.
;
; Las funciones que implementan acciones de juego tienen la siguiente firma:
; ```c
; void mi_accion(tablero_t* tablero, carta_t* carta);
; ```
; - El tablero a utilizar es el pasado como parámetro
; - La carta a utilizar es la carta destino de la acción (`accion->destino`)
;
; Las acciones se deben invocar en el orden natural de la secuencia (primero la
; primera acción, segundo la segunda acción, etc). Las acciones asumen este
; orden de ejecución.
;
; ```c
; void invocar_acciones(accion_t* accion, tablero_t* tablero);
; ```
global invocar_acciones
invocar_acciones:
	; Te recomendamos llenar una tablita acá con cada parámetro y su
	; ubicación según la convención de llamada. Prestá atención a qué
	; valores son de 64 bits y qué valores son de 32 bits o 8 bits.
	;
	; RDI = accion_t*  accion
	; RSI = tablero_t* tablero
	push RBP
	mov RBP, RSP 

	push R12 
	push R13 
	push R14 
	push R15

	mov R12,RDI 
	mov R13,RSI 

	.while:
	cmp R12,0
	je .fin 

	mov R14,[R12 + accion.destino]

	cmp BYTE [R14 + carta.en_juego],0
	je .siguiente
	mov RDI,R13 
	mov RSI,R14
	call [R12 + accion.invocar]
	cmp WORD [R14 + carta.vida],0
	jne .siguiente
	mov BYTE [R14 + carta.en_juego],0

	.siguiente:
	mov R12,[R12 + accion.siguiente]
	jmp .while
	.fin:

	pop R15 
	pop R14
	pop R13
	pop R12

	pop RBP
	ret

; Cuenta la cantidad de cartas rojas y azules en el tablero.
;
; Dado un tablero revisa el campo de juego y cuenta la cantidad de cartas
; correspondientes al jugador rojo y al jugador azul. Este conteo incluye tanto
; a las cartas en juego cómo a las fuera de juego (siempre que estén visibles
; en el campo).
;
; Se debe considerar el caso de que el campo contenga cartas que no pertenecen
; a ninguno de los dos jugadores.
;
; Las posiciones libres del campo tienen punteros nulos en lugar de apuntar a
; una carta.
;
; El resultado debe ser escrito en las posiciones de memoria proporcionadas
; como parámetro.
;
; ```c
; void contar_cartas(tablero_t* tablero, uint32_t* cant_rojas, uint32_t* cant_azules);
; ```
global contar_cartas
contar_cartas:
	; Te recomendamos llenar una tablita acá con cada parámetro y su
	; ubicación según la convención de llamada. Prestá atención a qué
	; valores son de 64 bits y qué valores son de 32 bits o 8 bits.
	;
	; RDI = tablero_t* tablero
	; RSI = uint32_t*  cant_rojas
	; RDX = uint32_t*  cant_azules
	push RBP
	mov RBP, RSP 

	add RDI, tablero.campo

	mov DWORD [RSI],0
	mov DWORD [RDX],0

	xor R10,R10

	.for:
	cmp R10, tablero.ANCHO * tablero.ALTO
	je .fin 

	mov R11,[RDI]
	cmp R11,0
	je .siguiente

	cmp BYTE [R11 + carta.jugador],JUGADOR_ROJO
	jne .rojo  
	inc DWORD [RSI]
	.rojo:

	cmp BYTE [R11 + carta.jugador],JUGADOR_AZUL
	jne .azul 
	inc DWORD [RDX]
	.azul:


	.siguiente:
	add RDI,8
	inc R10
	jmp .for 
	.fin:

	pop RBP
	ret
