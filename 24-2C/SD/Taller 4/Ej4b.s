.data
array1: .byte 1,2,3,4,5,6
length1: .word 6

array2: .byte 1,2,4,8,16
length2: .word 5

.text
#si los test pasan a1=1 
main:
la a0,array1
lw a1,length1
call PotenciasEnArreglo
li a1,3
bne a0,a1,noFunciona

la a0,array2
lw a1,length2
call PotenciasEnArreglo
li a1,5
bne a0,a1,noFunciona

funciona:
li a1,1
j fin
noFunciona: 
li a1,0
fin: j fin

#a0=n
#res a0
esPotenciaDe2:
addi sp,sp,-4
sw ra,0(sp)
beqz a0,return1
addi t0,a0,-1
and a0,a0,t0
beqz a0,true
li a0,0
j return1
true:
li a0,1
return1:
lw ra,0(sp)
addi sp,sp,4
ret

#a0=pointer, a1=length
#res a0
PotenciasEnArreglo:
addi sp,sp,-12
sw ra,0(sp)
sw s0,4(sp)
sw s1,8(sp)

mv s0,a0
li s1,0
for:
beqz a1,return2
lw a0,0(s0)
andi a0,a0,0xff
call esPotenciaDe2
add s1,s1,a0
addi a1,a1,-1
addi s0,s0,1
j for
return2:
mv a0,s1
lw ra,0(sp)
lw s0,4(sp)
lw s1,8(sp)
addi sp,sp,12
ret