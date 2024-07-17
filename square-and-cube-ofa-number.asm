; Program to find square and cube of a number 
    	ORG 	100h
    	JMP 	START	; Jump to the beginning of the code	
X   	DW 	    04H      	; Variable X = 4	
SQ  	DW 	    ?        	; Variable SQ = square of X	
CB  	DW 	    ?        	; Variable CB = cube of X	
START:  MOV 	AX,X    	; Load X to AX	
    	MOV 	BX,X    	; Load X to BX	
    	MUL 	BX      	;Multiply AX and BX	
    	MOV 	SQ,AX   	;Load square result to SQ	
    	MUL 	BX      	;Multiply AX and BX	
    	MOV 	CB,AX   	;Load cube of to CB	
    
    	MOV 	AH,4CH  	;Terminate program	
    	INT 	21H     	;Dos interrupt	
    	RET


