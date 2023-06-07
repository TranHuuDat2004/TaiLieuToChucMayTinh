.data 
	msg:  .asciiz "Enter a: "
	msg1:  .asciiz "Enter b: "
	msg2:  .asciiz "a > b"
	msg3:  .asciiz "b > a"
	msg4:  .asciiz "a = b"
	newline: .asciiz "\n"
	
.text 
.globl main
main:	#input a
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0 #gan gia tri cho bien tam t1
	
	#input b
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0 #gan gia tri cho bien tam t2

	#Compare	
	bgt $t1, $t2, bigger
	blt $t1, $t2, smaller
	
	li $v0, 4
	la $a0, msg4
	syscall
	j end
	
bigger: 
	li $v0, 4
	la $a0, msg2
	syscall
	j end
	
smaller: 
	li $v0, 4
	la $a0, msg3
	syscall
	j end

end:
	li $v0, 10
	syscall
	
	
