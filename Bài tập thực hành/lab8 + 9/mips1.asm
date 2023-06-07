.data
	msg: .asciiz "nhap x: "
	msg2: .asciiz "nhay y: "
	msg3: .asciiz "ket qua la: "
.text
.globl main
main:
	jal input_x
	jal input_y
	li $s0,0	#khoi tao bien dem
	li $s3,1
	jal handle
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
	
handle:
	beq $s0,$s2,print
	mul $s3,$s3,$s1
	addi $s0,$s0,1
	j handle
print:
	li $v0,4
	la $a0,msg3
	syscall
	add $a0,$s3,$zero
	li $v0,1
	syscall
	li $v0,10
	syscall