include "emu8086.inc"

; for COM file:
ORG 100h

; skip data definitions and
; jump to start code section:
JMP start   

; null terminated input string:
s1 DB "00000000", 0
sum DW 0 ; result.

start:

; Print the welcome message:
PRINTN "Enter 8 char Binary (zeros/ones) number: "

; Get string:
MOV DX, 9 ; buffer size (1+ for zero terminator).
LEA DI, s1  ; save s1 to DI register
CALL GET_STRING     ;call get_string func


; Check that we really got 8 chars,
; this check is optional:
MOV CX, 8   ;counter for a loop.
MOV SI, 0   ;move 0 -> SI
check_s:
; Terminated before
; reaching 9th char?
CMP s1[SI], 0
JNE ok1     ;if not equal jumb to ok1
JMP error_not_valid   ; jumb to error_not_valid code
ok1:
; Wrong digit? Not 1/0?
CMP s1[SI], 31h  ; s1[SI] - 31h
JNA ok2
JMP error_not_valid
ok2:
INC SI    ; add 1
LOOP check_s ; loop for check_s


; Start the conversion from
; string to value in SUM variable.

MOV BL, 1 ; multiplier.
MOV SI, 7 ; index address.
MOV CX, 8 ; counter for a loop.

next_digit:

MOV AL, s1[SI] ; get digit.
SUB AL, 30h   ;AL - 30h
MUL BL ; no change to AX.
ADD SUM, AX  ; AX + SUM
SHL BL, 1
DEC SI ; go to previous digit.
LOOP next_digit

; Done. Converted number is in SUM.

PRINTN " "
PRINTN "The result is: "

; Print the result:
MOV AX, SUM
CALL PRINT_NUM_UNS
JMP stop_program


error_not_valid:
PRINTN " "
PRINTN "ERROR: NOT VALID INPUT!"


stop_program:

RET ; EXIT FROM PROGRAM.


; Definition of procedures
; from Emu8086.inc:

DEFINE_GET_STRING
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM_UNS
; End of source code:
END
                                               