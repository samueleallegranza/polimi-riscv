#	void main(){
#		int i;
#		int sum;
#	
#		i = 0;
#		sum = 0;
#
#		while(i < 10){
#			sum = sum + i;
#			i = i + 1;
#		}
#
#		return;
#	}
 
.eqv LEN 10
.text
main:
	# s0 contiene i
	# s1 contiene sum
	li s0, 0
	li s1, 0
	
	li t0, LEN
WHILE:	bge	s0, t0, END_WHILE
	add	s1, s1, s0
	addi	s0, s0, 1
	j	WHILE
END_WHILE:
	# per terminare l’esecuzione tramite exit
	li a0, 0
	li a7, 93
	ecall
		
	
