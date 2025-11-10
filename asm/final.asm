include number.asm
include macros2.asm

.MODEL LARGE
.386
.STACK 200h

MAXTEXTSIZE equ 40


.DATA
@resEqualExpressions		dd		?
@resIsZero		dd		?
@pivote		dd		?
@actual		dd		?
@resMul		dd		?
@resAritmPrev		dd		?
_cte_1		dd		1.0
_cte_0		dd		0.0
varFloat		dd		?
j		dd		?
G		dd		?
varInt		dd		?
a		dd		?
b		dd		?
c		dd		?
d		dd		?
e		dd		?
f		dd		?
x		dd		?
s_varStr		db MAXTEXTSIZE dup (?), '$'
s_base		db MAXTEXTSIZE dup (?), '$'
s_p1		db MAXTEXTSIZE dup (?), '$'
s_p2		db MAXTEXTSIZE dup (?), '$'
s_p3		db MAXTEXTSIZE dup (?), '$'
varBool		dd		?
y		dd		?
res		dd		?
_cte_9		dd		9.0
_cte_5		dd		5.0
_cte_3		dd		3.0
_cte_2		dd		2.0
_cte_cad_1		db		"a es mas grande que b",'$', 23 dup (?)
_cte_33		dd		33.0
_cte_cad_2		db		"c es menor a 6",'$', 16 dup (?)
_cte_cad_3		db		"d es menor a 5",'$', 16 dup (?)
_cte_cad_4		db		"paso fin de a > b",'$', 19 dup (?)
msgDivCero db "Error: division por cero detectada. Abortando...",'$', 50 dup (?)
.CODE

START:

mov  AX, @data
mov  DS, AX
mov  es, ax

fld _cte_9
fstp a

fld _cte_5
fstp b

fld _cte_3
fstp c

fld _cte_2
fstp d

ETIQUETA_12:

fld a
fld b
fxch
fcom
fstsw ax
sahf
ffree
jbe ETIQUETA_68

jmp ETIQUETA_18

ETIQUETA_18:
displayString _cte_cad_1
newLine

fld a
fld _cte_1
fsub

fstp a

fld a

call CheckDivZero

fld _cte_33
fdiv

fstp x

DisplayFloat x, 2
newLine

ETIQUETA_32:

fld c
fld _cte_0
fxch
fcom
fstsw ax
sahf
ffree
jbe ETIQUETA_60

jmp ETIQUETA_38

ETIQUETA_38:
displayString _cte_cad_2
newLine

fld c
fld _cte_1
fsub

fstp c

ETIQUETA_45:

fld d
fld _cte_5
fxch
fcom
fstsw ax
sahf
ffree
jae ETIQUETA_59

jmp ETIQUETA_51

ETIQUETA_51:
displayString _cte_cad_3
newLine

fld d
fld _cte_1
fadd

fstp d

jmp ETIQUETA_45

ETIQUETA_59:
jmp ETIQUETA_32

ETIQUETA_60:
displayString _cte_cad_4
newLine

fld c

call CheckDivZero

fld _cte_5
fdiv

fstp e

jmp ETIQUETA_12

ETIQUETA_68:
mov  ax, 4c00h
int  21h
STRLEN PROC NEAR
    mov bx,0
STRL01:
    cmp BYTE PTR [SI+BX],'$'
    je STREND
    inc BX
    jmp STRL01
STREND:
    ret
STRLEN ENDP

COPIAR PROC NEAR
    call STRLEN
    cmp bx,MAXTEXTSIZE
    jle COPIARSIZEOK
    mov bx,MAXTEXTSIZE
COPIARSIZEOK:
    mov cx,bx
    cld
    rep movsb
    mov al,'$'
    mov BYTE PTR [DI],al
    ret
COPIAR ENDP

CheckDivZero PROC NEAR
    push ax
    push dx

    fldz 
    fcompp

    fstsw ax
    sahf
    jne CDZ_OK

    mov dx, offset msgDivCero
    mov ah, 9
    int 21h
    mov ax, 4C00h
    int 21h

    CDZ_OK:
    pop dx
    pop ax
    ret
CheckDivZero ENDP

END START
