.data
arr: .word 1 2 3 4 5 6
size: .word 5
key: .word 3
string: .asciiz "Element found at position "

.text
la $a0, arr
lw $a1, size
lw $a2, key
jal findElement
li $v0, 10
syscall

findElement:
addi $sp, $sp, -4
sw $s0, 0($sp)
li $s0, 0
forloop:
beq $s0, $a1, esci

sll $t0, $s0, 2
add $t0, $t0, $a0
lw $t0, 0($t0) #arr[i]
bne $t0, $a2, escif
li $v0, 4
la $a0, string
syscall
li $v0, 1
addi $a0, $s0, 1
syscall
j esci
escif:
addi $s0, $s0, 1
j forloop
esci:
lw $s0, 0($sp)
addi $sp, $sp, 4
jr $ra