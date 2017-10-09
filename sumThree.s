# Description: Read three input numbers and sum them up
    .data #
str: .asciiz "The sum is: " # Declare variable "str"
    .globl main #
    .text #
main:
    li $v0, 5 # Read the input integer to $v0
    syscall
    move $t1, $v0 # Move input value from $v0 to $t1

    li $v0, 5 # Read another integer to $v0
    syscall
    move $t2, $v0 # Move the second input to $t2

    li $v0, 5 # Read the third number
    syscall
    move $t3, $v0 # Move the third input to $t3

    add $t0, $t1, $t2 # sum the three numbers and
    add $t0, $t0, $t3 # save to $t0

    li $v0, 4 # first to print the message str
    la $a0, str # get address of str
    syscall # print the message

    move $a0, $t0 # get ready to print the result

    li $v0, 1 # print integer
    syscall

    li $v0, 10 # exit program
    syscall