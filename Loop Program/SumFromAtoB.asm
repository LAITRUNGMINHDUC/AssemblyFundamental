include \masm32\include\masm32rt.inc
	
.code
start:
	call main		
	exit
;-------------------------
	main proc

	LOCAL var1:DWORD
	LOCAL var2:DWORD
	LOCAL tempcmp: DWORD
    LOCAL result: DWORD

	mov var1, sval(input("Var 1 = "))
	mov var2, sval(input("Var 2 = "))
  

	mov ebx, var1
	mov ecx, var2

	cmp ebx, ecx
    	  jl CALC
          jg NEXT  
          je EQUAL

	CALC:
		mov eax, 0
			FIRSTCALC:
				cmp ebx, ecx
				jg STOP
				add eax, ebx
				add ebx, 1
                        push eax
				jmp FIRSTCALC
			STOP:
				jmp OVER

	NEXT:
		mov eax, 0
			ANOTHER:
				cmp ecx, ebx
				jg ANSTOP
				add eax, ecx
				add ecx, 1
                        push eax
				jmp ANOTHER
			ANSTOP:
				jmp OVER

      EQUAL:
            mov eax, ebx
            push eax
            jmp OVER

	OVER:
      pop eax
      mov result, eax
      print chr$("Result = ")
      print str$(result)		
	ret						

	main endp
;-------------------------	
end start		