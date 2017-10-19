#
# A program prints "Hello World" by calling a "subroutine".
#
	.text
	.globl main
main:
	add $t0,$0,$0 # initialize $t0 to zero
p1:
	jal printMessage # print "Hello World!"
	add $t0,$t0,1
	bne $t0,10,p1
	
	li $v0, 10 # exit program
	syscall
	
printMessage:
	la $a0, str # get the string
	li $v0, 4 # print message
	syscall
	jr $ra
	
	.data
str: .asciiz "Hello World!\n"
