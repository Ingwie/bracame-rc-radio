   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  56                     ; 24     void LCD_STR(const unsigned char *text){
  58                     	switch	.text
  59  0000               _LCD_STR:
  61  0000 89            	pushw	x
  62       00000000      OFST:	set	0
  65  0001 2014          	jra	L13
  66  0003               L72:
  67                     ; 26     LCD_DATA(*text++,1);
  69  0003 ae0001        	ldw	x,#1
  70  0006 1601          	ldw	y,(OFST+1,sp)
  71  0008 72a90001      	addw	y,#1
  72  000c 1701          	ldw	(OFST+1,sp),y
  73  000e 72a20001      	subw	y,#1
  74  0012 90f6          	ld	a,(y)
  75  0014 95            	ld	xh,a
  76  0015 ad4a          	call	_LCD_DATA
  78  0017               L13:
  79                     ; 25     while(*text){
  81  0017 1e01          	ldw	x,(OFST+1,sp)
  82  0019 7d            	tnz	(x)
  83  001a 26e7          	jrne	L72
  84                     ; 28     }
  87  001c 85            	popw	x
  88  001d 81            	ret
 115                     ; 32     void initLCD(void){
 116                     	switch	.text
 117  001e               _initLCD:
 121                     ; 33     GPIO_WriteLow(LCD_PORT_RSE,LCD_E); //clear enable
 123  001e 4b04          	push	#4
 124  0020 ae500f        	ldw	x,#20495
 125  0023 cd0000        	call	_GPIO_WriteLow
 127  0026 84            	pop	a
 128                     ; 34     GPIO_WriteLow(LCD_PORT_RSE,LCD_RS); //going to write command
 130  0027 4b01          	push	#1
 131  0029 ae500f        	ldw	x,#20495
 132  002c cd0000        	call	_GPIO_WriteLow
 134  002f 84            	pop	a
 135                     ; 35 		delay(30); //delay for LCD to initialise.
 137  0030 ae001e        	ldw	x,#30
 138  0033 cd0000        	call	_delay
 140                     ; 36 		LCD_NYB(0x03,0); //Required for initialisation
 142  0036 5f            	clrw	x
 143  0037 a603          	ld	a,#3
 144  0039 95            	ld	xh,a
 145  003a ad41          	call	_LCD_NYB
 147                     ; 37     delay(5); //required delay
 149  003c ae0005        	ldw	x,#5
 150  003f cd0000        	call	_delay
 152                     ; 38     LCD_NYB(0x03,0); //Required for initialisation
 154  0042 5f            	clrw	x
 155  0043 a603          	ld	a,#3
 156  0045 95            	ld	xh,a
 157  0046 ad35          	call	_LCD_NYB
 159                     ; 39     delay(1); //required delay
 161  0048 ae0001        	ldw	x,#1
 162  004b cd0000        	call	_delay
 164                     ; 41     LCD_DATA(0x28,0); //set to 4 bit interface, 2 line and 5*10 font
 166  004e 5f            	clrw	x
 167  004f a628          	ld	a,#40
 168  0051 95            	ld	xh,a
 169  0052 ad0d          	call	_LCD_DATA
 171                     ; 43     LCD_DATA(0x01,0); //clear display
 173  0054 5f            	clrw	x
 174  0055 a601          	ld	a,#1
 175  0057 95            	ld	xh,a
 176  0058 ad07          	call	_LCD_DATA
 178                     ; 44     LCD_DATA(0x06,0); //move cursor right after write
 180  005a 5f            	clrw	x
 181  005b a606          	ld	a,#6
 182  005d 95            	ld	xh,a
 183  005e ad01          	call	_LCD_DATA
 185                     ; 45 		 }
 188  0060 81            	ret
 233                     ; 47     void LCD_DATA(unsigned char data,unsigned char type){
 234                     	switch	.text
 235  0061               _LCD_DATA:
 237  0061 89            	pushw	x
 238       00000000      OFST:	set	0
 241                     ; 48     delay(10); //TEST LCD FOR BUSY 
 243  0062 ae000a        	ldw	x,#10
 244  0065 cd0000        	call	_delay
 246                     ; 49     LCD_NYB(data>>4,type); //WRITE THE UPPER NIBBLE
 248  0068 7b02          	ld	a,(OFST+2,sp)
 249  006a 97            	ld	xl,a
 250  006b 7b01          	ld	a,(OFST+1,sp)
 251  006d 4e            	swap	a
 252  006e a40f          	and	a,#15
 253  0070 95            	ld	xh,a
 254  0071 ad0a          	call	_LCD_NYB
 256                     ; 50     LCD_NYB(data,type); //WRITE THE LOWER NIBBLE
 258  0073 7b02          	ld	a,(OFST+2,sp)
 259  0075 97            	ld	xl,a
 260  0076 7b01          	ld	a,(OFST+1,sp)
 261  0078 95            	ld	xh,a
 262  0079 ad02          	call	_LCD_NYB
 264                     ; 51     }
 267  007b 85            	popw	x
 268  007c 81            	ret
 324                     ; 53     void LCD_NYB(unsigned char nyb, char type){
 325                     	switch	.text
 326  007d               _LCD_NYB:
 328  007d 89            	pushw	x
 329  007e 88            	push	a
 330       00000001      OFST:	set	1
 333                     ; 56     temp = nyb & 0x0F;
 335  007f 9e            	ld	a,xh
 336  0080 a40f          	and	a,#15
 337  0082 6b01          	ld	(OFST+0,sp),a
 338                     ; 57   	GPIO_Write(LCD_PORT_DATA,temp);
 340  0084 7b01          	ld	a,(OFST+0,sp)
 341  0086 88            	push	a
 342  0087 ae5014        	ldw	x,#20500
 343  008a cd0000        	call	_GPIO_Write
 345  008d 84            	pop	a
 346                     ; 59     if(type == 0){
 348  008e 0d03          	tnz	(OFST+2,sp)
 349  0090 260b          	jrne	L511
 350                     ; 60     GPIO_WriteLow(LCD_PORT_RSE,LCD_RS); //COMMAND MODE
 352  0092 4b01          	push	#1
 353  0094 ae500f        	ldw	x,#20495
 354  0097 cd0000        	call	_GPIO_WriteLow
 356  009a 84            	pop	a
 358  009b 2009          	jra	L711
 359  009d               L511:
 360                     ; 62     GPIO_WriteHigh(LCD_PORT_RSE,LCD_RS); //CHARACTER/DATA MODE
 362  009d 4b01          	push	#1
 363  009f ae500f        	ldw	x,#20495
 364  00a2 cd0000        	call	_GPIO_WriteHigh
 366  00a5 84            	pop	a
 367  00a6               L711:
 368                     ; 65     GPIO_WriteHigh(LCD_PORT_RSE,LCD_E); //ENABLE LCD DATA LINE
 370  00a6 4b04          	push	#4
 371  00a8 ae500f        	ldw	x,#20495
 372  00ab cd0000        	call	_GPIO_WriteHigh
 374  00ae 84            	pop	a
 375                     ; 66     delay(1); //SMALL DELAY
 377  00af ae0001        	ldw	x,#1
 378  00b2 cd0000        	call	_delay
 380                     ; 67     GPIO_WriteLow(LCD_PORT_RSE,LCD_E); //DISABLE LCD DATA LINED
 382  00b5 4b04          	push	#4
 383  00b7 ae500f        	ldw	x,#20495
 384  00ba cd0000        	call	_GPIO_WriteLow
 386  00bd 84            	pop	a
 387                     ; 68     }
 390  00be 5b03          	addw	sp,#3
 391  00c0 81            	ret
 426                     ; 70     void LCD_LINE(char line){
 427                     	switch	.text
 428  00c1               _LCD_LINE:
 432                     ; 71     switch(line){
 435                     ; 78     break;
 436  00c1 4d            	tnz	a
 437  00c2 2708          	jreq	L121
 438  00c4 4a            	dec	a
 439  00c5 2705          	jreq	L121
 440  00c7 4a            	dec	a
 441  00c8 270a          	jreq	L321
 442  00ca 200e          	jra	L541
 443  00cc               L121:
 444                     ; 72     case 0:
 444                     ; 73     case 1:
 444                     ; 74     LCD_DATA(0x80,0);
 446  00cc 5f            	clrw	x
 447  00cd a680          	ld	a,#128
 448  00cf 95            	ld	xh,a
 449  00d0 ad8f          	call	_LCD_DATA
 451                     ; 75     break;
 453  00d2 2006          	jra	L541
 454  00d4               L321:
 455                     ; 76     case 2:
 455                     ; 77     LCD_DATA(0xC0,0);
 457  00d4 5f            	clrw	x
 458  00d5 a6c0          	ld	a,#192
 459  00d7 95            	ld	xh,a
 460  00d8 ad87          	call	_LCD_DATA
 462                     ; 78     break;
 464  00da               L541:
 465                     ; 80     }
 468  00da 81            	ret
 481                     	xdef	_LCD_STR
 482                     	xdef	_LCD_LINE
 483                     	xdef	_LCD_NYB
 484                     	xdef	_LCD_DATA
 485                     	xdef	_initLCD
 486                     	xref	_delay
 487                     	xref	_GPIO_WriteLow
 488                     	xref	_GPIO_WriteHigh
 489                     	xref	_GPIO_Write
 508                     	end
