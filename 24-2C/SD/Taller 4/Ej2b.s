.text
#si los test pasan a1=1
main:
li a0,1
li a1,1
li a2,1
li a3,1
call mayor
li a1,0
bne a0,a1,noFunciona

li a0,2
li a1,1
li a2,3
li a3,-1
call mayor
li a1,1
bne a0,a1,noFunciona

li a0,1
li a1,2
li a2,-1
li a3,3
call mayor
li a1,-1
bne a0,a1,noFunciona

li a0,2
li a1,1
li a2,1
li a3,2
call mayor
li a1,0
bne a0,a1,noFunciona

funciona:
li a1,1
j fin
noFunciona:
li a1,0
fin: j fin

#a0=x1, a1=x2, a2=y1, a3=y2
#ret a0
mayor:
ble a0,a1,less
ble a2,a3,return
li a0,1
ret
less:
bge a0,a1,return
bge a2,a3,return
li a0,-1
ret
return:
li a0,0
ret