# Name: Daniel Coblentz
# Date: 10/23/2024
# Class: CS 226 Computer Organization & Design
# Description: This program calculates the total, positive, and negative sums, then displays each sum with its corresponding label ("Positive Sum," "Total Sum," "Negative Sum") on the console. It uses a loop to process the array, stores the results in memory, and uses a subroutine for formatted output to the user.


.data
    array: 		.word 5, -1, 3, -8, 12, 1, -4, 25, -15, -2	# the 10 elements in the array				offset 0
    array_length: 	.byte 10                   			# number of elements in the array			offset 40
    total_sum: 		.word 0                       			# variable to store the sum of all elements     	offset 44
    positive_sum: 	.word 0                    			# variable to store the sum of positive elements	offset 48
    negative_sum: 	.word 0                    			# variable to store the sum of negative elements 	offset 52
    newline: .asciz "\n"                    				# newline character for printing			offset 56
    
    total_output: 	.asciz "Total Sum: "										      # offset 58
    positive_output: 	.asciz "Positive Sum: "										      # offset 70
    negative_output: 	.asciz "Negative Sum: "								                      # offset 85

.text

main:
    # Register usage:
    # s0: memory base address (0x10010)
    # s1: array base address (0x10010 + offset for array)
    # s2: array length (number of elements)
    # s3: index for looping through the array
    # s4: offset for accessing array elements (index * 4)
    # s5: calculated address of the current array element
    # t2: current array element value
    # t3: total sum of array elements
    # t4: sum of positive elements
    # t5: sum of negative elements

    # initialize memory base address 
    lui s0, 0x10010       	  # load the memory base address into s0
    addi s1, s0, 0       	  # array base address (offset 0)
    lb s2, 40(s0)		  # load array length from memory (s2 = array_length)
    or s3, zero, zero		  # initialize index (s3 = 0)
    or t3, zero, zero                      # initialize total sum to 0
    or t4, zero, zero                       # initialize positive sum to 0
    or t5, zero, zero                       # initialize negative sum to 0

# loop through the array 
loop:
    slli s4, s3, 2        # calculate offset: s4 = index * 4 (word size)
    add s5, s4, s1        # s5 = array base address + offset
    lw t2, 0(s5)          # load array element into t2

    # add to total sum 
    add t3, t3, t2

    # check if the element is negative or positive
    blt t2, zero, add_to_negative  	# if t2 < 0, branch to add_to_negative
    add t4, t4, t2       		# add element to positive_sum
    jal zero, next_element
    
add_to_negative:
    add t5, t5, t2      		 # add element to negative_sum
    beq zero, zero, next_element  	 # branch to next_element

next_element:
    addi s3, s3, 1       # increment index
    blt s3, s2, loop     # if s3 < s2, repeat the loop


# end of the loop: store the sums in memory (expected: total: 16 , pos: 46, neg:-30 )
end_loop:
    sw t3, 44(s0)
    sw t4, 48(s0)
    sw t5, 52(s0)

    
# push the string and value for positive sum onto the stack
    la a0, positive_output # load address of "Positive Sum: "
    addi sp, sp, -4        # decrease stack pointer
    sw a0, 0(sp)           # push the string address onto the stack
    lw a1, 48(s0)          # load positive_sum value into a1
    addi sp, sp, -4        # decrease stack pointer
    sw a1, 0(sp)           # push the integer value onto the stack
    jal print_subroutine   # call subroutine for output
    
# push the string and value for negative sum onto the stack (same operation)
    la a0, negative_output 
    addi sp, sp, -4        
    sw a0, 0(sp)           
    lw a1, 52(s0)         
    addi sp, sp, -4        
    sw a1, 0(sp)           
    jal print_subroutine   
    
# push the string and value for Total Sum onto the stack (same operation)
    la a0, total_output    
    addi sp, sp, -4        
    sw a0, 0(sp)          
    lw a1, 44(s0)          
    addi sp, sp, -4        
    sw a1, 0(sp)           
    jal print_subroutine   

    # exit program
exit:  ori a7, zero, 10
       ecall 
       
# Subroutine to print the string, integer, and newline on hte terminal
print_subroutine:
    # pop the integer from the stack
    lw a1, 0(sp)           # load integer value into a1
    addi sp, sp, 4         # increase stack pointer

    # pop the string address from the stack
    lw a0, 0(sp)           # load string address into a0
    addi sp, sp, 4         # increase stack pointer

    # print the string (e.g., "Positive Sum: ")
    addi a7, zero, 4               # syscall code for PrintString
    ecall

    # print the integer (46)
    addi a7, zero, 1               # syscall code for PrintInt
    or a0, zero, a1        # move integer value to a0
    ecall

    # print a newline character after the integer
    la a0, newline         # load address of newline character
    addi a7, zero, 4               # syscall code for printString
    ecall

    # return from subroutine
    jalr zero, ra, 0       # return to the main program
