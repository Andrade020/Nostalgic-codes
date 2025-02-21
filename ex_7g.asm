;;7g)
			AREA ARMex, CODE, READONLY
									; ARMex: nome do bloco de código
			ENTRY					; Marca qual é primeira instrução a ser executada
IO0DIR EQU 0xE0028008 ;  0-> entrada 1 -> saída
IO0PIN EQU 0xE0028000
start	
	nop
	b inicio
data1   DCD    0x00ffffff    ; nesse caso o esperado será 6, em R2
inicio
		mov r7, #0   ;; r7 será a soma 
		ldr r0, =data1
		ldr r1, [r0] 
		mov r2, r1 
		lsr r2, #0x1c
		mov r8, #0xf
		bl cpr
		ldr r1, [r0] 
		mov r2, r1
		lsl r2, #0x4 
		lsr r2, #0x1c
		mov r8, #0xf
		bl cpr 
		mov r2, r1
		lsl r2, #0x8 
		lsr r2, #0x1c
		mov r8, #0xf
		bl cpr
		mov r2, r1		
		lsl r2, #0xc 
		lsr r2, #0x1c
		mov r8, #0xf
		bl cpr 
		mov r2, r1
		lsl r2, #0x10 
		lsr r2, #0x1c
		mov r8, #0xf
		bl cpr
		mov r2, r1
		lsl r2, #0x14 
		lsr r2, #0x1c
		mov r8, #0xf
		bl cpr 
		mov r2, r1
		lsl r2, #0x18 
		lsr r2, #0x1c
		mov r8, #0xf
		bl cpr 
		mov r2, r1
		lsl r2, #0x1c 
		lsr r2, #0x1c
		mov r8, #0xf
		bl cpr
fim     
		b fim
		
	
cpr   cmp r2, r8       ;f 
	  addeq r7, #4
	  sub r8, #1
	  cmp r2, r8      ; e
	  addeq r7, #3
	  sub r8, #1
	  cmp r2, r8	; d
	  addeq r7, #3
	  sub r8, #1
	  cmp r2, r8	; c
	  addeq r7, #2
	  sub r8, #1
	  cmp r2, r8	; b
	  addeq r7, #3
	  sub r8, #1
	  cmp r2, r8	; a
	  addeq r7, #2
	  sub r8, #1
	  cmp r2, r8	; 9
	  addeq r7, #2
	  sub r8, #1
	  cmp r2, r8	; 8
	  addeq r7, #1
	  sub r8, #1
	  cmp r2, r8	; 7
	  addeq r7, #3
	  sub r8, #1
	  cmp r2, r8	; 6
	  addeq r7, #2
	  sub r8, #1
	  cmp r2, r8	; 5
	  addeq r7, #2
	  sub r8, #1
	  cmp r2, r8	; 4
	  addeq r7, #1
	  sub r8, #1
	  cmp r2, r8	; 3
	  addeq r7, #2
	  sub r8, #1
	  cmp r2, r8	; 2
	  addeq r7, #1
	  sub r8, #1
	  cmp r2, r8	; 1
	  addeq r7, #1
	  sub r8, #1
	  bx lr 
	  end

;;;6a-corrigido;;;; 
;IO0DIR = 0x00000080
			AREA ARMex, CODE, READONLY
									; ARMex: nome do bloco de código
			ENTRY					; Marca qual é primeira instrução a ser executada
IO0DIR EQU 0xE0028008 ;  0-> entrada 1 -> saída
IO0PIN EQU 0xE0028000
;       PINSEL0        	= 0xE002C000
;       PINSEL1        	= 0xE002C004
;       IOPIN          	= 0xE0028000
;       IODIR          	= 0xE0028008
IO0SET equ 0xE0028004
IO0CLR equ 0xE002800C
start 
        nop
		b  inicio
dado dcd 4 ; DCD é exatamente igual a "não tretar", ele só está lá, e se vc deixar é o mesmo q dar uma instrução direta
dadofim
inicio
    mov r3, 4                            ;;;;;;r4 é Y
	mov r7, #1 							;;;;; dcd é 4
	ldr r0, =dado
	ldr r1, [r0]
	mov r4, r1
	bl ctt 
fim		
		b fim
ctt	add r7, #1
	mul r4, r1, r4 
	cmp r7, r3
	blt ctt
	bx lr 

       end


;7c- corrigido)
			AREA ARMex, CODE, READONLY
									; ARMex: nome do bloco de código
			ENTRY					; Marca qual é primeira instrução a ser executada
IO0DIR EQU 0xE0028008 ;  0-> entrada 1 -> saída
IO0PIN EQU 0xE0028000
start	
	nop
	b inicio
data1   DCD    0x12345678  ; este é X
inicio    
			ldr r2, =0x0ffffff0
			ldr r0, =data1 
			ldr r1, [r0]
			bl apagar
fim 		b fim			
apagar		
			and r1, r2 
			lsr r1, #4        ;r1´é y
			bx lr 
			


	end


;;7d)
			AREA ARMex, CODE, READONLY
									; ARMex: nome do bloco de código
			ENTRY					; Marca qual é primeira instrução a ser executada
IO0DIR EQU 0xE0028008 ;  0-> entrada 1 -> saída
IO0PIN EQU 0xE0028000
start	
	nop
	b inicio
data1   DCD    0x12345678, 6     ; nesse caso o esperado será 6, em R2
inicio
	
	mov r7, #4
	mov r12, #8
	ldr r1, =data1 
	ldr r2, [r1]     ; r2 é X
	bl cmc 
fim b fim
	
	
cmc	add r1, #4 
	ldr r0, [r1]       ; r0 é o número que vai fazer a operação
	add r0, #-1
	mul r6, r0 , r7    ; r0 x 4
	lsr r2, r6 		; x é deslocado (r0 x 4) para a direita
	lsl r2, r6
	sub r12, #1
	sub r12, r0
	mul r5, r12, r7 
	lsl r2, r5
	mov r7, #4
	lsr r2, #0x1c  
	mov r8, r2 		; r8 é Y
	bx lr 
	end