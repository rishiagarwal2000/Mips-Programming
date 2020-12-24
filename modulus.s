# Take modulus of 12 digit number w.r.t 4 digit number
	.data
input_str: .space 24
continue_str: .space 5
new_line: .asciiz "\n"
prompt_in1: .asciiz "Enter modulus: "
prompt_in2: .asciiz "Enter string of 12 decimal digits:​ "
prompt_continue: .asciiz "Wish to continue?:​ "
mod_str: .asciiz " mod "
equal_str: .asciiz " = "

	.text

run_mod:
	# Take input
	li $v0 4
	la $a0 prompt_in1
	syscall
	
	li $v0 5
	syscall
	move $s3 $v0

	li $v0 4
	la $a0 prompt_in2
	syscall
	
	li $v0 8
	addi $a1 $0 20
	la $a0 input_str
	syscall
	
	la $s1 input_str         #Address
	addi $s5 $0 89           #Ascii value for 'Y'

	add $t0 $0 $0            #Count
	addi $t2 $0 6            #Count bound 
	add $s2 $0 $0
	addi $t3 $0 10
	lp1:         
		addi $t0 $t0 1
		lbu $t1, 0($s1)      #load unsigned char from array into t1
		addi $t1, $t1, -48   #converts t1's ascii value to dec value
		mul $s2, $s2, $t3    #sum *= 10
		add $s2, $s2, $t1    #sum += array[s1]-'0'
		addi $s1, $s1, 1     #increment array address
		bne $t0 $t2 lp1
	
	add $t0 $0 $0            #Count
	move $s0 $s2
	add $s2 $0 $0
	lp2:
		addi $t0 $t0 1
		lbu $t1, 0($s1)
		addi $t1, $t1, -48
		mul $s2, $s2, $t3
		add $s2, $s2, $t1
		addi $s1, $s1, 1
		bne $t0 $t2 lp2
	move $s1 $s2

	#Print integers for debugging
	# li $v0 1
	# move $a0 $s0
	# syscall

	# li $v0 1
	# move $a0 $s1
	# syscall
	addi $sp $sp -16
	sw $s0 0($sp)
	sw $s1 4($sp)
	sw $s3 8($sp)
	sw $ra 12($sp)

	jal compute_mod

	lw $ra 12($sp)     # restore ra
	addi $sp $sp 16    # restore stack
	
	#Print output
	move $s2 $v0
	# li $v0 1
	# move $a0 $s0
	# syscall
	# li $v0 1
	# move $a0 $s1
	# syscall
	addi $t2 $0 12   # count bound
	addi $t0 $0 0    # count
	la $t1 input_str
	lp3:
		addi $t0 $t0 1
		li $v0 11
		lbu $a0 0($t1)
		syscall
		addi $t1 $t1 1
		bne $t0 $t2 lp3
	li $v0 4
	la $a0 mod_str
	syscall
	li $v0 1
	move $a0 $s3
	syscall
	li $v0 4
	la $a0 equal_str
	syscall
	li $v0 1
	move $a0 $s2
	syscall

	li $v0 4
	la $a0 new_line
	syscall
	#Check if user wants to continue
	li $v0 4
	la $a0 prompt_continue
	syscall
	li $v0 8
	addi $a1 $0 5
	la $a0 continue_str
	syscall

	lbu $s4 0($a0)
	beq $s4 $s5 run_mod
	jr $ra

compute_mod:
	lw $t0 0($sp)
	lw $t1 4($sp)
	lw $t2 8($sp)
	divu $t0 $t2
	mfhi $t3
	divu $t1 $t2
	mfhi $t4
	li $t5 1000000
	divu $t5 $t2
	mfhi $t5
	multu $t3 $t5
	mflo $t3
	divu $t3 $t2
	mfhi $t3
	add $t3 $t3 $t4
	divu $t3 $t2
	mfhi $t3
	move $v0 $t3
	jr $ra

main:
	jal run_mod
	
	li $v0 10
	syscall
