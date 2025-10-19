.data
tablaCalificaciones1: 
.half 5523
.byte 3
.half 8754
.byte 6
.half 0

tablaCalificaciones2:
.half 1
.byte 4
.half 3
.byte 10
.half 2
.byte 4
.half 5
.byte 1
.half 0


.text
#si los test pasan a1=1
la a0,tablaCalificaciones1
call sumaNotasIdImpar
li a1,3
bne a0,a1,noFunciona

la a0,tablaCalificaciones2
call sumaNotasIdImpar
li a1,15
bne a0,a1,noFunciona

funciona:
li a1,1
j fin
noFunciona:
li a1,0
fin:j fin

#a0 = pointer
#res a0
sumaNotasIdImpar:
li t2,0

for:
lw t0,0(a0)
slli t1,t0,16
beqz t1,return 

addi a0,a0,3
slli t1,t1,15
beqz t1,for

srli t0,t0,16
andi t0,t0,0xff
add t2,t2,t0
j for

return: 
mv a0,t2
ret