       .data
str0: .asciiz "stringexample"

       .globl main

       .text
main:
      la $a0, str0      # load sample string
      jal len           # call function

      move $a0, $v0     # get ready to print the output result from function
      li $v0, 1         # print integer
      syscall

      li $v0 ,10        # terminate the program
      syscall

len:  li   $v0, 0       # int len = 0
loop: lb   $t0, 0($a0)  # load the character

      move $t3, $a0     # debug:print the character out
      move $t4, $v0
      move $a0, $t0
      li $v0, 11
      syscall
      move $a0, $t3
      move $v0, $t4

      bne  $t0, $zero, upt # if $t0 is not 0, update the counters
      jr   $ra          # go back to caller
upt:  addi $v0, $v0, 1  # update length counter
      addi $a0, $a0, 1  # update address
      j    loop         # go next round loop
