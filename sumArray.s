# Program: sum of an array of length 5

    .data
array: .word 15, 23, -13, -75, 44 # declare array
    .globl main

    .text
main:
    li      $s1,0           # zero the sum
    li      $s2,0           # zero the sum for positive items
    li      $s3,0           # zero the sum for negative items
    li      $t1,0           # init index to 0
    li      $t2,0           # init loop counter
    li      $t3,0           # comparison standard 0
for: 
    beq     $t2,5,endfor    # for ( i=0; i<5 ; i++ ) R type
    lw      $v1,array($t1)  # R type
    add     $s1,$s1,$v1     # sum = sum + array[i] R type

    slt     $t4,$v1,$t0
    bne     $t4,$zero,nega

    add     $s2,$s2,$v1
    j		update

nega:
    add     $s3,$s3,$v1
    j       update             # J type

update:
    addi    $t1,$t1,4       # index++ I type
    addi    $t2,$t2,1       # counter++
    j       for             # J typ
    
endfor:
    # print out the result
    move    $a0, $s1
    li      $v0, 1
    syscall

    move    $a0, $s2
    li      $v0, 1
    syscall

    move    $a0, $s3
    li      $v0, 1
    syscall

    li      $v0,10          # exit
    syscall