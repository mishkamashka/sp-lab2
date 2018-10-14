global find_word
extern string_equals

; rdi - string pointer
; rsi - last word in dictionary pointer
; returns 0 or word pointer
section .text
find_word:
	xor rax, rax
.loop:
	test rsi, rsi
	jz .exit
	push rdi
	push rsi
	add rsi, 8
	call string_equeals
	pop rsi
	pop rdi
	test rax, rax
	jnz .success
	mov rsi, [rsi]
	jmp .loop
.success:
	mov rax, rsi
.exit
	ret
