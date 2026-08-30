# Example program for normal multiplication
# Output via subroutine
# Stack used to pass product to subroutine
	.data
val1:	.word	100		# arbutrary value 1
val2:	.word	-100		# arbitrary value 2
product:	.word	0		# memory allocation for product
outtext:	.asciz	"Product:\t"	# text string for output
	.text
main:	lui	s0, 0x10010	# memory base address
	lw	t0, 0(s0)		# load val1
	lw	t1, 4(s0)		# load val2
	mul	t2, t0, t1	# multiply two vals
	sw	t2, 0(sp)		# push product to stack
	addi	sp, sp, -4	# decrement sp
	jal	ra, println	# call subroutine to print
	sw	t2, 8(s0)		# store product to memory
exit:	ori	a7, zero, 10	# program exit
	ecall			# DONE!

println:	la	a0, outtext	# string address in a0
	ori	a7, zero, 4	# external call code to print string
	ecall			# print string
	ori	a7, zero, 1	# external call code to print integer
	addi	sp, sp, 4		# increment sp
	lw	a0, 0(sp)		# pop product from stack to a0
	ecall			# print integer product
	ori	a7, zero, 11	# external call code to print char
	ori	a0, zero, 0xa	# ASCII code for newline
	ecall			# print newline
	jalr	zero, ra, 0	# return from subroutine
