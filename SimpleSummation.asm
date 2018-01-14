%include "io.inc"

section	.data                ;initialized data
    fvar1: dd 100
    fvar2: dd 200
    print: db "Result is : %d", 10, 0  ; this will replace %d with the TOS value

section	.text                ;asm code
    extern printf
    global CMAIN
CMAIN:
    push ebp                 ; push base pointer
    mov ebp, esp             ; moves stack pointer into base pointer
                             ; above two lines are creation of the stack
    
    mov eax, [fvar1]         ; load fvar1 value to eax register
    mov ebx, [fvar2]         ; load fvar2 value to ebx register
    add eax, ebx             ; sum two regsiter value and store in eax
    push eax                 ; push eax address to stack
    push dword print         ; push the print address to stack
    call printf              ; then call extern printf method
    
    mov esp, ebp            ; these two lines
    pop ebp                 ; destruct the stack
    ret
    
section .bss                 ;uninitialized data