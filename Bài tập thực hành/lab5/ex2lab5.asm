.data
	msg: .asciiz "Nh?p s? nguy�n th? nh?t: "
	msg1: .asciiz "Nh?p s? nguy�n th? hai: "
	msg2: .asciiz "K?t qu? ph�p c?ng: "
.text
.globl main
main:
	li $v0,4
	la $a0,msg
	syscall
	li $v0,5
	syscall
	move $t1,$v0
	li $v0,4
	la $a0,msg1
	syscall
	li $v0,5
	syscall
	move $t2,$v0
	add $s0,$t1,$t2
	li $v0,4
	la $a0,msg2
	syscall
	move $a0,$s0
	li $v0,1
	syscall
	li $v0,10
	syscall
	