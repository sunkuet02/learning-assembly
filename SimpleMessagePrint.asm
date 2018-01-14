%include "io.inc"

section	.data                ;initialized data
msg: db "Hello World!",10,0  ; this is printable message

section	.text                ;asm code
extern printf
global CMAIN
CMAIN:
    push ebp                 ; push base pointer
    mov ebp, esp             ; moves stack pointer into base pointer
                             ; above two lines are creation of the stack
    
    push msg                 ; push the address of msg label on to the stack
    call printf
                             ; above two lines are function body like a c program
    
    mov esp, ebp            ; these two lines
    pop ebp                 ; destruct the stack
    ret
    
section .bss                 ;uninitialized data