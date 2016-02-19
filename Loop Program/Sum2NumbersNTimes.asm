include \masm32\include\masm32rt.inc 
;--------Make Method------------------
;-----Prototype the sum function, 2 parameters------
	ProcSum PROTO :SDWORD, :SDWORD
;-------------------------------------
.code
start:
	call main
	exit
;-------------------------------------
main proc	
	LOCAL var1: SDWORD
	LOCAL var2: SDWORD
	LOCAL result: SDWORD
	LOCAL COUNT: SDWORD
	LOCAL varN : SDWORD

	print chr$("Program compute sum of two integers with N-loop", 13,10)
	mov varN, sval(input("N = "))
	mov ecx, varN
	mov COUNT, ecx	


	CONTD:
		CMP COUNT, 0
		je STOP
		print chr$(13,10,"Time ")
		mov ebx, varN
		add ebx, 1
		mov eax, ebx
		sub eax, COUNT
		print str$(eax)
		print chr$(" : ", 13,10)
			;--------- Input 2 integers --------
			mov var1, sval(input("Var 1 = "))
			mov var2, sval(input("Var 2 = "))
			invoke ProcSum, var1, var2
			mov result, eax
			;--------- Print result ------------
			print chr$("Sum = ")
			print str$(result)
			print chr$(13,10)
		DEC COUNT ;--------- Decrease Count -----------
		JMP CONTD

	STOP:
		ret	
main endp
;----------------------------------------------
ProcSum proc v1:SDWORD, v2:SDWORD
	mov eax, v1
	add eax, v2
	ret
ProcSum endp
;----------------------------------------------
end start
	
