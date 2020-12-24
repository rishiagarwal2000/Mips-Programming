# Take gcd of 2 integers >=1
	.data
continue_str: .space 5
new_line: .asciiz "\n"
prompt_in1: .asciiz "Enter m: "
prompt_in2: .asciiz "Enter n:​ "
prompt_continue: .asciiz "Wish to continue?:​ "
gcd_str: .asciiz "gcd("
comma_str: .asciiz ","
close_bracket_str: .asciiz ")"
equal_str: .asciiz " = "

	.text

run_gcd:
	# Take input
	li $v0 4
	la $a0 prompt_in1
	syscall
	
	li $v0 5
	syscall
	move $s0 $v0

	li $v0 4
	la $a0 prompt_in2
	syscall
	
	li $v0 5
	syscall
	move $s1 $v0

	move $s2 $ra             # return address
	addi $s5 $0 89           # Ascii value for 'Y'

	# Print integers for debugging
	# li $v0 1
	# move $a0 $s0
	# syscall

	# li $v0 1
	# move $a0 $s1
	# syscall
	addi $sp $sp -12
	sw $s0 0($sp)
	sw $s1 4($sp)
	sw $s2 8($sp)

	jal compute_gcd

	lw $ra 8($sp)     # restore ra
	addi $sp $sp 12   # restore stack
	
	# Print output
	move $s3 $v0      # store answer
	li $v0 4
	la $a0 gcd_str    # gcd(
	syscall
	li $v0 1
	move $a0 $s0      # gcd(m
	syscall
	li $v0 4
	la $a0 comma_str  # gcd(m,
	syscall
	li $v0 1
	move $a0 $s1      # gcd(m,n
	syscall
	li $v0 4
	la $a0 close_bracket_str   # gcd(m,n)
	syscall
	li $v0 4
	la $a0 equal_str           # gcd(m,n) = 
	syscall
	li $v0 1
	move $a0 $s3               # gcd(m,n) = ans
	syscall

	li $v0 4
	la $a0 new_line            # gcd(m,n) = ans\n
	syscall
	
	# Check if user wants to continue
	li $v0 4
	la $a0 prompt_continue
	syscall
	li $v0 8
	addi $a1 $0 5
	la $a0 continue_str
	syscall

	lbu $s4 0($a0)
	beq $s4 $s5 run_gcd
	jr $ra

compute_gcd:
	lw $t0 0($sp)
	lw $t1 4($sp)

	bne $t0 $0 mNotZero
	move $v0 $t1
	jr $ra
	
	mNotZero:
	bne $t1 $0 nNotZero
	move $v0 $t0
	jr $ra
	
	nNotZero:
	divu $t0 $t1
	mfhi $t0

	addi $sp $sp -12
	sw $t1 0($sp)
	sw $t0 4($sp)
	sw $ra 8($sp)
	
	jal compute_gcd

	lw $ra 8($sp)

	addi $sp $sp 12
	jr $ra

main:
	jal run_gcd
	
	li $v0 10
	syscall