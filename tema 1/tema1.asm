
; Velciov Diana 7.2
   
   
.data 
 N DB 3
 
.code 
main proc 
 
 MOV BL, AL
 SUB BL, 1
 ADD AL, BL; face suma 3 + 2
 
 SUB BL, 1
 ADD AL, BL; face suma 5 + 1
  
; conversie in ascii, ca sa afiseze cifra 6, rezultatul corect
 ADD AL, 48
 
; afi?area rezultatului pe ecran, adica numarul 6
 MOV AH, 2
 MOV DL, AL
 INT 21H 
 
main endp
end 