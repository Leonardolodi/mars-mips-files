.data
stampa: .asciiz "dato un nuero calcola il fattoriale"

.text
li $v0, 4
la $a0, stampa
syscall

li $s1, 8	#numero da calcolare
li $s0, 0
forloop:
