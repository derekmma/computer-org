# 
# COMP2421 Computer Organization
# Lab Exercise 2
#
# MA Mingyu(Derek), 14110562D
# derek.ma | derek.ma@connect.polyu.hk
# This program returns the temprature in Fahrenheit converted from Celsius
#

    .data 
str1: .asciiz "---Floating Number Version---\n"
str2: .asciiz "Enter temperature in Celsius(C): "
str3: .asciiz "Temperature in Fahrenheit(F) is: "
str4: .asciiz "\n---Integer Number Version---\n"

    .globl main # Global variable: the entry point of the prog.

    .text

main:
    # 
    #Step 1.1: Print the prompt message using system call 4 
    #
    la $a0, str1 # load string address into $a0 and I/O code into $v0 
    li $v0, 4
    syscall # print the message on console
    la $a0, str2 # load string address into $a0 and I/O code into $v0 
    li $v0, 4
    syscall # print the message on console

    #
    #Step 1.2: Read the float from the console using system call 6
    # 
    li $v0, 6
    syscall
    mov.s $f20, $f0 # now the integer is saved in register f20

    #
    #Step 1.3: Calculate new temporature in fahrenheit
    #
    li.s $f4, 1.8
    li.s $f5, 32.0
    mul.s $f0, $f4, $f20
    add.s $f21, $f0, $f5

    #
    #Step 1.4: Print the result message using system call 4 
    #
    la $a0, str3 # load string address into $a0 and I/O code into $v0 
    li $v0, 4
    syscall # print the message on console

    #
    #Step 1.5: Print the temprature in F
    #
    mov.s $f12, $f21
    li $v0, 2
    syscall

    # 
    #Step 2.1: Print the prompt message using system call 4 
    #
    la $a0, str4 # load string address into $a0 and I/O code into $v0 
    li $v0, 4
    syscall # print the message on console
    la $a0, str2 # load string address into $a0 and I/O code into $v0 
    li $v0, 4
    syscall # print the message on console

    #
    #Step 2.2: Read the integer from the console using system call 5 
    # 
    li $v0, 5
    syscall
    move $s0, $v0 # now the integer is saved in register s0

    #
    #Step 2.3: Calculate new temporature in fahrenheit in integer
    #
    li $t0, 9
    li $t1, 5
    li $t3, 32
    mult $t0, $s0
    mflo $t2
    div $t2, $t1
    mflo $t4
    add $s2, $t3, $t4

    #
    #Step 2.4: Print the result message using system call 4 
    #
    la $a0, str3 # load string address into $a0 and I/O code into $v0 
    li $v0, 4
    syscall # print the message on console

    #
    #Step 2.5: Print the temprature in F
    #
    move $a0, $s2
    li $v0, 1
    syscall

    #
    #Step 3: terminate the program
    #
    li $v0, 10 # syscall code 10 for terminating the program
    syscall