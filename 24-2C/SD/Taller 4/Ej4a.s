.data
array1: .word 1,2,3,4
length1: .word 4
test1: .word -1,-2,-3,-4

array2: .word -2,-4,1,-2,4
length2: .word 5
test2: .word 2,4,-1,2,-4
.text
#si los test pasan a1=1 
main:
la a0,array1
lw a1,length1
call invertirArreglo
la a0,array1
lw a1,length1
la a2,test1
call arreglosIguales
li a1,1
bne a0,a1,noFunciona

la a0,array2
lw a1,length2
call invertirArreglo
la a0,array2
lw a1,length2
la a2,test2
call arreglosIguales
li a1,1
bne a0,a1,noFunciona

funciona:
li a1,1
j fin
noFunciona:
li a1,0
fin: j fin

#a0 = n
#ras a0
inv: 
addi sp,sp,-4
sw ra,0(sp)

neg a3,a3

lw ra,0(sp)
addi sp,sp,4
ret

#a0 = pointer, a1= length
#res a0
invertirArreglo:
addi sp,sp,-4
sw ra,0(sp)

for1:
beqz a1,return1
lw a3,0(a0)
neg a3,a3
sw a3,0(a0)
addi a0,a0,4
addi a1,a1,-1
j for1

return1: 
lw ra,0(sp)
addi sp,sp,4
ret

#a0=pointer1,a1=length,a2=pointer2
#res a0
arreglosIguales:
addi sp,sp,-4
sw ra,0(sp)

for2:
beqz a1,true
lw t0,0(a0)
lw t1,0(a2)
bne t0,t1,false
addi a0,a0,4
addi a2,a2,4
addi a1,a1,-1
j for2

true:
li a0,1
j return2
false:
li a0,0
return2:    
lw ra,0(sp)
addi sp,sp,4
ret