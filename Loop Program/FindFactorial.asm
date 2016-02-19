include /masm32/include/masm32rt.inc

factorial PROTO :DWORD

.code
	start:
		call main
		exit

	main proc
		LOCAL varN: DWORD
		LOCAL result: DWORD

		mov varN, sval(input("N = "))
		add varN, 1
		
		cmp varN, 13
			je error
			jg error

		mov ebx, 1
		invoke factorial, varN		
		mov result, eax
		print "N! = "
		print str$(result)
		ret

		error:
			print "OverFlow - Cannot do factorial of this N"
			ret
	main endp

	factorial proc N:DWORD
		LOCAL result: DWORD
		mov result, 1
		GIAITHUA:
			cmp ebx, N
				je OVER			
			mov eax, result	
			mul ebx
			mov result, eax
			add ebx, 1	
				jmp GIAITHUA
		OVER:
			ret	
	factorial endp

	end start