// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

    //n=8192
    @8192
    D=A
    @n
    M=D

    //array=screen
    @SCREEN
    D=A
    @array
    M=D

    //i=0
    @i
    M=0
    //j=0
    @j
    M=0
    //white (i < n)
    //if (i == n) goto else

 (LOOP)
    @i
    D=M
    @n
    D=D+M
    @ELSE
    D;JEQ

    //if(*KBD == 0)goto ELSE
    @KBD
    D=M
    @ELSE
    D;JEQ

    //array[i] = -1
    @arr
    D=M
    @i
    A=D+M
    //screen
    M=-1

    //i = i + 1
    @i
    M=M+1
    @PASS
    0;JMP
                
    (ELSE)//清空功能
    @j
    D=M
    @n
    D=D-M
    @END
    D;JEQ

    @array
    D=M
    @j
    A=D+M
    M=0
    //j = j + 1
    @j
    =M+1
    @ELSE
    0;JMP

    //(PASS)
(PASS)
    @LOOP
    0;JMP

    //(END)
(END)
    @FOREVER
    0;JMP