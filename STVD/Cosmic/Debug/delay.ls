   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  57                     ; 4 void Delay(u16 nCount)
  57                     ; 5 {
  59                     	switch	.text
  60  0000               _Delay:
  62  0000 89            	pushw	x
  63       00000000      OFST:	set	0
  66                     ; 7 		nCount = nCount * 3;
  68  0001 1e01          	ldw	x,(OFST+1,sp)
  69  0003 90ae0003      	ldw	y,#3
  70  0007 cd0000        	call	c_imul
  73  000a 2001          	jra	L13
  74  000c               L72:
  75                     ; 10         nCount--;
  77  000c 5a            	decw	x
  78  000d               L13:
  79  000d 1f01          	ldw	(OFST+1,sp),x
  80                     ; 8 		while (nCount != 0)
  82  000f 26fb          	jrne	L72
  83                     ; 12 }
  86  0011 85            	popw	x
  87  0012 81            	ret	
 122                     ; 14 void Delayms(u16 nCount)
 122                     ; 15 {
 123                     	switch	.text
 124  0013               _Delayms:
 126  0013 89            	pushw	x
 127       00000000      OFST:	set	0
 130  0014 200a          	jra	L55
 131  0016               L35:
 132                     ; 19         Delay(1000);
 134  0016 ae03e8        	ldw	x,#1000
 135  0019 ade5          	call	_Delay
 137                     ; 20 		nCount--;
 139  001b 1e01          	ldw	x,(OFST+1,sp)
 140  001d 5a            	decw	x
 141  001e 1f01          	ldw	(OFST+1,sp),x
 142  0020               L55:
 143                     ; 17 		while (nCount != 0)
 145  0020 1e01          	ldw	x,(OFST+1,sp)
 146  0022 26f2          	jrne	L35
 147                     ; 22 }
 150  0024 85            	popw	x
 151  0025 81            	ret	
 164                     	xdef	_Delayms
 165                     	xdef	_Delay
 166                     	xref.b	c_x
 185                     	xref	c_imul
 186                     	end
