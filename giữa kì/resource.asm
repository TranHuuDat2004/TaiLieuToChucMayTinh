.data
	#Can
	can1: .asciiz "Tan"
	can2: .asciiz "Nham"
	can3: .asciiz "Quy"
	can4: .asciiz "Giap"
	can5: .asciiz "At"
	can6: .asciiz "Binh"
	can7: .asciiz "Dinh"
	can8: .asciiz "Mau"
	can9: .asciiz "Ky"
	can0: .asciiz "Canh"
	#Chi
	chi0: .asciiz "Than"
	chi1: .asciiz "Dau"
	chi2: .asciiz "Tuat"
	chi3: .asciiz "Hoi"
	chi4: .asciiz "Ty"
	chi5: .asciiz "Suu"
	chi6: .asciiz "Dan"
	chi7: .asciiz "Mao"
	chi8: .asciiz "Thin"
	chi9: .asciiz "Ty"
	chi10: .asciiz "Than"
	chi11: .asciiz "Mui"
	#text nhap
	luachon: .asciiz "Moi ban nhap lua chon: "
	luachon1: .asciiz "Tinh can chi(1)\n"
	luachon2: .asciiz "Tinh nam sinh va can chi(2)\n"
	luachon3: .asciiz "Tinh cac nam can chi(3)\n"
	luachon4: .asciiz "Thoat(4)\n"
	
	namsinh: .asciiz "Nhap nam sinh: "
	nhaptuoi: .asciiz "Nhap tuoi: "
	namsinh1: .asciiz "Nam sinh: "
	nhapcan: .asciiz "Nhap can: "
	nhapchi: .asciiz "Nhap chi: "
	
	nl: .asciiz "\n"
	#Bien
	str1: .space 80
	str2: .space 80
.text
.globl main
main:
RunProgram:
	#
	li $v0,4
	la $a0,luachon1
	syscall
	
	li $v0,4
	la $a0,luachon2
	syscall
		
	li $v0,4
	la $a0,luachon3
	syscall
	
	li $v0,4
	la $a0,luachon4
	syscall	

	li $v0,4
	la $a0,luachon
	syscall		
	
	li $v0,5
	syscall
	move $s5,$v0
	#
	beq $s5,1,cau1
	beq $s5,2,cau2
	beq $s5,3,cau3
	beq $s5,4,Exit
	#Cau1
cau1:
	li $v0,4
	la $a0,namsinh
	syscall
	
	li $v0,5
	syscall
	move $s0,$v0
	#tinh can chi
tinhcanchi:
	rem $t1,$s0,10
	rem $t2,$s0,12

	beq $t1,1,incan1
	beq $t1,2,incan2
	beq $t1,3,incan3
	beq $t1,4,incan4
	beq $t1,5,incan5
	beq $t1,6,incan6
	beq $t1,7,incan7
	beq $t1,8,incan8
	beq $t1,9,incan9
	beq $t1,0,incan0
	
incan1: 
	li $v0,4
	la $a0,can1
	syscall
	j space1
	
incan2: 
	li $v0,4
	la $a0,can2
	syscall
	j space1
	
incan3: 
	li $v0,4
	la $a0,can3
	syscall
	j space1
	
incan4: 
	li $v0,4
	la $a0,can4
	syscall
	j space1
	
incan5: 
	li $v0,4
	la $a0,can5
	syscall
	j space1

incan6: 
	li $v0,4
	la $a0,can6
	syscall
	j space1

incan7: 
	li $v0,4
	la $a0,can7
	syscall
	j space1
	
incan8: 
	li $v0,4
	la $a0,can8
	syscall
	j space1
	
incan9: 
	li $v0,4
	la $a0,can9
	syscall
	j space1

incan0: 
	li $v0,4
	la $a0,can0
	syscall
space1:
	li $v0,11
	la $a0,' '
	syscall
chi:
	beq $t2,0,inchi0
	beq $t2,1,inchi1
	beq $t2,2,inchi2
	beq $t2,3,inchi3
	beq $t2,4,inchi4
	beq $t2,5,inchi5
	beq $t2,6,inchi6
	beq $t2,7,inchi7
	beq $t2,8,inchi8
	beq $t2,9,inchi9
	beq $t2,10,inchi10
	beq $t2,11,inchi11
inchi0:
	li $v0,4
	la $a0,chi0
	syscall	
	j ReRunProgram
inchi1:
	li $v0,4
	la $a0,chi1
	syscall	
	j ReRunProgram
inchi2:
	li $v0,4
	la $a0,chi2
	syscall	
	j ReRunProgram
inchi3:
	li $v0,4
	la $a0,chi3
	syscall	
	j ReRunProgram
inchi4:
	li $v0,4
	la $a0,chi4
	syscall	
	j ReRunProgram
inchi5:
	li $v0,4
	la $a0,chi5
	syscall	
	j ReRunProgram
inchi6:
	li $v0,4
	la $a0,chi6
	syscall	
	j ReRunProgram
inchi7:
	li $v0,4
	la $a0,chi7
	syscall	
	j ReRunProgram
inchi8:
	li $v0,4
	la $a0,chi8
	syscall	
	j ReRunProgram
inchi9:
	li $v0,4
	la $a0,chi9
	syscall	
	j ReRunProgram
inchi10:
	li $v0,4
	la $a0,chi10
	syscall	
	j ReRunProgram
inchi11:
	li $v0,4
	la $a0,chi11
	syscall	
	j ReRunProgram
cau2:
	li $v0,4
	la $a0,nhaptuoi
	syscall
	
	li $v0,5
	syscall
	move $s0,$v0
	
	li $s1,2023
	sub $s0,$s1,$s0
	#print nam sinh
	li $v0,4
	la $a0,namsinh1
	syscall
	
	li $v0,1
	move $a0,$s0
	syscall
	
	li $v0,4
	la $a0,nl
	syscall
	
	j tinhcanchi
cau3:
	li $v0,4
	la $a0,nhapcan
	syscall
	
	la $s3,str1
	move $a0,$s3
	
	li $a1,79
	li $v0,8
	syscall

	
	li $v0,4
	la $a0,nhapchi
	syscall
	
	la $s4,str2
	move $a0,$s4
	li $v0,8
	li $a1,79
	syscall

sscan:	
	move $t7,$s3
	move $t8,$s4
	
	la $s6,can1
	li $t9,1
	jal cmploop
	
	la $s6,can2
	li $t9,2
	la $s3,str1
	jal cmploop
	
	la $s6,can3
	li $t9,3
	la $s3,str1
	jal cmploop

	la $s6,can4
	li $t9,4
	la $s3,str1
	jal cmploop
	
	la $s6,can5
	li $t9,5
	la $s3,str1
	jal cmploop
	
	la $s6,can6
	li $t9,6
	la $s3,str1
	jal cmploop
	
	la $s6,can7
	li $t9,7
	la $s3,str1
	jal cmploop
	
	la $s6,can8
	li $t9,8
	la $s3,str1
	jal cmploop
	
	la $s6,can9
	li $t9,9
	la $s3,str1
	jal cmploop
	
	la $s6,can0
	li $t9,0
	la $s3,str1
	jal cmploop
	j Exit
cmpne:
	jr $ra
cmpeq:
	j sschi
cmploop:
    lb      $t3,($s3)                   
    lb      $t4,($s6)                              

    beq     $t4,$zero,cmpeq    

    bne     $t3,$t4,cmpne  
            
  
    addi    $s3,$s3,1                   
    addi    $s6,$s6,1                   
    j       cmploop

sschi:
	la $s6,chi0
	li $s7,0
	jal cmploop1
	
	la $s6,chi1
	li $s7,1
	la $s4,str2
	jal cmploop1
	
	la $s6,chi2
	li $s7,2
	la $s4,str2
	jal cmploop1
	
	la $s6,chi3
	li $s7,3
	la $s4,str2
	jal cmploop1

	la $s6,chi4
	li $s7,4
	la $s4,str2
	jal cmploop1
	
	la $s6,chi5
	li $s7,5
	la $s4,str2
	jal cmploop1
	
	la $s6,chi6
	li $s7,6
	la $s4,str2
	jal cmploop1
	
	la $s6,chi7
	li $s7,7
	la $s4,str2
	jal cmploop1
	
	la $s6,chi8
	li $s7,8
	la $s4,str2
	jal cmploop1
	
	la $s6,chi9
	li $s7,9
	la $s4,str2
	jal cmploop1
	
	la $s6,chi10
	li $s7,10
	la $s4,str2
	jal cmploop1

	la $s6,chi11
	li $s7,11
	la $s4,str2
	jal cmploop1
	j Exit
cmpne1:
	jr $ra
cmpeq1:
	j print
cmploop1:
    lb      $t3,($s4)                   
    lb      $t4,($s6)                            

    beq     $t4,$zero,cmpeq1
    
    bne     $t3,$t4,cmpne1               

    addi    $s4,$s4,1                   
    addi    $s6,$s6,1                   
    j       cmploop1
print:
	li $s0,1
	li $s4,61
loop1:
	rem $s1,$s0,10
	rem $s2,$s0,12
	beq $s1,$t9,check1
return:
	addi $s0,$s0,1
	blt $s0,$s4,loop1
check1:
	beq $s7,$s2,loop2
	j return
loop2:
	li $v0,1
	move $a0,$s0
	syscall
	
	addi $s0,$s0,60
	
	li $v0,11
	la $a0,' '
	syscall
	
	li $s4,2023
	blt $s0,$s4,loop2
	
	j ReRunProgram
ReRunProgram:
	li $v0,4
	la $a0,nl
	syscall
	j RunProgram
Exit:
	li $v0,10
	syscall
