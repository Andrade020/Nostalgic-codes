; AssemblerApplication3- 15 10.asm
; Created: 15/10/2017 17:42:57
; Author : Lucas
; Replace with your application code
.EQU  ResetAddress = 0x0000; Reset Start address of Reset handler is stored here
.EQU  Int0Address = 0x0002;  INT0 Start address of code to handle external INT0 
.equ varia= 0x55
.equ byte_inicial= 0x03
.equ nby= 0x07
.equ Iram1= 0x150
.EQU IRAM2 = 0X400
.equ byte_final= 0x23; esse eh o valor maximo
.macro SET_STACK
    ldi    r16, LOW(RAMEND)
    out    spl, r16
    ldi    r16, HIGH(RAMEND)
    out    sph, r16
.endmacro
 
.macro SET_PORTB_AS_OUTPUT
       ldi r16,0xFF ;
       ; ser r16 ;
       out    DDRB,R16 ;
.endmacro

.macro SET_PORTD_AS_inPUT
      ; ldi r19,0xff ;
        ser r19 ;  
       in    R19 ,DDRD; 
.endmacro


.org ResetAddress
rjmp start
.org Int0Address
rjmp Int0rot

.org 0x0020
start:
ldi r17,0b00000001 ; int masks 0 and 1 set ; 
out EIMSK,r17
ldi r17,0x01 
sts EICRA,r17
SET_STACK
SET_PORTB_AS_OUTPUT
SET_PORTD_AS_inPUT
ldi r20, varia
ldi r29, 0x00
ldi xh, high(Iram1);
ldi xl, low(Iram1)
SET_PORTD_AS_inPUT 
cpi r19, 1
brne pt2
call exercicioI; 
pt2: 
call exercicioII; 
;rjmp start 

exercicioI: 
ldi r16, byte_Inicial
ldi r29, 0x00
ldi r30, 0x07
blacklabel:


ldi r24, nby

st x+, r16
add r16, r30

inc r29
cp r29, r24
brlo blacklabel
sei
ret 



exercicioII: 
ldi r18, byte_Inicial
ldi r29, 0x00
ldi r30, 0x07
bll:
ldi r24, nby;;
cpi r18, byte_final ;; valor maximo 
brge exercicioII
st x+, r18
add r18, r30
inc r29
cp r29, r24
brlo bll;;
ret 

delay: 
rotinos: 
inc r23 
call rotinas
cpi r23, 0x23 ; um nop retirado ; esperado: 500.011
brlo rotinos 
ret
rotinas: 
inc r23 
call rotinus
cpi r23, 0x24 ;;; ULTIMA ALTERAC. 17->16
brlo rotinas 
ret
rotinus: 
inc r21

nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop

cpi r21, 0x3d

brne rotinus  
ret 
;;
Int0rot:
 LDI r16,Nby
       LDI XH, HIGH(IRAM1)
       LDI XL, LOW(IRAM1)
       LDI YH, HIGH(IRAM2)
       LDI YL, LOW(IRAM2)
   SET_PORTB_AS_OUTPUT
Point:
       LD r17, X+
       ST Y+, r17 
       OUT PORTB,r17 
       CALL delay 
       DEC r16
       CPI r16,0
       brne Point
reti
