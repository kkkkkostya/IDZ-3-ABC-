.include "macro-lib.asm"

.global test_programm_macros
.text
test_programm_macros:							# Òåñòîâàÿ ïðîãðàììà
	li s10, 0
	li s11, 2
	
	addi sp sp -4		# Çàïàñàåì îäíó ÿ÷åéêó äëÿ ñîõðàíåíèÿ ra
	sw ra (sp)			# Ñîõðàíÿåì ra
	loopp:
	
		call_read_file()			# Ââîä èìåíè ôàéëà
	
		la a0, strbuf
		
		call_string_processing		# Îáðàáîòêà ñ÷èòàííîé ñòðîêè
		
		print_or_not(t1)
		
		la a6, new_str
		call_create_new_file 		# Ñîçäàíèå íîâîãî ôàéëà
	
		addi s10,s10,1
		beq s10,  s11,ex
		j loopp
		
	ex:
		lw ra (sp)		# âîññòàíàâëèâàåì ra èç ñòåêà
		addi sp sp 4	# âîññòàíàâëèâàåì âåðøèíó ñòåêà
		ret
		
