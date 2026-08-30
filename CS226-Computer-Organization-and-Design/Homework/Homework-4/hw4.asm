# Daniel Coblentz
# 9/12/2024
# CS 226
# This program defines various variables of different types(bytes, halfwords, words and strings) and places them into memory. It allocates space for these variables, including handling alignment by reserving space for any “holes” in the memory.



	.data	#assemblier directive
		
small_num:	.byte		50			# 8-bit number
char_string:	.asciz		"123456789abcdef"	# null terminated string(16 bytes)
medium_num:	.half		30000			# 16-bit number
char_y:		.ascii		"Y"			# Single uppercase character
large_num:	.word		1000000			# 32-bit number
array:		.byte		1   19   52   79   12	# 5 8-bit vlaues (array)
extra:		.space		33			# 29 bytes of space from summing the previous 1-6 data sizes. and 33 includes holes in memory


	
	.text	# executable code

main: 	lui s0, 0x10010


exit: 	ori	a7, zero, 10
	ecall						#standard exit code always incldue.
