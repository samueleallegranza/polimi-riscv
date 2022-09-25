.text
.global MAIN

MAIN:	li t1, 10
	li t2, 15
	add a2, t2, t1

PRINT:
	mv a0, a2
	li a7, 1
	ecall
