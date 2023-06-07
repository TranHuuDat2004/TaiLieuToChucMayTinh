.data
	msg: .asciiz "nhap so luong phan tu cua mang: "
	msg1: .asciiz "[ "
	msg2: .asciiz " ] = "
	msg3: .asciiz "\nmax = "
	msg4: .asciiz "min = "
	arr: .word 0
.text
.globl main
main:
	jal input
	la $s1,arr 	#gán ??a ch? c?a arr vào $s1
	li $t0,0	#i=0
	jal input_arr
	# gán l?i chu?i và i
	la $s1,arr
	li $t0,0
	jal loop
	j exit
	
	
input:
	#output "enter size of array"
	li $v0,4
	la $a0,msg
	syscall
	
	#input size
	li $v0,5
	syscall 
	move $s0,$v0	#$s0 = size
	jr $ra
	
	#output "[i] = ...
input_arr:	#do while 
		#in [
		li $v0,4
		la $a0,msg1
		syscall
		#in i
		move $a0,$t0
		li $v0,1
		syscall
		#t?ng giá tr? i
		addi $t0,$t0,1
		#in ] = 
		li $v0,4
		la $a0,msg2
		syscall
		#nh?p ph?n t?
		li $v0,5
		syscall
		sw $v0,($s1)
		addi $s1,$s1,4
		# if i khác size thì ti?p t?c vòng l?p
		bne $t0,$s0,input_arr
		jr $ra
loop:
	slt $s2,$t0,$s0
	beq $s2,$0,print
	bne $t0,$0,jump
	lw $t1,($s1)
	lw $t2,($s1)
jump:
	lw $t3,($s1)
	addi $s1,$s1,4
	addi $t0,$t0,1
	min:
		slt $s2,$t3,$t1
		beq $s2,$0,max
	    		addi $t1,$t3,0
	max: 
		slt $s2,$t2,$t3
		beq $s2,$0,loop
	    		addi $t2,$t3,0
j loop

print:
	li $v0,4
	la $a0,msg4
	syscall
	move $a0,$t1
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,msg3
	syscall
	move $a0,$t2
	li $v0,1
	syscall
	
	jr $ra
exit:
	li $v0,10
	syscall
		
