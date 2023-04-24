.model small 
.data 
N DB 11
A DB 0
B DB 1
C DB 1     
I DB 0
VECT DB 15 DUP(?)

.code 
main proc 
MOV AX, @data 
MOV DS, AX

MOV CH, 0  
MOV CL, N  
MOV SI, 0
          
bucla: MOV AL, B
       MOV A, AL
       MOV AL, C
       MOV B, AL
       MOV DL, A
       ADD DL, B
       MOV C, DL
       MOV AH, 0
       MOV AL, A   
       MOV DL, 2
       DIV DL
       CMP AH, 1 
       JS next      
       ADD SI, 1 
       MOV BL, A   
       MOV VECT[SI], BL 
next:  LOOP bucla
               
MOV AL, B
MOV AH, 0   
MOV DL, 2
DIV DL
CMP AH, 1 
JS last
ADD SI, 1 
MOV BL, B  
MOV VECT[SI], BL 
       
last: 
MOV AL, C
MOV AH, 0   
MOV DL, 2
DIV DL
CMP AH, 1 
JS done   
ADD SI, 1  
MOV BL, C 
MOV VECT[SI], BL

done: 
;AFISEZ NUMARUL DE NUMERE IMPARE GASITE (ULTIMUL INDEX LA CARE SE VA SALVA UN NUMAR IMPAR)
MOV AH, 2  ; N = 11
MOV DX, SI 
ADD DL, 48
INT 21H  


MOV SI, 1 
MOV AH, 2
MOV DL, VECT[SI] 
ADD DL, 48
INT 21H 
MOV AH, 2
MOV DL, VECT[SI + 1] 
ADD DL, 48
INT 21H 
MOV AH, 2
MOV DL, VECT[SI + 2] 
ADD DL, 48
INT 21H

main endp 
end