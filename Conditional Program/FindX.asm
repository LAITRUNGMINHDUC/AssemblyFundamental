include \masm32\include\masm32rt.inc 
   
.code                       
start:                          ; The CODE entry point to the program
    call main                   ; branch to the "main" procedure
    exit
; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
main proc
    LOCAL varA:SDWORD            ; 2 SDWORD integral variables
    LOCAL varB:SDWORD            ; 
    
    LOCAL quot:SDWORD
    LOCAL modulo:SDWORD

  ; Input 2 integers
    mov varA, sval(input("Enter integer A  : "))
    mov varB, sval(input("Enter integer B : "))
    print chr$(13,10,13,10)
    print "The solution for AX + B = 0 is :"    
    print chr$(13,10)

    ; Move to registers to compare
    
        mov eax, varA
        mov ebx, varB

        cmp ebx, 0
        je error

        cmp eax, 0
        je conclude

        cmp eax, ebx
        je equal

            mov edx,0  
            mov eax, varB           ;EAX/EBX : EAX is hidden register                        
            CDQ                     ;Very Important with "signed" number
                                    ;If we don't have CDQ
                                    ;We cannot assign signed number to EAX
                                    ;And we solve the problem wrongly
            mov ebx, varA           
            
            idiv ebx                ;DIV/IDIV source
            neg eax 
            mov quot, eax
            mov modulo, edx
                
                cmp quot, 0
                    je realresult

            print "X = "
            print str$(quot)
            print chr$(13,10)
            print "Modulo = "
            print str$(modulo)
            print chr$(13,10)
            jmp over

        error:
            print "Error NumB - Cannot solve AX + B = 0"
            jmp over
        equal:
            print "X = -1"
            jmp over
        realresult:
            print "This program cannot have result in the REAL datatype"
            jmp over
        conclude:
            print "X = 0"
            jmp over
        over:
            ret            
main endp
;............................................
end start