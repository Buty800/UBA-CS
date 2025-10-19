main:
li a0,2024         #cargamos el parametro directamente en a0 para no modificar s1
jal ra, FUNCION    #complementoAdos(2024)
li a2,2024         #cargamos el valor a testear despues por si es modificado al llamar a FUNCION  
add a0, a2, a0     #a0 = a0 + 2024
bnez a0, noFunciona    #a0 != 0

funciona:
li a1, 1
j fin
noFunciona:
li a1, 0    
fin:
j fin
    
FUNCION:           #complementoAdos
addi sp, sp, -4    #prólogo
sw ra, (0)sp       #


not a1, a0        #a1 = ~a0
addi a0, a1, 1    #a0 = a1 + 1

#cambiamos las modificaciones del registro s1 por a1, de este modo no se modifica el valor de s1 y el funcionamiento es el mismo

lw ra, (0)sp       #
addi sp, sp, 4     #epílogo
ret
    
