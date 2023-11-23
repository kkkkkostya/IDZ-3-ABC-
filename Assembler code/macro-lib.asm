#���������� ��������
.eqv   STR_SIZE 4096
.eqv  inp_size 256

.data
quest: .asciz "����� �� ������� ���������?\n���� ��, ������� Y, ����� ����� ������ ������\n"
user_input:    .space STR_SIZE				# ������ ������ ��� ����������
test_: .asciz "��������� ��������� �� ������? ���� �� ������� ������, �� ������� 1. ���� �� ������ � ������� �������� - 0, ����� ����� ������ ������\n "
n: .asciz "\n"
user_test: .space inp_size

# ������ \n

.macro print_or_not(%x)						# ������ ��� ������ ���������� � �������
print_n()
print_n()
print_str(quest)
print_n()
	
	read_str(user_input, STR_SIZE)				# ���������� ������� ������������ � �������
	la %x user_input						
	lb      t6 (%x) 
	li 	t2 89
	la a0, new_str			
	beq	t6 t2 yes							# ���� ������������ ���� Y
	j end
yes:
	print_n()
	print_str(new_str)
end:
.end_macro

# ���������� ������
.macro read_str(%x, %y)
   la	a0 %x
   li     a1 %y
   li      a7 8
   ecall
.end_macro

.macro print_n()
   li a7, 4
   la a0, n
   ecall
.end_macro

# ������ ������
.macro print_str(%x)
   li a7, 4
   la a0, %x
   ecall
.end_macro

# �������������� ��������� ��� ������ ���� ��������������
.macro test_or_not()
   	print_str(test_)
   	read_str(user_test, inp_size)
   	la t1 user_test						
	lb      t6 (t1) 
	li 	t2 49			
	print_n()
	beq t6,t2,ok
	li 	t2 49	
	beq t6,t2, ok_2
	li a2, -1
	j end
ok:
	li a2, 0
ok_2:
	li a2, 1
end:
.end_macro

# ��������, ��� ������ �������� �������� ������� � ������� ��������������� ����� � ��������� ��������
.macro isVowel(%x)
   mv t2, %x
    
   li	a0 97					# ���� ������ - a
   beq %x, a0, vow
   
    li	a0 101				# ���� ������ - e
   beq %x, a0, vow			
   
    li	a0 105				# ���� ������ - i
   beq %x, a0, vow
   
    li	a0 111				# ���� ������ - o
   beq %x, a0, vow
   
    li	a0 117				# ���� ������ - u
   beq %x, a0, vow
   
    li	a0 121				# ���� ������ - y
   beq %x, a0, vow
   
    j end
vow:
	li t2, 32
	sub t2, a0, t2
   
end:
.end_macro

.macro call_read_file()
	jal read_file_
.end_macro

.macro call_string_processing()
	jal string_processing
.end_macro

.macro call_create_new_file()
	jal create_new_file
.end_macro