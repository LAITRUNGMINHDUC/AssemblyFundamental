# Assembly Fundamental for New Bie
This Assembly repository is for any guys who are learning Assembly at the basic level. These file can be used as examples for your problems about LOOP, BRANCH and some arithmetic oprands, such as: IDIV, DIV, MUL, IMUL by using EAX register.

You should install MASM32 and download my repo, then copy it to the MASM32 installed folder and Compile them to executable files.

In this repo, I provided you my Assembly exercises from my teacher in FPT Univeristy (Vietnam - Feb 2016):

## 1. Arithmetic Program
- SumAndAverage3Numbers.asm :  ADD oprand and IDIV oprand to SUM 3 numbers and find its AVERAGE
- AritmeticSequence.asm : Used the equation to find Arithmetic Sequence by using Stack, Jump and Imul

## 2. Conditional Program
- AddSubDivMultiply.asm : Used Jump and Add/ Sub/ Imul/ Idiv with Setting EDX = 0, CDQ for finding IDIV to find these things from 2 numbers provided
- FindX.asm : Find X in equation AX + B = 0 with A, B is integers. 

## 3. Loop Program
- FibonanciNumbers.asm : Find the Fibonanci(N) by using CMP, JMP to make a loop
- FindFactorial.asm : Find N! with N is provided from users by using Stack, CMP, JMP, to make loop
- SumFromAtoB.asm : Make sum from number A to number B (A = 1 ; B = 4 ; Sum range = 1 + 2 + 3 + 4) by using Stack, CMP, JMP
- Sum2NumbersNTimes.asm : Make sum 2 integers with loop times

## Note:
- Set EDX = 0 before using IDIV/ DIV oprand
- Use CDQ oprand before using IDIV/ DIV for signed number
- If the printed result of your program is not correct, you can try another way by PUSH EAX to STACK in every loop, and when the loop finishes, you just need to POP the top value in Stack to print a result.

## 

