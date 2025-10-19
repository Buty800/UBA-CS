.data 
pixels: .word 0x112233,0x445566,0x778899,0xAABBCC,0xDDEEFF
len: .word 5
.text
#t0 pointer
#t1 len
#t3 val
#ra max
la t0,pixels
lw t1,len

li ra,0

loop:
beqz t1,exit

addi t1,t1,-1
lw t3,0(t0)
addi t0,t0,4

srli t3,t3,16
andi t3,t3,0xFF

bge ra,t3,loop
mv ra,t3
j loop


exit:nop
