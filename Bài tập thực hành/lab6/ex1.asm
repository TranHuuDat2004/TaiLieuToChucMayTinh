.data
	str1: .asciiz "enter number: "
	str2: .asciiz "result is: "
.text
.globl main
main:
	#in string 1
	li $v0,4
	la $a0,str1
	syscall
	#in so nguyen a
	li $v0,5
	syscall
	move $t0,$v0
	#nhap string 1 lan 2
	li $v0,4
	syscall
	#nhap so nguyen b
	li $v0,5
	syscall
	move $t1,$v0
	#tinh a*b, a-b , a*b + (a-b)
	mul $s0,$t0,$t1
	sub $s1,$t0,$t1
	add $s2,$s0,$s1
	#in string 2
	li $v0,4
	la $a0,str2
	syscall
	#in ket qua
	move $a0,$s2
	li $v0,1
	syscall
	#exit
	li $v0,10
	syscall