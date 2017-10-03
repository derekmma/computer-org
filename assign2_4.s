    .data
str1: .asciiz "Getting in the if body\n"

    .globl main # Global variable: the entry point of the prog.

    .text
main:

    li $t1, 3 # x
    li $t2, 4 # y
    li $t3, 0 # z
    li $t4, 0

    slt $t5, $t1, $t2 # compare values in $t1 and $t2
    beq $t5, $zero, L1 # if $t5 is zero, x<y not satisfied, exit
    bne $t3, $zero, L1 # if condition doesn't hold ,exit without getting into the loop
    
    la $a0, str1
    li $v0, 4
    syscall

    li $t4, 1 # set value of w to 1
    j L1
L1:
    move $a0, $t4
    li $v0, 1
    syscall

    li $v0, 10
    syscall