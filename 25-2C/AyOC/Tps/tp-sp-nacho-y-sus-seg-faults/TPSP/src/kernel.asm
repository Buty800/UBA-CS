; ** por compatibilidad se omiten tildes **
; ==============================================================================
; TALLER System Programming - Arquitectura y Organizacion de Computadoras - FCEN
; ==============================================================================

%include "print.mac"

global start


; --- extern de símbolos que vienen de C/otros asm ---
extern idt_init
extern IDT_DESC
extern pic_reset
extern pic_enable
extern GDT_DESC           ; struct { uint16 limit; uint32 base; } en gdt.c
extern A20_enable         ; rutina para habilitar A20 (def. en a20.asm)
extern screen_draw_layout ; tu rutina en screen.c (opcional, parte pantalla)
extern mmu_init_kernel_dir
extern tasks_screen_draw
extern sched_init
extern tss_init
extern tasks_init

; --- extern de símbolos que vienen de C/otros asm ---
extern mmu_init_task_dir
extern mmu_map_page
extern mmu_unmap_page
extern mmu_next_free_kernel_page
extern copy_page
extern tss_idle

; --- direcciones útiles (NASM no ve los #define de C) ---
%define KERNEL_PAGE_DIR               (0x00025000)
%define ON_DEMAND_MEM_START_VIRTUAL   0x07000000
%define DST_VIRT_PAGE                 0x00A00000
%define SRC_VIRT_PAGE                 0x00B00000

; --- Selectores/constantes que usamos en este .asm ---
%define CS_RING_0_SEL   (1 << 3)      ; index 1 -> 0x08
%define DS_RING_0_SEL   (3 << 3)      ; index 3 -> 0x18
%define KERNEL_STACK     0x25000
%define GDT_IDX_TASK_INITIAL  11
%define GDT_IDX_TASK_IDLE     12
%define TSS_INITIAL_SEL  (GDT_IDX_TASK_INITIAL << 3)
%define TSS_IDLE_SEL     (GDT_IDX_TASK_IDLE    << 3)
%define DIVISOR 1193
BITS 16
;; Saltear seccion de datos
jmp start

;;
;; Seccion de datos.
;; -------------------------------------------------------------------------- ;;
start_rm_msg db     'Iniciando kernel en Modo Real'
start_rm_len equ    $ - start_rm_msg

start_pm_msg db     'Iniciando kernel en Modo Protegido'
start_pm_len equ    $ - start_pm_msg
SECTION .data
align 4
idle_tss_ptr:
    dd 0
    dw (GDT_IDX_TASK_IDLE << 3)

SECTION .text
;;
;; Seccion de código.
;; -------------------------------------------------------------------------- ;;



BITS 16
start:
    ; ==============================
    ; ||  Salto a modo protegido  ||
    ; ==============================

    ; 1) Deshabilitar interrupciones
    cli

    ; 2) Cambiar modo de video a 80x50 (BIOS, modo real)
    mov ax, 0003h
    int 10h               ; set text mode 80x25
    xor bx, bx
    mov ax, 1112h
    int 10h               ; cargar font 8x8 -> 80x50

    ; 3) Mensaje de bienvenida en modo real
    ;    print_text_rm <ptr>, <len>, <fila>, <col>, <attr>
    print_text_rm start_rm_msg, start_rm_len, 0, 0, 0x0F

    ; 4) Habilitar A20 (necesario para direccionar por encima de 1MiB)
    call A20_enable

    ; 5) Cargar la GDT (LGDT usa el pseudo-descriptor GDT_DESC)
    lgdt [GDT_DESC]

    ; 6) Setear PE=1 en CR0 para entrar a modo protegido
    mov eax, cr0
    or  eax, 0x00000001
    mov cr0, eax

    ; 7) Saltar con far jmp para cargar CS y “serializar” el cambio
    jmp dword CS_RING_0_SEL:modo_protegido

; --------------------------------------------------------------------------

BITS 32
modo_protegido:
    ; A partir de acá estamos en modo protegido 32-bit

    ; 8) Cargar selectores de datos (ring 0) en todos los segmentos
    mov ax, DS_RING_0_SEL
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax

    ; 9) Inicializar la pila del kernel en 0x25000
    mov esp, KERNEL_STACK
    mov ebp, esp

    ; 10) Mensaje de bienvenida en modo protegido
    print_text_pm start_pm_msg, start_pm_len, 1, 0, 0x0A

    ; 11) (opcional) Dibujar layout de pantalla con tu rutina en C
    ;     (comentar si aun no implementaste screen_draw_layout)
    call screen_draw_layout
    
    ; ===================================
    ; ||     (Parte 3: Paginación)     ||
    ; ===================================

    ; 1) Construir PD/PT con identity mapping 0..4MiB
    call mmu_init_kernel_dir        ; EAX = dir. física del Page Directory

    ; 2) Cargar CR3
    mov  cr3, eax

    ; 3) Habilitar paging: CR0.PG = 1
    mov  eax, cr0
    or   eax, 0x80000001            ; bit PG
    mov  cr0, eax

    ; ========================
    ; ||  (Parte 4: Tareas) ||
    ; ========================

    ; COMPLETAR - reemplazar la implementacion de la interrupcion 88 (ver comentarios en isr.asm)
    ; COMPLETAR - las funciones en tss.c
    ; COMPLETAR - Inicializar tss
    call tss_init
    call tasks_screen_draw
    ; cargar TR con la TSS Inicial
    mov ax, TSS_INITIAL_SEL
    ltr ax
    
    ; COMPLETAR - Inicializar el scheduler
    call sched_init 
    ; COMPLETAR - Inicializar las tareas
    call tasks_init

    ; ===================================
    ; ||   (Parte 2: Interrupciones)   ||
    ; ===================================

    call idt_init
    lidt [IDT_DESC]

    call pic_reset
    call pic_enable

    ; Setteamos el PIT
    mov ax, DIVISOR
    out 0x40, al
    rol ax, 8
    out 0x40, al

    ; COMPLETAR (Parte 4: Tareas)- Cargar tarea inicial

    ; COMPLETAR - Habilitar interrupciones (!! en etapas posteriores, evaluar si se debe comentar este código !!)
    sti
    ; NOTA: Pueden chequear que las interrupciones funcionen forzando a que se
    ;       dispare alguna excepción (lo más sencillo es usar la instrucción
    ;       `int3`)

    ; COMPLETAR - Probar Sys_call (para etapas posteriores, comentar este código)
    ; Sys_call
    ; COMPLETAR - Probar generar una excepción (para etapas posteriores, comentar este código)
    
    ; ========================
    ; ||  (Parte 4: Tareas)  ||
    ; ========================
    
    ; COMPLETAR - Inicializar el directorio de paginas de la tarea de prueba
    push 0x1C000
    call mmu_init_task_dir
    add esp, 4
    mov [tss_idle + 0x1C], eax
    ; COMPLETAR - Cargar directorio de paginas de la tarea
    mov cr3, eax
    ; COMPLETAR - Restaurar directorio de paginas del kernel
    mov eax, KERNEL_PAGE_DIR
    mov cr3, eax
    ; COMPLETAR - Saltar a la primera tarea: Idle
    jmp TSS_IDLE_SEL:0

    ; Ciclar infinitamente 
    mov eax, 0xFFFF
    mov ebx, 0xFFFF
    mov ecx, 0xFFFF
    mov edx, 0xFFFF
    jmp $

;; -------------------------------------------------------------------------- ;;

%include "a20.asm"
