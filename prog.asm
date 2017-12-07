.386

.model flat, stdcall
option casemap :none

include c:\masm32\include\windows.inc
include c:\masm32\include\kernel32.inc
include c:\masm32\include\masm32.inc
includelib c:\masm32\lib\kernel32.lib
includelib c:\masm32\lib\masm32.lib 

.data
    _ret sdword 13  ;mov to next line
    _car sdword 10  ;return to start of the line
    
   
.code
main:
    mov edx, 'A'    ;'A'
    mov ecx, 58     ;how many times
    jmp _end
    
_loop:  
    push ecx        ;save ecx, because invoke StdOut make changes to it
    push edx        ;save edx; same reason
    invoke StdOut, esp ;esp store latest stack pointer
    invoke StdOut, addr _ret
    invoke StdOut, addr _car
    pop edx         ;pop back edx
    pop ecx         ;pop back ecx
    
    inc edx         ;increase edx, e.g. from 'A' to 'B'
    dec ecx         ;decrease counter
     
_end:
    cmp ecx, 0      ;check if ecx is zero i.e. loop ended
    jne _loop       ;if ecx not zero, just to start of loop

_exit:    
    invoke ExitProcess, 0
end main

