# Example program for system calls (lecture slides page 8)
# Pseudoinstructions must be allowed for this program.
	.data
prompt:	.asciz  "Enter an integer:\t"
reply:	.word    0

	.text
main:	lui	s0, 0x10010		# memory base address in s0
	ori	a7, zero, 4		# syscall code for print string in a7
	or	a0, zero, s0	# load address of string in a0
	ecall			# print string on console

	ori	a7, zero, 5		# syscall code for reading an integer
	ecall			# read reply - value placed in a0
	sw 	a0, 20(s0)		# store the read number into memory

exit:	ori	a7, zero, 10	# system call code for ending program
	ecall
