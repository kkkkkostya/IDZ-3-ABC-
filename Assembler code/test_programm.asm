.include "macro-lib.asm"

.global test_programm
.text
test_programm:							# Тестовая программа
	li s10, 0
	li s11, 4
	
	addi sp sp -4		# Çàïàñàåì îäíó ÿ÷åéêó äëÿ ñîõðàíåíèÿ ra
	sw ra (sp)			# Ñîõðàíÿåì ra
	loopp:
	
		jal read_file_			# Ââîä èìåíè ôàéëà
	
		la a0, strbuf
		
		jal string_processing		# Îáðàáîòêà ñ÷èòàííîé ñòðîêè
		
		print_or_not(t1)
		
		la a6, new_str
		jal create_new_file 		# Ñîçäàíèå íîâîãî ôàéëà
	
		addi s10,s10,1
		beq s10,  s11,ex
		j loopp
		
	ex:
		lw ra (sp)		# âîññòàíàâëèâàåì ra èç ñòåêà
		addi sp sp 4	# âîññòàíàâëèâàåì âåðøèíó ñòåêà
		ret
		
