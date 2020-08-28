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

        ;; YOUR CODE GOES HERE.
        ;; Make the program print, one line at a time: 9, 8, 7, ..., 1, 0.


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
