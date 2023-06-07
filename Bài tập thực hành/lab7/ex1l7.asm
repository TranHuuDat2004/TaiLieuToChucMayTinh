.data
	msg: .asciiz "Nhap N: "
	msg1: .asciiz "Nhap phan tu cua mang: "
	msg2: .asciiz "Mang la: " 
	msg3: .asciiz ", "
	arr: .word 0
.text
.globl main
main: 
	#in "nhap n"
	li $v0,4
	la $a0,msg
	syscall
	#nhap n
	li $v0,5
	syscall
	move $s0,$v0
	#in "nhap phan tu mang"
	la $s1,arr	#gan dia chi 
	li $s2,0	#i=0
input_arr:
	li $v0,4
	la $a0,msg1
	syscall
	li $v0,5
	syscall
	sw $v0,($s1)
	addi $s2,$s2,1
	addi $s1,$s1,4
	bne $s2,$s0,input_arr
	li $v0,4
	la $a0,msg2
	syscall
	la $s1,arr
	li $s2,0
print_arr:
	li $v0,1
	lw $a0,($s1)
	syscall 
	li $v0,4
	la $a0,msg3
	syscall
	addi $s2,$s2,1
	addi $s1,$s1,4
	bne $s2,$s0,print_arr
	j exit
exit:
	li $v0,10
	syscall
.end main
	
		
