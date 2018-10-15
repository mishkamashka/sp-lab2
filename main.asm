global _start

extern string_length
extern read_word
extern print_string
extern print_newline
extern find_word

section .rodata
fail_msg: db "Unknown word", 0

section .text
%include "colon.inc"
%include "word.inc"

_start:
	call read_word
	mov rsi, word_buffer
	call find_word
	test rax, rax
	jz .fail
	
	add rax, 8
	mov rax, rdi
	inc rdi
	call print_string
	jmp .exit	
.fail:
	mov rdi, fail_msg
	call string_length	; print error
	mov rsi, rdi
	mov rdx, rax
	mov rax, 1
	mov rdi, 2
	syscall
.exit:
	mov rax, 60
	mov rdi, 0
	syscall
