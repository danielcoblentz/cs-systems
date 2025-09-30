# Program to check for divide by zero
# When detected, output prints message followed by 
# values involved
	.data
init:	.word 3			# initial denominator
start:	.word 10			# starting numerator
div0:	.asciz "Divide by zero: "	# error message

	.text
main:	lui	s0, 0x10010	# memory base address
	lw	t0, 0(s0)		# load initial value
	lw	t1, 4(s0)		# load starting value
loop:	beq	t0, zero, divzero	# check for divide by zero
	div	t1, t1, t0	# perform divide
	rem	t2, t1, t0	# get remainder
	addi	t0, t0, -1	# decrement initial denominator value
	bge	t0, zero, loop	# repeat loop
	jal	zero, exit	# jump to end of program
divzero:	ori	a7, zero, 4	# external call code to print string
	la	a0, div0		# address of string
	ecall
	ori	a7, zero, 1	# external call code to print integer
	or	a0, zero, t2	# numerator value
	ecall
	ori	a7, zero, 11	# external call code to print char
	ori	a0, zero, 0x2f	# char code for /
	ecall
	ori	a7, zero, 1	# external call code to print integer
	or	a0, zero, t0	# denominator value
	ecall
	ori	a7, zero, 11	# external call code to print char
	ori	a0, zero, 0xa	# char code for newline
	ecall
exit:	ori	a7, zero, 10
	ecall
