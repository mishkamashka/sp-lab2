%define link 0

%macro colon 2
    %%link: dq link	; ссылка на следующий элемент
    db %1, 0		; ключ
    %1: db %2, 0	; значение

    %define link %%link
%endmacro
