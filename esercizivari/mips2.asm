.data
i: .word 0
count: .word 0
arr: .space 40
enter: .asciiz "Enter the Number: "
reverse: .asciiz "\nReverse = "
.text
lw $s2, i #i in $s2
lw $s3, count #count in $s3
la $s4, arr #indirizzo di "arr" in $s4
li $v0, 4
la $a0, enter
syscall
li $v0, 5
syscall
move $s0, $v0 #num in $s0
whileloop:
beqz $s0, esciwhile
li $t0, 10
div $s0, $t0
mfhi $s1 # rem in $s1
sll $t1, $s2, 2
add $t1, $s4, $t1
sw $s1, 0($t1)
div $s0, $s0, $t0
addi $s2, $s2, 1
addi $s3, $s3, 1
j whileloop
esciwhile:
li $v0, 4
la $a0, reverse
syscall
move $a0, $s4
move $a1, $s3
jal stampa
li $v0, 10
syscall

stampa:
addi $sp, $sp, -8
sw $s0, 4($sp)
sw $a0, 0($sp)
li $s0, 0
li $v0, 1
forloop:
beq $s0, $a1, escifor
sll $t0, $s0, 2
add $t0, $t0, $a0
lw $a0, 0($t0)
syscall
lw $a0, 0($sp)
addi $s0, $s0, 1
j forloop
escifor:
lw $s0, 4($sp)
addi $sp, $sp, 8
jr $ra