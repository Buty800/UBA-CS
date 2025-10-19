main: 
li a0, 4
li a1, 6
jal ra, FUNCION #suma(4,6)
li a2, 10
bne a0, a2, noFunciona #4+6 != 10 
funciona: li a1, 1
j fin
noFunciona: li a1, 0
fin: j fin

FUNCION:        #suma
addi sp, sp, -4 #
sw ra, (0)sp    #prologo

add a0, a0, a1  #cambiamos el registro de destino a a0 para cumplir las convenciones de llamada

lw ra, (0)sp    #
addi sp, sp, 4  #epilogo
ret