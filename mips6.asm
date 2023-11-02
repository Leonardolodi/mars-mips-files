.data
stringa: .asciiz "Enter a positive integer: "
stringa2: .asciiz "sum = "

.text
li $v0, 4
la $a0, stringa
syscall

li $v0, 5
syscall

move $a0, $v0
jal somma

move $t0, $v0
la $a0, stringa2
li $v0, 4
syscall

li $v0, 1
move $a0, $t0
syscall

li $v0, 10
syscall

somma:
add $sp, $sp, -8
sw $ra, 0($sp)
sw $a0, 4($sp)
beq $a0, $zero, else
addi $a0, $a0, -1
jal somma
lw $a0, 4($sp)
add $v0, $a0, $v0
j exit
else:
add $v0, $a0, $zero
exit:
lw $ra, 0($sp)
add $sp, $sp, 8
jr $ra
