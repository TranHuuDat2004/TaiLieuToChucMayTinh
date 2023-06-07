.data
	msg: .asciiz "Nh?p m?t s? nguyên: "
	msg1: .asciiz "K?t qu?: "
.text
.globl main
main:
	li $v0,4
	la $a0,msg
	syscall
	li $v0,5
	syscall
	move $t1,$v0
	mul  $t0,$t1,$t1
	li $v0,4
	la $a0,msg1
	syscall
	move $a0,$t0
	li $v0,1
	syscall
	li $v0,10
	syscall