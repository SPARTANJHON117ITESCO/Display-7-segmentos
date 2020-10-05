; DISPLAY 7 SEGMENTOS
    
    
PROCESSOR 16F887
#include <xc.inc>

CONFIG FOSC=INTRC_NOCLKOUT
CONFIG WDTE=OFF
CONFIG PWRTE=ON
CONFIG MCLRE=OFF
CONFIG CP=OFF
CONFIG CPD=OFF
CONFIG BOREN=OFF
CONFIG IESO=OFF
CONFIG FCMEN=ON
CONFIG DEBUG=ON

CONFIG BOR4V=BOR40V
CONFIG WRT=OFF

PSECT udata
AA:
    DS 1
BB:
    DS 1
CC:
    DS 1

PSECT resetVec,class=CODE,delta=2
resetVec:
PAGESEL numeros
goto numeros

PSECT code
retardo:    
MOVLW    50       
MOVWF    AA          
externo:   
MOVLW     50        
MOVWF     BB         
mitad:    
MOVLW    65       
MOVWF    CC          
interno:    
DECFSZ   CC,1       
GOTO     interno       
DECFSZ   BB,1       
GOTO        mitad         
DECFSZ   AA,1       
GOTO        externo     
RETURN                     
		
limpieza:
    BANKSEL ANSEL
    clrf ANSEL
    BANKSEL PORTA
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    return
Display0:
    BANKSEL PORTA
    movlw 0b1111110
    movwf PORTA
   return
Display1:
    BANKSEL PORTA
    movlw 0b0110000
    movwf PORTA
   return   
Display2:
    BANKSEL PORTA
    movlw 0b1101101
    movwf PORTA
   return  
Display3:
    BANKSEL PORTA
    movlw 0b1111001
    movwf PORTA
   return
Display4:
    BANKSEL PORTA
    movlw 0b0110011
    movwf PORTA
   return
Display5:
    BANKSEL PORTA
    movlw 0b1011011
    movwf PORTA
   return
Display6:
    BANKSEL PORTA
    movlw 0b1011111
    movwf PORTA
   return
Display7:
    BANKSEL PORTA
    movlw 0b1110000
    movwf PORTA
   return
Display8:
    BANKSEL PORTA
    movlw 0b1111111
    movwf PORTA
   return
Display9:
    BANKSEL PORTA
    movlw 0b1111011
    movwf PORTA
   return
numeros:
   call limpieza
   call Display0 ;01111110
   call retardo  
   call limpieza
   call Display1  ;00110000
   call retardo
   call limpieza
   call Display2  ;01101101
   call retardo
   call limpieza
   call Display3  ;01111001
   call retardo
   call limpieza
   call Display4 ;00110011
   call retardo
   call limpieza
   call Display5 ;01011011
   call retardo
   call limpieza
   call Display6 ;01011111
   call retardo
   call limpieza
   call Display7 ;01110000
   call retardo
   call limpieza
   call Display8 ;01111111
   call retardo
   call limpieza
   call Display9 ;01111011
   call retardo
   call limpieza
    END


