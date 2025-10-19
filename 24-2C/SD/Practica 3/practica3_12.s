.data
array1: .word 1,2,3,4
array2: .word 5,5,5,5
length: .word 4
.text

lui t0,array1/0x1000
addi t0,t0,array1&0xFFF

lui t1,array2/0x1000
addi t1,t1,array2&0xFFF

lw t2,length

loop:
beq t2,zero,exit
addi t2,t2,-1
lw s0,0(t1)
sw s0,0(t0)
addi t0,t0,4
addi t1,t1,4
j loop
exit:nop