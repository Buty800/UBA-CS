main: 
li a0, 3
li a1, 10
li a2, -5
li a3, 2
li a4, 5
li a5, -1
jal ra, FUNCION
li a2, 1
bne a0, a2, noFunciona #ordenado2([3,5,10],[-5,-1,2]) != 1

funciona: li a1, 1
j fin
noFunciona: li a1, 0
fin: j fin

FUNCION: #ordenado2([a0,a4,a1],[a2,a5,a3])
#prologo
addi sp, sp, -12    #movemos el sp 
sw a2, (0)sp        #m[sp] = a2 inicial
sw s0, (4)sp        #m[sp+4] = s0 inicial
sw ra, (8)sp        #m[sp+8] = ra inicial

li s0, 1

mv a2, a4
jal ra, FUNCION_AUX #ordenado([a0,a4,a1])
bne a0, s0, return  #if(!a0) return a0

lw a0, (0)sp        #a0 = a2 inicial
mv a1, a3
mv a2, a5
jal ra, FUNCION_AUX #ordenado([a2,a5,a3])
bne a0, s0, return  #if(!a0) return a0

return: 
#subimos la lable para que siempre se ejecute el prologo
#epilogo
lw s0, (4)sp    #s0 = s0 inicial
lw ra, (8)sp    #ra = ra inicial
addi sp, sp, 12 #restablecer sp
ret    #return ordenado([a0,a4,a1]) ^ ordenado([a2,a5,a3])

FUNCION_AUX:      #ordenado([a0,a2,a1]) 
#prologo
addi sp, sp, -4   #movemos el sp
sw ra, (0)sp      #m[sp] = ra incial

sub a3, a2, a0
blt a3, zero, afuera #if(a2<a0) return 0
sub a5, a2, a1
bgt a5, zero, afuera #if(a2>a1) return 0

adentro: 
li a0, 1
j terminar
afuera: 
li a0, 0

terminar: 
#epilogo
lw ra, (0)sp      #ra = ra inicial
addi sp, sp, 4    #restablecemos el sp
ret