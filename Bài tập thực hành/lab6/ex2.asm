.data
	str1: .asciiz "enter number: "
	str2: .asciiz "result is: "
.text
.globl main
main:
	jal output_str1
	jal input_num
	move $t0,$v0
	jal output_str1
	jal input_num
	move $t1,$v0
	jal func_handle
	jal output_str2
	move $a0,$s2
	jal output_result
	j exit
output_str1: 
	li $v0,4
	la $a0,str1
	syscall
	jr $ra
input_num:
	li $v0,5
	syscall
	jr $ra
func_handle:
	mul $s0,$t0,$t1
	sub $s1,$t0,$t1
	add $s2,$s0,$s1
	jr $ra
output_str2:
	li $v0,4
	la $a0,str2
	syscall
	jr $ra
output_result: 
	li $v0,1
	syscall
	jr $ra
exit:
	li $v0,10
	syscall

	