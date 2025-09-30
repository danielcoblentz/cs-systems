	.data
val1:	.word 25		# two values to use in example if code
val2:	.word 50

	.text
main:	lui	s0, 0x10010	# memory base address
	lw	t0, 0(s0)	# load val1 to t0
	lw	t1, 4(s0)	# load val2 to t1

#     if (val1 = val2) {	# if-else logic to implement
#       val3 = val1 + val2;
#     } else {
#       val3 = val1 – val2
#     }
	    beq	t0, t1, addnums	# if val1 = val2, branch to addnums
subnums:    sub	t3, t0, t1		# else subtract
	    jal	zero, next		# if subtract was done, skip over add
addnums:	   add	t3, t0, t1		# add numbers - subtract was skipped
next:	   # code execution continues

exit:	ori	a7, zero, 10
	ecall
