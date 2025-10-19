.text
main:
#si los test pasan a1=1
li a0,3
call fib3
li a1,3
bne a0,a1,noFunciona

li a0,1
call fib3
li a1,1
bne a0,a1,noFunciona

li a0,6
call fib3
li a1,20
bne a0,a1,noFunciona

funciona:
li a1,1
j fin
noFunciona:
li a1,0
fin: j fin

#a0 = x
#res a0
fib3:
addi sp,sp,-16
sw ra,0(sp)
sw s0,4(sp)
sw s1,8(sp)

li s0,0
li t0,2
mv s1,a0

ble a0,t0,return

addi s1,s1,-1
mv a0,s1
call fib3
add s0,s0,a0

addi s1,s1,-1
mv a0,s1
call fib3
add s0,s0,a0

addi s1,s1,-1
mv a0,s1
call fib3
add s0,s0,a0

mv a0,s0
return:
lw ra,0(sp)
lw s0,4(sp)
lw s1,8(sp)
addi sp,sp,16 
ret 
