.data
	msg_input: .asciiz "Nhap Vao So Luong Phan Tu Mang: "
	msg_output: .asciiz "Tong Cac Phan Tu Le: "
	msg_input2: .asciiz "Nhap Vao Phan Tu: "

	int_array: .word 0:100
.text
.globl main
main:

# Nhap So Luong Phan Tu
	la $a0,msg_input
	li $v0,4
	syscall

# Chuyen qua thanh ghi $t0
	li $v0,5
	syscall
	move $t0,$v0

# Nhap cac phan tu cua mang
	la $a0,msg_input2
	li $v0,4
	syscall

	xor $t1,$t1,$t1
	la $t2,int_array

loop_input:
	li $v0,5
	syscall

	sw $v0,($t2)
	addi $t1,$t1,1
	addi $t2,$t2,4
	blt $t1,$t0,loop_input


# Tinh tong cac phan tu le cua mang

	xor $t1,$t1,$t1
	la $t2,int_array
	li $t4,0
	li $t5,2

loop_tong:
	lw $t3,($t2)
	div $t3,$t5
	mfhi $t6
	beqz $t6,end_if
	add $t4,$t4,$t3

end_if:
	addi $t1,$t1,1
	addi $t2,$t2,4

	blt $t1,$t0,loop_tong
	la $a0,msg_output
	li $v0,4
	syscall

	move $a0,$t4
	li $v0,1
	syscall

	li $v0,10
	syscall
