.data
	mang : .word 0:11
	nhap : .asciiz"Nhap N : "
	mongoac : .asciiz"[ "
	dongngoac : .asciiz" ] = "
	output : .asciiz "Mang da nhap la: "
	khoangtrang : .asciiz" "
.text
.globl main
main:
	la $v0,4
	la $a0,nhap
	syscall

	la $v0,5
	syscall
	move $t0,$v0

	add $t1,$zero,$zero
	la  $a1, mang
NhapMang:
	beq $t1,$t0,Ketthuc
	la $a0,mongoac
	la $v0,4
	syscall

	la $v0,1
	move $a0,$t1
	syscall

	la $v0,4
	la $a0,dongngoac
	syscall

	la $v0,5
	syscall

	sw $v0, ($a1)

	addi $t1,$t1,1
	addi $a1,$a1,4

	j NhapMang

Ketthuc:
	la $v0,4
	la $a0,output
	syscall

	la    $a1, mang
	add  $t1, $zero, ,$zero

#xuat mang

Xuatmang:
	beq $t1,$t0,exit
	lw $a0,($a1)
	la $v0,1
	syscall

	addi $t1,$t1,1
	addi $a1,$a1,4

	la $v0,4
	la $a0,khoangtrang
	syscall

	j Xuatmang

exit:
	li $v0,10
	syscall



