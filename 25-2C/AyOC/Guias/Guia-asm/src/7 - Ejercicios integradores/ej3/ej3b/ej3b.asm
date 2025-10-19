extern abc
;########### SECCION DE DATOS
section .rodata
CLT: db "CLT",0
RBO: db "RBO",0

section .data

;########### SECCION DE TEXTO (PROGRAMA)
section .text
extern strcmp
; Completar las definiciones (serán revisadas por ABI enforcer):
USUARIO_ID_OFFSET EQU 0
USUARIO_NIVEL_OFFSET EQU 4
USUARIO_SIZE EQU 8

CASO_CATEGORIA_OFFSET EQU 0
CASO_ESTADO_OFFSET EQU 4
CASO_USUARIO_OFFSET EQU 8
CASO_SIZE EQU 16

SEGMENTACION_CASOS0_OFFSET EQU 0
SEGMENTACION_CASOS1_OFFSET EQU 8
SEGMENTACION_CASOS2_OFFSET EQU 16
SEGMENTACION_SIZE EQU 24

ESTADISTICAS_CLT_OFFSET EQU 0
ESTADISTICAS_RBO_OFFSET EQU 1
ESTADISTICAS_KSC_OFFSET EQU 2
ESTADISTICAS_KDT_OFFSET EQU 3
ESTADISTICAS_ESTADO0_OFFSET EQU 4
ESTADISTICAS_ESTADO1_OFFSET EQU 5
ESTADISTICAS_ESTADO2_OFFSET EQU 6
ESTADISTICAS_SIZE EQU 7

global resolver_automaticamente

;void resolver_automaticamente(funcionCierraCasos* funcion, caso_t* arreglo_casos, caso_t* casos_a_revisar, int largo)
;RDI = funcion
;RSI = arreglo_casos
;RDX = casos_a_revisar
;ECX = largo
resolver_automaticamente:
    push RBP
	mov RBP, RSP 

    push R12
    push R13
    push R14
    push R15

    mov R12,RDI
    mov R13,RSI
    mov R14,RDX
    mov R15,RCX

    .for:
    cmp R15D,0
    je .fin 

    mov R10,[R13 + CASO_USUARIO_OFFSET]
    movsx R10, DWORD [R10 + USUARIO_NIVEL_OFFSET]

    cmp R10,0
    je .revisar

    mov RDI,R13 
    call R12 
    cmp AX,0
    je .cat

    mov WORD [R13 + CASO_ESTADO_OFFSET],1
    jmp .siguiente

    .cat:
    mov RDI, R13
    mov RSI, CLT
    call strcmp
    cmp EAX,0
    je .desfavorable 

    mov RDI, R13
    mov RSI, RBO
    call strcmp
    cmp EAX,0
    je .desfavorable 

    jmp .revisar

    .desfavorable:
    mov WORD [R13 + CASO_ESTADO_OFFSET],2
    jmp .siguiente

    .revisar:
    mov [R14],R13
    add R14,CASO_SIZE

    .siguiente:
    add R13,CASO_SIZE
    dec R15D
    jmp .for
    .fin:

    pop R15
    pop R14
    pop R13
    pop R12

    pop RBP
    ret
