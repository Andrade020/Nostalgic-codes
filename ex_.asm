/*
 INT0 and INT1 – range of event options
 INT0 – PORT D [2]
 INT1 – PORT D [3]
 PCINT[23:0] – any signal change (toggle)
 PCINT[7:0] – PORT B [7:0]
 PCINT[14:8] – PORT C [6:0]
 PCINT[23:16] – PORT D [7:0]
*/
/*
External Interrupt Mask Register  is used to enable and 
If INT# bit is set (and the SREG I-bit is set), then interrupts are
enabled on pin INT# 
Bit 7 6 5 4 3 2 1 0
- - - ---  INT1 INT0 

Note that only the INT0 and INT1 bits are writable. 

External Interrupt Flag Register - EIFR
Bit 7 6 5 4 3 2 1 0
- - - ---  INTF1 INTF0 
Interrupt flag bit is set when a change triggers an interrupt
request
 Flag is cleared automatically when interrupt routine is executed
 Flag can be cleared by writing a 1 to it 

*/

/*
External Interrupt Control Register
Bit 7 6 5 4 3 2 1 0
- - - - ISC11 ISC10 ISC01 ISC00
Init. 0 0 0 0 0 0 0 0

 bits 0,1,2 and 3 in this register to control the interrupt from
INT0 and INT1.  These bits control how to sense the external interrupts; either
by level, falling edge on pin, or rising edge of pin: 
ISCx1 ISCx0 Description
0 0 Low level on INTx pin generates interrupt
0 1 Any logical change
1 0 Falling edge on INTx pin generates interrupt
1 1 Rising edge on INTx pin generates interrupt
*/

/* Globally enable all interrupts: SREG
In addition to setting up the interrupts individually, the SREG (Status Register)
bit 7 must also be set to globally enable all (i.e. any) interrupts. 
SREG S tatus register
Bit 7 6 5 4 3 2 1 0
I T H S V N Z C
Init. 0 0 0 0 0 0 0 0
The bits in SREG indicate the current state of the processor.
In AVR code, we have an instruction of its own to set this flag; sei: 
sei ; this instruction enables all interrupts.
*/


.EQU  ResetAddress = 0x0000; Reset Start address of Reset handler is stored here
.EQU  Int0Address = 0x0001;  INT0 Start address of code to handle external INT0 
.EQU  Int1Address = 0x0002; INT1 Start address of code to handle external INT1 


; creating a MACRO to initialize stack pointer
.macro SET_STACK
    ldi    r16, LOW(RAMEND)
    out    spl, r16
    ldi    r16, HIGH(RAMEND)
    out    sph, r16
.endmacro
 
.macro SET_PORTB_AS_OUTPUT
       ldi r16,0xFF ;
       ; ser r16 ;  can be used instead of ldi r16,0xFF ;
       out    DDRB,R16 ; in this example Port B would be OUT-OUT-OUT-OUT-OUT-OUT-OUT-OUT
.endmacro

.macro SET_PORTD_AS_inPUT
       ldi r16,0x00 ;
       ; ser r16 ;  can be used instead of ldi r16,0xFF ;
       out    DDRD,R16 ; in this example Port B would be OUT-OUT-OUT-OUT-OUT-OUT-OUT-OUT
.endmacro

; Replace with your application code
.org ResetAddress
rjmp start
.org Int0Address
rjmp Int0rot
.org Int1Address
rjmp Int1rot





.org 0x0020
start:
SET_STACK
SET_PORTB_AS_OUTPUT
SET_PORTD_AS_inPUT

; set up int0 and int1
/*ldi r16,0b00000000 ; int masks 0 and 1 are NOTset
out EIMSK,r16
ldi r16,0b00000001 ; int masks 0  set
out EIMSK,r16
ldi r16,0b00000010 ; int masks  1 set
out EIMSK,r16
*/
ldi r16,0b00000011 ; int masks 0 and 1 set
out EIMSK,r16
; setting level, edge 
;ldi r16,0x01 ; interrupt t0 TRANSICAO and t1 on level ZERO
;ldi r16,0x00 ; interrupt t0 and t1 on level ZERO
;ldi r16,0x03 ; interrupt t1 on Level ZERO and t0 on rising edge only
;ldi r16,0x0c0 ; interrupt t0 on Level ZERO and t1 on rising edge only
ldi r16,0x0f ; interrupt t0 and t1 on rising edge 
sts EICRA,r16

sei ; enable interrupts

here:
    inc r17
nop
nop
nop
nop
nop
nop
    rjmp here




Int0rot:
inc r17
RETI

Int1rot:
dec r17
RETI