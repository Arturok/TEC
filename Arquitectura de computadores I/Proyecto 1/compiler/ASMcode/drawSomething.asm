


.data

frameBuffer:.space 0x80000 ; frame buffer address
bmp: .word 0x10000100
bmpwidth: .word 256
bmpheight: .word 2
color: .word 0xFFFFFF
pixeldot: .word 2
#lines: .float


.text


main:

la 

la $s0, 100
la $s1, 80
la $s2, 150
la $s3, 120
 
la $t0, pixeldot





move $s1, $t1
move $s0, $t2

sub $t5, $t1, $t0   # deltax
sub $t6, $t3, $t2 #deltay

sll $t6, $t6, 2
sub $t7, $t6, $t5 # d



lw $t0, color
move $t0, $a0
addi $s0, $s0, 1
bgt $s0, $t8, addcolour

addcolour:
lw $t0, color
move $t0, $s0

addmorecolour:
lw $t0, color
move $t0, $s2




jal loop


setpixel: 

lw $a3, bmp
lw $a2, bmpheight
lw $a1, bmpwidth
slt $s0, $s0, $a1
beq $s0, $t8, addonx
slt $s2, $s2, $a2
beq $s2, $t8, addony
lw $t0, color
move $t0, $s0
lw $t0, color
move $t0, $s2

jal drawpix


addonx:
addi $s0, $s0, 1

addony:
addi $s2, $s2, 1



drawpix:

li $t0, 0x10000100
lw $a3, bmp
lw $a2, bmpheight
lw $a1, bmpwidth
sll $s2, $s2, 1
add $t4, $s2, $s0
sll $t4, $t4, 2
add $t4, $t4, $t0
lw $a1, color
sw $a1, ($t4)







loop:
bgt $t7, $t4, increment
jal decrement
nop


increment:
lw $t0, color
move $t0, $s2
addi $s2, $s2, 1
bgt $s2, $t8, addmorecolour
sll $t5, $t5, 2
sub $t7, $t7, $t5
jal exit

decrement:
add $t7, $t7, $t6

jal exit

exit:
li $v0, 10
syscall


Printline:
li $v0, 4
li $a0, 0x1000
syscall





