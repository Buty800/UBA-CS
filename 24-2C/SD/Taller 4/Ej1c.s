main: 
li a0, 1
li a1, 2
jal ra, FUNCION #cuadrupleMenosMitad(1,2)
li a3, 3
bne a0, a3, noFunciona # (4*1 - 2/2) != 3

li a0, 3
li a1,2 #volvemos a cargar en el valor de a1 ya que no se mantiene
jal ra, FUNCION #cuadrupleMenosMitad(3,2)
li a3, 11
bne a0, a3, noFunciona # (4*3 - 2/2) != 11

li a0,3 #volvemos a cargar en el valor de a0 ya que no se mantiene 
li a1, 12
jal ra, FUNCION #cuadrupleMenosMitad(3,12)
li a3, 6
bne a0, a3, noFunciona # (4*3 - 12/2) != 6

funciona: 
li a1, 1
j fin
noFunciona: li a1, 0
fin: j fin

FUNCION: #cuadrupleMenosMitad
addi sp, sp, -4 #
sw ra, (0)sp    #prologo

slli a2, a0, 2 #a2 = a0<<2 = a0*4
srai a1, a1, 1 #a1 = a1>>1 = a1//2
sub a0, a2, a1 #a0 = a2 - a1 

lw ra, (0)sp   #epilogo
addi sp, sp, 4 #
ret
