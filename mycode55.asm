
    	ORG 	100h 
    	JMP 	START	    ;	 
X   	DW 	    04H      	; 
SQ  	DW 	    ?        	; 
CB  	DW 	    ?        	; 
START:  MOV 	AX,X    	; 
    	MOV 	BX,X    	; 
    	MUL 	BX      	; 
    	MOV 	SQ,AX   	; 
    	MUL 	BX      	; 
    	MOV 	CB,AX   	;     

    	MOV 	AH,4CH  	; 
    	INT 	21H     	; 
    	RET 
    




