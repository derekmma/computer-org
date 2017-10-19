	
	.data
str0: .asciiz "i is: "
str1: .asciiz "j is: "
a:   .word 1
x:   .word 2
c:   .word 3
d:   .word 4
e:   .word 5
g:   .word 6

	.text
	.globl main
main:
    lw $a0, a
    lw $a1, e
    lw $a2, x
    lw $a3, g
    jal compute_i
    move $s0, $v0

    lw $a0, c
    lw $a1, e
    lw $a2, d
    lw $a3, g
    jal compute_i
    move $s1, $v0

    la $a0, str0 # get the string
	li $v0, 4 # print message
	syscall

    move $a0, $s0     # get ready to print the output result from function
    li $v0, 1         # print integer
    syscall

    la $a0, str1 # get the string
	li $v0, 4 # print message
	syscall

    move $a0, $s1     # get ready to print the output result from function
    li $v0, 1         # print integer
    syscall

    li $v0 ,10        # terminate the program
    syscall

compute_i:
    mult $a0, $a1
    mflo $t0
    mult $a2, $a3
    mflo $t1
    add  $v0, $t0, $t1
    jr   $ra