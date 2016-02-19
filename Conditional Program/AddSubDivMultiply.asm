; EX5_ADD_SUB_MUL_DIV
; 

;--------------------------------------
include \masm32\include\masm32rt.inc


;--------------------------------------
.code
start:
    call main
    exit

;-------------------------------------
main proc
    LOCAL var1: DWORD
    LOCAL var2: DWORD

    LOCAL sumint:DWORD
    LOCAL subint:DWORD
    LOCAL mulint:DWORD
    LOCAL divint:DWORD
    LOCAL modulo:DWORD

    mov var1, sval(input("Enter number 1: "))
    mov var2, sval(input("Enter number 2: "))
    print chr$(13,10)
    
    ; ADD
        mov eax, var1
        add eax, var2
        mov sumint, eax
        print "Num1 + Num2 = "
        print str$(sumint)
        print chr$(13,10)
    ; SUB
        mov eax, var1
        sub eax, var2
        mov subint, eax
        print "Num1 - Num2 = "
        print str$(subint)
        print chr$(13,10)
    ; MUL
        mov eax, var1
        mov ebx, var2
        imul ebx
        mov mulint, eax
        print "Num1 * Num2 = "
        print str$(mulint)
        print chr$(13,10)
    ; DIV
        mov eax, var1
        cdq
        mov ebx, var2

        cmp ebx, 0
        je error

        cmp eax, ebx
        je equal
        jg bigger
        jl smaller
        
        error:
            print "Error Num2 - Cannot do Num1/Num2"
            jmp over
        equal:
            print "Num1 / Num2 = -1"
            jmp over
        bigger:
            mov edx,0           
            idiv ebx 
            mov divint, eax
            mov modulo, edx
            print "Num1 / Num2 = "
            print str$(divint)
            print chr$(13,10)
            print "Modulo = "
            print str$(modulo)
            print chr$(13,10)
            jmp over
        smaller:
            print "This program cannot have result in the REAL datatype"
            jmp over
        over:
            ret            
                
main endp
;-------------------------------------
end start
    