.text

#a0 = n

li a0,10
call fib
fin: j fin

fib:
addi sp,sp,-32
sw a2,8(sp)
sw a0,4(sp)
sw ra,0(sp)
    
li t0,2
ble a0,t0,base
addi a0,a0,-1
call fib
mv a2,a1
addi a0,a0,-1
call fib
add a1,a1,a2
j pop
base:
li a1,1

pop:
lw a2,8(sp)
lw a0,4(sp)
lw ra,0(sp)
addi sp,sp,32
ret 