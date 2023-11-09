.data
n1: .word 0
n2: .word 0
gcd: .word 0
debug: .asciiz "Enter two integers: "
gcdprint: .asciiz "GDC = "
.text

li $v0, 4
la $a0, debug
syscall

li $v0, 5
syscall
move $a0, $v0

li $v0, 5
syscall
move $a1, $v0

bgtz $a0, avantiuno
nor $a0, $a0, $a0
addi $a0, $a0, 1

avantiuno:
bgtz $a1, avantidue
nor $a1, $a1, $a1
addi $a1, $a1, 1

avantidue:
jal computegcd

move $t0, $v0

li $v0, 4
la $a0, gcdprint
syscall

li $v0, 1
move $a0, $t0
syscall

li $v0, 10
syscall

computegcd:
whileloop:
beq $a0, $a1, esciwhile
bgt $a0, $a1, ramothen
sub $a1, $a1, $a0
j Exit
ramothen:
sub $a0, $a0, $a1
Exit:
j whileloop
esciwhile:
move $v0, $a0
jr $ra