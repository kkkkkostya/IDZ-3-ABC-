.include "macro-lib.asm"

.global test_programm
.text
test_programm:							# �������� ���������
	li s10, 0
	li s11, 4
	
	addi sp sp -4		# �������� ���� ������ ��� ���������� ra
	sw ra (sp)			# ��������� ra
	loopp:
	
		jal read_file_			# ���� ����� �����
	
		la a0, strbuf
		
		jal string_processing		# ��������� ��������� ������
		
		print_or_not(t1)
		
		la a6, new_str
		jal create_new_file 		# �������� ������ �����
	
		addi s10,s10,1
		beq s10,  s11,ex
		j loopp
		
	ex:
		lw ra (sp)		# ��������������� ra �� �����
		addi sp sp 4	# ��������������� ������� �����
		ret
		
