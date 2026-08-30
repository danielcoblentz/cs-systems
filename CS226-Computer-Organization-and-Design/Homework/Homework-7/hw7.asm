# Program: fahrenheit to celsius conversion program
# Name: Daniel Coblentz
# Date: 11/16/2024

# Description:
# This program converts an integer temperature from fahrenheit to celsius using the formula: C = (F - 32) × 5 / 9

# Additional Details:
# The integer value is transferred from a general-purpose register to a floating-point register to perform the computation. A memory dump is generated separately, with labels indicating the resulting vals.


# Register useage:
#   f0 - F_temp (Fahrenheit temperature)
#   f1 - 32 (converted to float)
#   f2 - (F_temp - 32)
#   f3 - 5 (converted to float)
#   f4 - (F_temp - 32) * 5
#   f5 - 9 (converted to float)
#   f6 - (F_temp - 32) * 5 / 9 (result in Celsius)
#   t1, t2, t3 - General-purpose registers for loading byte values
#   s0 - base address for data segment
#   a7 - system call operation (exit)

# Offset calculations:
# F_temp = 0
# C_temp = 4
# const_32 = 8
# const_5 = 9
# const_9 = 10

# floating point offsets for storing vals:
# const_32: offset 8
# const_5: offset 12
# const_9: offset 16


.data
F_temp:  .float 98.6             # initial fahrenheit temp
C_temp:  .float 0                # celsius temperature, initialized to zero
const_32: .byte 32               # byte constant for 32
const_5:  .byte 5                # byte constant for 5
const_9:  .byte 9                # byte constant for 9

.text
    lui s0, 0x10010		 # memory base address    

    # load fahrenheit temperature into a floating-point register
    flw f0, 0(s0)               

    # load the value 32 then convert to floating-point 
    lb t1, 8(s0)                	# load byte constant 32 into t1, offset 8
    fcvt.s.w f1, t1, dyn
    
    
    # subtract 32 from F_temp
    fsub.s f2, f0, f1 dyn          	# subtract f1 from f0, store result in f2
    
    # load the value 5 into a general-purpose register and convert to floating-point 
    lb t2, 9(s0)                	# load 5 into t2, offset 9
    fcvt.s.w f3, t2 dyn            	# convert integer 5 to floating-point, store in f3
    
     # multiply the result by 5
    fmul.s f4, f2, f3 dyn          	# multiply f2 by f3, store result in f4

    # load the value 9 into a general-purpose register and convert to floating-point 
    lb t3, 10(s0)              		# load 9 into t3, offset 10
    fcvt.s.w f5, t3 dyn            	# convert integer 9 to floating-point, store in f5

    # divide the result by 9
    fdiv.s f6, f4, f5 dyn          	# divide f4 by f5, store result in f6

    # store the result in C_temp + store the reamining vals into memory for mem_dump file
    fsw f6, 4(s0)               	# store the computed celsius temperature at offset 4
    fsw f1, 8(s0) 			# store 32 to memory as a floating-point value 
    fsw f3, 12(s0) 			# store 5 to memory as a floating-point value 
    fsw f5, 16(s0) 			# store 9 to memory as a floating-point value
    
exit:	ori	a7, zero, 10		# program exit
	ecall