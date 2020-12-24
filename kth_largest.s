
	.data

arr:	.space 200  # space for 50 integers
length: .asciiz "Enter No. of Integers in list\n"
read_list: .asciiz "Enter list\n"
read_k: .asciiz "Enter (a positive integer)\n"

	.text

main:

	la $s0 arr

	li $v0 4		   # Print string
	la $a0 length
	syscall

	li $v0 5           # Read length
	syscall
	move $s5 $v0       # store length of array in s5
	
	li $s3 0x80000000  # store the max in the input array
	add $t1 $0 $0  # iterator
	
	li $v0 4		   # Print string
	la $a0 read_list
	syscall

	input_loop:
		sll $t0 $t1 2 # multiply iterator by 4
		add $t0 $s0 $t0  # store address of current element
		addi $t1 1  # iterator count
		
		li $v0 5     # take input
		syscall
		sw $v0 0($t0)  # store input

		slt $t3 $s3 $v0  # check if new element is larger
		beqz $t3 not_greater

		move $s3 $v0   # update with the larger element
		not_greater:
		bne $t1 $s5 input_loop  # loop back if not equal to max id
	
	
	li $v0 4		   # Print string
	la $a0 read_k
	syscall

	li $v0 5
	syscall           # read k
	move $s1 $v0      # move k to s1
	add $s2 $s1 $0   # cur_k

	k_loop:
		addi $s2 -1  # update cur_k
		bgtz $s2 continue# still loop to continue

		# Print answer
		li $v0 1
		move $a0 $s3
		syscall

		# EXIT
		li $v0 10
		syscall

		continue:
		li $s4 0x80000000  # intialize next_value
		add $t1 $0 $0  # iterator
		arr_loop:
			sll $t0 $t1 2 # multiply iterator by 4
			add $t0 $s0 $t0  # store address of current element
			addi $t1 1  # iterator count
			
			lw $t2 0($t0)
			
			slt $t3 $t2 $s3
			bgtz $t3 LESS

			j end_arr_loop

			LESS:
				slt $t3 $s4 $t2
				beqz $t3 smaller
 				move $s4 $t2
 				smaller:
				j end_arr_loop

			end_arr_loop:

				bne $t1 $s5 arr_loop

		move $s3 $s4      # update cur_value
		j k_loop


