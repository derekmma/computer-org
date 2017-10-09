    .data
arrayA:   .word  0:20       # assume array A has length of 20
arrayB:   .word  0:20       # assume array A has length of 20

    .globl main # Global variable: the entry point of the prog.

    .text
main:
    # Pre-process: load all values to registers
    li $s1, 5 # assume y is 5
    la $s2, arrayA # load base address of array A
    la $s3, arrayB # load base address of array B

    # Get value of A[20]
    lw $t3, 80($s2)       # load word at address $t2 to $t3

    # Print value of A[20]
    move $a0, $t3
    li $v0, 1
    syscall

    # Get value of B[A[20]]
    mul $t4, $t3, 4     # get index
    add $t5, $s3, $t4   # calculate offset
    lw $t6, ($t5)       # load word at that address

    # Print value of B[A[20]]
    move $a0, $t6
    li $v0, 1
    syscall

    # Add y to value of B[A[20]]
    add $s0, $s1, $t6

    # Print final value for x
    move $a0, $s0
    li $v0, 1
    syscall

    # Terminate the program
    li $v0, 10
    syscall