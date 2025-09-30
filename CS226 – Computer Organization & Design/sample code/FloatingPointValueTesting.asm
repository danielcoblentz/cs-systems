# Testing and comparing single vs. double precision floating-point
# Program reads floating-point values as float and double then
# outputs them in the Run I/O window to show difference in the
# interpreted value.  Output is via subroutines, one for single
# precision and a second for double.  Values are passed to 
# subroutine via the stack.
	.data
# Treating values as an array of float
Planck:	.float 6.62607015e-34
Avogaro:	.float 6.02214076e23
Euler:	.float 2.718281828459045
Golden: 	.float 1.61803398875
SqRt_2: 	.float 1.41421356237
SqRt_3: 	.float 1.73205080757
ln_2: 	.float 0.69314718056
log_2:	.float 0.30102999566398119521373889472449
Ln_10:	.float 2.30258509299
pi:	.float 3.141592653589793238462643383279502884197

# Same values defined as double
array:	.double
	6.62607015e-34
	6.02214076e23
	2.718281828459045
 	1.61803398875
 	1.41421356237
 	1.73205080757
 	0.69314718056
	0.30102999566398119521373889472449
	2.30258509299
	3.141592653589793238462643383279502884197

	.text
main:	lui	s0, 0x10010	# memory base address (float)
	addi	s11, s0, 0x28	# array base address (double)
	ori	s1, zero, 10	# number of values
	ori	s2, zero, 0	# initialize counter

loop:	# float first
	slli	s3, s2, 2		# calc offset x4
	add	s4, s0, s3	# mem addr element float
	flw	fs0, 0(s4)	# load float
	fsw	fs0, 0(sp) 	# push to stack
	addi	sp, sp, -4	# decr sp
	jal	ra, printfloat	# printfloat sub
	# double next
	slli	s5, s2, 3		# calc offset x8
	add	s6, s11, s5	# mem addr element double
	fld	fs1, 0(s6)	# load double
	fsd	fs1, 0(sp)	# push to stack
	addi	sp, sp, -8	# decrement sp
	jal	ra, printdouble	# printdouble sub
	addi	s2, s2, 1		# increment counter
	blt	s2, s1, loop	# repeat

exit:	ori	a7, zero, 10	# program exit
	ecall

printfloat:
	ori	a7, zero, 11	# call code to print char
	ori	a0, zero, 0x53	# ASCII value for "S"
	ecall
	ori	a0, zero, 0x3a	# ASCII value for ":"
	ecall
	ori	a0, zero, 0x9	# ASCII value for "\t"
	ecall
	ori	a7, zero, 2	# call code to print float
	addi	sp, sp, 4		# increment sp
	flw	fa0, 0(sp)	# load float into fa0 for output
	ecall			# print the float
	ori	a7, zero, 11	# call code to print char
	ori	a0, zero, 0xa	# ASCII value for "\n"
	ecall
	jalr	zero, ra, 0	# return from subroutine

printdouble:
	ori	a7, zero, 11	# call code to print char
	ori	a0, zero, 0x44	# ASCII value for "D"
	ecall
	ori	a0, zero, 0x3a	# ASCII value for ":"
	ecall
	ori	a0, zero, 0x9	# ASCII value for "\t"
	ecall
	ori	a7, zero, 3	# call code to print double
	addi	sp, sp, 8		# increment sp
	fld	fa0, 0(sp)	# load double into fa0 for output
	ecall
	ori	a7, zero, 11	# call code to print char
	ori	a0, zero, 0xa	# ASCII value for "\n"
	ecall
	jalr	zero, ra, 0	# return from subroutine
