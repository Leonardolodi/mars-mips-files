.data
end: .word 0
enter: .asciiz "Enter upper limit: "
cr: .asciiz "\n"
frase: .asciiz "All perfect numbers between 1 and "
space: .asciiz " "

.text
addi $s0, $t0, -2

li $v0, 4
la $a0, enter
syscall
li $v0, 5
syscall
sw $v0, end
li $v0, 4
la $a0, frase
syscall
li $v0, 1
lw $a0, end
addi $s2, $a0, 1 # variabile end+1 in $s0
syscall
li $v0, 4
la $a0, cr
syscall

li $s1, 1 # variabile i nel registro $s1
Forloop:
beq $s1, $s2, out
li $s3, 0 # variabile somma in s3. Va resettato qui.
li $s4, 1 # variabile j in s4. Va inizializzata qui.
Forloop2:
beq $s4, $s1, out2
div $s1, $s4
mfhi $t0 # resto in $t0
bne $t0, $zero, fuori2
add $s3, $s3, $s4
fuori2:
addi $s4, $s4, 1
j Forloop2
out2:

move $a0, $s3
move $a1, $s1
#salva sullo stack i registri temporanei che non vuoi perdere. Qui non ne abbiamo.
jal stampa
addi $s1, $s1, 1
j Forloop
out:
li $v0, 10
syscall

stampa:
bne $a0, $a1, fuori
li $v0, 1
move $a0, $a1
syscall
li $v0, 4
la $a0, space
syscall 
fuori:
jr $ra