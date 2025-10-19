main:
li a0, 4
li a1, 87
li a2, -124
li a3, -14
jal ra, FUNCION #menor4(4.81,-124,-14)
li a2, -124
bne a0, a2, noFunciona #min{4.81,-124,-14} != -124
funciona: li a1, 1
j fin
noFunciona: li a1, 0
fin: j fin

FUNCION:            #menor4(a0,a1,a2,a3)
 
#prologo
addi sp, sp, -16    #movemos el sp
sw a2, (0)sp        #m[sp] = a2 inicial
sw a3, (4)sp        #m[sp+4] = a3 inicial
sw ra, (8)sp        #m[sp+8] = ra inicial
sw s1, (12)sp       #m[sp+12] = s1 inicial  
#modificamos el prologo y el epilogo para guardar s1 y respetar las convenciones de llamadas

jal ra, FUNCION_AUX 
mv s1, a0           #s1 = menor(a0,a1)

lw a0, (0)sp        #a0 = a2 inicial
lw a1, (4)sp        #a1 = a3 inicial

jal ra, FUNCION_AUX #a0 = menor(a0,a1)

mv a1, s1           #a1 = s1
jal ra, FUNCION_AUX #a0 = menor(a0,a1)

#epilogo
lw ra, (8)sp    # ra = ra inicial
lw s1, (12)sp   # s1 = s1 inicial
addi sp, sp, 16 #restablecemos el sp
ret    
#return menor(menor(a0,a1),menor(a2,a3))

FUNCION_AUX:         #menor(a0,a1)

#prologo
addi sp, sp, -4      #movemos el sp
sw ra, (0)sp         #m[sp] = ra inicial

bgt a1, a0, terminar #if(a0<a1) return a0 
mv a0, a1            #else return a1

terminar: 
#epilogo
lw ra, (0)sp        #ra = ra inicial
addi sp, sp, 4      #restablecemos el sp
#agregamos epilogo para que el sp se mantenga y respetar las convenciones de llamada
ret
