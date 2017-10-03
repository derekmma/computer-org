    .data
array:   .word  0:10    # assume array A has length of 20

    .globl main

    .text
main:
    # Pre-process: load all values to registers
    li $s0, 1           # assume x is 1
li $s1, 5               # assume y is 5
    la $s2, array       # load base address of array

loop: 
    # Check condition for this while loop
    slti $t8, $s0, 10   # t8 is 1 if the condition satisfies, 0 if not
    beq $t8, $zero, exit # if condition doesn't hold ,exit without getting into the loop

    add $t0, $s0, $s1   # add x and y and save to $t0

    li $t3, 1           # $t3 is the index in the array
    mul $t4, $t3, 4     # $t4 is the offset
    add $t5, $s2, $t4   # $t5 is the address of A[20]
    sw $t0, ($t5)       # store the value to address
    
    addi $t1, $s0, 1    # add 1 to x value
    move $s0, $t1

    # Print out the result for verification
    move $a0, $t0
    li $v0, 1
    syscall

    move $a0, $s0
    li $v0, 1
    syscall

    j loop              # run the loop body again

exit:    
    # Terminate the program
    li $v0, 10
    syscall