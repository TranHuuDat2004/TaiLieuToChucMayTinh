.data
	nhap: .asciiz "Nhap n = "
	xuat: .asciiz "n! = "
.text
.globl main
main:
	li $v0, 4
	la $a0, nhap
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	
	jal giaithua
	li $v0,4
	la $a0,xuat
	syscall
	li $v0, 1
	move $a0, $s0
	syscall
	
	j exit
	
giaithua:
	li $s0, 1
	li $s1, 1
	loop:
		mul $s0, $s0, $s1
		addi $s1, $s1, 1
		ble $s1, $t0, loop
	jr $ra
	
exit:
	li $v0, 10
	syscall
	
