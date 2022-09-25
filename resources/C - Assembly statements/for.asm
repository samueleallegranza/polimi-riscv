
#	int a[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
#	
#	void main(){
#	
#		int i, sum;
#		sum = 0;
#		
#		for(i = 0; i < 10; i++){
#			sum = sum + a[i];
#		}
#	}


.data
a:	.dword 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
.eqv LEN 10
.text
.globl main

main:

	# $s0 contiene i
	# $s1 contiene sum

	li	s1, 0
	li	s0, 0
FOR:
	li 	t1, LEN
	bge	s0, t1, END_FOR
	la 	t1, a
	slli 	t2, s0, 3
	add 	t3, t1, t2
	ld 	t4, 0(t3)
	add 	s1, s1, t4

	addi	s0, s0, 1
	j	FOR
END_FOR:
	# per terminare l’esecuzione tramite exit
	li a0, 0
	li a7, 93
	ecall
