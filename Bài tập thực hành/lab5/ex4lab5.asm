.data
	msg: .asciiz "Nh?p s? th?c th? nh?t: "
	msg1: .asciiz "Nh?p s? th?c th? hai: "
	msg2: .asciiz "K?t qu?: "
.text
.globl main
main:
	li $v0,4
	la $a0,msg
	syscall
	li $v0,6
	syscall
	mov.s  $f1,$f0
	li $v0,4
	la $a0,msg1
	syscall
	li $v0,6
	syscall
	mov.s $f2,$f0
	add.s $f3,$f1,$f2
	li $v0,4
	la $a0,msg2
	syscall
	mov.s $f12,$f3
	li $v0,2
	syscall
	li $v0,10
	syscall
	
	
	
	 