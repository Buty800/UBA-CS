;########### SECCION DE DATOS
section .rodata
CLT: db "CLT",0
KDT: db "KDT",0
KSC: db "KSC",0
RBO: db "RBO",0



section .data

;########### SECCION DE TEXTO (PROGRAMA)
section .text
extern malloc
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

global calcular_estadisticas
;void calcular_estadisticas(caso_t* arreglo_casos, int largo, uint32_t usuario_id)
;RDI
;ESI
;EDX
calcular_estadisticas:

    push RBP
	mov RBP, RSP 

    push R12
    push R13
    push R14
    push R15

    mov R12,RDI
    mov R13,RSI
    mov R14,RDX

    mov RDI,ESTADISTICAS_SIZE
    call malloc
    mov R15,RAX 

    mov BYTE [R15 + ESTADISTICAS_CLT_OFFSET], 0
    mov BYTE [R15 + ESTADISTICAS_KDT_OFFSET], 0
    mov BYTE [R15 + ESTADISTICAS_KSC_OFFSET], 0
    mov BYTE [R15 + ESTADISTICAS_RBO_OFFSET], 0
    mov BYTE [R15 + ESTADISTICAS_ESTADO0_OFFSET], 0
    mov BYTE [R15 + ESTADISTICAS_ESTADO1_OFFSET], 0
    mov BYTE [R15 + ESTADISTICAS_ESTADO2_OFFSET], 0

    .for:
    cmp R13D,0
    je .fin

    cmp R14D,0
    je .stats 

    mov R10,[R12 + CASO_USUARIO_OFFSET]
    cmp R14D,DWORD [R10 + USUARIO_ID_OFFSET]
    je .stats

    jmp .siguiente

    .stats:
    
    movsx R10, WORD [R12 + CASO_ESTADO_OFFSET]
    inc BYTE [R15 + R10 + ESTADISTICAS_ESTADO0_OFFSET]

    mov RDI,R12
    mov RSI,CLT 
    call strcmp
    cmp EAX,0
    jne .if_CLT
    inc BYTE [R15 + ESTADISTICAS_CLT_OFFSET]
    .if_CLT:

    mov RDI,R12
    mov RSI,KDT
    call strcmp
    cmp EAX,0
    jne .if_KDT
    inc BYTE [R15 + ESTADISTICAS_KDT_OFFSET]
    .if_KDT:

    mov RDI,R12
    mov RSI,KSC
    call strcmp
    cmp EAX,0
    jne .if_KSC
    inc BYTE [R15 + ESTADISTICAS_KSC_OFFSET]
    .if_KSC:

    mov RDI,R12
    mov RSI,RBO
    call strcmp
    cmp EAX,0
    jne .if_RBO
    inc BYTE [R15 + ESTADISTICAS_RBO_OFFSET]
    .if_RBO:

    .siguiente:
    add R12,CASO_SIZE
    dec R13D
    jmp .for
    .fin:

    mov RAX,R15

    pop R15 
    pop R14
    pop R13
    pop R12

    pop RBP
    ret

