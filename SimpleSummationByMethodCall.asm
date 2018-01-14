%include "io.inc"

section	.data                ;initialized data
    fvar1: dd 100
    fvar2: dd 200
    print: db "Result is : %d", 10, 0  ; this will replace %d with the TOS value

section	.text                ;asm code
    extern printf
    global addfunction
    global CMAIN

CMAIN:
    mov ebp, esp             ; for correct debugging
    push ebp                 ; push base pointer
    mov ebp, esp             ; moves stack pointer into base pointer
                             ; above two lines are creation of the stack
    push ebp                 ; push base pointer to stack for executing after method calls
    call addfunction
    pop ebp                  ; go to that pointer which is left, i.e: ebp
    
    mov esp, ebp            ; these two lines
    pop ebp                 ; destruct the stack
    ret
    
addfunction:
    mov ebp, esp
    push ebp
    mov ebp, esp
    
    mov eax, [fvar1]         ; load fvar1 value to eax register
    mov ebx, [fvar2]         ; load fvar2 value to ebx register
    add eax, ebx             ; sum two regsiter value and store in eax
    push eax                 ; push eax address to stack
    push dword print         ; push the print address to stack
    call printf              ; then call extern printf method
    
    mov esp, ebp
    pop ebp
    ret
        
section .bss                 ;uninitialized data