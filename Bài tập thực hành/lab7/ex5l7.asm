.data
	input: .asciiz "Nhap size cua mang: "
	Open: .asciiz "[ "
	Close: .asciiz " ] = "
	output: .asciiz "\nMang da nhap: "
	key: .asciiz "nhap gia tri can tim trong mang: "
	addr: .asciiz "vi tri cua gia tri trong mang: "
	naddr: .asciiz "khong ton tai"
	array: .word 0:100 # int array[100]
.text
.globl main
main:
# nhap size cua mang
	la $a0, input
	addi $v0, $0, 4
	syscall

	addi $v0, $0, 5
	syscall
	addi $s0, $v0, 0 # $s0 = size

	jal NhapMang
	jal Sort
	j XuatMang
	
	jal condi
	j Exit

NhapMang:
# khoi tao
	addi $t1, $0, 0 # $t1 = 0
	la $a1, array # $a1 = &array
NhapPhanTu:
# kiem tra so lan lap
	slt $t2, $t1, $s0
	beq $t2, $0, KetThucNhap

# xuat dau nhac nhap
	la $a0, Open
	addi $v0, $0, 4
	syscall

	addi $a0, $t1, 0
	addi $v0, $0, 1
	syscall

	la $a0, Close
	addi $v0, $0, 4
	syscall

# nhap so nguyen va luu vao array[i]
	addi $v0, $0, 5
	syscall
	sw $v0, ($a1)

# tang chi so
	addi $t1, $t1, 1
	addi $a1, $a1, 4

	j NhapPhanTu

KetThucNhap:
	jr $ra

## Sap xep
Sort:
	addi $t0, $0, 1 # $t0 = i = 1
	la $a1, array # dia chi a[i] ban dau co gia tri la a[1]
	addi $a1, $a1, 4 #
while1:
	beq $t0, $s0, end
	lw $t1, ($a1) # $t1 = value of $a1
	addi $t2, $t0, 0 # $t2 = j = i
	la $a2, ($a1)
while2:
	blez $t2, cont
	la $a3, ($a2)
	addi $a3, $a3, -4
	lw $t4, ($a3)
	ble $t4, $t1, cont
	la $a3, ($a2)
	addi $a3, $a3, -4
	lw $t5, ($a3)
	sw $t5, ($a2)
	addi $t2, $t2, -1
	addi $a2, $a2, -4
	j while2
cont:
	sw $t1, ($a2)
	addi $t0, $t0, 1
	addi $a1, $a1, 4
	j while1
end:
	jr $ra

# Xuat
XuatMang:
	la $a0, output
	addi $v0, $zero, 4
	syscall

	la $a1, array
	addi $t1, $0, 0

XuatPhanTu:
# kiem tra so lan lap
	slt $t2, $t1, $s0
	beq $t2, $0, input_key

# xuat phan tu array[i]
	lw $a0, ($a1)
	addi $v0, $zero, 1
	syscall

# xuat khoang trang
	addi $a0, $0, 0x20
	addi $v0, $0, 11
	syscall

# tang i
	addi $t1, $t1, 1
	addi $a1, $a1, 4

	j XuatPhanTu
##tim phan tu
input_key:
	li $v0,4
	la $a0,key
	syscall
	move $t4,$v0	#t4=key
	
	la $a1,array
	li $t1,0
	
	jr $ra
condi:
	bne $t1,$s0,find
	li $v0,4
	la $a0,naddr
	syscall
	jr $ra
find:
	lw $t3,($a1)
	beq $t4,$t3,print
	addi $a1,$a1,4
	addi $t1,$t1,1
	j condi
print: 
	li $v0,4
	la $a0,addr
	syscall 
	move $v0,$t1
	li $v0,1
	syscall
	
	jr $ra
Exit:
	addi $v0, $0, 10
	syscall
