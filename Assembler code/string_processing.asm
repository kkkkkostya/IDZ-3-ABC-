.include "macro-lib.asm"	

.data
prom:         .asciz "Input file name to write: "    			 # �������� ����� ��� ������

.text

.global string_processing						 	# ��������� ������ �������� ������� �������
string_processing:
	mv t5, a0
	do:   
		la      t6 new_str
		li 	t0 0
		
	prepr:
	      	lb      t1 (t5) 
	 
	      	isVowel(t1)								# �������������� ������� ���� �� ������� �������� �������
		sb	t2 (t6)							# ��������� ������ � ����� ������
		li 	t0 1
		addi    t6 t6 1 
	          beqz    t1 end 
	          addi	t5 t5 1
	          b       prepr
	        
	end:	
		addi	t6 t6 -1
		li	t4 0
		sb	t4 (t6)
	ret 
