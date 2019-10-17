	;; This is the data section
	.DATA
	.ADDR x4000		; Start the data at address 0x4000
	
global_array
	.FILL #2

	;; Start of the code section
	.CODE
	.ADDR 0x0000	; Start the code at address 0x0000

	CONST R2, #1	; Prime number counter
	LEA R3, global_array	; R3 contains array address
	CONST R4, #2	; All number counter 

	;; R6 is MOD
	;; R7 is temp array storage 
	;; R0 is loaded with the nth prime 

	ADD R0, R0, #-1 ; Decrement R0 by 1 

MAIN 	CMPI R0, #0	; Compare B to 0
	BRnz END	; if (B <= 0) Branch to the end

	CONST R1, #0	; Counter for Data + Offset 
	CONST R5, #0	; Reset R5 

	ADD R4, R4, #1	; Increment all numbers 

					; R5 is while iterator 
LOOP 	
	ADD R1, R3, R5	;  Calculate offset 
	LDR R7, R1, #0	;  Load value into R7
	MOD R6, R4, R7	;  Check outer num (R6) against prime array num (R7)

	ADD R5, R5, #1	;  Advance while iterator 

	CMPI R6, #0		;  Check mod val 
		BRp LOOP	;	If mod val not 0, continue

	CMP R5, R2	; Check R5 < R2 
		BRzp ADDPRIME 	; 

	CMPI R6, #0		;  Check mod val 
		Brz MAIN	;   If mod val is 0, go back 

ADDPRIME 
	CONST R1, #0	;
	ADD R1, R3, R2	;
	STR R4, R1, #0	; Store new prime 
	ADD R2, R2, #1	; Increment prime number counter 
	ADD R0, R0, #-1	; Decrement R0 number 
	BRnzp MAIN		;

END ADD R1, R4, #0	; Store in R1 
	NOP