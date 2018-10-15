%define link 0

%macro colon 2
	 %%link: dq link	; ссылка на следующий элемент
	;%2: db %1, 0
	db %1, 0
	%2:
	%define link %%link
%endmacro
