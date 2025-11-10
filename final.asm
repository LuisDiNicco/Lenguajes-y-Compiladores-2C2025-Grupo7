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
_cte_1_500000000		dd		1.500000000
_cte_10		dd		10.0
_cte_4		dd		4.0
_cte_3		dd		3.0
_cte_cad_1		db		"a es mas grande que b",'$', 23 dup (?)
_cte_cad_2		db		"a es mas grande que b (a > b)",'$', 31 dup (?)
_cte_cad_3		db		"a es mas chico o igual a b (a <= b)",'$', 37 dup (?)
_cte_cad_4		db		"a y c mas grandes que b [a > b & c > b]",'$', 41 dup (?)
_cte_cad_5		db		"a es mas grande que b o c es mas grande que b",'$', 47 dup (?)
_cte_cad_6		db		"a no es mas grande que b -> !(a > b)",'$', 38 dup (?)
_cte_5		dd		5.0
_cte_cad_7		db		"b ahora vale 1",'$', 16 dup (?)
_cte_cad_8		db		"a es mas grande que b y c",'$', 27 dup (?)
_cte_99999_990000000		dd		99999.990000000
_cte_99_000000000		dd		99.000000000
_cte_0_999900000		dd		0.999900000
_cte_cad_9		db		"@sdadasjfla%dfg",'$', 17 dup (?)
_cte_cad_10		db		"asldk  fh sjf",'$', 15 dup (?)
_cte_24		dd		24.0
_cte_27		dd		27.0
_cte_cad_11		db		"27 - c = 3",'$', 12 dup (?)
_cte_500		dd		500.0
_cte_cad_12		db		"x es 500",'$', 10 dup (?)
_cte_cad_13		db		"x en realidad es el siguiente nro:",'$', 36 dup (?)
_cte_34		dd		34.0
_cte_cad_14		db		"34 * 3 =",'$', 10 dup (?)
_cte_8		dd		8.0
_cte_cad_15		db		"5/8 =",'$', 7 dup (?)
_cte_cad_16		db		"ingrese un nro",'$', 16 dup (?)
_cte_cad_17		db		"ewr es una cte string",'$', 23 dup (?)
_cte_100		dd		100.0
_cte_101		dd		101.0
_cte_45		dd		45.0
_cte_99		dd		99.0
_cte_0_500000000		dd		0.500000000
_cte_cad_18		db		"parte true estructura mas interna",'$', 35 dup (?)
_cte_cad_19		db		"parte else estructura mas interna",'$', 35 dup (?)
_cte_55		dd		55.0
_cte_cad_20		db		"efectivamente no es 0",'$', 23 dup (?)

.CODE

START:

mov  AX, @data
mov  DS, AX
mov  es, ax

fld _cte_1_500000000
fstp j

fld _cte_10
fstp e

fld e
fstp j

fld _cte_4
fstp a

fld _cte_3
fstp b

ETIQUETA_15:

fld a
fld b
fxch
fcom
fstsw ax
sahf
ffree
jbe ETIQUETA_28

jmp ETIQUETA_21

ETIQUETA_21:
displayString _cte_cad_1
newLine

fld a
fld _cte_1
fsub

fstp a

jmp ETIQUETA_15

ETIQUETA_28:
fld a
fld b
fxch
fcom
fstsw ax
sahf
ffree
jbe ETIQUETA_35

jmp ETIQUETA_33

ETIQUETA_33:
displayString _cte_cad_1
newLine

ETIQUETA_35:
fld a
fld b
fxch
fcom
fstsw ax
sahf
ffree
jbe ETIQUETA_43

jmp ETIQUETA_40

ETIQUETA_40:
displayString _cte_cad_2
newLine

jmp ETIQUETA_45

ETIQUETA_43:
displayString _cte_cad_3
newLine

ETIQUETA_45:
fld _cte_4
fstp c

fld a
fld _cte_1
fadd

fstp a

fld a
fld b
fxch
fcom
fstsw ax
sahf
ffree
jbe ETIQUETA_64

jmp ETIQUETA_57

ETIQUETA_57:
fld c
fld b
fxch
fcom
fstsw ax
sahf
ffree
jbe ETIQUETA_64

jmp ETIQUETA_62

ETIQUETA_62:
displayString _cte_cad_4
newLine

ETIQUETA_64:
fld _cte_0
fstp a

fld a
fld b
fxch
fcom
fstsw ax
sahf
ffree
jbe ETIQUETA_72

jmp ETIQUETA_77

ETIQUETA_72:
fld c
fld b
fxch
fcom
fstsw ax
sahf
ffree
jbe ETIQUETA_79

jmp ETIQUETA_77

ETIQUETA_77:
displayString _cte_cad_5
newLine

ETIQUETA_79:
fld a
fld b
fxch
fcom
fstsw ax
sahf
ffree
jbe ETIQUETA_84

jmp ETIQUETA_86

ETIQUETA_84:
displayString _cte_cad_6
newLine

ETIQUETA_86:
fld b
fld _cte_1
fadd

fstp b

fld a
fld _cte_0
fxch
fcom
fstsw ax
sahf
ffree
jne ETIQUETA_104

jmp ETIQUETA_95

ETIQUETA_95:
fld b
fld c
fxch
fcom
fstsw ax
sahf
ffree
jae ETIQUETA_104

jmp ETIQUETA_100

ETIQUETA_100:
fld _cte_5
fstp a

jmp ETIQUETA_109

ETIQUETA_104:
displayString _cte_cad_7
newLine

fld _cte_1
fstp b

ETIQUETA_109:
fld _cte_10
fstp a

fld a
fld b
fxch
fcom
fstsw ax
sahf
ffree
jbe ETIQUETA_124

jmp ETIQUETA_117

ETIQUETA_117:
fld a
fld b
fxch
fcom
fstsw ax
sahf
ffree
jbe ETIQUETA_124

jmp ETIQUETA_122

ETIQUETA_122:
displayString _cte_cad_8
newLine

ETIQUETA_124:
fld _cte_99999_990000000
fstp varFloat

fld _cte_99_000000000
fstp varFloat

fld _cte_0_999900000
fstp varFloat

lea si, _cte_cad_9
lea di, s_varStr
call COPIAR

lea si, _cte_cad_10
lea di, s_varStr
call COPIAR

fld _cte_24
fstp c

fld _cte_27
fld c
fsub

fstp x

fld x
fld _cte_3
fxch
fcom
fstsw ax
sahf
ffree
jne ETIQUETA_154

jmp ETIQUETA_152

ETIQUETA_152:
displayString _cte_cad_11
newLine

ETIQUETA_154:
fld _cte_1
fstp d

fld d
fld _cte_500
fadd

fstp x

fld x
fld _cte_500
fxch
fcom
fstsw ax
sahf
ffree
jne ETIQUETA_170

jmp ETIQUETA_167

ETIQUETA_167:
displayString _cte_cad_12
newLine

jmp ETIQUETA_174

ETIQUETA_170:
displayString _cte_cad_13
newLine

DisplayFloat x, 2
newLine

ETIQUETA_174:
fld _cte_34
fld _cte_3
fmul

fstp x

displayString _cte_cad_14
newLine

DisplayFloat x, 2
newLine

fld _cte_5
fstp e

fld _cte_8
fstp f

fld e
fld f
fdiv

fstp x

displayString _cte_cad_15
newLine

DisplayFloat x, 2
newLine

displayString _cte_cad_16
newLine

getString s_base
newLine

displayString _cte_cad_17
newLine

DisplayFloat varInt, 2
newLine

fld _cte_0
fstp @resEqualExpressions

fld a
fld b
fadd

fstp @pivote

fld _cte_100
fstp @actual

fld @pivote
fld @actual
fxch
fcom
fstsw ax
sahf
ffree
jne ETIQUETA_223

ETIQUETA_223:
fld _cte_1
fstp @resEqualExpressions

jmp ETIQUETA_225

ETIQUETA_225:
fld _cte_1
fstp res

fld _cte_1
fstp c

fld _cte_101
fstp d

fld _cte_1
fstp y

fld _cte_0
fstp a

fld _cte_45
fstp b

fld _cte_99
fstp G

fld _cte_0_500000000
fstp j

fld c
fld _cte_0
fxch
fcom
fstsw ax
sahf
ffree
je ETIQUETA_301

jmp ETIQUETA_255

ETIQUETA_255:
fld d
fld _cte_0
fxch
fcom
fstsw ax
sahf
ffree
je ETIQUETA_301

jmp ETIQUETA_260

ETIQUETA_260:
fld y
fld _cte_0
fxch
fcom
fstsw ax
sahf
ffree
je ETIQUETA_301

jmp ETIQUETA_265

ETIQUETA_265:
fld res
fld _cte_0
fxch
fcom
fstsw ax
sahf
ffree
je ETIQUETA_301

jmp ETIQUETA_270

ETIQUETA_270:
fld a
fld _cte_0
fxch
fcom
fstsw ax
sahf
ffree
je ETIQUETA_275

jmp ETIQUETA_280

ETIQUETA_275:
fld b
fld _cte_0
fxch
fcom
fstsw ax
sahf
ffree
je ETIQUETA_301

jmp ETIQUETA_280

ETIQUETA_280:
fld G
fld _cte_100
fxch
fcom
fstsw ax
sahf
ffree
jae ETIQUETA_296

jmp ETIQUETA_285

ETIQUETA_285:
fld j
fld _cte_0
fxch
fcom
fstsw ax
sahf
ffree
je ETIQUETA_295

jmp ETIQUETA_290

ETIQUETA_290:
lea si, _cte_cad_18
lea di, s_p3
call COPIAR

displayString s_p3
newLine

ETIQUETA_295:
jmp ETIQUETA_301

ETIQUETA_296:
lea si, _cte_cad_19
lea di, s_p1
call COPIAR

displayString s_p1
newLine

ETIQUETA_301:
fld _cte_55
fld _cte_0
fxch
fcom
fstsw ax
sahf
ffree
jne ETIQUETA_311

fld _cte_1
fstp @resIsZero

jmp ETIQUETA_310

ETIQUETA_310:
ETIQUETA_311:
fld _cte_0
fstp @resIsZero

fld @resIsZero
fld _cte_1
fxch
fcom
fstsw ax
sahf
ffree
je ETIQUETA_319

jmp ETIQUETA_318

ETIQUETA_318:
displayString _cte_cad_20
newLine

ETIQUETA_319:
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

END START
