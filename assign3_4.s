   	.text
	.globl main
main:
    lui $t3, 18838
    ori $t3, $t3, 722
    addu $v0, $zero, $t3

    move $s0, $v0

    move $a0, $s0     # get ready to print the output result from function
    li $v0, 1         # print integer
    syscall

    lui $t3, 15070
    ori $t3, $t3, 26801
    addu $v1, $zero, $t3

    move $s1, $v1

    move $a0, $s1     # get ready to print the output result from function
    li $v0, 1         # print integer
    syscall

    # 2222222211
    # 10 00010 00111 01000 11010 11100 00011
    addu $t1, $s0, $s1

    move $a0, $t1     # get ready to print the output result from function
    li $v0, 1         # print integer
    syscall

    li $v0 ,10        # terminate the program
    syscall