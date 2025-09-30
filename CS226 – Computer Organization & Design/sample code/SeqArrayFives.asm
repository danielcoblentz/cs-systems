# RISC-V Program to Store Values in Array (SeqArrayFives.asm)

# Register Usage
#	s0 = array base address
#	s1 = array index
#	s2 = calculated array element offset
#	s3 = array element address
#	t0 = value to store in array

	.data	
fives:	.word	0 0 0 0 0		          # allocate 5 element array
	.text
main:
	lui	s0, 0x10010		# base address of array in s0
	
	addi	t0, zero, 5		# first value to store in array
	or	s1, zero, zero	          # initialize index s1 (0)
	slli	s2, s1, 2			# calculate x4 offset s2
	add	s3, s0, s2		# add offset to base address
	sw	t0, 0(s3)			# store the value to array[0]

	addi	t0, t0, 5			# next value to store in array
	addi	s1, s1, 1			# increment the index (1)
	slli	s2, s1, 2			# calculate x4 offset s2
	add	s3, s0, s2		# add offset to base address
	sw	t0, 0(s3) 		# store the value to array[1]

	addi	t0, t0, 5			# next value to store in array
	addi	s1, s1, 1			# increment the index (2)
	slli	s2, s1, 2			# calculate x4 offset s2
	add	s3, s0, s2		# add offset to base address
	sw	t0, 0(s3) 		# store the value to array[2]

	addi	t0, t0, 5			# next value to store in array
	addi	s1, s1, 1			# increment the index (3)
	slli	s2, s1, 2			# calculate x4 offset s2
	add	s3, s0, s2		# add offset to base address
	sw	t0, 0(s3) 		# store the value to array[3]

	addi	t0, t0, 5			# last value to store in array
	addi	s1, s1, 1			# increment the index (4)
	slli	s2, s1, 2			# calculate x4 offset s2
	add	s3, s0, s2		# add offset to base address
	sw	t0, 0(s3) 		# store the index value to array[4]

exit:	ori	a7, zero, 10
	ecall
