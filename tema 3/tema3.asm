.model small 
.data 
msg1 DB 255 DUP('$')
msg2 DB 255 DUP('$') 
msgall DB 255 DUP('$')

.code 
main proc  
MOV AX, @data 
MOV DS, AX  
  
MOV SI, 0       
MOV DI, 0  
MOV CX, 255

;programul citeste caractere pana la apasarea tastei enter, iar apoi trece la citirea celui de-al doilea sir de caractere    
citire1: MOV AH, 1
         INT 21H
         MOV msg1[SI], AL
         ADD SI, 1
         CMP AL, 13
         JZ citire2
         LOOP citire1 
         
;pentru al doilea sir de caractere ne oprim din citire cand se apasa tasta enter
citire2: MOV AH, 1
         INT 21H
         MOV msg2[DI], AL
         ADD DI, 1
         CMP AL, 13
         JZ init
         LOOP citire2
         
init:    MOV SI, 0
         MOV DI, 0
         MOV CX, 255
                    
 
;copiez primul sir in noul sir
copy1:   MOV BL, msg1[DI]  
         CMP BL, 13
         JZ init2 
         MOV msgall[SI], BL
         ADD SI, 1
         ADD DI, 1
         LOOP copy1
      
init2:   MOV DI, 0            
         MOV CX, 255          
         
;concatenez al doilea sir in noul sir (unde exista deja sirul 1)
copy2:   MOV BL, msg2[DI]  
         CMP BL, 13
         JZ done 
         MOV msgall[SI], BL
         ADD SI, 1
         ADD DI, 1
         LOOP copy2
         
done: 
MOV AH, 9  
LEA DX, msgall
INT 21H 

main endp 
end
    
