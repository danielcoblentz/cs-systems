	.data
val1:	.word 25		# two values to use in example if code
val2:	.word 50

	.text
main:	lui	s0, 0x10010		# memory base address
	lw	t0, 0(s0)		# load val1 to t0
	lw	t1, 4(s0)		# load val2 to t1

# if (val1 = val2) {val4 = val1 + val2}
ex1:	beq	t0, t1, addvals	# check if equal
	jal	zero, noadd	# go here if not equal
addvals:	add	t3, t0, t1		# add only if val1 = val2
noadd:	# add should not execute - check t3 to confirm - value should be 0

# if (val1 != val2) {val4 = val1 + val2}
ex2:	bne	t0, t1, doadd	# check if not equal
	jal	zero, skipadd	# go here if equal
doadd:	add	t3, t0, t1		# add only if val1 != val2
skipadd:	# add should execute - check t3 to confirm - should be 75 (0x4b)

exit:	ori	a7, zero, 10
	ecall
