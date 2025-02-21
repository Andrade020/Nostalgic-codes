; DEFINING NAMES FOR REGISTERS AND OTHERS

.DEF regA = r16

.DEF regB = r17

.DEF regC = r18

.DEF regD = r19

 

; SETTING VALUES FOR PROGRAM CONSTANTS

.EQU SW_count = 0xffff

.EQU init_ram1 = 0x0250

.EQU init_ram2 = 0x0350

;.EQU endof_ram1 = 0x025F

.EQU NBYTES = 0x0f

;.EQU init_table = 0x1000

;.EQU endof_table = 0x1100

 

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

 

.dseg

;.org  0x0100

       .org 0x250 ; .ORG init_ram1

       table1: .BYTE 0X20 ; RESERVE 0X20 BYTES FOR TABLE1 IN SRAM ADDRESS 0X250

       .org 0x350; .ORG init_ram2

       table2: .BYTE 0X20 ; RESERVE 0X20 BYTES FOR TABLE1 IN SRAM ADDRESS 0X350

 

 

       .db        "  Lucas Andrade  ",0

 

; Code start here

.cseg

.org  0x0000   ;  starting address for the program

       rjmp    start  ; used to jump to another starting address

       /* The first part of the code segment is reserved for the interrupt/jump

       table and the first     item in the table is the reset vector which we

       put a jump instruction to the first line of our code. */

 

.org 0x0050 ;  used to indicate the address where the next opcodes will be placed into program memory

start:

       SET_STACK     ; call and execute MACRO SET_STACK

       SET_PORTB_AS_OUTPUT ; call and execute MACRO SET_PORTB_AS_OUTPUT

 

; example for SETTING PORT PIN DIRECTION

 ; A 1 in the data direction register brings the pin to switch on its output drivers, a zero makes it an input.

       ldi r16,0x0A ;

       out    DDRB,R16 ; in this example Port B would be IN-IN-IN-IN-OUT-IN-OUT-IN

       ldi r16,0xFF ;

       ser r16 ;  ldi r16,0xFF ;

       out    DDRB,R16 ; in this example Port B would be OUT-OUT-OUT-OUT-OUT-OUT-OUT-OUT

 

       ; example for shifting  the I/O port set ('1') left

       ldi    r17,0x01 ; setting least significant bit

       ldi    r18,0x15 ; how many times the loop will be executed

loop_led:

       out           PORTB,r17

       ROL           r17 ; rotate left > makes an eventual LED shift

       ;CALL  SW_COUNTING_ROUTINE; ; example for calling a subroutine

       dec           r18

       brne   loop_led

       ;rjmp  loop_led

 

 

       /*     Reading  NBYTES data from a memory region starting at address init_ram1

       Wrinting the read data to another region stating at address init_ram2 */

TRANSFER_DATA: ; transfering ISRAM data

       LDI  regD, NBYTES;

       LDI XH, HIGH(init_ram1); preparing 16-bit X register to point to source data in RAM

    LDI XL, LOW(init_ram1)

       LDI YH, HIGH(init_ram2); preparing 16-bit Y register to point to destiny data in RAM

    LDI YL, LOW(init_ram2)

LOOP_SW:

       LD regA, X+; read data from RAM source region - UPDATE POINTER TO NEXT ADDRESS

    ST Y+, regA; write given data to RAM destiny region - UPDATE POINTER TO NEXT ADDRESS

       DEC regD

       CPI regD,0

;      BRBC 1,LOOP_SW

       brne LOOP_SW

 

       ; example for calling a subroutine

       CALL SW_COUNTING_ROUTINE;

       /*

       SW_count = 0x100 -> 1037 us at 1MHz

       SW_count = 0x200 -> 2061 us at 1MHz

       SW_count = 0xFFFF -> 262153 us at 1MHz

       */

 

 

HERE:

       JMP HERE

 

 

 

 

SW_COUNTING_ROUTINE:

       ; USING 16-BIT REGISTERS TO ADDRESS MEMORY

       LDI ZH, HIGH(0XFFFF - SW_count)

       LDI ZL, LOW(0XFFFF - SW_count)

SW_COUNTING_LOOP:

       adiw ZH:ZL,1

       BRNE SW_COUNTING_LOOP

       RET; return from the SW_COUNTING_ROUTINE execution