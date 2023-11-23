.include "macro-lib.asm"

.eqv	NAME_SIZE 256 				# ������ ������ ��� ����� �����
.eqv	TEXT_SIZE 4096 				# ������ ������ ��� ������
	
		.data
er_name_mes:    .asciz "Incorrect file name\n"
er_read_mes:    .asciz "Incorrect read operation\n"

new_str:     .space TEXT_SIZE				# ����� ��������������� ������
file_name:      .space	NAME_SIZE		# ������������ �����
strbuf:	.space TEXT_SIZE			# ����� ��� ��������� ������
default_name: .asciz "testout.txt"      	# ��� ����� �� ���������
file_out_name: .space	NAME_SIZE		# ��� ��������� �����
prompt:         .asciz "Input file path: "    			 # ���� �� ��������� �����

.text
.global main file_name strbuf file_out_name default_name er_name_mes er_read_mes new_str
main:
	test_or_not()
	
	beqz a2, auto_test
	
	bgtz a2, auto_test_mac

	jal read_file_			# ���� ����� �����
	
	la a0, strbuf
	
	jal string_processing		# ��������� ��������� ������
	
	print_or_not(t1)
	
	la a6, new_str
	jal create_new_file 		# �������� ������ �����
	
	j exit
	
	auto_test:
		jal test_programm
		j exit
		
	auto_test_mac:
		jal test_programm_macros

exit:
	li a7, 10
	ecall
	
