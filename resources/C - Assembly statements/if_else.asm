# Coide C
#	void main(){
#
#		int a;
#		int b;
#
#		a = 5;
#	
#		b = a % 2;
#
#		if(b != 0){
#			a = a + 1;
#		}else{
#			a = a - 1;
#		}
#	
#		return;
#
#	}




.text
main:
	
	# $s0 contiene a
	# $s1 contiene b

	li	s0, 5 #addi s0, zero, 5
	li 	t0, 2
	div	s1 ,s0, t0
	beq	t0, zero, ELSE
	addi	s0, s0, 1
	j	END_IF
	ELSE:
	addi	s0, s0, -1
	END_IF:	
	li a0, 0
	li a7, 93
	ecall
	
		
