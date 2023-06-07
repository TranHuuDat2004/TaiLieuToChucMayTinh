.data
	size: .word 9
	chuoi: .asciiz "Hello TDT"
.text
.globl main
main:
	lw $t0,size
	la $t1,chuoi
	li $t4,0
	
loop: 
	beq $t0,$t4,exit
	li $v0, 11
	
	lb $a0,($t1)
	syscall
	
	li $a0,10		
	syscall
	
	addi $t4,$t4,1
	addi $t1,$t1,1
	
	j loop
exit:
	li $v0,10
	syscall