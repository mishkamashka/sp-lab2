%define link 0

%macro colon 2
	%%link: dq link	; next element pointer
	db %1, 0
	%2:
	%define link %%link
%endmacro
