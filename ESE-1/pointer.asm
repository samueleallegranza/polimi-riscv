# Exercise 2 - Pointer

.data
V:	.space 80	# Array (8B[long])*(10 values)=80B (Not initialized)
P:	.dword 0	# NULL Pointer

.text
.globl MAIN

MAIN:	li a2, 5
	jal FOO		# ra=CURR_PC & jump to FOO
	# Exit program
	li a0, 0	# return 0(=a0)
	li a7, 93	# exit code
	ecall		# Syscall


	# s0 needed, save it on stack
FOO:	addi sp, sp, -8
	sd s0, 0(sp)
	
	# p = ADDR(V[0])
	la t0, V	# t0 -> V[0]
	la t1, P	# t1 -> P
	sd t0, 0(t1)	# (t1->P) = (t0->V[0])
	
	li s0, 0	# s0 = i = 0
	li t2, 10	# COUNT = 10
	
	# Start looping (i<COUNT)
FOR:	bge s0, t2, ENDFOR
	ld t0, P
	ld t1, 0(t0)
	add t1, t1, a2
	sd t1, 0(t0)

	ld t0, P	# not strictly necessary
	addi t0, t0, +8
	la t1, P
	sd t0, 0(t1)
	
	addi s0, s0, +1	# i++
	j FOR
		
	# Restore registers from stack
ENDFOR:	ld s0, 0(sp)
	addi sp, sp, 8
	jr ra
	