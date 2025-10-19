.text
#si los test pasan a1=1 
main:
li a0, 3
call factorial
li a1,6
bne a0,a1,noFunciona

li a0, 5
call factorial
li a1,120
bne a0,a1,noFunciona

li a0,0
call factorial
li a1,1
bne a0,a1,noFunciona

funciona:
li a1,1
j fin
noFunciona:
li a1,0
fin: j fin


#a0 = n
#res a0
factorial:
addi sp,sp,-16
sw a0, 4(sp)
sw ra, 0(sp)
li t0,1
bgt a0, t0, else
li a0,1
addi sp, sp, 16
ret
else:
addi a0, a0, -1
call factorial
lw t1, 4(sp)
lw ra, 0(sp)
addi sp, sp, 16
mul a0, t1, a0
ret