# Exercise 3 - Big function

.text
.globl MAIN

MAIN:
	li s0, 1
	li s1, 2
	li s2, 3
	li s3, 4
	li s4, 5
	li s5, 6
	li s6, 7
	
	mv a2, s0
	mv a3, s1
	mv a4, s2
	mv a5, s3
	mv a6, s4
	mv a7, s5	# Not enough registers! Other params. in stack
	addi sp, sp, -8
	sd s6, 0(sp)
	jal BIG_FUN
	
	addi sp, sp, 8 	# libera spazio sullo stack
	mv s7, a0
	
	li a0, 0
	li a7, 93
	ecall
	
BIG_FUN:
	addi sp, sp, -8
	sd ra, 0(sp)
	
	addi sp, sp, -48
	sd a2, 40(sp)
	sd a3, 32(sp)
	sd a4, 24(sp)
	sd a5, 16(sp)
	sd a6, 8(sp)
	sd a7, 0(sp)	
	
	mv a2, a5
	ld a3, 56(sp)
	jal SUMS
	
	ld a2, 40(sp)
	ld a3, 32(sp)
	ld a4, 24(sp)
	ld a5, 16(sp)
	ld a6, 8(sp)
	ld a7, 0(sp)
	addi sp, sp, 48
	
	mul t0, a2, a3	# t0  = (a * b)
	add t0, t0, a0	# t0 += sums(d, g)
	add t0, t0, a4	# t0 += c
	add t0, t0, a6	# t0 += e
	add t0, t0, a7	# t0 += f
	
	mv a0, t0
	ld ra, 0(sp)
	addi sp, sp, +8
	jr ra

SUMS:
	mul t0, a0, a1
	addi a0, t0, 17
	jr ra
	