
#	void main(){
#		int i;
#		int sum;
#
#		i = 0;
#		sum = 0;
#
#		do{
#		   sum = sum + i;
#		   i = i + 1;
#		}while(i < 10);
#		return;
#	}

.text
.eqv NUM 10
.globl main

main:
	# s0 contiene i
	# s1 contiene sum

	li s0, 0
	li s1, 0
	
DO:	
# corpo del ciclo
	add	s1, s1, s0
	#i = i + 1
	addi	s0, s0, 1
# se la condizione di permanenza e' verificata, torna all'inizio del diclo
	li 	t0, NUM
	blt	s0, t0, DO
	# per terminare l’esecuzione tramite exit
	li a0, 0
	li a7, 93
	ecall
