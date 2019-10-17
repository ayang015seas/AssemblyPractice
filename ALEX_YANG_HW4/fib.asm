;; Fib program

	.CODE		; This is a code segment
	.ADDR  0x0001	; Start filling in instructions at address 0x00

	CONST R2, #0    ; Initialize R2 to 0
	CONST R3, #1	; Initialize R3 to 1
	CONST R4, #0	;

	CMPI R0, #2 	; Account for input = 2
	BRz INPUT1		;

	CMPI R0, #1		; Account for input = 1
	BRz END2		;

	ADD R0, R0, #-2	;


LOOP	CMPI R0, #0	; Compare B to 0
	BRnz END	; if (B <= 0) Branch to the end

	ADD R4, R2, #0	;
	ADD R2, R3, #0	;
	ADD R3, R4, #0	;
	ADD R3, R3, R2	;

	CONST R4, #0	;
	ADD R0, R0, #-1	; B =  B - 1

	BRnzp LOOP	; Go back to the beginning of the loop

INPUT1
	CONST R1, #1	;
	BRnzp END2 		;

END	ADD R1, R3, #0;
END2	NOP
