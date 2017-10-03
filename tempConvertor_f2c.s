    .data 

    .globl main

    .text

main:
    li $a0, 5 # input variable, the degree in F
    jal f2t
    move $a0, $v0
    li $v0, 1
    syscall
    li $v0, 10
    syscall

f2t:
    li $t0, 5
    li $t1, 9
    addi $t2, $a0, -32
    mult $t2, $t0
    mflo $t3
    div $t3, $t1
    mflo $v0
    jr $ra