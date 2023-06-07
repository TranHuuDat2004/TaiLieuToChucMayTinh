.data
	array: .word 79 63 84 52 19 2 5 39 42 96
	msg:.asciiz"Enter A: "
	msg1:.asciiz"Enter B: "
	error:.asciiz"It is a valid input in this array. Please enter again! \n"
	output:.asciiz"The array after permute: "
	space:.asciiz" "
	
.text
.globl main
main:
	j input1
	
input_again1:
	li $v0,4
	la $a0,error
	syscall

input1:	#nhap va check so trong mang (so a)
	li $v0,4
	la $a0,msg
	syscall
	
	li $s1,0
	
do:
	li $v0,5
	syscall

check:		
	beq $s1,10, input_again1
	la $s0,array
	mul $t0,$s1,4
	add $s0,$s0,$t0
	lw $t1,($s0)
	beq $v0,$t1,exit
	addi $s1,$s1,1
	j check

exit:
	move $s5,$v0 # A = s5
	j input2
	
input_again2:
	li $v0,4
	la $a0,error
	syscall

input2: #nhap va check so trong mang (so b)
	li $v0,4
	la $a0,msg1
	syscall
	
	li $s4,0
	
do2:
	li $v0,5
	syscall

check2:		
	beq $s4,10, input_again2
	la $s0,array
	mul $t0,$s4,4
	add $s0,$s0,$t0
	lw $t1,($s0)
	beq $v0,$t1,exit2
	addi $s4,$s4,1
	j check2

exit2:	
	move $s6,$v0  # B =s6
	
	sw $s5,($s0)
	
	la $s0,array
	mul $t5,$s1,4
	add $s0,$s0,$t5
	
	sw $s6,($s0)
	
	la $s0,array
	li $s7,0
	
func_print:
	li $v0,1
	lw $a0,($s0)
	syscall
	
	li $v0,4
	la $a0, space
	syscall
	
	addi $s7,$s7,1
	addi $s0,$s0,4
	bne $s7,10,func_print
end:
	li $v0,10
	syscall
	
	
	
	
	
	
