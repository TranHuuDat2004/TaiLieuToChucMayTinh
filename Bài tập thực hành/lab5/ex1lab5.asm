.data
	msg: .asciiz "Sinh Vi�n TDTU xin ch�o c�c b?n"
.text
.globl main
main:
	li $v0,4
	la $a0,msg
	syscall
	li $v0,10
	syscall