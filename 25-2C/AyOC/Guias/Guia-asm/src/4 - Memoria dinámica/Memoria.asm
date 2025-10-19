extern malloc
extern free
extern fprintf

section .data

section .text

global strCmp
global strClone
global strDelete
global strPrint
global strLen

; ** String **

; int32_t strCmp(char* a, char* b)
; a[RDI], b[RSI]
strCmp:


	ciclo_cmp:				;
	mov R8B, BYTE [RDI]	;
	mov R9B, BYTE [RSI]	; while !(*a-*b)
	cmp R8B, R9B		; 	
	jne	fin_cmp			;
						;
	or R9B, R8B 		;
	cmp R9B,0			; if !*a && !*b : break
	je fin_cmp				;
						;
	inc RDI				; a++
	inc RSI				; b++
						;
	jmp ciclo_cmp		;
	fin_cmp:			;

	setl AL             ; al = 1 si a > b
	setg DL             ; dl = 1 si a < b
	sub AL, DL	        ; eax = (a > b) - (a< b)
	movsx EAX, AL		; expando AL a 32bits

	ret

; char* strClone(char* a)
; a[RDI]
strClone:
; epilogo
	push RBP
	push R12
	
	mov RBP, RSP
	mov R12, RDI ; Guardo el puntero en stack

	call strLen
	mov RDI, RAX 
	inc RDI 

	call malloc
	mov RDI, RAX 

	ciclo:			; do
	mov R9B, [R12]	; 
	mov [RDI], R9B	; *rdi = *r12
	inc RDI 		; rdi++
	inc R12 		; r12++
	cmp R9B,0		; 
	jne ciclo		; while (*r12)

	pop R12
	pop RBP
	ret

; void strDelete(char* a)
strDelete:
	push RBP 
	mov RBP, RSP 
	
	call free
	
	pop RBP 
  	ret

; void strPrint(char* a, FILE* pFile)
strPrint:
	ret

; uint32_t strLen(char* a)
; a[RDI]
strLen:
	xor EAX,EAX		; eax = 0
	
	ciclo_len:			;
	cmp BYTE [RDI],0	; while *a != 0
	je fin_len			;
						;
	inc RDI				;	a++
	inc EAX				;	eax++
						;
	jmp ciclo_len 		;	

	fin_len:		
	ret


