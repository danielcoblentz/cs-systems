# Example system call program for output formatting (lecture slides pages 10-11)
# Pseudoinstruction must be allowed for this program.
	.data
outstr1:	.asciz		"Good morning!\n"
outstr2:	.asciz		"Enter an integer:\t"
outstr3:	.asciz		"The number you entered was "

	.text
main:	ori	a7, zero, 4		# syscall code print string
	la	a0, outstr1		# address of outstr1
	ecall				# print string
	la	a0, outstr2		# address of outstr2
	ecall				# print string
	ori	a7, zero, 5		# syscall code read integer
	ecall				# read integer
	or	t0, zero, a0		# copy value to t0
	ori	a7, zero, 4		# syscall code print string
	la	a0, outstr3		# address of outstr3
	ecall				# print string
	ori	a7, zero, 1		# syscall code print integer
	or	a0, zero, t0		# copy value to a0
	ecall				# print value
	ori	a7, zero, 11		# syscall code print character
	ori	a0, zero, 0x2e		# ASCII code for period
	ecall				# print period
exit:	ori	a7, zero, 10		# syscall code for exit
	ecall				# exit program
