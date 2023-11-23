.include "macro-lib.asm"

.global test_programm_macros
.text
test_programm_macros:							# �������� ���������
	li s10, 0
	li s11, 1
	
	addi sp sp -4		# �������� ���� ������ ��� ���������� ra
	sw ra (sp)			# ��������� ra
	loopp:
	
		call_read_file()			# ���� ����� �����
	
		la a0, strbuf
		
		call_string_processing		# ��������� ��������� ������
		
		print_or_not(t1)
		
		la a6, new_str
		call_create_new_file 		# �������� ������ �����
	
		addi s10,s10,1
		beq s10,  s11,ex
		j loopp
		
	ex:
		lw ra (sp)		# ��������������� ra �� �����
		addi sp sp 4	# ��������������� ������� �����
		ret
		
