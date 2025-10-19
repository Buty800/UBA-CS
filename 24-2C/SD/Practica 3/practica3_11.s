.data 
length: .word 4
array: .word 5,0,20,1
.text

#t0 pointer
#t1 length
#t2 val
#ra max

#set registers
lui t0,(array/0x1000)
addi t0,t0,array&0xFFF 
lw t1,length 
lw ra,array

 
addi t1,t1,-1
loop:
beq t1,zero,exit
addi t1,t1,-1
addi t0,t0,4
lw t2,0(t0)
bge ra,t2,loop
add ra,t2,zero
j loop
exit:
nop
