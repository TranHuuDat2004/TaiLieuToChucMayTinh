.data
	msg: .asciiz "nhap x: "
	msg2: .asciiz "nhap y: "
	msg3: .asciiz "\nmin: "
	msg4: .asciiz "\nmax: "
	msg5: .asciiz "min=max= "
.text
.globl main
main:
	jal input_x
	jal input_y
	jal combi
input_x:
	li $v0,4
	la $a0,msg
	syscall
	li $v0,5
	syscall
	move $s1,$v0
	jr $ra
	
input_y:
	li $v0,4
	la $a0,msg2
	syscall
	li $v0,5
	syscall
	move $s2,$v0
	jr $ra
combi:
	beq $s1,$s2,number_equal
	blt $s1,$s2,min
	li $v0,4
	la $a0,msg4
	syscall
	add $a0,$s1,$0
	li $v0,1
	syscall
	li $v0,4
	la $a0,msg3
	syscall 
	add $a0,$s2,$0
	li $v0,1
	syscall
	li $v0,10
	syscall
min:
	li $v0,4
	la $a0,msg3
	syscall
	add $a0,$s1,$0
	li $v0,1
	syscall
	li $v0,4
	la $a0,msg4
	syscall
	add $a0,$s2,$0
	li $v0,1
	syscall
	li $v0,10
	syscall
number_equal:
	li $v0,4
	la $a0,msg5
	syscall
	add $a0,$s1,$zero
	li $v0,1
	syscall
	
	
	