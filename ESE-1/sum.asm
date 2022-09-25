# Exercise 1 - Sum

.text
.globl MAIN

MAIN:
	# s0 = a;   s1 = b;   s2 = c
	li s0, 5		# s0 = 5
	li s1, 3		# s1 = 3
	
	# SUM function call + param. preparation
	mv a2, s0
	mv a3, s1 
	jal SUM			# ra = CURR_PC & jump to SUM
	
	# Move return value in a0 to s2
	mv s2, a0
	mv a2, s2 # Return c(=s2)
	
	# Exit program
	li a0, 0
	li a7, 93
	ecall

SUM: 	
	# s0 needed to store result of a2 + a3. Save s0 into stack
	addi sp, sp, -8
	sd s0, 0(sp)
	# Operation s0 = a2 + a3
	add s0, a2, a3
	# Move s0 into a0 (return value register)
	mv a0 , s0
	# Restore registers from the stack
	ld s0, 0(sp)
	addi sp, sp, +8
	# Return to MAIN (set CURR_PC = ra, previously set with jal)
	jr ra		# jal zero, 0(ra)