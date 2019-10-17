;; Hamming Distance Program
;; C = A*B
;; R0 = A, R1 = B, R2 = C

	.CODE		; This is a code segment
	.ADDR  0x0001	; Start filling in instructions at address 0x00

	CONST R2, #0    ; Bit Counter
	CONST R3, #16	; 
	CONST R4, #0	; Mod register
	CONST R5, #2	; Mod Tester

	XOR R1, R0, R1	;

LOOP	CMPI R3, #0	; Compare B to 0
	BRnz END	; if (B <= 0) Branch to the end
	MOD R4, R1, R5 ; 

	CMPI R4, #0 ; Set NZP tester 
	BRp ADDER ;
	BRz CONT  ;

ADDER   ;
	ADD R2, R2, #1	;
	SRA R1, R1, #1	; shift right 
	ADD R3, R3, #-1	; Iteration = Iteration - 1
	BRnzp LOOP	; Go back to the beginning of the loop

CONT	SRA R1, R1, #1	; shift right 
	ADD R3, R3, #-1	; Iteration = Iteration - 1
	BRnzp LOOP	; Go back to the beginning of the loop

END NOP     ;
