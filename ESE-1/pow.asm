# Exercise 3 - Power

.text
.globl MAIN

MAIN:	li a2, 2
	li a3, 5
	# Print content of a0
	jal POW
	mv a0, a0,
	li a7, 1
	ecall
	# Exit program
	li a0, 0	# return 0(=a0)
	li a7, 93	# exit code
	ecall		# syscall
	
POW:	# a2=base, a3=exp
	bnez a3, ELSE
	li a0, 1
	j ENDIF
ELSE:
	addi sp, sp, -8
	sw ra, 0(sp)
	addi a3, a3, -1
	jal POW
	mul a0, a2, a0
	lw ra, 0(sp)
	addi sp, sp, +8
ENDIF:
	jr ra