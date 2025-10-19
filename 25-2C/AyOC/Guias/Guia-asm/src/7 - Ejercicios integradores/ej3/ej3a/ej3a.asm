
extern malloc
;########### SECCION DE DATOS
section .data

;########### SECCION DE TEXTO (PROGRAMA)
section .text

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


contar_casos_por_nivel:
push RBP
mov RBP, RSP


xor R10,R10
.for:
cmp R10D,ESI
je .fin
mov R11, [RDI + CASO_USUARIO_OFFSET]
movsx R11, DWORD [R11 + USUARIO_NIVEL_OFFSET] 
add QWORD [RDX + 8*R11], CASO_SIZE 
inc R10
add RDI,CASO_SIZE
jmp .for
.fin:

pop RBP
ret 





;segmentacion_t* segmentar_casos(caso_t* arreglo_casos, int largo)
global segmentar_casos
; RDI = arreglo_casos
; ESI = largo
segmentar_casos:
push RBP
mov RBP, RSP

push R12
push R13
push R14
sub RSP, 24

mov R12,RDI
mov R13,RSI

mov QWORD [RSP],0
mov QWORD [RSP+8],0
mov QWORD [RSP+16],0

mov RDX,RSP 

call contar_casos_por_nivel

mov RDI,SEGMENTACION_SIZE
call malloc
mov R14,RAX

mov QWORD [R14+SEGMENTACION_CASOS0_OFFSET],0
mov RDI,[RSP]
cmp RDI,0
je .no0
call malloc
mov [R14+SEGMENTACION_CASOS0_OFFSET],RAX
.no0:


mov QWORD [R14+SEGMENTACION_CASOS1_OFFSET],0
mov RDI,[RSP + 8]
cmp RDI,0
je .no1
call malloc
mov [R14+SEGMENTACION_CASOS1_OFFSET],RAX
.no1:

mov QWORD [R14+SEGMENTACION_CASOS2_OFFSET],0
mov RDI,[RSP + 16]
cmp RDI,0
je .no2
call malloc
mov [R14+SEGMENTACION_CASOS2_OFFSET],RAX
.no2:

mov RAX,R14 
mov RDI,R12

mov QWORD [RSP],0
mov QWORD [RSP+8],0
mov QWORD [RSP+16],0


; xor R10,R10
; .for:
; cmp R10D,R13D
; je .fin

; mov R11, [RDI + CASO_USUARIO_OFFSET]            ;
; movsx R11, DWORD [R11 + USUARIO_NIVEL_OFFSET]   ; lvl = arreglo_casos[i].usuario->nivel

; mov R8,[RSP + 8*R11]                            ; j = contadores[lvl]
; add QWORD [RSP + 8*R11], CASO_SIZE 

; shl R11,4                                       ;
; ;mov R9,[RAX + R11]                              ; res->casos_nivel
; ;mov R9,[R9 + R8]                                ; &res->casos_nivel[j]
; ;mov R8,[RDI]
; ;mov [R9],R8                                    ; 


; inc R10
; add RDI,CASO_SIZE
; jmp .for
; .fin:


add RSP,24
pop R14
pop R13 
pop R12

pop RBP
ret