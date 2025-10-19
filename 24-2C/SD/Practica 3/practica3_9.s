.data
val: .word 0x901A002
.text

lw t2,val

loop:
beq t2,zero,exit
andi t1,t2,0xFF
add t0,t0,t1
srli t2,t2,8
jal s0, loop
exit:
nop