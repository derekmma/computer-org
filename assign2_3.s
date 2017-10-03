    .data
str1: .asciiz "------\n"

    .globl main # Global variable: the entry point of the prog.

    .text
main:
    li $a3, 3
    li $a1, 17
    add $t0, $zero, $zero
loop: 
    beq $a1, $zero, Done

    move $a0, $t0
    li $v0, 1
    syscall

    move $a0, $a3
    li $v0, 1
    syscall

    add $t0, $t0, $a3

    move $a0, $t0
    li $v0, 1
    syscall

    sub $a1, $a1, 1

    move $a0, $a1
    li $v0, 1
    syscall

    j loop

Done: 
    la $a0, str1 # load string address into $a0 and I/O code into $v0 
    li $v0, 4
    syscall
    addi $t0, $t0, 1

    move $a0, $t0
    li $v0, 1
    syscall

    #add $v0, $t0, $zero
    li $v0, 10
    syscall