
#long v[10];
#long *p;
#
#	void foo(int n){
#	
#		int i;
#
#		p = v;
#	
#		for(i = 0; i < 10; i++){	
#	
#			*p = *p + n;
#			p++;
#		}
#	}
#
#	void main(){
#		foo(5);
#	}

.data
v:	.space 80 	# array di 10 elementi
p:	.dword 0	# puntatore inizializzato a NULL
.eqv    NUM    10
.text
.globl MAIN
 
 MAIN:  li	a2, 5
 	jal	FOO
 	# per terminare l’esecuzione tramite exit
	li a0, 0
	li a7, 93
	ecall
 
 FOO:   addi	sp, sp, -8
 	# carica indirizzo v in t0
 	la	t0, v
 	
 	la 	t2, p
 	# carica contenuto di t0 in p
 	sd	t0, 0(t2)
 	# backup di s0
 	sd	s0, 0(sp)
 	# inizializza i
 	li	s0, 0
	li	t3, NUM
	
	
 for:   bge	s0, t3, endfor
 	# carica contenuto di p in t0
 	ld 	t0, p
 	# carica *p
 	ld	t1, 0(t0)
 	# somma n
 	add	t1, t1, a2
 	# salva *p
 	sd	t1, 0(t0)
 	# ri-carica contenuto di p in t0 (non necessario)
 	ld	t0, p
 	# incrementa contenuto di p
 	addi	t0, t0, 8
 	# salva contenuto di p
	sd	t0, 0(t2)
 	addi	s0, s0, 1
 	j	for
 	
 endfor:ld	s0, 0(sp)
 	addi	sp, sp, 8
 	jr	ra
