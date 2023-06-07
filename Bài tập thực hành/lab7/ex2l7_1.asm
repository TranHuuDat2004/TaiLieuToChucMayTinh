.data
	list: .word 1, 2, 4, 5, 8, 9, 3, 6, 7, 15
	size: .word 10
	solonnhat: .asciiz "So lon nhat trong mang: "
	sonhonhat: .asciiz "So nho nhat trong mang: "
	newline: .asciiz "\n"
.text
.globl main
main:
	lw $t0,size #nap gia tri dang luu trong bo nho co dia chi chua tai size
	la $t1,list #truyen dia chi cua list vao $t1
	li $t2,0  #khoi tao bien i: i=0
	lw $t3,($t1)
	
	##max
loop_max:
	beq $t2,$t0,loop_end1
	
	addi $t2,$t2,1
	addi $t1,$t1,4
	lw $t6,($t1)
	
	blt $t3,$t6,luu1
	j loop_max
luu1:
	move $t3,$t6
	j loop_max	
loop_end1:
	li $v0,4
	la $a0,solonnhat
	syscall
	li $v0,1
	move $a0,$t3
	syscall
	
	##min
	lw $t0,size #nap gia tri dang luu trong bo nho co dia chi chua tai size
	la $t1,list #truyen dia chi cua list vao $t1
	li $t4,0  #khoi tao bien j: j=0
	lw $t5,($t1)
loop_min:
	beq $t4,$t0,loop_end2
	
	addi $t4,$t4,1
	addi $t1,$t1,4
	lw $t7,($t1)
	
	bgt $t5,$t7,luu2
	j loop_min
luu2:
	move $t5,$t7
	j loop_min

loop_end2:
	li $v0,4
	la $a0,newline
	syscall
	
	li $v0,4
	la $a0,sonhonhat
	syscall
	li $v0,1
	move $a0,$t5
	syscall
	li $v0,10
	syscall
	
	
	