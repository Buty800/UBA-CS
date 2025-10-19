extern strcmp
global invocar_habilidad

; Completar las definiciones o borrarlas (en este ejercicio NO serán revisadas por el ABI enforcer)
DIRENTRY_NAME_OFFSET EQU 0
DIRENTRY_PTR_OFFSET EQU 16
DIRENTRY_SIZE EQU 24

FANTASTRUCO_DIR_OFFSET EQU 0
FANTASTRUCO_ENTRIES_OFFSET EQU 8
FANTASTRUCO_ARCHETYPE_OFFSET EQU 16
FANTASTRUCO_FACEUP_OFFSET EQU 24
FANTASTRUCO_SIZE EQU 32

section .rodata
; Acá se pueden poner todas las máscaras y datos que necesiten para el ejercicio

section .text

; void invocar_habilidad(void* carta, char* habilidad);
invocar_habilidad:
	; Te recomendamos llenar una tablita acá con cada parámetro y su
	; ubicación según la convención de llamada. Prestá atención a qué
	; valores son de 64 bits y qué valores son de 32 bits o 8 bits.
	;
	; RDI = void*    card ; Vale asumir que card siempre es al menos un card_t*
	; RSI = char*    habilidad
	push RBP
	mov RBP, RSP

	push R12
    push R13
    push R14
    push R15

	cmp RDI,0
	je .ret

	mov R12,RDI 
	mov R13,RSI 
	mov R14W, WORD [R12 + FANTASTRUCO_ENTRIES_OFFSET]
	mov R15,[R12 + FANTASTRUCO_DIR_OFFSET]

	.for:
	cmp R14W,0
	je .fin
	
	mov RDI,[R15]
	mov RSI,R13 
	call strcmp
	cmp EAX,0
	jne .siguiente
	mov RDI,R12 
	mov R10, [R15]
	call [R10 + DIRENTRY_PTR_OFFSET]
	
	jmp .ret

	.siguiente:
	add R15,8
	dec R14W
	jmp .for
	.fin:

	mov RDI,[R12 + FANTASTRUCO_ARCHETYPE_OFFSET]
	mov RSI,R13 
	call invocar_habilidad

	.ret:
	pop R15 
    pop R14
    pop R13
    pop R12

	pop RBP
    ret ;No te olvides el ret!
