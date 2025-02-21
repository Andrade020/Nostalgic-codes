;6e-terminada )
			AREA ARMex, CODE, READONLY
									; ARMex: nome do bloco de código
					ENTRY					; Marca qual é primeira instrução a ser executada
IO0DIR EQU 0xE0028008 ;  0-> entrada 1 -> saída
IO0PIN EQU 0xE0028000
;       PINSEL0        	= 0xE002C000
;       PINSEL1        	= 0xE002C004

;       IOPIN          	= 0xE0028000  entrada
;       IODIR          	= 0xE0028008  saida
IO0SET equ 0xE0028004
IO0CLR equ 0xE002800C

start	
	nop
	b inicio
data1   DCD    0x10000001, 2, 7, 5      ; nesse caso o esperado será 6, em R2
inicio        ;----------> prioridade
		ldr r6, =0xffffffff      ; INT R1, R2, R3, R4, R5, R6, R7, R11, R10, R12, R8, R9
		ldr r8, =IO0PIN
		ldr r9, =IO0DIR 
		ldr r11, =IO0SET
		ldr r10, =IO0DIR 
		ldr r10, =IO0CLR 
		ldr r12, =IO0SET
		ldr r0, =data1
		ldr r1, [r0]    ; r1 é o número X
		  add r0, #4
			ldr r2, [r0]  ; r2 é set 
				add r0, #4 
				ldr r3, [r0]  ; r3 é 	reset 
					add r0, #4 
				ldr r4, [r0]	; r4 é 	inv 
			   mov r5 , #0	; r5 é Y 
		bl fco 
		ldr r7, [r11]
fim 	b fim 
			 



fco 	 
		str r6, [r10] ; r6 é a contantn
		str r1, [r11]    ; está em r11 o nºX
		cmp r2, #0 
		bne cz
		mov r6, #1
		str r6, [r11]
		
cz		cmp r2, #1 
		bne cu
		mov r6, #0x10
		str r6, [r11]
cu		cmp r2, #2 
		bne cd
		mov r6, #0x100
		str r6, [r11]
cd		cmp r2, #3 
		bne ct
		mov r6, #0x1000
		str r6, [r11]
ct		cmp r2, #4 
		bne cq
		ldr r6, =0x10000
		str r6, [r11]
cq		cmp r2, #5 
		bne cc
		ldr r6, =0x100000
		str r6, [r11]
cc		cmp r2, #6 
		bne cs
		ldr r6, =0x1000000
		str r6, [r11]
cs		cmp r2, #7 	
		bne rst
		ldr r6, =0x10000000
		str r6, [r11]
rst 	ldr r7, [r11]
		
		cmp r3, #0 
		bne bz
		mov r6, #1
		str r6, [r10]		
bz		cmp r3, #1 
		bne bu
		mov r6, #0x10
		str r6, [r10]
bu		cmp r3, #2 
		bne bd
		mov r6, #0x100
		str r6, [r10]
bd		cmp r3, #3 
		bne bt
		ldr r6, =0x1000
		str r6, [r10]
bt		cmp r3, #4 
		bne bq
		ldr r6, =0x10000
		str r6, [r10]
bq		cmp r3, #5 
		bne bc
		ldr r6, =0x100000
		str r6, [r10]
bc		cmp r3, #6 
		bne bs
		ldr r6, =0x1000000
		str r6, [r10]
bs		cmp r3, #7 	
		bne inv	
		ldr r6, =0x10000000
		str r6, [r10]
		
inv		ldr r7, [r11]
		ldr r0, =data1
		ldr r6, [r0]
		mov r8, #4
		mul r12, r4, r8
		lsr r6, r12
		lsl r6, #28
		lsr r6, #28
		mov r5, #1
		lsl r5, r12
		cmp r6, #1	
		beq clr  
		cmp r6, #0
		beq set	 	
fm		bx lr 	 		
clr     str r5, [r10]
		b fm 
set		str r5, [r11]	
		b fm 
		
		
	end

















;;;7b;;;
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

	b inicio
dado dcd 13, 1, 8, 5   ; resultado em r5
dadofim
inicio
	
	 ldr r11, =data3
	 sub r11, #4
	 ldr r0, =dado; ro esta recebendo a "linha de memoria" 
	 ldr r1, =data2; 
	 ldr r4, =dadofim	
	; ldr r4, [r5]
x	 ldr r2, [r0]; r2 esta pegando o valor da "linha de memoria" contida em r0	lendo da rom  	 
	 str r2,[r1];r2 esta sendpo escrito na posição  indicada por r1 (ram)	 
	 add r0, #4
	 add r1,#4
	 cmp r0, r4
	 blt x
	
	


 	 ldr r0, =dado
	 ldr r4, =dadofim
	 sub r9, r4, r0
	 lsr r9, #2
jp	 mov r10, #0 
	 ldr r5, =data2 
	 ldr r6, [r5]
	 
minor
						; r6 é o menor 
	 add r5, #4
	 add r10, #1
	 ldr r7, [r5]
	 cmp r10, r9 
	 bge cp
	 cmp r6, r7
	 ble minor 
	 mov r6, r7        ; r10  conta até dar o numero de termos
	 cmp r10, r9      ; r9 é o número de termos
	 ble minor
cp	 mov r4, #0
	 mov r3, #0x0fffffff
	 
	 ldr r0, =data2 
	 sub r0, #4
	 mov r10, #0
rtn  add r10, #1
	 cmp r10, r9
	 bgt grv 
	 add r0, #4
	 ldr r12, [r0]
	 cmp r12, r6 
	 bne rtn
	 str r3, [r0]
	 b rtn
	 
grv  add r11, #4 
	 str r6, [r11] 
	 add r13, #1
	 cmp r13, r9
	 bgt elv
	 b jp
	 
elv 	; ; ; ;  ; ;; ;função: maior x menor + intermediario x intermediario
			ldr r0, =data3 
			sub r0, #3
			ldr r1,[r0]
			add r0, #4
			ldr r2,[r0]
			add r0, #4
			ldr r3,[r0]
			add r0, #4
			ldr r4,[r0]
			mul r5, r1, r4 
			mul r6, r2, r3
			add r5, r6  
			;;;
	 
	 
	 
	 
	 
	 
fim  b fim
	 
reset 
	
	 
	 	 
			AREA MyData, DATA, READWRITE
data2		SPACE 	255				; definie área com 255 bytes iguais a zero
	
	
			AREA MyData, DATA, READWRITE
data3		SPACE 	255				; definie área com 255 bytes iguais a zero
	

			end

















;;;6a-corrigido de novo;;;; 
			AREA ARMex, CODE, READONLY
									; ARMex: nome do bloco de código
			ENTRY					; Marca qual é primeira instrução a ser executada
IO0DIR EQU 0xE0028008 ;  0-> entrada 1 -> saída
IO0PIN EQU 0xE0028000
IO0SET equ 0xE0028004
IO0CLR equ 0xE002800C
start 
        nop
		b  inicio
dado dcd 7 ; DCD é exatamente igual a "não tretar", ele só está lá, e se vc deixar é o mesmo q dar uma instrução direta
dadofim
inicio
    mov r3, #4                            ;;;;;;r6 é Y
	mov r8, #1
	mov r7, #1 							 ;;;;; dcd é X  ou r1
	ldr r0, =dado						 ;;;;;resultado em r8
	ldr r1, [r0]						 ; r3 é 0 numero q vai ser elevado 
	mov r4, r1							 
	bl ctt 
fim		
		b fim
ctt	add r7, #1
	mul r6, r8, r4 
	mov r8, r6
	cmp r7, r3
	ble ctt
	bx lr 
       end



Exercícios de Assembly- favor conferir




andreia pereira
​
Luiz Copetti
​
olá, professor 

eu sou o Lucas Rafael, e gostaria que, se pudesse, você anotasse esses dois exercícios pra gente: 6e e 7b(ambos extras)

não acredito que dê tempo de você anotar em sala, então estou enviando os arquivos em formato de texto, prontos para o senhor copiar para o compilador e testar! também está no arquivo o 6a com uma pequena correção que nossa dupla fez. Obrigado desde já. 