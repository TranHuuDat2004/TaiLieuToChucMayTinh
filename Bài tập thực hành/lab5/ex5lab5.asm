.data
	msg: .asciiz "Nh?p s? nguyên x: "
	msg1: .asciiz "Nh?p s? nguyên y: "
	msg2: .asciiz "K?t qu?: "
.text
.globl main
main:
	li $v0,4
	la $a0,msg
	syscall
	li $v0,5
	syscall
	move $t1,$v0
	mtc1 $t1,$f1
	li $v0,4
	la $a0,msg1
	syscall
	li $v0,5
	syscall
	move $t2,$v0
	mtc1 $t2,$f2
	div.s $f0,$f1,$f2
	li $v0,4
	la $a0,msg2
	syscall
	mov.s $f12,$f0
	li $v0,2
	syscall
	li $v0,10
	syscall