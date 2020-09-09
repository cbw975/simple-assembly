; ------------------------------------------------------------------------------
; Counts down from 9 to 0, printing each.
; To assemble and run:
;
;     $ nasm -felf64 -gdwarf countdown.asm
;     $ ld -o countdown countdown.o
;     $ ./countdown	
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
        global    _start
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
        section   .text

_start:
        mov       r10, 10             ; loop iteration counter
print_loop:
        ;; Make the program print, one line at a time: 9, 8, 7, ..., 1, 0.
        dec       r10                 ; decrement loop counter
        mov       rax, 1              ; rax gets the system call code for "write".
        mov       rdi, 1              ; rdi gets the file handle for stdout (console).
        mov       rsi, digit_str      ; rsi gets the address of the string below.
        mov       rdx, 2              ; rdx gets the number of bytes to write.
        syscall                       ; Call kernel, triggering the write.  The
	                              ; registers carry the arguments.
        
        mov       r11, [digit_str]
        dec       r11
        mov       [digit_str], r11
        
        cmp       r10, 0
        jne       print_loop

	;; This code ends the program.
        mov       rax, 60                 ; system call for exit
        xor       rdi, rdi                ; exit code 0
        syscall                           ; invoke operating system to exit
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
        section   .data
digit_str:
	db        "9", 10                 ; The integer 10 is a newline char
; ------------------------------------------------------------------------------
