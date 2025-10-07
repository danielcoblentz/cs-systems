# Name:  
# Assignment number:
# Date: 
# Description of program: find the largest and smallest value in an array

		.data
length:		.byte	7
smallest:	.word	0
largest:	.word	0
numbers:	.word	12, 7, -3, 8, -4, 25, 19		

		.text
main:		lui	s0, 0x10010	# memory base address
		addi	s1, s0, 12	# array base address	
		lb	s2, 0(s0)	# load array length
		or	s3, zero, zero	# set index = 0

		lw	t0, 0(s1)	# get first element of array (min)
		or	t1, zero, t0	# copy min to max
		addi	s3, s3, 1	# increment index

# loop through array starting with 2nd element
loop:		slli	s4, s3, 2	# calc offset x4 index
		add	s5, s4, s1	# offset + array base address
		lw	t2, 0(s5)	# load next array element

		# compare with smallest
		blt	t2, t0, new_smallest

		# compare with largest
		blt	t1, t2, new_largest
		jal	zero, next_loop

new_smallest:
		or	t0, zero, t2	# copy new smallest value
		jal	zero, next_loop	
		
new_largest:
		or	t1, zero, t2	# cop[y new largest value

next_loop:
		addi	s3, s3, 1	# increment index
		blt	s3, s2, loop	# repeat loop if not finished

		sw	t0, 4(s0)	# stores the smallest value
		sw	t1, 8(s0)	# stores the largest value

exit:		ori	a7, zero, 10
		ecall
