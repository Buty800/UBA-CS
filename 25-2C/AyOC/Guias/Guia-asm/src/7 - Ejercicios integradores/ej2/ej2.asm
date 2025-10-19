extern malloc
extern free

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
;   - optimizar
global EJERCICIO_2A_HECHO
EJERCICIO_2A_HECHO: db TRUE ; Cambiar por `TRUE` para correr los tests.

; Marca el ejercicio 1B como hecho (`true`) o pendiente (`false`).
;
; Funciones a implementar:
;   - contarCombustibleAsignado
global EJERCICIO_2B_HECHO
EJERCICIO_2B_HECHO: db TRUE ; Cambiar por `TRUE` para correr los tests.

; Marca el ejercicio 1C como hecho (`true`) o pendiente (`false`).
;
; Funciones a implementar:
;   - modificarUnidad
global EJERCICIO_2C_HECHO
EJERCICIO_2C_HECHO: db TRUE ; Cambiar por `TRUE` para correr los tests.

;########### ESTOS SON LOS OFFSETS Y TAMAÑO DE LOS STRUCTS
; Completar las definiciones (serán revisadas por ABI enforcer):
ATTACKUNIT_CLASE EQU 0
ATTACKUNIT_COMBUSTIBLE EQU 12
ATTACKUNIT_REFERENCES EQU 14
ATTACKUNIT_SIZE EQU 16

global optimizar
optimizar:
	; Te recomendamos llenar una tablita acá con cada parámetro y su
	; ubicación según la convención de llamada. Prestá atención a qué
	; valores son de 64 bits y qué valores son de 32 bits o 8 bits.
	;
	; RDI = mapa_t           mapa
	; RSI = attackunit_t*    compartida
	; RDX = uint32_t*        fun_hash(attackunit_t*)
	push RBP
	mov RBP, RSP
	
	push R12
	push R13
	push R14
	push R15 
	push RBX
	sub RSP,8

	mov R12,RDI 
	mov R13,RSI 
	mov R14,RDX 

	xor R15,R15 ; i = 0

	mov RDI,R13  ;
	call R14 	 ;	EBX = hash_objetivo
	mov EBX,EAX	 ;

	.for:
	cmp R15,255*255
	je .fin


	mov RDI,[R12]	;
	cmp RDI,0		; if(!mapa[i][j]) continue
	je .siguiente	;
	
	call R14 

	cmp EBX,EAX
	jne .siguiente

	mov RDI, [R12]
	dec BYTE [RDI + ATTACKUNIT_REFERENCES]	; mapa[i][j]->references--

	inc BYTE [R13 + ATTACKUNIT_REFERENCES]	; compartida->references++
	
	cmp BYTE [RDI + ATTACKUNIT_REFERENCES],0		
	jne .dont_free
	call free 								;if(!mapa[i][j]->references) free(mapa[i][j])
	.dont_free
	
	
	mov [R12],R13	;mapa[i][j] = compartida
	

	.siguiente:
	inc R15 
	add R12,8
	jmp .for
	.fin:

	add RSP,8
	pop RBX
	pop R15
	pop R14
	pop R13
	pop R12
	pop RBP
	ret

global contarCombustibleAsignado
contarCombustibleAsignado:
	; RDI = mapa_t           mapa
	; RSI = uint16_t*        fun_combustible(char*)
	push RBP
	mov RBP, RSP 
	
	push R12
	push R13
	push R14
	push R15 

	mov R12,RDI
	mov R13,RSI 
	xor R14,R14 	;i = 0
	xor R15D,R15D 	;res = 0

	.for:
	cmp R14,255*255
	je .end_for

	mov RDI, [R12]
	cmp RDI,0
	
	je .siguiente

	movsx R8D, WORD [RDI+ATTACKUNIT_COMBUSTIBLE]
	add R15D,R8D 
	mov RDI, RDI + ATTACKUNIT_CLASE
	call R13 
	movsx EAX,AX 
	sub R15D, EAX
	
	.siguiente:
	add R12,8
	inc R14
	jmp .for
	.end_for:

	mov EAX,R15D

	
	pop R15
	pop R14
	pop R13
	pop R12
	pop RBP
	ret

global modificarUnidad
modificarUnidad:
	; RDI = mapa_t           mapa
	; SIL = uint8_t          x
	; DL  = uint8_t          y
	; RCX = void*            fun_modificar(attackunit_t*)
	push RBP
	mov RBP, RSP 

	movsx RSI, SIL 	; x
	movsx RDX, DL  	; y

	imul RSI,RSI,255
	add RSI,RDX 
	shl RSI,3  

	add RDI,RSI 	;&mapa[x][y]

	mov RSI, [RDI] 	;mapa[x][y]

	cmp RSI, 0	 	; if(!mapa[x][y]) return 
	je .fin
	
	cmp BYTE [RSI+ATTACKUNIT_REFERENCES],1	;if(mapa[x][y]->references == 1)
	je .ref_unica

	dec BYTE [RSI+ATTACKUNIT_REFERENCES] ; mod->references--
	
	push RDI					;
	push RCX					;
	mov RDI, ATTACKUNIT_SIZE 	; malloc(16)
	call malloc					;
	pop RCX						;
	pop RDI						;

	mov RSI,[RDI]
	mov [RDI],RAX
	mov RDI,RAX

	mov R8,[RSI]		;
	mov R9,[RSI + 8]	; *mapa[x][y] = *mod
	mov [RDI],R8 		;
	mov [RDI + 8],R9 	;

	mov BYTE [RDI + ATTACKUNIT_REFERENCES], 1 ; mapa[x][y]->references = 1

	call RCX
	jmp .fin

	.ref_unica:
	mov RDI,[RDI]
	call RCX

	.fin:

	pop RBP
	ret
