.data
num1: .word 0x1000000,0xF0000000
num2: .word 0x1000000,0xF0000000

.text

lui t0,num1/0x1000
addi t0,t0,num1&0xFFF

lui t1,num2/0x1000
addi t1,t1,num2&0xFFF

addi t2,t1,12


lw s0,0(t0)
lw s1, 0(t1)

add s2,s0,s1 
sw s2,0(t2)

addi t0,t0,4
addi t1,t1,4
addi t2,t2,4

lw s0,0(t0)

bgtu s2,s1,carry
addi s0,s0,1
carry:
lw s1, 0(t1)
add s2,s0,s1 
sw s2,0(t2)
