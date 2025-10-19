extern malloc

section .rodata
; Acá se pueden poner todas las máscaras y datos que necesiten para el ejercicio

section .text
; Marca un ejercicio como aún no completado (esto hace que no corran sus tests)
FALSE EQU 0
; Marca un ejercicio como hecho
TRUE  EQU 1

; Marca el ejercicio 1A como hecho (`true`) o pendiente (`false`).
;
; Funciones a implementar:
;   - es_indice_ordenado
global EJERCICIO_1A_HECHO
EJERCICIO_1A_HECHO: db TRUE ; Cambiar por `TRUE` para correr los tests.

; Marca el ejercicio 1B como hecho (`true`) o pendiente (`false`).
;
; Funciones a implementar:
;   - indice_a_inventario
global EJERCICIO_1B_HECHO
EJERCICIO_1B_HECHO: db TRUE ; Cambiar por `TRUE` para correr los tests.

;########### ESTOS SON LOS OFFSETS Y TAMAÑO DE LOS STRUCTS
; Completar las definiciones (serán revisadas por ABI enforcer):
ITEM_NOMBRE EQU 0
ITEM_FUERZA EQU 0
ITEM_DURABILIDAD EQU 0
ITEM_SIZE EQU 0

;; La funcion debe verificar si una vista del inventario está correctamente 
;; ordenada de acuerdo a un criterio (comparador)

;; bool es_indice_ordenado(item_t** inventario, uint16_t* indice, uint16_t tamanio, comparador_t comparador);

;; Dónde:
;; - `inventario`: Un array de punteros a ítems que representa el inventario a
;;   procesar.
;; - `indice`: El arreglo de índices en el inventario que representa la vista.
;; - `tamanio`: El tamaño del inventario (y de la vista).
;; - `comparador`: La función de comparación que a utilizar para verificar el
;;   orden.
;; 
;; Tenga en consideración:
;; - `tamanio` es un valor de 16 bits. La parte alta del registro en dónde viene
;;   como parámetro podría tener basura.
;; - `comparador` es una dirección de memoria a la que se debe saltar (vía `jmp` o
;;   `call`) para comenzar la ejecución de la subrutina en cuestión.
;; - Los tamaños de los arrays `inventario` e `indice` son ambos `tamanio`.
;; - `false` es el valor `0` y `true` es todo valor distinto de `0`.
;; - Importa que los ítems estén ordenados según el comparador. No hay necesidad
;;   de verificar que el orden sea estable.

global es_indice_ordenado
es_indice_ordenado:
	; Te recomendamos llenar una tablita acá con cada parámetro y su
	; ubicación según la convención de llamada. Prestá atención a qué
	; valores son de 64 bits y qué valores son de 32 bits o 8 bits.
	;
	; r/m64 = item_t**     inventario 	[RDI]
	; r/m64 = uint16_t*    indice		[RSI]
	; r/m16 = uint16_t     tamanio		[DX]
	; r/m64 = comparador_t comparador	[RCX]

	push RBP
	mov RBP, RSP 
	
	push R12 
	push R13
	push R14
	push R15
	
	mov R12, RDI 
	mov R13, RSI 
	mov R14W,DX
	mov R15, RCX 


	dec R14W 

	movsx RSI,WORD [R13]
	mov RSI, [R12 + RSI * 8]

	for_a:
	cmp R14W,0
	je end_for_a

	mov RDI,RSI
	add R13,2 
	movsx RSI,WORD [R13]
	mov RSI, [R12 + RSI * 8]

	call R15 
	cmp RAX,0
	je end_for_a

	dec R14W
	jmp for_a
	end_for_a:

	pop R15
	pop	R14
	pop R13 
	pop R12

	pop RBP 
  	ret

;; Dado un inventario y una vista, crear un nuevo inventario que mantenga el
;; orden descrito por la misma.

;; La memoria a solicitar para el nuevo inventario debe poder ser liberada
;; utilizando `free(ptr)`.

;; item_t** indice_a_inventario(item_t** inventario, uint16_t* indice, uint16_t tamanio);

;; Donde:
;; - `inventario` un array de punteros a ítems que representa el inventario a
;;   procesar.
;; - `indice` es el arreglo de índices en el inventario que representa la vista
;;   que vamos a usar para reorganizar el inventario.
;; - `tamanio` es el tamaño del inventario.
;; 
;; Tenga en consideración:
;; - Tanto los elementos de `inventario` como los del resultado son punteros a
;;   `ítems`. Se pide *copiar* estos punteros, **no se deben crear ni clonar
;;   ítems**

global indice_a_inventario
indice_a_inventario:
	; Te recomendamos llenar una tablita acá con cada parámetro y su
	; ubicación según la convención de llamada. Prestá atención a qué
	; valores son de 64 bits y qué valores son de 32 bits o 8 bits.
	;
	; r/m64 = item_t**  inventario	[RDI]
	; r/m64 = uint16_t* indice		[RSI]
	; r/m16 = uint16_t  tamanio		[DX]
	
	push RBP
	mov RBP, RSP 
	
	movsx RDX, DX

	push RDI
	push RSI  
	push RDX 
	
	shl RDX,3
	mov RDI,RDX 
	call malloc 
	
	pop RDX  
	pop RSI 
	pop RDI


	dec RDX 
	for_b:
	cmp RDX,0
	jl end_for_b

	movsx R8, WORD [RSI + 2*RDX]
	mov R8, [RDI + 8*R8]
	mov [RAX + 8*RDX], R8

	dec RDX
	jmp for_b
	end_for_b:  


	
	pop RBP 
  	ret
