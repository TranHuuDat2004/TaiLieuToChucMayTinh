##S?p x?p m?ng có 10 ph?n t? ?ã khai báo s?n.
.data
	array: .word 5, 26, 18, 62, 20, 23, 15, 19, 30, 90
	size: .word 10
	khoangtrang: .asciiz " "
	msg: .asciiz "Mang da duoc sap xep: "
.text
.globl main
main:
	la $t0, array          
	lw $t1, size             
	li $t1, 9                  
	li $t2, 9                        

Loop:
	beqz $t2, loop1 
	
	sub $t2, $t2, 1
	
	lw $t3, ($t0)           
	lw $t4, 4($t0)   
	
	addi $t0, $t0, 4    
    
	ble $t3, $t4, Loop 
	
	sw $t3 , ($t0)          
	sw $t4, -4($t0)  
	
	bnez $t2, Loop          
loop1:
	la $t0, array  
	
	sub $t1, $t1, 1         
	add $t2, $t2, $t1   
    
	bnez $t1, Loop

	li $v0, 4
	la $a0, msg           
	syscall   
	  
	la $t0, array           
	li $t1, 10                       

print_loop:
	li $v0, 1
	lw $a0, ($t0)
	syscall

	li $v0, 4               
	la $a0, khoangtrang 
	syscall

	addi $t0, $t0, 4           
	sub $t1, $t1, 1         
	bnez $t1, print_loop     
exit:
	jr $ra
