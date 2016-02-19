  include \masm32\include\masm32rt.inc 
   
.code                       
start:                          ; The CODE entry point to the program
    call main                   ; branch to the "main" procedure
    exit
; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
main proc
    LOCAL var1:DWORD            ; 2 DWORD integral variables
    LOCAL var2:DWORD            ; 
    LOCAL var3:DWORD
    
    LOCAL sum:DWORD
    LOCAL average:DWORD
    LOCAL modulo:DWORD

  ; Input 3 integers
    mov var1, sval(input("Enter number 1 : "))
    mov var2, sval(input("Enter number 2 : "))
    mov var3, sval(input("Enter number 3 : "))    
    print chr$(13,10,13,10)
  ; Sum 3 integers use register

    mov eax,0
    mov eax, var1
    add eax, var2
    add eax, var3
    mov sum, eax        ; Lay EAX cho vo SUM
    print "The SUM of 3 integers is: "
    print str$(sum)
    print chr$(13,10)
    
    ; Average of 3 integers
    ; mov eax,       ;EAX is hidden register for DIV (So bi chia) --> Destination register (Toan hang dich)
    ; Vi EAX dang la SUM cua 3 so ==> Ko can move

    mov eax, sum
    mov ebx, 3      ;EBX is a source (Toan hang nguon)
    mov edx, 0      ;EDX is a modulo (So du)
    idiv ebx         ;div EBX : Lay EAX/EBX -> Luu lai vo EAX
    mov average, eax
    mov modulo, edx

    print "The average of 3 integers is : "
    print str$(average)     ; Show EAX = Show Trung binh cua 3 so
    print chr$(13,10)
    print "The modulo of this division: "
    print str$(modulo)     ; Show EDX = Show so du
    
    ret

main endp
;............................................
end start


