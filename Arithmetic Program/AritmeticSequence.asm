include \masm32\include\masm32rt.inc

.code
start:
	call main		
	exit
;-------------------------
	main proc

	LOCAL varN:DWORD
	LOCAL varD:DWORD
	LOCAL varU:DWORD
    LOCAL result: DWORD

	mov varU, sval(input("Var U1 = "))
	mov varD, sval(input("Var D = "))
	mov varN, sval(input("Var N = "))

	cmp varN, 0
		je error
		jl error

	mov eax, varU
	push eax

	mov eax, varD
	mov ebx, varN
	sub ebx, 1
	imul ebx
	push eax

	pop eax
	mov result, eax
	pop eax
	add result, eax
	print str$(result)
	jmp OVER  
	
	error:
		print chr$("ERROR")
		jmp OVER

	OVER:
	ret
	main endp
;-------------------------	
end start		