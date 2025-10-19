

;########### ESTOS SON LOS OFFSETS Y TAMAÑO DE LOS STRUCTS
; Completar las definiciones (serán revisadas por ABI enforcer):
NODO_OFFSET_NEXT EQU 8
NODO_OFFSET_CATEGORIA EQU 8
NODO_OFFSET_ARREGLO EQU 8
NODO_OFFSET_LONGITUD EQU 8
NODO_SIZE EQU 8
PACKED_NODO_OFFSET_NEXT EQU 8
PACKED_NODO_OFFSET_CATEGORIA EQU 8
PACKED_NODO_OFFSET_ARREGLO EQU 8
PACKED_NODO_OFFSET_LONGITUD EQU 8
PACKED_NODO_SIZE EQU 8
LISTA_OFFSET_HEAD EQU 8
LISTA_SIZE EQU 8
PACKED_LISTA_OFFSET_HEAD EQU 8
PACKED_LISTA_SIZE EQU 8

;########### SECCION DE DATOS
section .data

;########### SECCION DE TEXTO (PROGRAMA)
section .text

;########### LISTA DE FUNCIONES EXPORTADAS
global cantidad_total_de_elementos
global cantidad_total_de_elementos_packed

;########### DEFINICION DE FUNCIONES
;extern uint32_t cantidad_total_de_elementos(lista_t* lista);
;registros: lista[RDI]
cantidad_total_de_elementos:
	;prologo
  	push RBP 
  	mov RBP, RSP 
	
	xor EAX, EAX	; EAX = 0
	mov RDI, [RDI] 	; RDI = head 

	ciclo:
	cmp RDI,0 					; if RDI == NULL: return 
	je fin 						;
	add EAX, DWORD [RDI + 24] 	; EAX += RDI.longituc
	mov RDI, [RDI]			  	; RDI = RDI.next
	jmp ciclo					

	fin:
	;epilogo
	pop RBP 
  	ret

;extern uint32_t cantidad_total_de_elementos_packed(packed_lista_t* lista);
;registros: lista[RDI]
cantidad_total_de_elementos_packed:
	push RBP 
  	mov RBP, RSP 
	
	xor EAX, EAX	; EAX = 0
	mov RDI, [RDI] 	; RDI = head 

	ciclo_packed:
	cmp RDI,0 					; if RDI == NULL: return 
	je fin_packed				;
	add EAX, [RDI + 17] 		; EAX += RDI.longitud
	mov RDI, [RDI]			  	; RDI = RDI.next
	jmp ciclo_packed				

	fin_packed:
	;epilogo
	pop RBP 
  	ret

