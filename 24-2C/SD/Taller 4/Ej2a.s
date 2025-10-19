.text
#si los test pasan a1=1
main:
li a0,10
call fib
li a1,55
bne a0,a1,noFunciona

li a0,20 
call fib
li a1,6765
bne a0,a1,noFunciona

li a0,0
call fib
mv s2,a0
li a1,0
bne a0,a1,noFunciona

funciona:
li a1,1
j fin
noFunciona:
li a1,0
fin: j fin

fib:
addi sp,sp,-4
sw ra,0(sp)

li t0,1
li t1,0
li t2,0
iter:
beqz a0,return
addi a0,a0,-1
add t2,t0,t1
mv t0,t1
mv t1,t2
j iter
return:
mv a0,t2

lw ra,0(sp)
addi sp,sp,4
ret 