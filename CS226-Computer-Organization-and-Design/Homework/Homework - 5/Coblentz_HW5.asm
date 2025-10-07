# Daniel Coblentz
# 9/19/2024
# This program will provide an example of different types of shifts, define multiple types of data, and perform calculations.
# The results will be assigned to the following variables: I, J, and K.
# s0 = memory base address

# I = [(A + B) * (C - D)] / [(C - B) + 6]
# Register usage:
#	t0 = A 
#	t1 = B 
#	t2 = (A + B)
#	t0 = C 
#	t3 = D 
#	t4 = (C - D) 
#	t3 = (A+B) * (C - D)
#	t2 = (C - B)
#	t1 = (C - B) + 6
#	s1 = ((A+B) * (C-D)) by (C-B) + 6

# J = [(W >> 2) * X] - [(Y << 1) / Z]
# Register usage:
# t0 = W
# t1 = (W >> 2)
# t2 = X
# t0 = ((W >> 2) * x)
# t1 = Y
# t2 = (Y << 1)
# t3 = Z
# t4 = (Y << 1) + Z
# t5 = [((W >> 2) * X) - ((Y << 1) % Z)
# s2 = Store the result of expression to J 

# K = ((((J - I) >> 4) - 7) - A)
# Register usage list:
# t0 = I
# t1 = J
# t2 = (J - I)
# t3 = (J - I) >> 4
# t4 = A
# t5 = final result stored in (K)


	.data	# Assembler directive
	
A:	.byte	50 	# offset 0
B:	.half	30	# offset 2
C:	.half	40	# offset 4
D:	.byte	20	# offset 6
W:	.byte	160	# offset 7
X:	.word	10	# offset 8
Y:	.half	-32	# offset 12
Z:	.byte	8	# offset 14
I:	.word	0	# offset 16
J:	.word	0	# offset 20
K:	.word	0	# offset 24
	
	.text	# Executable code

main: 	
	lui s0, 0x10010		# Memory base address
	
# I = [(A + B) * (C - D)] / [(C - B) + 6] #################

# load & calculate (A + B) 
lb t0, 0(s0)	# Load A into t0 
lh t1, 2(s0)	# Load B into t1 
add t2, t0, t1	# Store (A + B) in t2 

# load & calculate (C - D)
lh t0, 4(s0)	# Load C into t0
lb t3, 6(s0)	# Load D into t3
sub t4, t0, t3  # (C - D) stored in t4
mul t3, t2, t4  # (A+B) * (C - D) stored in t3

# Calculate (C - B)
sub t2, t0, t1	# (C - B) into t2
addi t1, t2, 6	# (C - B) + 6 into t1

# Divide ((A+B) * (C-D)) by (C-B) + 6
div s1, t3, t1	# Calculate final result
sw s1, 16(s0)	# Store the result in I # store the value for I in s1


# J = [(W >> 2) * X] - [(Y << 1) % Z] ##################

# load & calculate (W >> 2)
lb t0, 7(s0)	# load W 
srli t1, t0, 2	# (W >> 2)


# load & calculate X * (W >> 2) 
lw t2, 8(s0)	# Load X
mul t0, t1, t2	# ((W >> 2) * x)

#load Y then shift left logical (Y << 1)
lh t1, 12(s0)	# load Y
slli t2, t1, 1	# (Y << 1)

#load Z then divide (Y << 1)
lb t3, 14(s0)	# load Z
div t4,t2,t3	# (Y << 1) + Z

#subract the two expressions [((W >> 2) * X) - ((Y << 1) % Z)
sub s2, t0, t4	# [((W >> 2) * X) - ((Y << 1) % Z)
sw s2, 20(s0)	# Store the result of J 




# K = ((((J - I) >> 4) - 7) - A) ##################


# Calculate (J - I)
#I = s1
#J = s2

sub t2, s2, s1     # t2 = J - I

# calculate (J - I) >> 4
srli t3, t2, 4      # Shift (J - I) right by 4, result stored in t3

# Subtract 7 from the result
addi t3, t3, -7     # t3 = ((J - I) >> 4) - 7

# Load A from data segment
lb t4, 0(s0)        

# Subtract A
sub t5, t3, t4      # t5 = (((J - I) >> 4) - 7) - A

# Store the result in K
sw t5, 24(s0)       # Store the result in K 
exit: 	
	ori	a7, zero, 10
	ecall			# Standard exit code
