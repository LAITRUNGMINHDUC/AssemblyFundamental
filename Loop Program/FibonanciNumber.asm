; Program calculate Fibonanci

include /masm32/include/masm32rt.inc

.code
	start:
		call main
		exit

	main proc
		LOCAL varN: SDWORD
		LOCAL result: SDWORD
		LOCAL temp1: SDWORD
		LOCAL temp2: SDWORD
		LOCAL index: SDWORD

		mov varN, sval(input("Fibonanci N = "))			; Input N for Fibonanci finding		

		cmp varN, 1										; Compare N with 1, 2
			je equal									; Because Fibonanci(1) = 1; Fibonanci(2) = 1
		cmp varN, 2										;
			je equal									;

		mov eax, 1										; Temp1 := 1
		mov temp1, eax									; Use EAX as temporary register
		mov eax, 1										; Temp2 := 1
		mov temp2, eax 									; The same with Temp1
		mov ebx, varN									; Use EBX as temp register
		sub ebx, 2										; index := varN - 2
		mov index, ebx 									; index is Fibonanci(a) with a GREATER 2 and a LESS OR EQUAL to varN
														
		FIBONANCI:										; Fibonanci label
			cmp index, 0 								; if index == 0 then jump to SHOW
				je SHOW

			mov eax, temp1		
			add eax, temp2
			; 	eax := temp1 + temp2
			
			mov ebx, temp2
			mov temp1, ebx
			;	temp1 := temp2

			mov temp2, eax
			; 	temp2 := eax

			push eax 									; Push eax to stack FOR saving value
			dec index									; Each time loop, index decrease 1 and Compare to 0 for exit loop

			;---------- This program is for showing each Fibonanci from 1 to N ---------------	
			; print ("Fibonanci (")
			; mov ebx, varN
			; sub ebx, index
			; print str$(ebx)
			; print chr$(") = ")
			; print str$(eax)
			; print chr$(13,10)

			jmp FIBONANCI

		;----------------------------
		SHOW:
			pop result 									; Assign result with the TOP of STACK 
			print "Result : "							; Top of STACK is the latest value of eax
			print str$(result)							; It means that the result we want
			jmp over	

		;----------------------------	
		equal:
			print chr$("Result : 1")
			jmp over
		over:	
			ret
	main endp
;---------------------------------------------		
	end start

