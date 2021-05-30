.model small 
.stack 100h

;; --------------------data segment -----------------------------

.data 
YEAR DW 2000D
LEAPYEAR DB ?

; ---------------------code segment -----------------------------

.code
main proc
    mov bx, @data       ; importing the data segment
    mov ds, bx          
    
    mov ax, YEAR        ; store in ax
    mov bx, 4           ; divisor = 4
    div bx              ; divide by bx, remainder is stored in dx
    
    cmp dx, 0           ; if remainder is 0, go to step 2, else step5
    je step2
    jmp step5
    
    step2:
    mov ax, YEAR        ; same procedure for the divisor 100
    mov bx, 100
    div bx    
    cmp dx, 0
    je step3
    jmp step4
    
    step3:
    mov ax, YEAR
    mov bx, 400         ; same procedure for the divisor 400
    div bx
    cmp dx, 0
    je step4
    jmp step5 
    
    step4:
    mov LEAPYEAR, 1
    jmp exit
    
    step5:
    mov LEAPYEAR, 0
    jmp exit
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
       
    
    
    