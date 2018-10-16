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
%include "words.inc"

_start:
	call read_word
	mov rsi, link
	call find_word
	test rax, rax		; if word not found - to error printting
	jz .fail
	
	add rax, 8		; skip link
	mov rdi, rax
	call string_length
	add rdi, rax		; skip word itself
	inc rdi			; skip null-terminator
	call print_string	; print definition
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
	call print_newline
	mov rax, 60
	mov rdi, 0
	syscall
