   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  18                     	bsct
  19  0000               _phase_actuelle:
  20  0000 00            	dc.b	0
  21                     .bit:	section	.data,bit
  22  0000               _phase_change:
  23  0000 00            	dc.b	0
  24  0001               _trimdyn:
  25  0001 00            	dc.b	0
  26  0002               _outputdr:
  27  0002 00            	dc.b	0
  28  0003               _expon:
  29  0003 00            	dc.b	0
  30  0004               _secumot:
  31  0004 00            	dc.b	0
  32  0005               _tor1plus:
  33  0005 00            	dc.b	0
  34  0006               _tor1moins:
  35  0006 00            	dc.b	0
  36  0007               _tor2plus:
  37  0007 00            	dc.b	0
  38  0008               _tor2moins:
  39  0008 00            	dc.b	0
  40  0009               _flashencour:
  41  0009 00            	dc.b	0
  42  000a               _haut:
  43  000a 00            	dc.b	0
  44  000b               _bas:
  45  000b 00            	dc.b	0
  46  000c               _gauche:
  47  000c 00            	dc.b	0
  48  000d               _droite:
  49  000d 00            	dc.b	0
  50                     	bsct
  51  0001               _ratiobat:
  52  0001 01            	dc.b	1
  53  0002               _chargeeaccus:
  54  0002 270f          	dc.w	9999
  55  0004               _tempotrimdyn:
  56  0004 00            	dc.b	0
  57  0005               _tempsbip1:
  58  0005 00            	dc.b	0
  59  0006               _tempsbip2:
  60  0006 00            	dc.b	0
  61  0007               _tempsbip3:
  62  0007 00            	dc.b	0
  63  0008               _tempsbip4:
  64  0008 00            	dc.b	0
  65  0009               _tempsbip5:
  66  0009 00            	dc.b	0
  67                     	switch	.bit
  68  000e               _bipon:
  69  000e 00            	dc.b	0
  70                     	bsct
  71  000a               _cur:
  72  000a 00            	dc.b	0
  73  000b 00            	dc.b	0
  74  000c 00            	dc.b	0
  75  000d 00            	dc.b	0
  76  000e 00            	dc.b	0
  77  000f 00            	dc.b	0
  78  0010 00            	dc.b	0
  79  0011 1f            	dc.b	31
  80  0012 00            	dc.b	0
  81  0013 00            	dc.b	0
  82  0014 00            	dc.b	0
  83  0015 00            	dc.b	0
  84  0016 00            	dc.b	0
  85  0017 00            	dc.b	0
  86  0018 1f            	dc.b	31
  87  0019 00            	dc.b	0
  88  001a 00            	dc.b	0
  89  001b 00            	dc.b	0
  90  001c 00            	dc.b	0
  91  001d 00            	dc.b	0
  92  001e 00            	dc.b	0
  93  001f 1f            	dc.b	31
  94  0020 00            	dc.b	0
  95  0021 00            	dc.b	0
  96  0022 00            	dc.b	0
  97  0023 00            	dc.b	0
  98  0024 00            	dc.b	0
  99  0025 00            	dc.b	0
 100  0026 1f            	dc.b	31
 101  0027 00            	dc.b	0
 102  0028 00            	dc.b	0
 103  0029 00            	dc.b	0
 104  002a 00            	dc.b	0
 105  002b 00            	dc.b	0
 106  002c 00            	dc.b	0
 107  002d 1f            	dc.b	31
 108  002e 00            	dc.b	0
 109  002f 00            	dc.b	0
 110  0030 00            	dc.b	0
 111  0031 00            	dc.b	0
 112  0032 00            	dc.b	0
 113  0033 00            	dc.b	0
 114  0034 1f            	dc.b	31
 115  0035 00            	dc.b	0
 116  0036 00            	dc.b	0
 117  0037 00            	dc.b	0
 118  0038 00            	dc.b	0
 119  0039 00            	dc.b	0
 120  003a 00            	dc.b	0
 121  003b 1f            	dc.b	31
 122  003c 00            	dc.b	0
 123  003d 00            	dc.b	0
 124  003e 00            	dc.b	0
 125  003f 00            	dc.b	0
 126  0040 00            	dc.b	0
 127  0041 00            	dc.b	0
 128  0042 1f            	dc.b	31
 129  0043 00            	dc.b	0
 130  0044 00            	dc.b	0
 131  0045 00            	dc.b	0
 132  0046 00            	dc.b	0
 133  0047 00            	dc.b	0
 134  0048 00            	dc.b	0
 135  0049 00            	dc.b	0
 218                     ; 72 void bip(u8 temps1,u8 temps2,u8 temps3,u8 temps4,u8 temps5) // temps x 0.2 sec
 218                     ; 73 {
 220                     	switch	.text
 221  0000               _bip:
 223  0000 89            	pushw	x
 224       00000000      OFST:	set	0
 227                     ; 74 	if (bipon)
 229  0001 7201000e1e    	btjf	_bipon,L74
 230                     ; 76 		GPIO_WriteLow(GPIOD,GPIO_PIN_4);
 232  0006 4b10          	push	#16
 233  0008 ae500f        	ldw	x,#20495
 234  000b cd0000        	call	_GPIO_WriteLow
 236  000e 84            	pop	a
 237                     ; 77 		tempsbip1 = temps1 + 1;
 239  000f 7b01          	ld	a,(OFST+1,sp)
 240  0011 4c            	inc	a
 241  0012 b705          	ld	_tempsbip1,a
 242                     ; 78 		tempsbip2 = temps2 + tempsbip1;
 244  0014 1b02          	add	a,(OFST+2,sp)
 245  0016 b706          	ld	_tempsbip2,a
 246                     ; 79 		tempsbip3 = temps3 + tempsbip2;
 248  0018 1b05          	add	a,(OFST+5,sp)
 249  001a b707          	ld	_tempsbip3,a
 250                     ; 80 		tempsbip4 = temps4 + tempsbip3;
 252  001c 1b06          	add	a,(OFST+6,sp)
 253  001e b708          	ld	_tempsbip4,a
 254                     ; 81 		tempsbip5 = temps5 + tempsbip4;
 256  0020 1b07          	add	a,(OFST+7,sp)
 257  0022 b709          	ld	_tempsbip5,a
 258  0024               L74:
 259                     ; 83 }
 262  0024 85            	popw	x
 263  0025 81            	ret	
 294                     ; 85 void biponoff(void)
 294                     ; 86 {
 295                     	switch	.text
 296  0026               _biponoff:
 300                     ; 87 	LCD_DISP_OFF();
 302  0026 cd0000        	call	_LCD_DISP_OFF
 304                     ; 88 	LCD_CLEAR_DISPLAY();
 306  0029 cd0000        	call	_LCD_CLEAR_DISPLAY
 308                     ; 89 	Menu_actif = 1;
 310  002c 72100000      	bset	_Menu_actif
 311                     ; 90 	Tempo_menu = 13;
 313  0030 350d0000      	mov	_Tempo_menu,#13
 314                     ; 92 	bipon = !bipon;
 316                     ; 94 	if (bipon)
 318  0034 5f            	clrw	x
 319  0035 9010000e      	bcpl	_bipon
 320  0039 7201000e22    	btjf	_bipon,L16
 321                     ; 96 		LCD_printtruc(1,6,"Bip On",0);
 323  003e 89            	pushw	x
 324  003f ae012c        	ldw	x,#L36
 325  0042 89            	pushw	x
 326  0043 ae0006        	ldw	x,#6
 327  0046 a601          	ld	a,#1
 328  0048 95            	ld	xh,a
 329  0049 cd0000        	call	_LCD_printtruc
 331  004c 5b04          	addw	sp,#4
 332                     ; 97 		bip(2,1,1,0,0);
 334  004e 4b00          	push	#0
 335  0050 4b00          	push	#0
 336  0052 4b01          	push	#1
 337  0054 ae0001        	ldw	x,#1
 338  0057 a602          	ld	a,#2
 339  0059 95            	ld	xh,a
 340  005a ada4          	call	_bip
 342  005c 5b03          	addw	sp,#3
 344  005e 2010          	jra	L56
 345  0060               L16:
 346                     ; 100 		LCD_printtruc(1,6,"Bip Off",0);
 348  0060 89            	pushw	x
 349  0061 ae0124        	ldw	x,#L76
 350  0064 89            	pushw	x
 351  0065 ae0006        	ldw	x,#6
 352  0068 a601          	ld	a,#1
 353  006a 95            	ld	xh,a
 354  006b cd0000        	call	_LCD_printtruc
 356  006e 5b04          	addw	sp,#4
 357  0070               L56:
 358                     ; 103 	LCD_DISP_ON();
 361                     ; 104 }
 364  0070 cc0000        	jp	_LCD_DISP_ON
 390                     ; 106 void razchrono(void)
 390                     ; 107 {
 391                     	switch	.text
 392  0073               _razchrono:
 396                     ; 108 	minutes = secondes = 0;
 398  0073 3f19          	clr	_secondes
 399  0075 3f18          	clr	_minutes
 400                     ; 109 	bip(2,1,2,0,0);
 402  0077 4b00          	push	#0
 403  0079 4b00          	push	#0
 404  007b 4b02          	push	#2
 405  007d ae0001        	ldw	x,#1
 406  0080 a602          	ld	a,#2
 407  0082 95            	ld	xh,a
 408  0083 cd0000        	call	_bip
 410  0086 5b03          	addw	sp,#3
 411                     ; 111 }
 414  0088 81            	ret	
 439                     ; 113 void razchronobat(void)
 439                     ; 114 {
 440                     	switch	.text
 441  0089               _razchronobat:
 445                     ; 115 	chargeeaccus = 9999;
 447  0089 ae270f        	ldw	x,#9999
 448  008c bf02          	ldw	_chargeeaccus,x
 449                     ; 116 	bip(1,2,1,1,3);
 451  008e 4b03          	push	#3
 452  0090 4b01          	push	#1
 453  0092 4b01          	push	#1
 454  0094 ae0002        	ldw	x,#2
 455  0097 a601          	ld	a,#1
 456  0099 95            	ld	xh,a
 457  009a cd0000        	call	_bip
 459  009d 5b03          	addw	sp,#3
 460                     ; 117 }
 463  009f 81            	ret	
 530                     .const:	section	.text
 531  0000               L24:
 532  0000 00bb          	dc.w	L111
 533  0002 00c3          	dc.w	L311
 534  0004 00cb          	dc.w	L511
 535  0006 00dc          	dc.w	L711
 536  0008 00e4          	dc.w	L121
 537  000a 017c          	dc.w	L502
 538  000c 00ec          	dc.w	L321
 539  000e 00f4          	dc.w	L521
 540  0010 00fc          	dc.w	L721
 541  0012 010c          	dc.w	L131
 542  0014 011c          	dc.w	L331
 543  0016 012c          	dc.w	L531
 544  0018 013c          	dc.w	L731
 545  001a 014c          	dc.w	L141
 546  001c 015c          	dc.w	L341
 547  001e 016c          	dc.w	L541
 548                     ; 119 void info(void) // Affichage pendant le vol ...
 548                     ; 120 {
 549                     	switch	.text
 550  00a0               _info:
 552  00a0 5204          	subw	sp,#4
 553       00000004      OFST:	set	4
 556                     ; 123 	char esp = 32;
 558  00a2 a620          	ld	a,#32
 559  00a4 6b03          	ld	(OFST-1,sp),a
 560                     ; 125 	for(i = 0; i < NUM_OUTPUT ; i++)
 562  00a6 4f            	clr	a
 563  00a7 6b04          	ld	(OFST+0,sp),a
 564  00a9               L571:
 565                     ; 128 		switch (barout[i])
 567  00a9 5f            	clrw	x
 568  00aa 97            	ld	xl,a
 569  00ab e61b          	ld	a,(_barout,x)
 571                     ; 189 			break;
 572  00ad a110          	cp	a,#16
 573  00af 2503cc017c    	jruge	L502
 574  00b4 5f            	clrw	x
 575  00b5 97            	ld	xl,a
 576  00b6 58            	sllw	x
 577  00b7 de0000        	ldw	x,(L24,x)
 578  00ba fc            	jp	(x)
 579  00bb               L111:
 580                     ; 130 		case 0:
 580                     ; 131 			lbas[i] = '\1';
 582  00bb 7b04          	ld	a,(OFST+0,sp)
 583  00bd 5f            	clrw	x
 584  00be 97            	ld	xl,a
 585  00bf a601          	ld	a,#1
 586                     ; 132 			lhaut[i] = esp;
 587                     ; 133 			break;
 589  00c1 200e          	jp	LC002
 590  00c3               L311:
 591                     ; 134 		case 1:
 591                     ; 135 			lbas[i] = '\2';
 593  00c3 7b04          	ld	a,(OFST+0,sp)
 594  00c5 5f            	clrw	x
 595  00c6 97            	ld	xl,a
 596  00c7 a602          	ld	a,#2
 597                     ; 136 			lhaut[i] = esp;
 598                     ; 137 			break;
 600  00c9 2006          	jp	LC002
 601  00cb               L511:
 602                     ; 138 		case 2:
 602                     ; 139 			lbas[i] = '\3';
 604  00cb 7b04          	ld	a,(OFST+0,sp)
 605  00cd 5f            	clrw	x
 606  00ce 97            	ld	xl,a
 607  00cf a603          	ld	a,#3
 608                     ; 140 			lhaut[i] = esp;
 610  00d1               LC002:
 611  00d1 e706          	ld	(_lbas,x),a
 618  00d3 5f            	clrw	x
 619  00d4 7b04          	ld	a,(OFST+0,sp)
 620  00d6 97            	ld	xl,a
 621  00d7 7b03          	ld	a,(OFST-1,sp)
 622                     ; 141 			break;
 624  00d9 cc017a        	jp	LC001
 625  00dc               L711:
 626                     ; 142 		case 3:
 626                     ; 143 			lbas[i] = '\4';
 628  00dc 7b04          	ld	a,(OFST+0,sp)
 629  00de 5f            	clrw	x
 630  00df 97            	ld	xl,a
 631  00e0 a604          	ld	a,#4
 632                     ; 144 			lhaut[i] = esp;
 633                     ; 145 			break;
 635  00e2 20ed          	jp	LC002
 636  00e4               L121:
 637                     ; 146 		case 4:
 637                     ; 147 			lbas[i] = '\5';
 639  00e4 7b04          	ld	a,(OFST+0,sp)
 640  00e6 5f            	clrw	x
 641  00e7 97            	ld	xl,a
 642  00e8 a605          	ld	a,#5
 643                     ; 148 			lhaut[i] = esp;
 644                     ; 149 			break;
 646  00ea 20e5          	jp	LC002
 647  00ec               L321:
 648                     ; 150 		case 6:
 648                     ; 151 			lbas[i] = '\6';
 650  00ec 7b04          	ld	a,(OFST+0,sp)
 651  00ee 5f            	clrw	x
 652  00ef 97            	ld	xl,a
 653  00f0 a606          	ld	a,#6
 654                     ; 152 			lhaut[i] = esp;
 655                     ; 153 			break;
 657  00f2 20dd          	jp	LC002
 658  00f4               L521:
 659                     ; 154 		case 7:
 659                     ; 155 			lbas[i] = '\7';
 661  00f4 7b04          	ld	a,(OFST+0,sp)
 662  00f6 5f            	clrw	x
 663  00f7 97            	ld	xl,a
 664  00f8 a607          	ld	a,#7
 665                     ; 156 			lhaut[i] = esp;
 666                     ; 157 			break;
 668  00fa 20d5          	jp	LC002
 669  00fc               L721:
 670                     ; 158 		case 8:
 670                     ; 159 			lbas[i] = esp;
 672  00fc 7b04          	ld	a,(OFST+0,sp)
 673  00fe 5f            	clrw	x
 674  00ff 97            	ld	xl,a
 675  0100 7b03          	ld	a,(OFST-1,sp)
 676  0102 e706          	ld	(_lbas,x),a
 677                     ; 160 			lhaut[i] = '\0';
 679  0104 5f            	clrw	x
 680  0105 7b04          	ld	a,(OFST+0,sp)
 681  0107 97            	ld	xl,a
 682  0108 6f0f          	clr	(_lhaut,x)
 683                     ; 161 			break;
 685  010a 2070          	jra	L502
 686  010c               L131:
 687                     ; 162 		case 9:
 687                     ; 163 			lbas[i] = esp;
 689  010c 7b04          	ld	a,(OFST+0,sp)
 690  010e 5f            	clrw	x
 691  010f 97            	ld	xl,a
 692  0110 7b03          	ld	a,(OFST-1,sp)
 693  0112 e706          	ld	(_lbas,x),a
 694                     ; 164 			lhaut[i] = '\1';
 696  0114 5f            	clrw	x
 697  0115 7b04          	ld	a,(OFST+0,sp)
 698  0117 97            	ld	xl,a
 699  0118 a601          	ld	a,#1
 700                     ; 165 			break;
 702  011a 205e          	jp	LC001
 703  011c               L331:
 704                     ; 166 		case 10:
 704                     ; 167 			lbas[i] = esp;
 706  011c 7b04          	ld	a,(OFST+0,sp)
 707  011e 5f            	clrw	x
 708  011f 97            	ld	xl,a
 709  0120 7b03          	ld	a,(OFST-1,sp)
 710  0122 e706          	ld	(_lbas,x),a
 711                     ; 168 			lhaut[i] = '\2';
 713  0124 5f            	clrw	x
 714  0125 7b04          	ld	a,(OFST+0,sp)
 715  0127 97            	ld	xl,a
 716  0128 a602          	ld	a,#2
 717                     ; 169 			break;
 719  012a 204e          	jp	LC001
 720  012c               L531:
 721                     ; 170 		case 11:
 721                     ; 171 			lbas[i] = esp;
 723  012c 7b04          	ld	a,(OFST+0,sp)
 724  012e 5f            	clrw	x
 725  012f 97            	ld	xl,a
 726  0130 7b03          	ld	a,(OFST-1,sp)
 727  0132 e706          	ld	(_lbas,x),a
 728                     ; 172 			lhaut[i] = '\3';
 730  0134 5f            	clrw	x
 731  0135 7b04          	ld	a,(OFST+0,sp)
 732  0137 97            	ld	xl,a
 733  0138 a603          	ld	a,#3
 734                     ; 173 			break;
 736  013a 203e          	jp	LC001
 737  013c               L731:
 738                     ; 174 		case 12:
 738                     ; 175 			lbas[i] = esp;
 740  013c 7b04          	ld	a,(OFST+0,sp)
 741  013e 5f            	clrw	x
 742  013f 97            	ld	xl,a
 743  0140 7b03          	ld	a,(OFST-1,sp)
 744  0142 e706          	ld	(_lbas,x),a
 745                     ; 176 			lhaut[i] = '\4';
 747  0144 5f            	clrw	x
 748  0145 7b04          	ld	a,(OFST+0,sp)
 749  0147 97            	ld	xl,a
 750  0148 a604          	ld	a,#4
 751                     ; 177 			break;
 753  014a 202e          	jp	LC001
 754  014c               L141:
 755                     ; 178 		case 13:
 755                     ; 179 			lbas[i] = esp;
 757  014c 7b04          	ld	a,(OFST+0,sp)
 758  014e 5f            	clrw	x
 759  014f 97            	ld	xl,a
 760  0150 7b03          	ld	a,(OFST-1,sp)
 761  0152 e706          	ld	(_lbas,x),a
 762                     ; 180 			lhaut[i] = '\5';
 764  0154 5f            	clrw	x
 765  0155 7b04          	ld	a,(OFST+0,sp)
 766  0157 97            	ld	xl,a
 767  0158 a605          	ld	a,#5
 768                     ; 181 			break;
 770  015a 201e          	jp	LC001
 771  015c               L341:
 772                     ; 182 		case 14:
 772                     ; 183 			lbas[i] = esp;
 774  015c 7b04          	ld	a,(OFST+0,sp)
 775  015e 5f            	clrw	x
 776  015f 97            	ld	xl,a
 777  0160 7b03          	ld	a,(OFST-1,sp)
 778  0162 e706          	ld	(_lbas,x),a
 779                     ; 184 			lhaut[i] = '\6';
 781  0164 5f            	clrw	x
 782  0165 7b04          	ld	a,(OFST+0,sp)
 783  0167 97            	ld	xl,a
 784  0168 a606          	ld	a,#6
 785                     ; 185 			break;
 787  016a 200e          	jp	LC001
 788  016c               L541:
 789                     ; 186 		case 15:
 789                     ; 187 			lbas[i] = esp;
 791  016c 7b04          	ld	a,(OFST+0,sp)
 792  016e 5f            	clrw	x
 793  016f 97            	ld	xl,a
 794  0170 7b03          	ld	a,(OFST-1,sp)
 795  0172 e706          	ld	(_lbas,x),a
 796                     ; 188 			lhaut[i] = '\7';
 798  0174 5f            	clrw	x
 799  0175 7b04          	ld	a,(OFST+0,sp)
 800  0177 97            	ld	xl,a
 801  0178 a607          	ld	a,#7
 802  017a               LC001:
 803  017a e70f          	ld	(_lhaut,x),a
 804                     ; 189 			break;
 806  017c               L502:
 807                     ; 125 	for(i = 0; i < NUM_OUTPUT ; i++)
 809  017c 0c04          	inc	(OFST+0,sp)
 812  017e 7b04          	ld	a,(OFST+0,sp)
 813  0180 a108          	cp	a,#8
 814  0182 2403cc00a9    	jrult	L571
 815                     ; 194 	lhaut[NUM_OUTPUT] = 10;
 817  0187 350a0017      	mov	_lhaut+8,#10
 818                     ; 195 	lbas[NUM_OUTPUT] = 10;
 820  018b 350a000e      	mov	_lbas+8,#10
 821                     ; 196 	LCD_LOCATE(1,1);
 823  018f ae0001        	ldw	x,#1
 824  0192 a601          	ld	a,#1
 825  0194 95            	ld	xh,a
 826  0195 cd0000        	call	_LCD_LOCATE
 828                     ; 197 	LCD_printstring(lhaut);
 830  0198 ae000f        	ldw	x,#_lhaut
 831  019b cd0000        	call	_LCD_printstring
 833                     ; 198 	LCD_LOCATE(2,1);
 835  019e ae0001        	ldw	x,#1
 836  01a1 a602          	ld	a,#2
 837  01a3 95            	ld	xh,a
 838  01a4 cd0000        	call	_LCD_LOCATE
 840                     ; 199 	LCD_printstring(lbas);
 842  01a7 ae0006        	ldw	x,#_lbas
 843  01aa cd0000        	call	_LCD_printstring
 845                     ; 208 	LCD_printtruc(1,12,"%2.2u\n",minutes);
 847  01ad b618          	ld	a,_minutes
 848  01af 5f            	clrw	x
 849  01b0 97            	ld	xl,a
 850  01b1 89            	pushw	x
 851  01b2 ae011d        	ldw	x,#L702
 852  01b5 89            	pushw	x
 853  01b6 ae000c        	ldw	x,#12
 854  01b9 a601          	ld	a,#1
 855  01bb 95            	ld	xh,a
 856  01bc cd0000        	call	_LCD_printtruc
 858  01bf 5b04          	addw	sp,#4
 859                     ; 209 	LCD_printtruc(1,14,":%2.2u\n",secondes);
 861  01c1 b619          	ld	a,_secondes
 862  01c3 5f            	clrw	x
 863  01c4 97            	ld	xl,a
 864  01c5 89            	pushw	x
 865  01c6 ae0115        	ldw	x,#L112
 866  01c9 89            	pushw	x
 867  01ca ae000e        	ldw	x,#14
 868  01cd a601          	ld	a,#1
 869  01cf 95            	ld	xh,a
 870  01d0 cd0000        	call	_LCD_printtruc
 872  01d3 5b04          	addw	sp,#4
 873                     ; 212 	LCD_printtruc(1,10,"%u\n",channel);
 875  01d5 b600          	ld	a,_channel
 876  01d7 5f            	clrw	x
 877  01d8 97            	ld	xl,a
 878  01d9 89            	pushw	x
 879  01da ae0111        	ldw	x,#L312
 880  01dd 89            	pushw	x
 881  01de ae000a        	ldw	x,#10
 882  01e1 a601          	ld	a,#1
 883  01e3 95            	ld	xh,a
 884  01e4 cd0000        	call	_LCD_printtruc
 886  01e7 5b04          	addw	sp,#4
 887                     ; 216 	volt = ADC1_GetBufferValue(6); //3.42 (697) 2.2 (452) ->  200.81 / VOLT + 0.05V *2 + diode
 889  01e9 a606          	ld	a,#6
 890  01eb cd0000        	call	_ADC1_GetBufferValue
 892                     ; 217 	volt = volt * 10;
 894  01ee 90ae000a      	ldw	y,#10
 895  01f2 cd0000        	call	c_imul
 897                     ; 218 	volt += 680;
 899  01f5 1c02a8        	addw	x,#680
 900  01f8 1f01          	ldw	(OFST-3,sp),x
 901                     ; 219 	LCD_printtruc(2,12,"%i\n",volt/1000);
 903  01fa 90ae03e8      	ldw	y,#1000
 904  01fe 65            	divw	x,y
 905  01ff 89            	pushw	x
 906  0200 ae010d        	ldw	x,#L512
 907  0203 89            	pushw	x
 908  0204 ae000c        	ldw	x,#12
 909  0207 a602          	ld	a,#2
 910  0209 95            	ld	xh,a
 911  020a cd0000        	call	_LCD_printtruc
 913  020d 5b04          	addw	sp,#4
 914                     ; 220 	volt /= 10;
 916  020f 1e01          	ldw	x,(OFST-3,sp)
 917  0211 90ae000a      	ldw	y,#10
 918  0215 65            	divw	x,y
 919  0216 1f01          	ldw	(OFST-3,sp),x
 920                     ; 221 	LCD_printtruc(2,13,".%2.2iV\n",volt%100);
 922  0218 90ae0064      	ldw	y,#100
 923  021c 65            	divw	x,y
 924  021d 9089          	pushw	y
 925  021f ae0104        	ldw	x,#L712
 926  0222 89            	pushw	x
 927  0223 ae000d        	ldw	x,#13
 928  0226 a602          	ld	a,#2
 929  0228 95            	ld	xh,a
 930  0229 cd0000        	call	_LCD_printtruc
 932  022c 5b04          	addw	sp,#4
 933                     ; 222 	if (volt < 750)
 935  022e 1e01          	ldw	x,(OFST-3,sp)
 936  0230 a302ee        	cpw	x,#750
 937  0233 2442          	jruge	L122
 938                     ; 224 		if (secondes == 0)
 940  0235 b619          	ld	a,_secondes
 941  0237 263e          	jrne	L122
 942                     ; 226 			bipon = 1;
 944  0239 7210000e      	bset	_bipon
 945                     ; 227 			bip(0,1,1,1,1);
 947  023d 4b01          	push	#1
 948  023f 4b01          	push	#1
 949  0241 4b01          	push	#1
 950  0243 ae0001        	ldw	x,#1
 951  0246 95            	ld	xh,a
 952  0247 cd0000        	call	_bip
 954  024a 5b03          	addw	sp,#3
 955                     ; 228 			LCD_DISP_OFF();
 957  024c cd0000        	call	_LCD_DISP_OFF
 959                     ; 229 			LCD_CLEAR_DISPLAY();
 961  024f cd0000        	call	_LCD_CLEAR_DISPLAY
 963                     ; 230 			LCD_printtruc(1,5,"BATTERIE\n",0);
 965  0252 5f            	clrw	x
 966  0253 89            	pushw	x
 967  0254 ae00fa        	ldw	x,#L522
 968  0257 89            	pushw	x
 969  0258 ae0005        	ldw	x,#5
 970  025b a601          	ld	a,#1
 971  025d 95            	ld	xh,a
 972  025e cd0000        	call	_LCD_printtruc
 974  0261 5b04          	addw	sp,#4
 975                     ; 231 			LCD_printtruc(2,6,"FAIBLE\n",0);
 977  0263 5f            	clrw	x
 978  0264 89            	pushw	x
 979  0265 ae00f2        	ldw	x,#L722
 980  0268 89            	pushw	x
 981  0269 ae0006        	ldw	x,#6
 982  026c a602          	ld	a,#2
 983  026e 95            	ld	xh,a
 984  026f cd0000        	call	_LCD_printtruc
 986  0272 5b04          	addw	sp,#4
 987                     ; 232 			LCD_DISP_ON();
 989  0274 cd0000        	call	_LCD_DISP_ON
 991  0277               L122:
 992                     ; 237 }
 995  0277 5b04          	addw	sp,#4
 996  0279 81            	ret	
1036                     ; 239 void chronobat(void) // Autonomie batterie f des gaz
1036                     ; 240 {
1037                     	switch	.text
1038  027a               _chronobat:
1040  027a 89            	pushw	x
1041       00000002      OFST:	set	2
1044                     ; 243 	if (output.secumoteur != 255)
1046  027b c60000        	ld	a,_output
1047  027e a1ff          	cp	a,#255
1048  0280 2603cc032a    	jreq	L742
1049                     ; 245 		temp = output.usValueOut[output.secumoteur];
1051  0285 5f            	clrw	x
1052  0286 97            	ld	xl,a
1053  0287 58            	sllw	x
1054  0288 de0059        	ldw	x,(_output+89,x)
1055                     ; 246 		temp -= MIN_COURSE;
1057  028b 1d07d0        	subw	x,#2000
1058                     ; 247 		temp /= 20;
1060  028e 90ae0014      	ldw	y,#20
1061  0292 65            	divw	x,y
1062                     ; 248 		temp *= ratiobat;
1064  0293 b601          	ld	a,_ratiobat
1065  0295 905f          	clrw	y
1066  0297 9097          	ld	yl,a
1067  0299 cd0000        	call	c_imul
1069  029c 5d            	tnzw	x
1070                     ; 249 		if (temp == 0) temp = 1;
1072  029d 2601          	jrne	L152
1075  029f 5c            	incw	x
1076  02a0               L152:
1077                     ; 250 		temp /= 180;
1079  02a0 a6b4          	ld	a,#180
1080  02a2 62            	div	x,a
1081  02a3 1f01          	ldw	(OFST-1,sp),x
1082                     ; 251 		chargeeaccus -= temp;
1084  02a5 be02          	ldw	x,_chargeeaccus
1085  02a7 72f001        	subw	x,(OFST-1,sp)
1086                     ; 252 		if (chargeeaccus > 9999) chargeeaccus = 0;
1088  02aa a32710        	cpw	x,#10000
1089  02ad 2501          	jrult	L352
1092  02af 5f            	clrw	x
1093  02b0               L352:
1094  02b0 bf02          	ldw	_chargeeaccus,x
1095                     ; 253 		temp = chargeeaccus/100;
1097  02b2 90ae0064      	ldw	y,#100
1098  02b6 65            	divw	x,y
1099  02b7 1f01          	ldw	(OFST-1,sp),x
1100                     ; 254 		if (Menu_actif == 0)	LCD_printtruc(2,9,"%2.2u%%\n",temp);
1102  02b9 7200000012    	btjt	_Menu_actif,L552
1105  02be 89            	pushw	x
1106  02bf ae00e9        	ldw	x,#L752
1107  02c2 89            	pushw	x
1108  02c3 ae0009        	ldw	x,#9
1109  02c6 a602          	ld	a,#2
1110  02c8 95            	ld	xh,a
1111  02c9 cd0000        	call	_LCD_printtruc
1113  02cc 5b04          	addw	sp,#4
1114  02ce 1e01          	ldw	x,(OFST-1,sp)
1115  02d0               L552:
1116                     ; 255 		if (temp == 50) bip(3,0,0,0,0);
1118  02d0 a30032        	cpw	x,#50
1119  02d3 2611          	jrne	L162
1122  02d5 4b00          	push	#0
1123  02d7 4b00          	push	#0
1124  02d9 4b00          	push	#0
1125  02db 5f            	clrw	x
1126  02dc a603          	ld	a,#3
1127  02de 95            	ld	xh,a
1128  02df cd0000        	call	_bip
1130  02e2 5b03          	addw	sp,#3
1131  02e4 1e01          	ldw	x,(OFST-1,sp)
1132  02e6               L162:
1133                     ; 256 		if (temp == 40) bip(6,0,0,0,0);
1135  02e6 a30028        	cpw	x,#40
1136  02e9 2611          	jrne	L362
1139  02eb 4b00          	push	#0
1140  02ed 4b00          	push	#0
1141  02ef 4b00          	push	#0
1142  02f1 5f            	clrw	x
1143  02f2 a606          	ld	a,#6
1144  02f4 95            	ld	xh,a
1145  02f5 cd0000        	call	_bip
1147  02f8 5b03          	addw	sp,#3
1148  02fa 1e01          	ldw	x,(OFST-1,sp)
1149  02fc               L362:
1150                     ; 257 		if (temp == 30) bip(12,1,12,1,12);
1152  02fc a3001e        	cpw	x,#30
1153  02ff 2613          	jrne	L562
1156  0301 4b0c          	push	#12
1157  0303 4b01          	push	#1
1158  0305 4b0c          	push	#12
1159  0307 ae0001        	ldw	x,#1
1160  030a a60c          	ld	a,#12
1161  030c 95            	ld	xh,a
1162  030d cd0000        	call	_bip
1164  0310 5b03          	addw	sp,#3
1165  0312 1e01          	ldw	x,(OFST-1,sp)
1166  0314               L562:
1167                     ; 258 		if (temp == 20) bip(12,2,36,1,36);
1169  0314 a30014        	cpw	x,#20
1170  0317 2611          	jrne	L742
1173  0319 4b24          	push	#36
1174  031b 4b01          	push	#1
1175  031d 4b24          	push	#36
1176  031f ae0002        	ldw	x,#2
1177  0322 a60c          	ld	a,#12
1178  0324 95            	ld	xh,a
1179  0325 cd0000        	call	_bip
1181  0328 5b03          	addw	sp,#3
1182  032a               L742:
1183                     ; 260 }
1186  032a 85            	popw	x
1187  032b 81            	ret	
1230                     ; 262 s8 sortiepourcent(u16 sortie) // Valeurs des temps en %
1230                     ; 263 {	
1231                     	switch	.text
1232  032c               _sortiepourcent:
1234  032c 89            	pushw	x
1235       00000002      OFST:	set	2
1238                     ; 265 	a= (sortie - NEUTRE_COURSE);
1240  032d 1d0bb8        	subw	x,#3000
1241                     ; 266 	a=a/10;
1243  0330 a60a          	ld	a,#10
1244  0332 cd0000        	call	c_sdivx
1246  0335 1f01          	ldw	(OFST-1,sp),x
1247                     ; 267 	return a;
1249  0337 7b02          	ld	a,(OFST+0,sp)
1252  0339 85            	popw	x
1253  033a 81            	ret	
1287                     ; 270 u16 pourcentsortie(s8 pourcent)
1287                     ; 271 { 
1288                     	switch	.text
1289  033b               _pourcentsortie:
1293                     ; 272 	return ((pourcent * 10) + NEUTRE_COURSE);
1295  033b 5f            	clrw	x
1296  033c 4d            	tnz	a
1297  033d 2a01          	jrpl	L421
1298  033f 53            	cplw	x
1299  0340               L421:
1300  0340 97            	ld	xl,a
1301  0341 90ae000a      	ldw	y,#10
1302  0345 cd0000        	call	c_imul
1304  0348 1c0bb8        	addw	x,#3000
1307  034b 81            	ret	
1350                     ; 276 u8 nivbar(u16 sortie) // Pour baragraphe info
1350                     ; 277 {	
1351                     	switch	.text
1352  034c               _nivbar:
1354  034c 89            	pushw	x
1355       00000002      OFST:	set	2
1358                     ; 279 	a= (sortie - MIN_COURSE);
1360  034d 1d07d0        	subw	x,#2000
1361                     ; 280 	a = (a / 133);
1363  0350 a685          	ld	a,#133
1364  0352 62            	div	x,a
1365  0353 1f01          	ldw	(OFST-1,sp),x
1366                     ; 281 	return (u8)a;
1368  0355 7b02          	ld	a,(OFST+0,sp)
1371  0357 85            	popw	x
1372  0358 81            	ret	
1426                     ; 284 u32 FLASH_ProgramdoubleByte(u32 add,u16 val)
1426                     ; 285 {
1427                     	switch	.text
1428  0359               _FLASH_ProgramdoubleByte:
1430  0359 88            	push	a
1431       00000001      OFST:	set	1
1434                     ; 288 	tval = val  & 0xff;
1436  035a 7b09          	ld	a,(OFST+8,sp)
1437                     ; 289 	FLASH_ProgramByte(add, val);
1439  035c 88            	push	a
1440  035d 1e07          	ldw	x,(OFST+6,sp)
1441  035f 89            	pushw	x
1442  0360 1e07          	ldw	x,(OFST+6,sp)
1443  0362 89            	pushw	x
1444  0363 cd0000        	call	_FLASH_ProgramByte
1446  0366 5b05          	addw	sp,#5
1447                     ; 290 	add ++;
1449  0368 96            	ldw	x,sp
1450  0369 1c0004        	addw	x,#OFST+3
1451  036c a601          	ld	a,#1
1452  036e cd0000        	call	c_lgadc
1454                     ; 292 	tval = (val >> 8) & 0xff;
1456  0371 7b08          	ld	a,(OFST+7,sp)
1457  0373 6b01          	ld	(OFST+0,sp),a
1458                     ; 293 	FLASH_ProgramByte(add, tval);
1460  0375 88            	push	a
1461  0376 1e07          	ldw	x,(OFST+6,sp)
1462  0378 89            	pushw	x
1463  0379 1e07          	ldw	x,(OFST+6,sp)
1464  037b 89            	pushw	x
1465  037c cd0000        	call	_FLASH_ProgramByte
1467  037f 5b05          	addw	sp,#5
1468                     ; 294 	add ++;
1470  0381 96            	ldw	x,sp
1471  0382 1c0004        	addw	x,#OFST+3
1472  0385 a601          	ld	a,#1
1473  0387 cd0000        	call	c_lgadc
1475                     ; 296 	return add;
1477  038a 96            	ldw	x,sp
1478  038b 1c0004        	addw	x,#OFST+3
1479  038e cd0000        	call	c_ltor
1483  0391 84            	pop	a
1484  0392 81            	ret	
1547                     ; 299 u16 FLASH_ReaddoubleByte(u32 add)
1547                     ; 300 {
1548                     	switch	.text
1549  0393               _FLASH_ReaddoubleByte:
1551  0393 5204          	subw	sp,#4
1552       00000004      OFST:	set	4
1555                     ; 305 	datal = FLASH_ReadByte(add);
1557  0395 1e09          	ldw	x,(OFST+5,sp)
1558  0397 89            	pushw	x
1559  0398 1e09          	ldw	x,(OFST+5,sp)
1560  039a 89            	pushw	x
1561  039b cd0000        	call	_FLASH_ReadByte
1563  039e 5b04          	addw	sp,#4
1564  03a0 6b01          	ld	(OFST-3,sp),a
1565                     ; 306 	add = add + 1;
1567  03a2 96            	ldw	x,sp
1568  03a3 1c0007        	addw	x,#OFST+3
1569  03a6 a601          	ld	a,#1
1570  03a8 cd0000        	call	c_lgadc
1572                     ; 307 	datah = FLASH_ReadByte(add);
1574  03ab 1e09          	ldw	x,(OFST+5,sp)
1575  03ad 89            	pushw	x
1576  03ae 1e09          	ldw	x,(OFST+5,sp)
1577  03b0 89            	pushw	x
1578  03b1 cd0000        	call	_FLASH_ReadByte
1580  03b4 5b04          	addw	sp,#4
1581  03b6 6b02          	ld	(OFST-2,sp),a
1582                     ; 308 	val = 256 * datah + datal;
1584  03b8 5f            	clrw	x
1585  03b9 97            	ld	xl,a
1586  03ba 4f            	clr	a
1587  03bb 1b01          	add	a,(OFST-3,sp)
1588  03bd 2401          	jrnc	L441
1589  03bf 5c            	incw	x
1590  03c0               L441:
1591  03c0 02            	rlwa	x,a
1592                     ; 310 	return val;
1596  03c1 5b04          	addw	sp,#4
1597  03c3 81            	ret	
1635                     ; 313 void reset_model(void)
1635                     ; 314 {
1636                     	switch	.text
1637  03c4               _reset_model:
1639  03c4 88            	push	a
1640       00000001      OFST:	set	1
1643                     ; 318 	for(i = 0; i < NUM_INPUT; i++)
1645  03c5 4f            	clr	a
1646  03c6 6b01          	ld	(OFST+0,sp),a
1647  03c8               L154:
1648                     ; 320 		input.channel[i].usMinValue = 0;
1650  03c8 97            	ld	xl,a
1651  03c9 a612          	ld	a,#18
1652  03cb 42            	mul	x,a
1653  03cc 905f          	clrw	y
1654  03ce df00ad        	ldw	(_input+2,x),y
1655                     ; 321 		input.channel[i].usNeutralValue = 511;
1657  03d1 90ae01ff      	ldw	y,#511
1658  03d5 df00af        	ldw	(_input+4,x),y
1659                     ; 322 		input.channel[i].usMaxValue = 1023;
1661  03d8 90ae03ff      	ldw	y,#1023
1662  03dc df00b1        	ldw	(_input+6,x),y
1663                     ; 323 		input.channel[i].expo[0] = 0;
1665  03df 724f00bb      	clr	(_input+16,x)
1666                     ; 324 		input.channel[i].expo[1] = 0;
1668  03e3 724f00bc      	clr	(_input+17,x)
1669                     ; 318 	for(i = 0; i < NUM_INPUT; i++)
1671  03e7 0c01          	inc	(OFST+0,sp)
1674  03e9 7b01          	ld	a,(OFST+0,sp)
1675  03eb a106          	cp	a,#6
1676  03ed 25d9          	jrult	L154
1677                     ; 329 	for(i = 0; i < NUM_MIXER; i++)
1679  03ef 4f            	clr	a
1680  03f0 6b01          	ld	(OFST+0,sp),a
1681  03f2               L754:
1682                     ; 331 		if(i < NUM_INPUT + NUM_INPUT_SWITCH)
1684  03f2 a108          	cp	a,#8
1685  03f4 97            	ld	xl,a
1686  03f5 a604          	ld	a,#4
1687  03f7 2425          	jruge	L564
1688                     ; 333 			mixer[i].in = i;
1690  03f9 42            	mul	x,a
1691  03fa 7b01          	ld	a,(OFST+0,sp)
1692  03fc d7006b        	ld	(_mixer,x),a
1693                     ; 334 			mixer[i].out = i;
1695  03ff 97            	ld	xl,a
1696  0400 a604          	ld	a,#4
1697  0402 42            	mul	x,a
1698  0403 7b01          	ld	a,(OFST+0,sp)
1699  0405 d7006c        	ld	(_mixer+1,x),a
1700                     ; 335 			mixer[i].pente[0] = 100;
1702  0408 97            	ld	xl,a
1703  0409 a604          	ld	a,#4
1704  040b 42            	mul	x,a
1705  040c a664          	ld	a,#100
1706  040e d7006d        	ld	(_mixer+2,x),a
1707                     ; 336 			mixer[i].pente[1] = 100;
1709  0411 7b01          	ld	a,(OFST+0,sp)
1710  0413 97            	ld	xl,a
1711  0414 a604          	ld	a,#4
1712  0416 42            	mul	x,a
1713  0417 a664          	ld	a,#100
1714  0419 d7006e        	ld	(_mixer+3,x),a
1716  041c 2011          	jra	L764
1717  041e               L564:
1718                     ; 341 			mixer[i].in = 255;
1720  041e 42            	mul	x,a
1721  041f a6ff          	ld	a,#255
1722  0421 d7006b        	ld	(_mixer,x),a
1723                     ; 342 			mixer[i].out = 255;
1725  0424 d7006c        	ld	(_mixer+1,x),a
1726                     ; 343 			mixer[i].pente[0] = 0;
1728  0427 724f006d      	clr	(_mixer+2,x)
1729                     ; 344 			mixer[i].pente[1] = 0;
1731  042b 724f006e      	clr	(_mixer+3,x)
1732  042f               L764:
1733                     ; 329 	for(i = 0; i < NUM_MIXER; i++)
1735  042f 0c01          	inc	(OFST+0,sp)
1738  0431 7b01          	ld	a,(OFST+0,sp)
1739  0433 a110          	cp	a,#16
1740  0435 25bb          	jrult	L754
1741                     ; 352 	output.usValueOut[NUM_OUTPUT] =  LONGUEUR_TRAME; //22.5 ms
1743  0437 aeac44        	ldw	x,#44100
1744  043a cf0069        	ldw	_output+105,x
1745                     ; 354 	for(i = 0; i < NUM_OUTPUT ; i++)
1747  043d 4f            	clr	a
1748  043e 6b01          	ld	(OFST+0,sp),a
1749  0440               L174:
1750                     ; 356 		output.dr[i] = 100;
1752  0440 5f            	clrw	x
1753  0441 97            	ld	xl,a
1754  0442 a664          	ld	a,#100
1755  0444 d70001        	ld	(_output+1,x),a
1756                     ; 357 		output.sValue[i] = 0;
1758  0447 7b01          	ld	a,(OFST+0,sp)
1759  0449 97            	ld	xl,a
1760  044a a604          	ld	a,#4
1761  044c 42            	mul	x,a
1762  044d 4f            	clr	a
1763  044e d7000c        	ld	(_output+12,x),a
1764  0451 d7000b        	ld	(_output+11,x),a
1765  0454 d7000a        	ld	(_output+10,x),a
1766  0457 d70009        	ld	(_output+9,x),a
1767                     ; 358 		output.usValueOut[i] = NEUTRE_COURSE;
1769  045a 5f            	clrw	x
1770  045b 7b01          	ld	a,(OFST+0,sp)
1771  045d 97            	ld	xl,a
1772  045e 58            	sllw	x
1773  045f 90ae0bb8      	ldw	y,#3000
1774  0463 df0059        	ldw	(_output+89,x),y
1775                     ; 359 		output.usMinValue[i] = MIN_COURSE;
1777  0466 90ae07d0      	ldw	y,#2000
1778  046a df0029        	ldw	(_output+41,x),y
1779                     ; 360 		output.usNeutralValue[i] = NEUTRE_COURSE;
1781  046d 90ae0bb8      	ldw	y,#3000
1782  0471 df0039        	ldw	(_output+57,x),y
1783                     ; 361 		output.usMaxValue[i] = MAX_COURSE;
1785  0474 90ae0fa0      	ldw	y,#4000
1786  0478 df0049        	ldw	(_output+73,x),y
1787                     ; 362 		output.usValueOut[NUM_OUTPUT] = output.usValueOut[NUM_OUTPUT] - output.usValueOut[i];
1789  047b 905f          	clrw	y
1790  047d ce0069        	ldw	x,_output+105
1791  0480 9097          	ld	yl,a
1792  0482 9058          	sllw	y
1793  0484 90de0059      	ldw	y,(_output+89,y)
1794  0488 90bf00        	ldw	c_x,y
1795  048b 72b00000      	subw	x,c_x
1796  048f cf0069        	ldw	_output+105,x
1797                     ; 354 	for(i = 0; i < NUM_OUTPUT ; i++)
1799  0492 0c01          	inc	(OFST+0,sp)
1802  0494 7b01          	ld	a,(OFST+0,sp)
1803  0496 a108          	cp	a,#8
1804  0498 25a6          	jrult	L174
1805                     ; 365 	output.secumoteur = 255;
1807  049a 35ff0000      	mov	_output,#255
1808                     ; 366 	ratiobat = 0;
1810  049e 3f01          	clr	_ratiobat
1811                     ; 367 }
1814  04a0 84            	pop	a
1815  04a1 81            	ret	
1879                     	switch	.const
1880  0020               L251:
1881  0020 00004002      	dc.l	16386
1882                     ; 369 void load_input(u8 model)
1882                     ; 370 {
1883                     	switch	.text
1884  04a2               _load_input:
1886  04a2 520b          	subw	sp,#11
1887       0000000b      OFST:	set	11
1890                     ; 371 	u8 i = 0;
1892                     ; 374 	u32 addr = BASE_EEPROM + MODEL_ACTUEL_LENGTH + 1;
1894                     ; 376 	addr = addr + (((NUM_PHASE * PHASE_LENGTH) + INPUT_LENGTH ) * model);
1896  04a4 97            	ld	xl,a
1897  04a5 4f            	clr	a
1898  04a6 02            	rlwa	x,a
1899  04a7 cd0000        	call	c_itolx
1901  04aa ae0020        	ldw	x,#L251
1902  04ad cd0000        	call	c_ladd
1904  04b0 96            	ldw	x,sp
1905  04b1 1c0007        	addw	x,#OFST-4
1906  04b4 cd0000        	call	c_rtol
1908                     ; 378 	flashencour = 1;
1910  04b7 72100009      	bset	_flashencour
1911                     ; 380 	for(i = 0; i < NUM_INPUT; i++)
1913  04bb 0f0b          	clr	(OFST+0,sp)
1914  04bd               L135:
1915                     ; 382 		input.channel[i].usMinValue = FLASH_ReaddoubleByte(addr);
1917  04bd 1e09          	ldw	x,(OFST-2,sp)
1918  04bf 89            	pushw	x
1919  04c0 1e09          	ldw	x,(OFST-2,sp)
1920  04c2 89            	pushw	x
1921  04c3 cd0393        	call	_FLASH_ReaddoubleByte
1923  04c6 5b04          	addw	sp,#4
1924  04c8 1f03          	ldw	(OFST-8,sp),x
1925  04ca 7b0b          	ld	a,(OFST+0,sp)
1926  04cc 97            	ld	xl,a
1927  04cd a612          	ld	a,#18
1928  04cf 42            	mul	x,a
1929  04d0 1603          	ldw	y,(OFST-8,sp)
1930  04d2 df00ad        	ldw	(_input+2,x),y
1931                     ; 383 		addr = addr + 2;	
1933  04d5 96            	ldw	x,sp
1934  04d6 1c0007        	addw	x,#OFST-4
1935  04d9 a602          	ld	a,#2
1936  04db cd0000        	call	c_lgadc
1938                     ; 385 		input.channel[i].usNeutralValue = FLASH_ReaddoubleByte(addr);
1940  04de 1e09          	ldw	x,(OFST-2,sp)
1941  04e0 89            	pushw	x
1942  04e1 1e09          	ldw	x,(OFST-2,sp)
1943  04e3 89            	pushw	x
1944  04e4 cd0393        	call	_FLASH_ReaddoubleByte
1946  04e7 5b04          	addw	sp,#4
1947  04e9 1f03          	ldw	(OFST-8,sp),x
1948  04eb 7b0b          	ld	a,(OFST+0,sp)
1949  04ed 97            	ld	xl,a
1950  04ee a612          	ld	a,#18
1951  04f0 42            	mul	x,a
1952  04f1 1603          	ldw	y,(OFST-8,sp)
1953  04f3 df00af        	ldw	(_input+4,x),y
1954                     ; 386 		addr = addr + 2;	
1956  04f6 96            	ldw	x,sp
1957  04f7 1c0007        	addw	x,#OFST-4
1958  04fa a602          	ld	a,#2
1959  04fc cd0000        	call	c_lgadc
1961                     ; 388 		input.channel[i].usMaxValue = FLASH_ReaddoubleByte(addr);
1963  04ff 1e09          	ldw	x,(OFST-2,sp)
1964  0501 89            	pushw	x
1965  0502 1e09          	ldw	x,(OFST-2,sp)
1966  0504 89            	pushw	x
1967  0505 cd0393        	call	_FLASH_ReaddoubleByte
1969  0508 5b04          	addw	sp,#4
1970  050a 1f03          	ldw	(OFST-8,sp),x
1971  050c 7b0b          	ld	a,(OFST+0,sp)
1972  050e 97            	ld	xl,a
1973  050f a612          	ld	a,#18
1974  0511 42            	mul	x,a
1975  0512 1603          	ldw	y,(OFST-8,sp)
1976  0514 df00b1        	ldw	(_input+6,x),y
1977                     ; 389 		addr = addr + 2;	                
1979  0517 96            	ldw	x,sp
1980  0518 1c0007        	addw	x,#OFST-4
1981  051b a602          	ld	a,#2
1982  051d cd0000        	call	c_lgadc
1984                     ; 391 		delta2 = (input.channel[i].usNeutralValue - input.channel[i].usMinValue);
1986  0520 7b0b          	ld	a,(OFST+0,sp)
1987  0522 97            	ld	xl,a
1988  0523 a612          	ld	a,#18
1989  0525 42            	mul	x,a
1990  0526 de00ad        	ldw	x,(_input+2,x)
1991  0529 1f03          	ldw	(OFST-8,sp),x
1992  052b 7b0b          	ld	a,(OFST+0,sp)
1993  052d 97            	ld	xl,a
1994  052e a612          	ld	a,#18
1995  0530 42            	mul	x,a
1996  0531 de00af        	ldw	x,(_input+4,x)
1997  0534 72f003        	subw	x,(OFST-8,sp)
1998  0537 1f05          	ldw	(OFST-6,sp),x
1999                     ; 392 		if (delta2 > 4) input.channel[i].pente[0] = 256000 / delta2;
2001  0539 a30005        	cpw	x,#5
2002  053c 2525          	jrult	L735
2005  053e cd0000        	call	c_uitolx
2007  0541 96            	ldw	x,sp
2008  0542 5c            	incw	x
2009  0543 cd0000        	call	c_rtol
2011  0546 aee800        	ldw	x,#59392
2012  0549 bf02          	ldw	c_lreg+2,x
2013  054b ae0003        	ldw	x,#3
2014  054e bf00          	ldw	c_lreg,x
2015  0550 96            	ldw	x,sp
2016  0551 5c            	incw	x
2017  0552 cd0000        	call	c_ldiv
2019  0555 7b0b          	ld	a,(OFST+0,sp)
2020  0557 97            	ld	xl,a
2021  0558 a612          	ld	a,#18
2022  055a 42            	mul	x,a
2023  055b 1c00b3        	addw	x,#_input+8
2024  055e cd0000        	call	c_rtol
2027  0561 2015          	jra	L145
2028  0563               L735:
2029                     ; 393 		else input.channel[i].pente[0] = 0xFFFF;
2031  0563 7b0b          	ld	a,(OFST+0,sp)
2032  0565 97            	ld	xl,a
2033  0566 a612          	ld	a,#18
2034  0568 42            	mul	x,a
2035  0569 a6ff          	ld	a,#255
2036  056b d700b6        	ld	(_input+11,x),a
2037  056e d700b5        	ld	(_input+10,x),a
2038  0571 4f            	clr	a
2039  0572 d700b4        	ld	(_input+9,x),a
2040  0575 d700b3        	ld	(_input+8,x),a
2041  0578               L145:
2042                     ; 395 		delta2 = (input.channel[i].usMaxValue - input.channel[i].usNeutralValue);
2044  0578 7b0b          	ld	a,(OFST+0,sp)
2045  057a 97            	ld	xl,a
2046  057b a612          	ld	a,#18
2047  057d 42            	mul	x,a
2048  057e de00af        	ldw	x,(_input+4,x)
2049  0581 1f03          	ldw	(OFST-8,sp),x
2050  0583 7b0b          	ld	a,(OFST+0,sp)
2051  0585 97            	ld	xl,a
2052  0586 a612          	ld	a,#18
2053  0588 42            	mul	x,a
2054  0589 de00b1        	ldw	x,(_input+6,x)
2055  058c 72f003        	subw	x,(OFST-8,sp)
2056  058f 1f05          	ldw	(OFST-6,sp),x
2057                     ; 396 		if (delta2 > 4) input.channel[i].pente[1] = 256000 / delta2;
2059  0591 a30005        	cpw	x,#5
2060  0594 2525          	jrult	L345
2063  0596 cd0000        	call	c_uitolx
2065  0599 96            	ldw	x,sp
2066  059a 5c            	incw	x
2067  059b cd0000        	call	c_rtol
2069  059e aee800        	ldw	x,#59392
2070  05a1 bf02          	ldw	c_lreg+2,x
2071  05a3 ae0003        	ldw	x,#3
2072  05a6 bf00          	ldw	c_lreg,x
2073  05a8 96            	ldw	x,sp
2074  05a9 5c            	incw	x
2075  05aa cd0000        	call	c_ldiv
2077  05ad 7b0b          	ld	a,(OFST+0,sp)
2078  05af 97            	ld	xl,a
2079  05b0 a612          	ld	a,#18
2080  05b2 42            	mul	x,a
2081  05b3 1c00b7        	addw	x,#_input+12
2082  05b6 cd0000        	call	c_rtol
2085  05b9 2015          	jra	L545
2086  05bb               L345:
2087                     ; 397 		else input.channel[i].pente[1] = 0xFFFF;
2089  05bb 7b0b          	ld	a,(OFST+0,sp)
2090  05bd 97            	ld	xl,a
2091  05be a612          	ld	a,#18
2092  05c0 42            	mul	x,a
2093  05c1 a6ff          	ld	a,#255
2094  05c3 d700ba        	ld	(_input+15,x),a
2095  05c6 d700b9        	ld	(_input+14,x),a
2096  05c9 4f            	clr	a
2097  05ca d700b8        	ld	(_input+13,x),a
2098  05cd d700b7        	ld	(_input+12,x),a
2099  05d0               L545:
2100                     ; 380 	for(i = 0; i < NUM_INPUT; i++)
2102  05d0 0c0b          	inc	(OFST+0,sp)
2105  05d2 7b0b          	ld	a,(OFST+0,sp)
2106  05d4 a106          	cp	a,#6
2107  05d6 2403cc04bd    	jrult	L135
2108                     ; 399 	flashencour = 0;
2110  05db 72110009      	bres	_flashencour
2111                     ; 400 }
2114  05df 5b0b          	addw	sp,#11
2115  05e1 81            	ret	
2194                     	switch	.const
2195  0024               L461:
2196  0024 00004026      	dc.l	16422
2197                     ; 402 void load_phase(u8 phase)
2197                     ; 403 {
2198                     	switch	.text
2199  05e2               _load_phase:
2201  05e2 88            	push	a
2202  05e3 5206          	subw	sp,#6
2203       00000006      OFST:	set	6
2206                     ; 404 	u8 i = 0;
2208                     ; 405 	u8 j = 0;
2210                     ; 408 	u32 addr = BASE_EEPROM + MODEL_ACTUEL_LENGTH + 1;
2212                     ; 410 	addr = addr + INPUT_LENGTH  + (((NUM_PHASE * PHASE_LENGTH) + INPUT_LENGTH ) * modele_actuel);
2214  05e5 b633          	ld	a,_modele_actuel
2215  05e7 97            	ld	xl,a
2216  05e8 4f            	clr	a
2217  05e9 02            	rlwa	x,a
2218  05ea cd0000        	call	c_itolx
2220  05ed ae0024        	ldw	x,#L461
2221  05f0 cd0000        	call	c_ladd
2223  05f3 96            	ldw	x,sp
2224  05f4 1c0003        	addw	x,#OFST-3
2225  05f7 cd0000        	call	c_rtol
2227                     ; 412 	addr = addr + ( PHASE_LENGTH * phase );
2229  05fa 7b07          	ld	a,(OFST+1,sp)
2230  05fc 97            	ld	xl,a
2231  05fd a66e          	ld	a,#110
2232  05ff 42            	mul	x,a
2233  0600 cd0000        	call	c_itolx
2235  0603 96            	ldw	x,sp
2236  0604 1c0003        	addw	x,#OFST-3
2237  0607 cd0000        	call	c_lgadd
2239                     ; 414 	flashencour = 1;
2241  060a 72100009      	bset	_flashencour
2242                     ; 416 	for(i = 0; i < NUM_INPUT; i++)
2244  060e 0f02          	clr	(OFST-4,sp)
2245  0610               L506:
2246                     ; 418 		for(j = 0; j < 2; j++)
2248  0610 0f01          	clr	(OFST-5,sp)
2249  0612               L316:
2250                     ; 420 			input.channel[i].expo[j] = FLASH_ReadByte(addr);
2252  0612 7b02          	ld	a,(OFST-4,sp)
2253  0614 97            	ld	xl,a
2254  0615 a612          	ld	a,#18
2255  0617 42            	mul	x,a
2256  0618 01            	rrwa	x,a
2257  0619 1b01          	add	a,(OFST-5,sp)
2258  061b 2401          	jrnc	L661
2259  061d 5c            	incw	x
2260  061e               L661:
2261  061e 02            	rlwa	x,a
2262  061f 89            	pushw	x
2263  0620 1e07          	ldw	x,(OFST+1,sp)
2264  0622 89            	pushw	x
2265  0623 1e07          	ldw	x,(OFST+1,sp)
2266  0625 89            	pushw	x
2267  0626 cd0000        	call	_FLASH_ReadByte
2269  0629 5b04          	addw	sp,#4
2270  062b 85            	popw	x
2271  062c d700bb        	ld	(_input+16,x),a
2272                     ; 421 			addr++;
2274  062f 96            	ldw	x,sp
2275  0630 1c0003        	addw	x,#OFST-3
2276  0633 a601          	ld	a,#1
2277  0635 cd0000        	call	c_lgadc
2279                     ; 418 		for(j = 0; j < 2; j++)
2281  0638 0c01          	inc	(OFST-5,sp)
2284  063a 7b01          	ld	a,(OFST-5,sp)
2285  063c a102          	cp	a,#2
2286  063e 25d2          	jrult	L316
2287                     ; 416 	for(i = 0; i < NUM_INPUT; i++)
2289  0640 0c02          	inc	(OFST-4,sp)
2292  0642 7b02          	ld	a,(OFST-4,sp)
2293  0644 a106          	cp	a,#6
2294  0646 25c8          	jrult	L506
2295                     ; 426 	for(i = 0; i < NUM_MIXER; i++)
2297  0648 4f            	clr	a
2298  0649 6b02          	ld	(OFST-4,sp),a
2299  064b               L126:
2300                     ; 428 		mixer[i].in = FLASH_ReadByte(addr);
2302  064b 97            	ld	xl,a
2303  064c a604          	ld	a,#4
2304  064e 42            	mul	x,a
2305  064f 89            	pushw	x
2306  0650 1e07          	ldw	x,(OFST+1,sp)
2307  0652 89            	pushw	x
2308  0653 1e07          	ldw	x,(OFST+1,sp)
2309  0655 89            	pushw	x
2310  0656 cd0000        	call	_FLASH_ReadByte
2312  0659 5b04          	addw	sp,#4
2313  065b 85            	popw	x
2314  065c d7006b        	ld	(_mixer,x),a
2315                     ; 429 		addr++;
2317  065f 96            	ldw	x,sp
2318  0660 1c0003        	addw	x,#OFST-3
2319  0663 a601          	ld	a,#1
2320  0665 cd0000        	call	c_lgadc
2322                     ; 430 		mixer[i].out = FLASH_ReadByte(addr);
2324  0668 7b02          	ld	a,(OFST-4,sp)
2325  066a 97            	ld	xl,a
2326  066b a604          	ld	a,#4
2327  066d 42            	mul	x,a
2328  066e 89            	pushw	x
2329  066f 1e07          	ldw	x,(OFST+1,sp)
2330  0671 89            	pushw	x
2331  0672 1e07          	ldw	x,(OFST+1,sp)
2332  0674 89            	pushw	x
2333  0675 cd0000        	call	_FLASH_ReadByte
2335  0678 5b04          	addw	sp,#4
2336  067a 85            	popw	x
2337  067b d7006c        	ld	(_mixer+1,x),a
2338                     ; 431 		addr++;
2340  067e 96            	ldw	x,sp
2341  067f 1c0003        	addw	x,#OFST-3
2342  0682 a601          	ld	a,#1
2343  0684 cd0000        	call	c_lgadc
2345                     ; 432 		mixer[i].pente[0] = FLASH_ReadByte(addr);
2347  0687 7b02          	ld	a,(OFST-4,sp)
2348  0689 97            	ld	xl,a
2349  068a a604          	ld	a,#4
2350  068c 42            	mul	x,a
2351  068d 89            	pushw	x
2352  068e 1e07          	ldw	x,(OFST+1,sp)
2353  0690 89            	pushw	x
2354  0691 1e07          	ldw	x,(OFST+1,sp)
2355  0693 89            	pushw	x
2356  0694 cd0000        	call	_FLASH_ReadByte
2358  0697 5b04          	addw	sp,#4
2359  0699 85            	popw	x
2360  069a d7006d        	ld	(_mixer+2,x),a
2361                     ; 433 		addr++;
2363  069d 96            	ldw	x,sp
2364  069e 1c0003        	addw	x,#OFST-3
2365  06a1 a601          	ld	a,#1
2366  06a3 cd0000        	call	c_lgadc
2368                     ; 434 		mixer[i].pente[1] = FLASH_ReadByte(addr);
2370  06a6 7b02          	ld	a,(OFST-4,sp)
2371  06a8 97            	ld	xl,a
2372  06a9 a604          	ld	a,#4
2373  06ab 42            	mul	x,a
2374  06ac 89            	pushw	x
2375  06ad 1e07          	ldw	x,(OFST+1,sp)
2376  06af 89            	pushw	x
2377  06b0 1e07          	ldw	x,(OFST+1,sp)
2378  06b2 89            	pushw	x
2379  06b3 cd0000        	call	_FLASH_ReadByte
2381  06b6 5b04          	addw	sp,#4
2382  06b8 85            	popw	x
2383  06b9 d7006e        	ld	(_mixer+3,x),a
2384                     ; 435 		addr++;		
2386  06bc 96            	ldw	x,sp
2387  06bd 1c0003        	addw	x,#OFST-3
2388  06c0 a601          	ld	a,#1
2389  06c2 cd0000        	call	c_lgadc
2391                     ; 426 	for(i = 0; i < NUM_MIXER; i++)
2393  06c5 0c02          	inc	(OFST-4,sp)
2396  06c7 7b02          	ld	a,(OFST-4,sp)
2397  06c9 a110          	cp	a,#16
2398  06cb 2403cc064b    	jrult	L126
2399                     ; 441 	for(i = 0; i < NUM_OUTPUT; i++)
2401  06d0 4f            	clr	a
2402  06d1 6b02          	ld	(OFST-4,sp),a
2403  06d3               L726:
2404                     ; 443 		output.dr[i] = FLASH_ReadByte(addr);
2406  06d3 5f            	clrw	x
2407  06d4 97            	ld	xl,a
2408  06d5 89            	pushw	x
2409  06d6 1e07          	ldw	x,(OFST+1,sp)
2410  06d8 89            	pushw	x
2411  06d9 1e07          	ldw	x,(OFST+1,sp)
2412  06db 89            	pushw	x
2413  06dc cd0000        	call	_FLASH_ReadByte
2415  06df 5b04          	addw	sp,#4
2416  06e1 85            	popw	x
2417  06e2 d70001        	ld	(_output+1,x),a
2418                     ; 444 		addr++;
2420  06e5 96            	ldw	x,sp
2421  06e6 1c0003        	addw	x,#OFST-3
2422  06e9 a601          	ld	a,#1
2423  06eb cd0000        	call	c_lgadc
2425                     ; 445 		temp = FLASH_ReadByte(addr);
2427  06ee 1e05          	ldw	x,(OFST-1,sp)
2428  06f0 89            	pushw	x
2429  06f1 1e05          	ldw	x,(OFST-1,sp)
2430  06f3 89            	pushw	x
2431  06f4 cd0000        	call	_FLASH_ReadByte
2433  06f7 5b04          	addw	sp,#4
2434  06f9 6b01          	ld	(OFST-5,sp),a
2435                     ; 446 		addr++;		
2437  06fb 96            	ldw	x,sp
2438  06fc 1c0003        	addw	x,#OFST-3
2439  06ff a601          	ld	a,#1
2440  0701 cd0000        	call	c_lgadc
2442                     ; 447 		output.usMinValue[i] = pourcentsortie(temp);
2444  0704 7b01          	ld	a,(OFST-5,sp)
2445  0706 cd033b        	call	_pourcentsortie
2447  0709 7b02          	ld	a,(OFST-4,sp)
2448  070b 905f          	clrw	y
2449  070d 9097          	ld	yl,a
2450  070f 9058          	sllw	y
2451  0711 90df0029      	ldw	(_output+41,y),x
2452                     ; 448 		temp = FLASH_ReadByte(addr);
2454  0715 1e05          	ldw	x,(OFST-1,sp)
2455  0717 89            	pushw	x
2456  0718 1e05          	ldw	x,(OFST-1,sp)
2457  071a 89            	pushw	x
2458  071b cd0000        	call	_FLASH_ReadByte
2460  071e 5b04          	addw	sp,#4
2461  0720 6b01          	ld	(OFST-5,sp),a
2462                     ; 449 		addr++;		
2464  0722 96            	ldw	x,sp
2465  0723 1c0003        	addw	x,#OFST-3
2466  0726 a601          	ld	a,#1
2467  0728 cd0000        	call	c_lgadc
2469                     ; 450 		output.usNeutralValue[i] = pourcentsortie(temp);
2471  072b 7b01          	ld	a,(OFST-5,sp)
2472  072d cd033b        	call	_pourcentsortie
2474  0730 7b02          	ld	a,(OFST-4,sp)
2475  0732 905f          	clrw	y
2476  0734 9097          	ld	yl,a
2477  0736 9058          	sllw	y
2478  0738 90df0039      	ldw	(_output+57,y),x
2479                     ; 451 		temp = FLASH_ReadByte(addr);
2481  073c 1e05          	ldw	x,(OFST-1,sp)
2482  073e 89            	pushw	x
2483  073f 1e05          	ldw	x,(OFST-1,sp)
2484  0741 89            	pushw	x
2485  0742 cd0000        	call	_FLASH_ReadByte
2487  0745 5b04          	addw	sp,#4
2488  0747 6b01          	ld	(OFST-5,sp),a
2489                     ; 452 		addr++;		
2491  0749 96            	ldw	x,sp
2492  074a 1c0003        	addw	x,#OFST-3
2493  074d a601          	ld	a,#1
2494  074f cd0000        	call	c_lgadc
2496                     ; 453 		output.usMaxValue[i] = pourcentsortie(temp);
2498  0752 7b01          	ld	a,(OFST-5,sp)
2499  0754 cd033b        	call	_pourcentsortie
2501  0757 7b02          	ld	a,(OFST-4,sp)
2502  0759 905f          	clrw	y
2503  075b 9097          	ld	yl,a
2504  075d 9058          	sllw	y
2505  075f 90df0049      	ldw	(_output+73,y),x
2506                     ; 441 	for(i = 0; i < NUM_OUTPUT; i++)
2508  0763 0c02          	inc	(OFST-4,sp)
2511  0765 7b02          	ld	a,(OFST-4,sp)
2512  0767 a108          	cp	a,#8
2513  0769 2403cc06d3    	jrult	L726
2514                     ; 457 	output.secumoteur = FLASH_ReadByte(addr);
2516  076e 1e05          	ldw	x,(OFST-1,sp)
2517  0770 89            	pushw	x
2518  0771 1e05          	ldw	x,(OFST-1,sp)
2519  0773 89            	pushw	x
2520  0774 cd0000        	call	_FLASH_ReadByte
2522  0777 5b04          	addw	sp,#4
2523  0779 c70000        	ld	_output,a
2524                     ; 458 	addr++;		
2526  077c 96            	ldw	x,sp
2527  077d 1c0003        	addw	x,#OFST-3
2528  0780 a601          	ld	a,#1
2529  0782 cd0000        	call	c_lgadc
2531                     ; 459 	ratiobat = FLASH_ReadByte(addr);
2533  0785 1e05          	ldw	x,(OFST-1,sp)
2534  0787 89            	pushw	x
2535  0788 1e05          	ldw	x,(OFST-1,sp)
2536  078a 89            	pushw	x
2537  078b cd0000        	call	_FLASH_ReadByte
2539  078e b701          	ld	_ratiobat,a
2540                     ; 460 	flashencour = 0;
2542  0790 72110009      	bres	_flashencour
2543  0794 5b04          	addw	sp,#4
2544                     ; 461 	phase_change = 0;
2546  0796 72110000      	bres	_phase_change
2547                     ; 463 }
2550  079a 5b07          	addw	sp,#7
2551  079c 81            	ret	
2609                     ; 465 void save_input(u8 model) // taille : (6 x NUM_INPUT) (36)
2609                     ; 466 {
2610                     	switch	.text
2611  079d               _save_input:
2613  079d 5205          	subw	sp,#5
2614       00000005      OFST:	set	5
2617                     ; 467 	u8 i = 0;
2619                     ; 469 	u32 addr = BASE_EEPROM + MODEL_ACTUEL_LENGTH + 1;
2621                     ; 471 	addr = addr + (((NUM_PHASE * PHASE_LENGTH) + INPUT_LENGTH ) * model);
2623  079f 97            	ld	xl,a
2624  07a0 4f            	clr	a
2625  07a1 02            	rlwa	x,a
2626  07a2 cd0000        	call	c_itolx
2628  07a5 ae0020        	ldw	x,#L251
2629  07a8 cd0000        	call	c_ladd
2631  07ab 96            	ldw	x,sp
2632  07ac 1c0002        	addw	x,#OFST-3
2633  07af cd0000        	call	c_rtol
2635                     ; 473 	flashencour = 1;
2637  07b2 72100009      	bset	_flashencour
2638                     ; 475 	FLASH_DeInit();
2640  07b6 cd0000        	call	_FLASH_DeInit
2642                     ; 477 	FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
2644  07b9 4f            	clr	a
2645  07ba cd0000        	call	_FLASH_SetProgrammingTime
2647                     ; 479 	FLASH_Unlock(FLASH_MEMTYPE_DATA);
2649  07bd a6f7          	ld	a,#247
2650  07bf cd0000        	call	_FLASH_Unlock
2652                     ; 483 	for(i = 0; i < NUM_INPUT; i++)
2654  07c2 4f            	clr	a
2655  07c3 6b01          	ld	(OFST-4,sp),a
2656  07c5               L366:
2657                     ; 485 		addr = FLASH_ProgramdoubleByte(addr,input.channel[i].usMinValue);
2659  07c5 97            	ld	xl,a
2660  07c6 a612          	ld	a,#18
2661  07c8 42            	mul	x,a
2662  07c9 de00ad        	ldw	x,(_input+2,x)
2663  07cc 89            	pushw	x
2664  07cd 1e06          	ldw	x,(OFST+1,sp)
2665  07cf 89            	pushw	x
2666  07d0 1e06          	ldw	x,(OFST+1,sp)
2667  07d2 89            	pushw	x
2668  07d3 cd0359        	call	_FLASH_ProgramdoubleByte
2670  07d6 5b06          	addw	sp,#6
2671  07d8 96            	ldw	x,sp
2672  07d9 1c0002        	addw	x,#OFST-3
2673  07dc cd0000        	call	c_rtol
2675                     ; 486 		addr = FLASH_ProgramdoubleByte(addr,input.channel[i].usNeutralValue);
2677  07df 7b01          	ld	a,(OFST-4,sp)
2678  07e1 97            	ld	xl,a
2679  07e2 a612          	ld	a,#18
2680  07e4 42            	mul	x,a
2681  07e5 de00af        	ldw	x,(_input+4,x)
2682  07e8 89            	pushw	x
2683  07e9 1e06          	ldw	x,(OFST+1,sp)
2684  07eb 89            	pushw	x
2685  07ec 1e06          	ldw	x,(OFST+1,sp)
2686  07ee 89            	pushw	x
2687  07ef cd0359        	call	_FLASH_ProgramdoubleByte
2689  07f2 5b06          	addw	sp,#6
2690  07f4 96            	ldw	x,sp
2691  07f5 1c0002        	addw	x,#OFST-3
2692  07f8 cd0000        	call	c_rtol
2694                     ; 487 		addr = FLASH_ProgramdoubleByte(addr,input.channel[i].usMaxValue);
2696  07fb 7b01          	ld	a,(OFST-4,sp)
2697  07fd 97            	ld	xl,a
2698  07fe a612          	ld	a,#18
2699  0800 42            	mul	x,a
2700  0801 de00b1        	ldw	x,(_input+6,x)
2701  0804 89            	pushw	x
2702  0805 1e06          	ldw	x,(OFST+1,sp)
2703  0807 89            	pushw	x
2704  0808 1e06          	ldw	x,(OFST+1,sp)
2705  080a 89            	pushw	x
2706  080b cd0359        	call	_FLASH_ProgramdoubleByte
2708  080e 5b06          	addw	sp,#6
2709  0810 96            	ldw	x,sp
2710  0811 1c0002        	addw	x,#OFST-3
2711  0814 cd0000        	call	c_rtol
2713                     ; 483 	for(i = 0; i < NUM_INPUT; i++)
2715  0817 0c01          	inc	(OFST-4,sp)
2718  0819 7b01          	ld	a,(OFST-4,sp)
2719  081b a106          	cp	a,#6
2720  081d 25a6          	jrult	L366
2721                     ; 489 	flashencour = 0;
2723  081f 72110009      	bres	_flashencour
2724                     ; 491 }
2727  0823 5b05          	addw	sp,#5
2728  0825 81            	ret	
2809                     ; 493 void save_phase(u8 phase) // taille : (2 x NUM_INPUT) + (4 x NUM_MIXER) + (3 x NUM_OUTPUT) + SECUMOTEUR_LENGTH (96)
2809                     ; 494 {
2810                     	switch	.text
2811  0826               _save_phase:
2813  0826 88            	push	a
2814  0827 5206          	subw	sp,#6
2815       00000006      OFST:	set	6
2818                     ; 495 	u8 i = 0;
2820                     ; 496 	u8 j = 0;
2822                     ; 499 	u32 addr = BASE_EEPROM + MODEL_ACTUEL_LENGTH + 1;
2824                     ; 501 	addr = addr + INPUT_LENGTH  + (((NUM_PHASE * PHASE_LENGTH) + INPUT_LENGTH ) * modele_actuel);
2826  0829 b633          	ld	a,_modele_actuel
2827  082b 97            	ld	xl,a
2828  082c 4f            	clr	a
2829  082d 02            	rlwa	x,a
2830  082e cd0000        	call	c_itolx
2832  0831 ae0024        	ldw	x,#L461
2833  0834 cd0000        	call	c_ladd
2835  0837 96            	ldw	x,sp
2836  0838 1c0003        	addw	x,#OFST-3
2837  083b cd0000        	call	c_rtol
2839                     ; 503 	addr = addr + ( PHASE_LENGTH * phase );
2841  083e 7b07          	ld	a,(OFST+1,sp)
2842  0840 97            	ld	xl,a
2843  0841 a66e          	ld	a,#110
2844  0843 42            	mul	x,a
2845  0844 cd0000        	call	c_itolx
2847  0847 96            	ldw	x,sp
2848  0848 1c0003        	addw	x,#OFST-3
2849  084b cd0000        	call	c_lgadd
2851                     ; 505 	flashencour = 1;
2853  084e 72100009      	bset	_flashencour
2854                     ; 507 	FLASH_DeInit();
2856  0852 cd0000        	call	_FLASH_DeInit
2858                     ; 509 	FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
2860  0855 4f            	clr	a
2861  0856 cd0000        	call	_FLASH_SetProgrammingTime
2863                     ; 511 	FLASH_Unlock(FLASH_MEMTYPE_DATA);
2865  0859 a6f7          	ld	a,#247
2866  085b cd0000        	call	_FLASH_Unlock
2868                     ; 515 	for(i = 0; i < NUM_INPUT; i++)
2870  085e 0f02          	clr	(OFST-4,sp)
2871  0860               L727:
2872                     ; 518 		for(j = 0; j < 2;j++)
2874  0860 0f01          	clr	(OFST-5,sp)
2875  0862               L537:
2876                     ; 520 			FLASH_ProgramByte(addr, input.channel[i].expo[j]);
2878  0862 7b02          	ld	a,(OFST-4,sp)
2879  0864 97            	ld	xl,a
2880  0865 a612          	ld	a,#18
2881  0867 42            	mul	x,a
2882  0868 01            	rrwa	x,a
2883  0869 1b01          	add	a,(OFST-5,sp)
2884  086b 2401          	jrnc	L452
2885  086d 5c            	incw	x
2886  086e               L452:
2887  086e 02            	rlwa	x,a
2888  086f d600bb        	ld	a,(_input+16,x)
2889  0872 88            	push	a
2890  0873 1e06          	ldw	x,(OFST+0,sp)
2891  0875 89            	pushw	x
2892  0876 1e06          	ldw	x,(OFST+0,sp)
2893  0878 89            	pushw	x
2894  0879 cd0000        	call	_FLASH_ProgramByte
2896  087c 5b05          	addw	sp,#5
2897                     ; 521 			addr ++;
2899  087e 96            	ldw	x,sp
2900  087f 1c0003        	addw	x,#OFST-3
2901  0882 a601          	ld	a,#1
2902  0884 cd0000        	call	c_lgadc
2904                     ; 518 		for(j = 0; j < 2;j++)
2906  0887 0c01          	inc	(OFST-5,sp)
2909  0889 7b01          	ld	a,(OFST-5,sp)
2910  088b a102          	cp	a,#2
2911  088d 25d3          	jrult	L537
2912                     ; 515 	for(i = 0; i < NUM_INPUT; i++)
2914  088f 0c02          	inc	(OFST-4,sp)
2917  0891 7b02          	ld	a,(OFST-4,sp)
2918  0893 a106          	cp	a,#6
2919  0895 25c9          	jrult	L727
2920                     ; 526 	for(i = 0; i < NUM_MIXER; i++)
2922  0897 4f            	clr	a
2923  0898 6b02          	ld	(OFST-4,sp),a
2924  089a               L347:
2925                     ; 528 		FLASH_ProgramByte(addr,mixer[i].in);
2927  089a 97            	ld	xl,a
2928  089b a604          	ld	a,#4
2929  089d 42            	mul	x,a
2930  089e d6006b        	ld	a,(_mixer,x)
2931  08a1 88            	push	a
2932  08a2 1e06          	ldw	x,(OFST+0,sp)
2933  08a4 89            	pushw	x
2934  08a5 1e06          	ldw	x,(OFST+0,sp)
2935  08a7 89            	pushw	x
2936  08a8 cd0000        	call	_FLASH_ProgramByte
2938  08ab 5b05          	addw	sp,#5
2939                     ; 529 		addr ++;
2941  08ad 96            	ldw	x,sp
2942  08ae 1c0003        	addw	x,#OFST-3
2943  08b1 a601          	ld	a,#1
2944  08b3 cd0000        	call	c_lgadc
2946                     ; 530 		FLASH_ProgramByte(addr,mixer[i].out);
2948  08b6 7b02          	ld	a,(OFST-4,sp)
2949  08b8 97            	ld	xl,a
2950  08b9 a604          	ld	a,#4
2951  08bb 42            	mul	x,a
2952  08bc d6006c        	ld	a,(_mixer+1,x)
2953  08bf 88            	push	a
2954  08c0 1e06          	ldw	x,(OFST+0,sp)
2955  08c2 89            	pushw	x
2956  08c3 1e06          	ldw	x,(OFST+0,sp)
2957  08c5 89            	pushw	x
2958  08c6 cd0000        	call	_FLASH_ProgramByte
2960  08c9 5b05          	addw	sp,#5
2961                     ; 531 		addr ++;
2963  08cb 96            	ldw	x,sp
2964  08cc 1c0003        	addw	x,#OFST-3
2965  08cf a601          	ld	a,#1
2966  08d1 cd0000        	call	c_lgadc
2968                     ; 532 		FLASH_ProgramByte(addr,mixer[i].pente[0]);
2970  08d4 7b02          	ld	a,(OFST-4,sp)
2971  08d6 97            	ld	xl,a
2972  08d7 a604          	ld	a,#4
2973  08d9 42            	mul	x,a
2974  08da d6006d        	ld	a,(_mixer+2,x)
2975  08dd 88            	push	a
2976  08de 1e06          	ldw	x,(OFST+0,sp)
2977  08e0 89            	pushw	x
2978  08e1 1e06          	ldw	x,(OFST+0,sp)
2979  08e3 89            	pushw	x
2980  08e4 cd0000        	call	_FLASH_ProgramByte
2982  08e7 5b05          	addw	sp,#5
2983                     ; 533 		addr ++;
2985  08e9 96            	ldw	x,sp
2986  08ea 1c0003        	addw	x,#OFST-3
2987  08ed a601          	ld	a,#1
2988  08ef cd0000        	call	c_lgadc
2990                     ; 534 		FLASH_ProgramByte(addr,mixer[i].pente[1]);
2992  08f2 7b02          	ld	a,(OFST-4,sp)
2993  08f4 97            	ld	xl,a
2994  08f5 a604          	ld	a,#4
2995  08f7 42            	mul	x,a
2996  08f8 d6006e        	ld	a,(_mixer+3,x)
2997  08fb 88            	push	a
2998  08fc 1e06          	ldw	x,(OFST+0,sp)
2999  08fe 89            	pushw	x
3000  08ff 1e06          	ldw	x,(OFST+0,sp)
3001  0901 89            	pushw	x
3002  0902 cd0000        	call	_FLASH_ProgramByte
3004  0905 5b05          	addw	sp,#5
3005                     ; 535 		addr ++;
3007  0907 96            	ldw	x,sp
3008  0908 1c0003        	addw	x,#OFST-3
3009  090b a601          	ld	a,#1
3010  090d cd0000        	call	c_lgadc
3012                     ; 526 	for(i = 0; i < NUM_MIXER; i++)
3014  0910 0c02          	inc	(OFST-4,sp)
3017  0912 7b02          	ld	a,(OFST-4,sp)
3018  0914 a110          	cp	a,#16
3019  0916 2582          	jrult	L347
3020                     ; 541 	for(i = 0; i < NUM_OUTPUT; i++)
3022  0918 4f            	clr	a
3023  0919 6b02          	ld	(OFST-4,sp),a
3024  091b               L157:
3025                     ; 544 		FLASH_ProgramByte(addr,output.dr[i]);		
3027  091b 5f            	clrw	x
3028  091c 97            	ld	xl,a
3029  091d d60001        	ld	a,(_output+1,x)
3030  0920 88            	push	a
3031  0921 1e06          	ldw	x,(OFST+0,sp)
3032  0923 89            	pushw	x
3033  0924 1e06          	ldw	x,(OFST+0,sp)
3034  0926 89            	pushw	x
3035  0927 cd0000        	call	_FLASH_ProgramByte
3037  092a 5b05          	addw	sp,#5
3038                     ; 545 		addr++;
3040  092c 96            	ldw	x,sp
3041  092d 1c0003        	addw	x,#OFST-3
3042  0930 a601          	ld	a,#1
3043  0932 cd0000        	call	c_lgadc
3045                     ; 546 		temp = sortiepourcent(output.usMinValue[i]);
3047  0935 7b02          	ld	a,(OFST-4,sp)
3048  0937 5f            	clrw	x
3049  0938 97            	ld	xl,a
3050  0939 58            	sllw	x
3051  093a de0029        	ldw	x,(_output+41,x)
3052  093d cd032c        	call	_sortiepourcent
3054  0940 6b01          	ld	(OFST-5,sp),a
3055                     ; 547 		FLASH_ProgramByte(addr,temp);
3057  0942 88            	push	a
3058  0943 1e06          	ldw	x,(OFST+0,sp)
3059  0945 89            	pushw	x
3060  0946 1e06          	ldw	x,(OFST+0,sp)
3061  0948 89            	pushw	x
3062  0949 cd0000        	call	_FLASH_ProgramByte
3064  094c 5b05          	addw	sp,#5
3065                     ; 548 		addr ++;
3067  094e 96            	ldw	x,sp
3068  094f 1c0003        	addw	x,#OFST-3
3069  0952 a601          	ld	a,#1
3070  0954 cd0000        	call	c_lgadc
3072                     ; 549 		temp = sortiepourcent(output.usNeutralValue[i]);
3074  0957 7b02          	ld	a,(OFST-4,sp)
3075  0959 5f            	clrw	x
3076  095a 97            	ld	xl,a
3077  095b 58            	sllw	x
3078  095c de0039        	ldw	x,(_output+57,x)
3079  095f cd032c        	call	_sortiepourcent
3081  0962 6b01          	ld	(OFST-5,sp),a
3082                     ; 550 		FLASH_ProgramByte(addr,temp);
3084  0964 88            	push	a
3085  0965 1e06          	ldw	x,(OFST+0,sp)
3086  0967 89            	pushw	x
3087  0968 1e06          	ldw	x,(OFST+0,sp)
3088  096a 89            	pushw	x
3089  096b cd0000        	call	_FLASH_ProgramByte
3091  096e 5b05          	addw	sp,#5
3092                     ; 551 		addr ++;
3094  0970 96            	ldw	x,sp
3095  0971 1c0003        	addw	x,#OFST-3
3096  0974 a601          	ld	a,#1
3097  0976 cd0000        	call	c_lgadc
3099                     ; 552 		temp = sortiepourcent(output.usMaxValue[i]);
3101  0979 7b02          	ld	a,(OFST-4,sp)
3102  097b 5f            	clrw	x
3103  097c 97            	ld	xl,a
3104  097d 58            	sllw	x
3105  097e de0049        	ldw	x,(_output+73,x)
3106  0981 cd032c        	call	_sortiepourcent
3108  0984 6b01          	ld	(OFST-5,sp),a
3109                     ; 553 		FLASH_ProgramByte(addr,temp);
3111  0986 88            	push	a
3112  0987 1e06          	ldw	x,(OFST+0,sp)
3113  0989 89            	pushw	x
3114  098a 1e06          	ldw	x,(OFST+0,sp)
3115  098c 89            	pushw	x
3116  098d cd0000        	call	_FLASH_ProgramByte
3118  0990 5b05          	addw	sp,#5
3119                     ; 554 		addr ++;
3121  0992 96            	ldw	x,sp
3122  0993 1c0003        	addw	x,#OFST-3
3123  0996 a601          	ld	a,#1
3124  0998 cd0000        	call	c_lgadc
3126                     ; 541 	for(i = 0; i < NUM_OUTPUT; i++)
3128  099b 0c02          	inc	(OFST-4,sp)
3131  099d 7b02          	ld	a,(OFST-4,sp)
3132  099f a108          	cp	a,#8
3133  09a1 2403cc091b    	jrult	L157
3134                     ; 558 	FLASH_ProgramByte(addr,output.secumoteur);
3136  09a6 3b0000        	push	_output
3137  09a9 1e06          	ldw	x,(OFST+0,sp)
3138  09ab 89            	pushw	x
3139  09ac 1e06          	ldw	x,(OFST+0,sp)
3140  09ae 89            	pushw	x
3141  09af cd0000        	call	_FLASH_ProgramByte
3143  09b2 5b05          	addw	sp,#5
3144                     ; 559 	addr ++;
3146  09b4 96            	ldw	x,sp
3147  09b5 1c0003        	addw	x,#OFST-3
3148  09b8 a601          	ld	a,#1
3149  09ba cd0000        	call	c_lgadc
3151                     ; 560 	FLASH_ProgramByte(addr,ratiobat);
3153  09bd 3b0001        	push	_ratiobat
3154  09c0 1e06          	ldw	x,(OFST+0,sp)
3155  09c2 89            	pushw	x
3156  09c3 1e06          	ldw	x,(OFST+0,sp)
3157  09c5 89            	pushw	x
3158  09c6 cd0000        	call	_FLASH_ProgramByte
3160  09c9 5b05          	addw	sp,#5
3161                     ; 562 	flashencour = 0;
3163  09cb 72110009      	bres	_flashencour
3164                     ; 563 }
3167  09cf 5b07          	addw	sp,#7
3168  09d1 81            	ret	
3225                     ; 565 void settrimdyn(void)
3225                     ; 566 {
3226                     	switch	.text
3227  09d2               _settrimdyn:
3229  09d2 5203          	subw	sp,#3
3230       00000003      OFST:	set	3
3233                     ; 569 	for(i = 0; i < NUM_MIXER ; i++)
3235  09d4 4f            	clr	a
3236  09d5 6b03          	ld	(OFST+0,sp),a
3237  09d7               L5001:
3238                     ; 571 		u8 in = mixer[i].in;
3240  09d7 97            	ld	xl,a
3241  09d8 a604          	ld	a,#4
3242  09da 42            	mul	x,a
3243  09db d6006b        	ld	a,(_mixer,x)
3244  09de 6b01          	ld	(OFST-2,sp),a
3245                     ; 572 		u8 out = mixer[i].out;
3247  09e0 d6006c        	ld	a,(_mixer+1,x)
3248  09e3 6b02          	ld	(OFST-1,sp),a
3249                     ; 574 		if ((out < NUM_OUTPUT) && (in < 4)) // trim dynamique que sur les sorties pilotées par les manches
3251  09e5 a108          	cp	a,#8
3252  09e7 2418          	jruge	L3101
3254  09e9 7b01          	ld	a,(OFST-2,sp)
3255  09eb a104          	cp	a,#4
3256  09ed 2412          	jruge	L3101
3257                     ; 576 			if (out != output.secumoteur) output.usNeutralValue[out] = trimmem[out];
3259  09ef 7b02          	ld	a,(OFST-1,sp)
3260  09f1 c10000        	cp	a,_output
3261  09f4 270b          	jreq	L3101
3264  09f6 5f            	clrw	x
3265  09f7 97            	ld	xl,a
3266  09f8 58            	sllw	x
3267  09f9 9093          	ldw	y,x
3268  09fb 90ee23        	ldw	y,(_trimmem,y)
3269  09fe df0039        	ldw	(_output+57,x),y
3270  0a01               L3101:
3271                     ; 578 		bip(1,0,0,0,0);
3273  0a01 4b00          	push	#0
3274  0a03 4b00          	push	#0
3275  0a05 4b00          	push	#0
3276  0a07 5f            	clrw	x
3277  0a08 a601          	ld	a,#1
3278  0a0a 95            	ld	xh,a
3279  0a0b cd0000        	call	_bip
3281                     ; 579 		trimdyn = 0;
3283  0a0e 72110001      	bres	_trimdyn
3284  0a12 5b03          	addw	sp,#3
3285                     ; 569 	for(i = 0; i < NUM_MIXER ; i++)
3287  0a14 0c03          	inc	(OFST+0,sp)
3290  0a16 7b03          	ld	a,(OFST+0,sp)
3291  0a18 a110          	cp	a,#16
3292  0a1a 25bb          	jrult	L5001
3293                     ; 581 }
3296  0a1c 5b03          	addw	sp,#3
3297  0a1e 81            	ret	
3335                     ; 583 void memtrimdyn(void)
3335                     ; 584 {
3336                     	switch	.text
3337  0a1f               _memtrimdyn:
3339  0a1f 88            	push	a
3340       00000001      OFST:	set	1
3343                     ; 587 	for(i = 0; i < NUM_OUTPUT; i++)
3345  0a20 4f            	clr	a
3346  0a21 6b01          	ld	(OFST+0,sp),a
3347  0a23               L5301:
3348                     ; 589 		trimmem[i] = output.usValueOut[i];
3350  0a23 5f            	clrw	x
3351  0a24 97            	ld	xl,a
3352  0a25 58            	sllw	x
3353  0a26 9093          	ldw	y,x
3354  0a28 90de0059      	ldw	y,(_output+89,y)
3355  0a2c ef23          	ldw	(_trimmem,x),y
3356                     ; 587 	for(i = 0; i < NUM_OUTPUT; i++)
3358  0a2e 0c01          	inc	(OFST+0,sp)
3361  0a30 7b01          	ld	a,(OFST+0,sp)
3362  0a32 a108          	cp	a,#8
3363  0a34 25ed          	jrult	L5301
3364                     ; 591 	tempotrimdyn = 9; // lance le decompte
3366  0a36 35090004      	mov	_tempotrimdyn,#9
3367                     ; 592 	bip(2,0,0,0,0);
3369  0a3a 4b00          	push	#0
3370  0a3c 4b00          	push	#0
3371  0a3e 4b00          	push	#0
3372  0a40 5f            	clrw	x
3373  0a41 a602          	ld	a,#2
3374  0a43 95            	ld	xh,a
3375  0a44 cd0000        	call	_bip
3377  0a47 5b03          	addw	sp,#3
3378                     ; 593 }
3381  0a49 84            	pop	a
3382  0a4a 81            	ret	
3498                     ; 595 void etalonnage(void) // taille : 6 x NUM_INPUT
3498                     ; 596 {
3499                     	switch	.text
3500  0a4b               _etalonnage:
3502       00000037      OFST:	set	55
3505                     ; 598 	u16 count = 0;
3507                     ; 604 	flashencour = 1;
3509  0a4b 72100009      	bset	_flashencour
3510  0a4f 5237          	subw	sp,#55
3511                     ; 606 	bas = 0;
3513  0a51 7211000b      	bres	_bas
3514                     ; 607 	LCD_DISP_OFF();
3516  0a55 cd0000        	call	_LCD_DISP_OFF
3518                     ; 608 	LCD_CLEAR_DISPLAY();
3520  0a58 cd0000        	call	_LCD_CLEAR_DISPLAY
3522                     ; 609 	LCD_printtruc(1,1,"Manches a zero\n",0);
3524  0a5b 5f            	clrw	x
3525  0a5c 89            	pushw	x
3526  0a5d ae00d9        	ldw	x,#L1111
3527  0a60 89            	pushw	x
3528  0a61 ae0001        	ldw	x,#1
3529  0a64 a601          	ld	a,#1
3530  0a66 95            	ld	xh,a
3531  0a67 cd0000        	call	_LCD_printtruc
3533  0a6a 5b04          	addw	sp,#4
3534                     ; 610 	LCD_printtruc(2,1,"Appuyer bas\n",0);
3536  0a6c 5f            	clrw	x
3537  0a6d 89            	pushw	x
3538  0a6e ae00cc        	ldw	x,#L3111
3539  0a71 89            	pushw	x
3540  0a72 ae0001        	ldw	x,#1
3541  0a75 a602          	ld	a,#2
3542  0a77 95            	ld	xh,a
3543  0a78 cd0000        	call	_LCD_printtruc
3545  0a7b 5b04          	addw	sp,#4
3546                     ; 611 	LCD_DISP_ON();
3548  0a7d cd0000        	call	_LCD_DISP_ON
3550                     ; 612 	Delayms(800);
3552  0a80 ae0320        	ldw	x,#800
3553  0a83 cd0000        	call	_Delayms
3555                     ; 613 	bip(1,0,0,0,0);
3557  0a86 4b00          	push	#0
3558  0a88 4b00          	push	#0
3559  0a8a 4b00          	push	#0
3560  0a8c 5f            	clrw	x
3561  0a8d a601          	ld	a,#1
3562  0a8f 95            	ld	xh,a
3563  0a90 cd0000        	call	_bip
3565  0a93 5b03          	addw	sp,#3
3567  0a95 2017          	jra	L443
3568  0a97               L5111:
3569                     ; 615 	while(!bas) 	bas = GPIO_ReadInputPin(GPIOC,GPIO_PIN_1);
3571  0a97 4b02          	push	#2
3572  0a99 ae500a        	ldw	x,#20490
3573  0a9c cd0000        	call	_GPIO_ReadInputPin
3575  0a9f 5b01          	addw	sp,#1
3576  0aa1 4d            	tnz	a
3577  0aa2 2706          	jreq	L043
3578  0aa4 7210000b      	bset	_bas
3579  0aa8 2004          	jra	L443
3580  0aaa               L043:
3581  0aaa 7211000b      	bres	_bas
3582  0aae               L443:
3585  0aae 7201000be4    	btjf	_bas,L5111
3586                     ; 617 	LCD_DISP_OFF();
3588  0ab3 cd0000        	call	_LCD_DISP_OFF
3590                     ; 618 	LCD_CLEAR_DISPLAY();
3592  0ab6 cd0000        	call	_LCD_CLEAR_DISPLAY
3594                     ; 619 	LCD_printtruc(1,1,"Mesures zero\n",0);
3596  0ab9 5f            	clrw	x
3597  0aba 89            	pushw	x
3598  0abb ae00be        	ldw	x,#L3211
3599  0abe 89            	pushw	x
3600  0abf ae0001        	ldw	x,#1
3601  0ac2 a601          	ld	a,#1
3602  0ac4 95            	ld	xh,a
3603  0ac5 cd0000        	call	_LCD_printtruc
3605  0ac8 5b04          	addw	sp,#4
3606                     ; 620 	LCD_printtruc(2,1,"en cour\n",0);
3608  0aca 5f            	clrw	x
3609  0acb 89            	pushw	x
3610  0acc ae00b5        	ldw	x,#L5211
3611  0acf 89            	pushw	x
3612  0ad0 ae0001        	ldw	x,#1
3613  0ad3 a602          	ld	a,#2
3614  0ad5 95            	ld	xh,a
3615  0ad6 cd0000        	call	_LCD_printtruc
3617  0ad9 5b04          	addw	sp,#4
3618                     ; 621 	LCD_DISP_ON();
3620  0adb cd0000        	call	_LCD_DISP_ON
3622                     ; 622 	Menu_raz = 1;
3624  0ade 72100000      	bset	_Menu_raz
3625                     ; 624 	if(synchro)
3627  0ae2 720100000b    	btjf	_synchro,L7211
3628                     ; 626 		ADC1_StartConversion();
3630  0ae7 cd0000        	call	_ADC1_StartConversion
3633  0aea               L3311:
3634                     ; 627 		while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == 0)
3636  0aea a680          	ld	a,#128
3637  0aec cd0000        	call	_ADC1_GetFlagStatus
3639  0aef 4d            	tnz	a
3640  0af0 27f8          	jreq	L3311
3641  0af2               L7211:
3642                     ; 632 	for(i = 0; i < NUM_INPUT; i++)
3644  0af2 4f            	clr	a
3645  0af3 6b37          	ld	(OFST+0,sp),a
3646  0af5               L7311:
3647                     ; 634 		neutral[i] = ADC1_GetBufferValue(i);
3649  0af5 cd0000        	call	_ADC1_GetBufferValue
3651  0af8 9096          	ldw	y,sp
3652  0afa 72a9002b      	addw	y,#OFST-12
3653  0afe 1703          	ldw	(OFST-52,sp),y
3654  0b00 905f          	clrw	y
3655  0b02 7b37          	ld	a,(OFST+0,sp)
3656  0b04 9097          	ld	yl,a
3657  0b06 9058          	sllw	y
3658  0b08 72f903        	addw	y,(OFST-52,sp)
3659  0b0b 90ff          	ldw	(y),x
3660                     ; 632 	for(i = 0; i < NUM_INPUT; i++)
3662  0b0d 0c37          	inc	(OFST+0,sp)
3665  0b0f 7b37          	ld	a,(OFST+0,sp)
3666  0b11 a106          	cp	a,#6
3667  0b13 25e0          	jrult	L7311
3668                     ; 636 	ADC1_ClearFlag(ADC1_FLAG_EOC);
3670  0b15 a680          	ld	a,#128
3671  0b17 cd0000        	call	_ADC1_ClearFlag
3673                     ; 639 	count = 100;
3675  0b1a ae0064        	ldw	x,#100
3676  0b1d 1f11          	ldw	(OFST-38,sp),x
3677  0b1f               L5411:
3678                     ; 642 		if(synchro)
3680  0b1f 7201000055    	btjf	_synchro,L3511
3681                     ; 644 			count--;
3683  0b24 5a            	decw	x
3684  0b25 1f11          	ldw	(OFST-38,sp),x
3685                     ; 645 			synchro = 0;
3687  0b27 72110000      	bres	_synchro
3688                     ; 646 			ADC1_StartConversion();
3690  0b2b cd0000        	call	_ADC1_StartConversion
3693  0b2e               L7511:
3694                     ; 647 			while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == 0)
3696  0b2e a680          	ld	a,#128
3697  0b30 cd0000        	call	_ADC1_GetFlagStatus
3699  0b33 4d            	tnz	a
3700  0b34 27f8          	jreq	L7511
3701                     ; 651 			for(i = 0; i < NUM_INPUT; i++)
3703  0b36 4f            	clr	a
3704  0b37 6b37          	ld	(OFST+0,sp),a
3705  0b39               L3611:
3706                     ; 653 				neutral[i] = (neutral[i] + ADC1_GetBufferValue(i)) / 2;
3708  0b39 cd0000        	call	_ADC1_GetBufferValue
3710  0b3c 9096          	ldw	y,sp
3711  0b3e 72a9002b      	addw	y,#OFST-12
3712  0b42 1703          	ldw	(OFST-52,sp),y
3713  0b44 905f          	clrw	y
3714  0b46 7b37          	ld	a,(OFST+0,sp)
3715  0b48 9097          	ld	yl,a
3716  0b4a 9058          	sllw	y
3717  0b4c 72f903        	addw	y,(OFST-52,sp)
3718  0b4f 90fe          	ldw	y,(y)
3719  0b51 90bf00        	ldw	c_x,y
3720  0b54 72bb0000      	addw	x,c_x
3721  0b58 54            	srlw	x
3722  0b59 9096          	ldw	y,sp
3723  0b5b 72a9002b      	addw	y,#OFST-12
3724  0b5f 1701          	ldw	(OFST-54,sp),y
3725  0b61 905f          	clrw	y
3726  0b63 9097          	ld	yl,a
3727  0b65 9058          	sllw	y
3728  0b67 72f901        	addw	y,(OFST-54,sp)
3729  0b6a 90ff          	ldw	(y),x
3730                     ; 651 			for(i = 0; i < NUM_INPUT; i++)
3732  0b6c 0c37          	inc	(OFST+0,sp)
3735  0b6e 7b37          	ld	a,(OFST+0,sp)
3736  0b70 a106          	cp	a,#6
3737  0b72 25c5          	jrult	L3611
3738                     ; 656 			ADC1_ClearFlag(ADC1_FLAG_EOC);
3740  0b74 a680          	ld	a,#128
3741  0b76 cd0000        	call	_ADC1_ClearFlag
3743  0b79               L3511:
3744                     ; 640 	while (count != 0)
3746  0b79 1e11          	ldw	x,(OFST-38,sp)
3747  0b7b 26a2          	jrne	L5411
3748                     ; 660 	Menu_raz = 1;
3750  0b7d 72100000      	bset	_Menu_raz
3751                     ; 661 	bas = 0;
3753  0b81 7211000b      	bres	_bas
3754                     ; 662 	LCD_DISP_OFF();
3756  0b85 cd0000        	call	_LCD_DISP_OFF
3758                     ; 663 	LCD_CLEAR_DISPLAY();
3760  0b88 cd0000        	call	_LCD_CLEAR_DISPLAY
3762                     ; 664 	LCD_printtruc(1,1,"Manches au max\n",0);
3764  0b8b 5f            	clrw	x
3765  0b8c 89            	pushw	x
3766  0b8d ae00a5        	ldw	x,#L1711
3767  0b90 89            	pushw	x
3768  0b91 ae0001        	ldw	x,#1
3769  0b94 a601          	ld	a,#1
3770  0b96 95            	ld	xh,a
3771  0b97 cd0000        	call	_LCD_printtruc
3773  0b9a 5b04          	addw	sp,#4
3774                     ; 665 	LCD_printtruc(2,1,"min, appuyer bas\n",0);
3776  0b9c 5f            	clrw	x
3777  0b9d 89            	pushw	x
3778  0b9e ae0093        	ldw	x,#L3711
3779  0ba1 89            	pushw	x
3780  0ba2 ae0001        	ldw	x,#1
3781  0ba5 a602          	ld	a,#2
3782  0ba7 95            	ld	xh,a
3783  0ba8 cd0000        	call	_LCD_printtruc
3785  0bab 5b04          	addw	sp,#4
3786                     ; 666 	LCD_DISP_ON();
3788  0bad cd0000        	call	_LCD_DISP_ON
3790                     ; 667 	Menu_raz = 1;
3792  0bb0 72100000      	bset	_Menu_raz
3793                     ; 668 	bip(1,0,0,0,0);
3795  0bb4 4b00          	push	#0
3796  0bb6 4b00          	push	#0
3797  0bb8 4b00          	push	#0
3798  0bba 5f            	clrw	x
3799  0bbb a601          	ld	a,#1
3800  0bbd 95            	ld	xh,a
3801  0bbe cd0000        	call	_bip
3803  0bc1 5b03          	addw	sp,#3
3805  0bc3 2017          	jra	L024
3806  0bc5               L5711:
3807                     ; 669 	while(!bas) 	bas = GPIO_ReadInputPin(GPIOC,GPIO_PIN_1);
3809  0bc5 4b02          	push	#2
3810  0bc7 ae500a        	ldw	x,#20490
3811  0bca cd0000        	call	_GPIO_ReadInputPin
3813  0bcd 5b01          	addw	sp,#1
3814  0bcf 4d            	tnz	a
3815  0bd0 2706          	jreq	L414
3816  0bd2 7210000b      	bset	_bas
3817  0bd6 2004          	jra	L024
3818  0bd8               L414:
3819  0bd8 7211000b      	bres	_bas
3820  0bdc               L024:
3823  0bdc 7201000be4    	btjf	_bas,L5711
3824                     ; 670 	bas = 0;
3826  0be1 7211000b      	bres	_bas
3827                     ; 671 	LCD_DISP_OFF();
3829  0be5 cd0000        	call	_LCD_DISP_OFF
3831                     ; 672 	LCD_CLEAR_DISPLAY();
3833  0be8 cd0000        	call	_LCD_CLEAR_DISPLAY
3835                     ; 673 	LCD_printtruc(1,1,"Mesures max/min\n",0);
3837  0beb 5f            	clrw	x
3838  0bec 89            	pushw	x
3839  0bed ae0082        	ldw	x,#L3021
3840  0bf0 89            	pushw	x
3841  0bf1 ae0001        	ldw	x,#1
3842  0bf4 a601          	ld	a,#1
3843  0bf6 95            	ld	xh,a
3844  0bf7 cd0000        	call	_LCD_printtruc
3846  0bfa 5b04          	addw	sp,#4
3847                     ; 674 	LCD_printtruc(2,1,"en cour\n",0);
3849  0bfc 5f            	clrw	x
3850  0bfd 89            	pushw	x
3851  0bfe ae00b5        	ldw	x,#L5211
3852  0c01 89            	pushw	x
3853  0c02 ae0001        	ldw	x,#1
3854  0c05 a602          	ld	a,#2
3855  0c07 95            	ld	xh,a
3856  0c08 cd0000        	call	_LCD_printtruc
3858  0c0b 5b04          	addw	sp,#4
3859                     ; 675 	LCD_DISP_ON();
3861  0c0d cd0000        	call	_LCD_DISP_ON
3863                     ; 677 	for(i = 0; i < NUM_INPUT; i++)
3865  0c10 0f37          	clr	(OFST+0,sp)
3866  0c12               L5021:
3867                     ; 679 		min[i] = neutral[i];
3869  0c12 96            	ldw	x,sp
3870  0c13 1c002b        	addw	x,#OFST-12
3871  0c16 1f03          	ldw	(OFST-52,sp),x
3872  0c18 5f            	clrw	x
3873  0c19 7b37          	ld	a,(OFST+0,sp)
3874  0c1b 97            	ld	xl,a
3875  0c1c 58            	sllw	x
3876  0c1d 72fb03        	addw	x,(OFST-52,sp)
3877  0c20 9096          	ldw	y,sp
3878  0c22 72a90013      	addw	y,#OFST-36
3879  0c26 1701          	ldw	(OFST-54,sp),y
3880  0c28 905f          	clrw	y
3881  0c2a 9097          	ld	yl,a
3882  0c2c 9058          	sllw	y
3883  0c2e 72f901        	addw	y,(OFST-54,sp)
3884  0c31 fe            	ldw	x,(x)
3885  0c32 90ff          	ldw	(y),x
3886                     ; 680 		max[i] = neutral[i];
3888  0c34 96            	ldw	x,sp
3889  0c35 1c002b        	addw	x,#OFST-12
3890  0c38 1f03          	ldw	(OFST-52,sp),x
3891  0c3a 5f            	clrw	x
3892  0c3b 97            	ld	xl,a
3893  0c3c 58            	sllw	x
3894  0c3d 72fb03        	addw	x,(OFST-52,sp)
3895  0c40 9096          	ldw	y,sp
3896  0c42 72a9001f      	addw	y,#OFST-24
3897  0c46 1701          	ldw	(OFST-54,sp),y
3898  0c48 905f          	clrw	y
3899  0c4a 9097          	ld	yl,a
3900  0c4c 9058          	sllw	y
3901  0c4e 72f901        	addw	y,(OFST-54,sp)
3902  0c51 fe            	ldw	x,(x)
3903  0c52 90ff          	ldw	(y),x
3904                     ; 677 	for(i = 0; i < NUM_INPUT; i++)
3906  0c54 0c37          	inc	(OFST+0,sp)
3909  0c56 7b37          	ld	a,(OFST+0,sp)
3910  0c58 a106          	cp	a,#6
3911  0c5a 25b6          	jrult	L5021
3912                     ; 683 	count = 1000;
3914  0c5c ae03e8        	ldw	x,#1000
3915  0c5f 1f11          	ldw	(OFST-38,sp),x
3916  0c61               L3121:
3917                     ; 686 		if(synchro)
3919  0c61 7200000003cc  	btjf	_synchro,L1221
3920                     ; 689 			count--;
3922  0c69 5a            	decw	x
3923  0c6a 1f11          	ldw	(OFST-38,sp),x
3924                     ; 690 			synchro = 0;
3926  0c6c 72110000      	bres	_synchro
3927                     ; 691 			ADC1_StartConversion();
3929  0c70 cd0000        	call	_ADC1_StartConversion
3932  0c73               L5221:
3933                     ; 692 			while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == 0)
3935  0c73 a680          	ld	a,#128
3936  0c75 cd0000        	call	_ADC1_GetFlagStatus
3938  0c78 4d            	tnz	a
3939  0c79 27f8          	jreq	L5221
3940                     ; 695 			Menu_raz = 1;
3942  0c7b 72100000      	bset	_Menu_raz
3943                     ; 697 			for(i = 0; i < NUM_INPUT; i++)
3945  0c7f 4f            	clr	a
3946  0c80 6b37          	ld	(OFST+0,sp),a
3947  0c82               L1321:
3948                     ; 699 				val[i] = ADC1_GetBufferValue(i);
3950  0c82 cd0000        	call	_ADC1_GetBufferValue
3952  0c85 9096          	ldw	y,sp
3953  0c87 72a90005      	addw	y,#OFST-50
3954  0c8b 1703          	ldw	(OFST-52,sp),y
3955  0c8d 905f          	clrw	y
3956  0c8f 7b37          	ld	a,(OFST+0,sp)
3957  0c91 9097          	ld	yl,a
3958  0c93 9058          	sllw	y
3959  0c95 72f903        	addw	y,(OFST-52,sp)
3960  0c98 90ff          	ldw	(y),x
3961                     ; 697 			for(i = 0; i < NUM_INPUT; i++)
3963  0c9a 0c37          	inc	(OFST+0,sp)
3966  0c9c 7b37          	ld	a,(OFST+0,sp)
3967  0c9e a106          	cp	a,#6
3968  0ca0 25e0          	jrult	L1321
3969                     ; 702 			for(i = 0; i < NUM_INPUT; i++)
3971  0ca2 0f37          	clr	(OFST+0,sp)
3972  0ca4               L7321:
3973                     ; 704 				if(val[i] < min[i])
3975  0ca4 96            	ldw	x,sp
3976  0ca5 1c0005        	addw	x,#OFST-50
3977  0ca8 1f03          	ldw	(OFST-52,sp),x
3978  0caa 5f            	clrw	x
3979  0cab 7b37          	ld	a,(OFST+0,sp)
3980  0cad 97            	ld	xl,a
3981  0cae 58            	sllw	x
3982  0caf 72fb03        	addw	x,(OFST-52,sp)
3983  0cb2 9096          	ldw	y,sp
3984  0cb4 72a90013      	addw	y,#OFST-36
3985  0cb8 1701          	ldw	(OFST-54,sp),y
3986  0cba 905f          	clrw	y
3987  0cbc 9097          	ld	yl,a
3988  0cbe 9058          	sllw	y
3989  0cc0 72f901        	addw	y,(OFST-54,sp)
3990  0cc3 fe            	ldw	x,(x)
3991  0cc4 90f3          	cpw	x,(y)
3992  0cc6 2420          	jruge	L5421
3993                     ; 706 					min[i] = val[i];
3995  0cc8 96            	ldw	x,sp
3996  0cc9 1c0005        	addw	x,#OFST-50
3997  0ccc 1f03          	ldw	(OFST-52,sp),x
3998  0cce 5f            	clrw	x
3999  0ccf 97            	ld	xl,a
4000  0cd0 58            	sllw	x
4001  0cd1 72fb03        	addw	x,(OFST-52,sp)
4002  0cd4 9096          	ldw	y,sp
4003  0cd6 72a90013      	addw	y,#OFST-36
4004  0cda 1701          	ldw	(OFST-54,sp),y
4005  0cdc 905f          	clrw	y
4006  0cde 9097          	ld	yl,a
4007  0ce0 9058          	sllw	y
4008  0ce2 72f901        	addw	y,(OFST-54,sp)
4009  0ce5 fe            	ldw	x,(x)
4010  0ce6 90ff          	ldw	(y),x
4011  0ce8               L5421:
4012                     ; 708 				if(val[i] > max[i])
4014  0ce8 96            	ldw	x,sp
4015  0ce9 1c0005        	addw	x,#OFST-50
4016  0cec 1f03          	ldw	(OFST-52,sp),x
4017  0cee 5f            	clrw	x
4018  0cef 97            	ld	xl,a
4019  0cf0 58            	sllw	x
4020  0cf1 72fb03        	addw	x,(OFST-52,sp)
4021  0cf4 9096          	ldw	y,sp
4022  0cf6 72a9001f      	addw	y,#OFST-24
4023  0cfa 1701          	ldw	(OFST-54,sp),y
4024  0cfc 905f          	clrw	y
4025  0cfe 9097          	ld	yl,a
4026  0d00 9058          	sllw	y
4027  0d02 72f901        	addw	y,(OFST-54,sp)
4028  0d05 fe            	ldw	x,(x)
4029  0d06 90f3          	cpw	x,(y)
4030  0d08 2322          	jrule	L7421
4031                     ; 710 					max[i] = val[i];
4033  0d0a 96            	ldw	x,sp
4034  0d0b 1c0005        	addw	x,#OFST-50
4035  0d0e 1f03          	ldw	(OFST-52,sp),x
4036  0d10 5f            	clrw	x
4037  0d11 97            	ld	xl,a
4038  0d12 58            	sllw	x
4039  0d13 72fb03        	addw	x,(OFST-52,sp)
4040  0d16 9096          	ldw	y,sp
4041  0d18 72a9001f      	addw	y,#OFST-24
4042  0d1c 1701          	ldw	(OFST-54,sp),y
4043  0d1e 905f          	clrw	y
4044  0d20 9097          	ld	yl,a
4045  0d22 9058          	sllw	y
4046  0d24 72f901        	addw	y,(OFST-54,sp)
4047  0d27 89            	pushw	x
4048  0d28 fe            	ldw	x,(x)
4049  0d29 90ff          	ldw	(y),x
4050  0d2b 85            	popw	x
4051  0d2c               L7421:
4052                     ; 702 			for(i = 0; i < NUM_INPUT; i++)
4054  0d2c 0c37          	inc	(OFST+0,sp)
4057  0d2e 7b37          	ld	a,(OFST+0,sp)
4058  0d30 a106          	cp	a,#6
4059  0d32 2403cc0ca4    	jrult	L7321
4060                     ; 715 			ADC1_ClearFlag(ADC1_FLAG_EOC);
4062  0d37 a680          	ld	a,#128
4063  0d39 cd0000        	call	_ADC1_ClearFlag
4065  0d3c               L1221:
4066                     ; 684 	while (count != 0)
4068  0d3c 1e11          	ldw	x,(OFST-38,sp)
4069  0d3e 2703cc0c61    	jrne	L3121
4070                     ; 719 	LCD_printtruc(2,1,"Enregistrement...\n",0);
4072  0d43 5f            	clrw	x
4073  0d44 89            	pushw	x
4074  0d45 ae006f        	ldw	x,#L1521
4075  0d48 89            	pushw	x
4076  0d49 ae0001        	ldw	x,#1
4077  0d4c a602          	ld	a,#2
4078  0d4e 95            	ld	xh,a
4079  0d4f cd0000        	call	_LCD_printtruc
4081  0d52 5b04          	addw	sp,#4
4082                     ; 720 	Menu_raz = 1;
4084  0d54 72100000      	bset	_Menu_raz
4085                     ; 721 	bip(1,2,1,0,0);
4087  0d58 4b00          	push	#0
4088  0d5a 4b00          	push	#0
4089  0d5c 4b01          	push	#1
4090  0d5e ae0002        	ldw	x,#2
4091  0d61 a601          	ld	a,#1
4092  0d63 95            	ld	xh,a
4093  0d64 cd0000        	call	_bip
4095  0d67 5b03          	addw	sp,#3
4096                     ; 722 	Delayms(500);
4098  0d69 ae01f4        	ldw	x,#500
4099  0d6c cd0000        	call	_Delayms
4101                     ; 725 	FLASH_DeInit();
4103  0d6f cd0000        	call	_FLASH_DeInit
4105                     ; 727 	FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
4107  0d72 4f            	clr	a
4108  0d73 cd0000        	call	_FLASH_SetProgrammingTime
4110                     ; 729 	FLASH_Unlock(FLASH_MEMTYPE_DATA);
4112  0d76 a6f7          	ld	a,#247
4113  0d78 cd0000        	call	_FLASH_Unlock
4115                     ; 732 		u32 addr = BASE_EEPROM + MODEL_ACTUEL_LENGTH + 1;
4117                     ; 734 		addr = addr + (((NUM_PHASE * PHASE_LENGTH) + INPUT_LENGTH ) * modele_actuel);
4119  0d7b b633          	ld	a,_modele_actuel
4120  0d7d 97            	ld	xl,a
4121  0d7e 4f            	clr	a
4122  0d7f 02            	rlwa	x,a
4123  0d80 cd0000        	call	c_itolx
4125  0d83 ae0020        	ldw	x,#L251
4126  0d86 cd0000        	call	c_ladd
4128  0d89 96            	ldw	x,sp
4129  0d8a 1c000d        	addw	x,#OFST-42
4130  0d8d cd0000        	call	c_rtol
4132                     ; 736 		for(i = 0; i < NUM_INPUT; i++)
4134  0d90 0f37          	clr	(OFST+0,sp)
4135  0d92               L3521:
4136                     ; 738 			addr = FLASH_ProgramdoubleByte(addr,min[i]);
4138  0d92 96            	ldw	x,sp
4139  0d93 1c0013        	addw	x,#OFST-36
4140  0d96 1f03          	ldw	(OFST-52,sp),x
4141  0d98 5f            	clrw	x
4142  0d99 7b37          	ld	a,(OFST+0,sp)
4143  0d9b 97            	ld	xl,a
4144  0d9c 58            	sllw	x
4145  0d9d 72fb03        	addw	x,(OFST-52,sp)
4146  0da0 fe            	ldw	x,(x)
4147  0da1 89            	pushw	x
4148  0da2 1e11          	ldw	x,(OFST-38,sp)
4149  0da4 89            	pushw	x
4150  0da5 1e11          	ldw	x,(OFST-38,sp)
4151  0da7 89            	pushw	x
4152  0da8 cd0359        	call	_FLASH_ProgramdoubleByte
4154  0dab 5b06          	addw	sp,#6
4155  0dad 96            	ldw	x,sp
4156  0dae 1c000d        	addw	x,#OFST-42
4157  0db1 cd0000        	call	c_rtol
4159                     ; 739 			addr = FLASH_ProgramdoubleByte(addr,neutral[i]);
4161  0db4 96            	ldw	x,sp
4162  0db5 1c002b        	addw	x,#OFST-12
4163  0db8 1f03          	ldw	(OFST-52,sp),x
4164  0dba 5f            	clrw	x
4165  0dbb 7b37          	ld	a,(OFST+0,sp)
4166  0dbd 97            	ld	xl,a
4167  0dbe 58            	sllw	x
4168  0dbf 72fb03        	addw	x,(OFST-52,sp)
4169  0dc2 fe            	ldw	x,(x)
4170  0dc3 89            	pushw	x
4171  0dc4 1e11          	ldw	x,(OFST-38,sp)
4172  0dc6 89            	pushw	x
4173  0dc7 1e11          	ldw	x,(OFST-38,sp)
4174  0dc9 89            	pushw	x
4175  0dca cd0359        	call	_FLASH_ProgramdoubleByte
4177  0dcd 5b06          	addw	sp,#6
4178  0dcf 96            	ldw	x,sp
4179  0dd0 1c000d        	addw	x,#OFST-42
4180  0dd3 cd0000        	call	c_rtol
4182                     ; 740 			addr = FLASH_ProgramdoubleByte(addr,max[i]);
4184  0dd6 96            	ldw	x,sp
4185  0dd7 1c001f        	addw	x,#OFST-24
4186  0dda 1f03          	ldw	(OFST-52,sp),x
4187  0ddc 5f            	clrw	x
4188  0ddd 7b37          	ld	a,(OFST+0,sp)
4189  0ddf 97            	ld	xl,a
4190  0de0 58            	sllw	x
4191  0de1 72fb03        	addw	x,(OFST-52,sp)
4192  0de4 fe            	ldw	x,(x)
4193  0de5 89            	pushw	x
4194  0de6 1e11          	ldw	x,(OFST-38,sp)
4195  0de8 89            	pushw	x
4196  0de9 1e11          	ldw	x,(OFST-38,sp)
4197  0deb 89            	pushw	x
4198  0dec cd0359        	call	_FLASH_ProgramdoubleByte
4200  0def 5b06          	addw	sp,#6
4201  0df1 96            	ldw	x,sp
4202  0df2 1c000d        	addw	x,#OFST-42
4203  0df5 cd0000        	call	c_rtol
4205                     ; 736 		for(i = 0; i < NUM_INPUT; i++)
4207  0df8 0c37          	inc	(OFST+0,sp)
4210  0dfa 7b37          	ld	a,(OFST+0,sp)
4211  0dfc a106          	cp	a,#6
4212  0dfe 2592          	jrult	L3521
4213                     ; 744 	LCD_DISP_OFF();
4215  0e00 cd0000        	call	_LCD_DISP_OFF
4217                     ; 745 	LCD_CLEAR_DISPLAY();
4219  0e03 cd0000        	call	_LCD_CLEAR_DISPLAY
4221                     ; 746 	LCD_printtruc(1,1,"Enregistre\n",0);
4223  0e06 5f            	clrw	x
4224  0e07 89            	pushw	x
4225  0e08 ae0063        	ldw	x,#L1621
4226  0e0b 89            	pushw	x
4227  0e0c ae0001        	ldw	x,#1
4228  0e0f a601          	ld	a,#1
4229  0e11 95            	ld	xh,a
4230  0e12 cd0000        	call	_LCD_printtruc
4232  0e15 5b04          	addw	sp,#4
4233                     ; 747 	LCD_printtruc(2,1,"Appuyer haut\n",0);
4235  0e17 5f            	clrw	x
4236  0e18 89            	pushw	x
4237  0e19 ae0055        	ldw	x,#L3621
4238  0e1c 89            	pushw	x
4239  0e1d ae0001        	ldw	x,#1
4240  0e20 a602          	ld	a,#2
4241  0e22 95            	ld	xh,a
4242  0e23 cd0000        	call	_LCD_printtruc
4244  0e26 5b04          	addw	sp,#4
4245                     ; 748 	LCD_DISP_ON();
4247  0e28 cd0000        	call	_LCD_DISP_ON
4249                     ; 750 	Menu_raz = 1;
4251  0e2b 72100000      	bset	_Menu_raz
4253  0e2f 2017          	jra	L405
4254  0e31               L5621:
4255                     ; 752 	while(!haut) 	haut = GPIO_ReadInputPin(GPIOG,GPIO_PIN_1);
4257  0e31 4b02          	push	#2
4258  0e33 ae501e        	ldw	x,#20510
4259  0e36 cd0000        	call	_GPIO_ReadInputPin
4261  0e39 5b01          	addw	sp,#1
4262  0e3b 4d            	tnz	a
4263  0e3c 2706          	jreq	L005
4264  0e3e 7210000a      	bset	_haut
4265  0e42 2004          	jra	L405
4266  0e44               L005:
4267  0e44 7211000a      	bres	_haut
4268  0e48               L405:
4271  0e48 7201000ae4    	btjf	_haut,L5621
4272                     ; 753 	Tempo_menu = 14;
4274  0e4d 350e0000      	mov	_Tempo_menu,#14
4275                     ; 754 	Delayms(500);
4277  0e51 ae01f4        	ldw	x,#500
4278  0e54 cd0000        	call	_Delayms
4280                     ; 755 	load_input(phase_actuelle);
4282  0e57 b600          	ld	a,_phase_actuelle
4283  0e59 cd04a2        	call	_load_input
4285                     ; 757 }
4288  0e5c 5b37          	addw	sp,#55
4289  0e5e 81            	ret	
4346                     	switch	.const
4347  0028               L225:
4348  0028 000003e8      	dc.l	1000
4349                     ; 759 void captureADC(void)
4349                     ; 760 {
4350                     	switch	.text
4351  0e5f               _captureADC:
4353  0e5f 5207          	subw	sp,#7
4354       00000007      OFST:	set	7
4357                     ; 765 	ADC1_StartConversion();
4359  0e61 cd0000        	call	_ADC1_StartConversion
4362  0e64               L5231:
4363                     ; 767 	while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == 0)
4365  0e64 a680          	ld	a,#128
4366  0e66 cd0000        	call	_ADC1_GetFlagStatus
4368  0e69 4d            	tnz	a
4369  0e6a 27f8          	jreq	L5231
4370                     ; 771 	for(i = 0; i < NUM_INPUT; i++)
4372  0e6c 4f            	clr	a
4373  0e6d 6b05          	ld	(OFST-2,sp),a
4374  0e6f               L1331:
4375                     ; 773 		value = ADC1_GetBufferValue(i);
4377  0e6f cd0000        	call	_ADC1_GetBufferValue
4379  0e72 1f06          	ldw	(OFST-1,sp),x
4380                     ; 775 		if(value  < input.channel[i].usMinValue)
4382  0e74 7b05          	ld	a,(OFST-2,sp)
4383  0e76 97            	ld	xl,a
4384  0e77 a612          	ld	a,#18
4385  0e79 42            	mul	x,a
4386  0e7a de00ad        	ldw	x,(_input+2,x)
4387  0e7d 1306          	cpw	x,(OFST-1,sp)
4388  0e7f 230b          	jrule	L7331
4389                     ; 777 			value = input.channel[i].usMinValue;
4391  0e81 7b05          	ld	a,(OFST-2,sp)
4392  0e83 97            	ld	xl,a
4393  0e84 a612          	ld	a,#18
4394  0e86 42            	mul	x,a
4395  0e87 de00ad        	ldw	x,(_input+2,x)
4396  0e8a 1f06          	ldw	(OFST-1,sp),x
4397  0e8c               L7331:
4398                     ; 779 		if(value  > input.channel[i].usMaxValue)
4400  0e8c 7b05          	ld	a,(OFST-2,sp)
4401  0e8e 97            	ld	xl,a
4402  0e8f a612          	ld	a,#18
4403  0e91 42            	mul	x,a
4404  0e92 de00b1        	ldw	x,(_input+6,x)
4405  0e95 1306          	cpw	x,(OFST-1,sp)
4406  0e97 240b          	jruge	L1431
4407                     ; 781 			value = input.channel[i].usMaxValue;
4409  0e99 7b05          	ld	a,(OFST-2,sp)
4410  0e9b 97            	ld	xl,a
4411  0e9c a612          	ld	a,#18
4412  0e9e 42            	mul	x,a
4413  0e9f de00b1        	ldw	x,(_input+6,x)
4414  0ea2 1f06          	ldw	(OFST-1,sp),x
4415  0ea4               L1431:
4416                     ; 784 		if(value  < input.channel[i].usNeutralValue)
4418  0ea4 7b05          	ld	a,(OFST-2,sp)
4419  0ea6 97            	ld	xl,a
4420  0ea7 a612          	ld	a,#18
4421  0ea9 42            	mul	x,a
4422  0eaa de00af        	ldw	x,(_input+4,x)
4423  0ead 1306          	cpw	x,(OFST-1,sp)
4424  0eaf 2335          	jrule	L3431
4425                     ; 786 			delta = value - input.channel[i].usMinValue;
4427  0eb1 7b05          	ld	a,(OFST-2,sp)
4428  0eb3 97            	ld	xl,a
4429  0eb4 a612          	ld	a,#18
4430  0eb6 42            	mul	x,a
4431  0eb7 1606          	ldw	y,(OFST-1,sp)
4432  0eb9 de00ad        	ldw	x,(_input+2,x)
4433  0ebc bf00          	ldw	c_y,x
4434  0ebe 72b20000      	subw	y,c_y
4435  0ec2 1706          	ldw	(OFST-1,sp),y
4436                     ; 787 			value = delta * input.channel[i].pente[0] / 256;
4438  0ec4 1e06          	ldw	x,(OFST-1,sp)
4439  0ec6 cd0000        	call	c_uitolx
4441  0ec9 96            	ldw	x,sp
4442  0eca 5c            	incw	x
4443  0ecb cd0000        	call	c_rtol
4445  0ece 7b05          	ld	a,(OFST-2,sp)
4446  0ed0 97            	ld	xl,a
4447  0ed1 a612          	ld	a,#18
4448  0ed3 42            	mul	x,a
4449  0ed4 1c00b3        	addw	x,#_input+8
4450  0ed7 cd0000        	call	c_ltor
4452  0eda 96            	ldw	x,sp
4453  0edb 5c            	incw	x
4454  0edc cd0000        	call	c_lmul
4456  0edf a608          	ld	a,#8
4457  0ee1 cd0000        	call	c_lursh
4460  0ee4 2039          	jra	L5431
4461  0ee6               L3431:
4462                     ; 791 			delta = value - input.channel[i].usNeutralValue;
4464  0ee6 7b05          	ld	a,(OFST-2,sp)
4465  0ee8 97            	ld	xl,a
4466  0ee9 a612          	ld	a,#18
4467  0eeb 42            	mul	x,a
4468  0eec 1606          	ldw	y,(OFST-1,sp)
4469  0eee de00af        	ldw	x,(_input+4,x)
4470  0ef1 bf00          	ldw	c_y,x
4471  0ef3 72b20000      	subw	y,c_y
4472  0ef7 1706          	ldw	(OFST-1,sp),y
4473                     ; 792 			value = 1000 + (delta * input.channel[i].pente[1] / 256);
4475  0ef9 1e06          	ldw	x,(OFST-1,sp)
4476  0efb cd0000        	call	c_uitolx
4478  0efe 96            	ldw	x,sp
4479  0eff 5c            	incw	x
4480  0f00 cd0000        	call	c_rtol
4482  0f03 7b05          	ld	a,(OFST-2,sp)
4483  0f05 97            	ld	xl,a
4484  0f06 a612          	ld	a,#18
4485  0f08 42            	mul	x,a
4486  0f09 1c00b7        	addw	x,#_input+12
4487  0f0c cd0000        	call	c_ltor
4489  0f0f 96            	ldw	x,sp
4490  0f10 5c            	incw	x
4491  0f11 cd0000        	call	c_lmul
4493  0f14 a608          	ld	a,#8
4494  0f16 cd0000        	call	c_lursh
4496  0f19 ae0028        	ldw	x,#L225
4497  0f1c cd0000        	call	c_ladd
4499  0f1f               L5431:
4500  0f1f be02          	ldw	x,c_lreg+2
4501  0f21 1f06          	ldw	(OFST-1,sp),x
4502                     ; 795 		input.channel[i].usValue = value;
4504  0f23 7b05          	ld	a,(OFST-2,sp)
4505  0f25 97            	ld	xl,a
4506  0f26 a612          	ld	a,#18
4507  0f28 42            	mul	x,a
4508  0f29 1606          	ldw	y,(OFST-1,sp)
4509  0f2b df00ab        	ldw	(_input,x),y
4510                     ; 771 	for(i = 0; i < NUM_INPUT; i++)
4512  0f2e 0c05          	inc	(OFST-2,sp)
4515  0f30 7b05          	ld	a,(OFST-2,sp)
4516  0f32 a106          	cp	a,#6
4517  0f34 2403cc0e6f    	jrult	L1331
4518                     ; 798 	ADC1_ClearFlag(ADC1_FLAG_EOC);
4520  0f39 a680          	ld	a,#128
4521  0f3b cd0000        	call	_ADC1_ClearFlag
4523                     ; 799 }
4526  0f3e 5b07          	addw	sp,#7
4527  0f40 81            	ret	
4570                     	switch	.const
4571  002c               L035:
4572  002c 00000064      	dc.l	100
4573                     ; 802 static s16 expou(u16 x, u8 exp)
4573                     ; 803 {
4574                     	switch	.text
4575  0f41               L7431_expou:
4577  0f41 89            	pushw	x
4578  0f42 520c          	subw	sp,#12
4579       0000000c      OFST:	set	12
4582                     ; 805 	return (s16)(((u32)x * x / 1000 * x * exp / 1000
4582                     ; 806 	+ (u32)x * (u8)(100 - exp) + 50) / 100);
4584  0f44 a664          	ld	a,#100
4585  0f46 1011          	sub	a,(OFST+5,sp)
4586  0f48 cd0000        	call	c_cmulx
4588  0f4b 96            	ldw	x,sp
4589  0f4c 1c0009        	addw	x,#OFST-3
4590  0f4f cd0000        	call	c_rtol
4592  0f52 7b11          	ld	a,(OFST+5,sp)
4593  0f54 b703          	ld	c_lreg+3,a
4594  0f56 3f02          	clr	c_lreg+2
4595  0f58 3f01          	clr	c_lreg+1
4596  0f5a 3f00          	clr	c_lreg
4597  0f5c 96            	ldw	x,sp
4598  0f5d 1c0005        	addw	x,#OFST-7
4599  0f60 cd0000        	call	c_rtol
4601  0f63 1e0d          	ldw	x,(OFST+1,sp)
4602  0f65 cd0000        	call	c_uitolx
4604  0f68 96            	ldw	x,sp
4605  0f69 5c            	incw	x
4606  0f6a cd0000        	call	c_rtol
4608  0f6d 1e0d          	ldw	x,(OFST+1,sp)
4609  0f6f 9093          	ldw	y,x
4610  0f71 cd0000        	call	c_umul
4612  0f74 ae0028        	ldw	x,#L225
4613  0f77 cd0000        	call	c_ludv
4615  0f7a 96            	ldw	x,sp
4616  0f7b 5c            	incw	x
4617  0f7c cd0000        	call	c_lmul
4619  0f7f 96            	ldw	x,sp
4620  0f80 1c0005        	addw	x,#OFST-7
4621  0f83 cd0000        	call	c_lmul
4623  0f86 ae0028        	ldw	x,#L225
4624  0f89 cd0000        	call	c_ludv
4626  0f8c 96            	ldw	x,sp
4627  0f8d 1c0009        	addw	x,#OFST-3
4628  0f90 cd0000        	call	c_ladd
4630  0f93 a632          	ld	a,#50
4631  0f95 cd0000        	call	c_ladc
4633  0f98 ae002c        	ldw	x,#L035
4634  0f9b cd0000        	call	c_ludv
4636  0f9e be02          	ldw	x,c_lreg+2
4639  0fa0 5b0e          	addw	sp,#14
4640  0fa2 81            	ret	
4712                     ; 810 static s16 expo(s16 inval, u8 i)
4712                     ; 811 {
4713                     	switch	.text
4714  0fa3               L3731_expo:
4716  0fa3 89            	pushw	x
4717  0fa4 5206          	subw	sp,#6
4718       00000006      OFST:	set	6
4721                     ; 816 	if ((input.channel[i].expo[0] == 0) && (input.channel[i].expo[1] == 0))    return inval;	// no expo
4723  0fa6 7b0b          	ld	a,(OFST+5,sp)
4724  0fa8 97            	ld	xl,a
4725  0fa9 a612          	ld	a,#18
4726  0fab 42            	mul	x,a
4727  0fac d600bb        	ld	a,(_input+16,x)
4728  0faf 2609          	jrne	L3341
4730  0fb1 d600bc        	ld	a,(_input+17,x)
4731  0fb4 2604          	jrne	L3341
4734  0fb6 1e07          	ldw	x,(OFST+1,sp)
4736  0fb8 2004          	jra	L055
4737  0fba               L3341:
4738                     ; 817 	if (inval == 0)  return inval;	// 0 don't change
4740  0fba 1e07          	ldw	x,(OFST+1,sp)
4741  0fbc 2603          	jrne	L5341
4745  0fbe               L055:
4747  0fbe 5b08          	addw	sp,#8
4748  0fc0 81            	ret	
4749  0fc1               L5341:
4750                     ; 819 	neg = (u8)(inval < 0 ? 1 : 0);
4752  0fc1 2a04          	jrpl	L435
4753  0fc3 a601          	ld	a,#1
4754  0fc5 2001          	jra	L635
4755  0fc7               L435:
4756  0fc7 4f            	clr	a
4757  0fc8               L635:
4758  0fc8 6b03          	ld	(OFST-3,sp),a
4759                     ; 821 	if (neg) {
4761  0fca 2710          	jreq	L7341
4762                     ; 822 		inval = -inval;
4764  0fcc 1e07          	ldw	x,(OFST+1,sp)
4765  0fce 50            	negw	x
4766  0fcf 1f07          	ldw	(OFST+1,sp),x
4767                     ; 823 		exp = input.channel[i].expo[0];
4769  0fd1 7b0b          	ld	a,(OFST+5,sp)
4770  0fd3 97            	ld	xl,a
4771  0fd4 a612          	ld	a,#18
4772  0fd6 42            	mul	x,a
4773  0fd7 d600bb        	ld	a,(_input+16,x)
4775  0fda 2009          	jra	L1441
4776  0fdc               L7341:
4777                     ; 826 		exp = input.channel[i].expo[1];
4779  0fdc 7b0b          	ld	a,(OFST+5,sp)
4780  0fde 97            	ld	xl,a
4781  0fdf a612          	ld	a,#18
4782  0fe1 42            	mul	x,a
4783  0fe2 d600bc        	ld	a,(_input+17,x)
4784  0fe5               L1441:
4785  0fe5 6b06          	ld	(OFST+0,sp),a
4786                     ; 828 	if (exp > 0)  val = expou(inval,exp);
4788  0fe7 9c            	rvf	
4789  0fe8 2d09          	jrsle	L3441
4792  0fea 88            	push	a
4793  0feb 1e08          	ldw	x,(OFST+2,sp)
4794  0fed cd0f41        	call	L7431_expou
4796  0ff0 84            	pop	a
4798  0ff1 2014          	jra	L5441
4799  0ff3               L3441:
4800                     ; 829 	else          val = 1000 - expou(1000 - inval,-exp);
4802  0ff3 40            	neg	a
4803  0ff4 88            	push	a
4804  0ff5 ae03e8        	ldw	x,#1000
4805  0ff8 72f008        	subw	x,(OFST+2,sp)
4806  0ffb cd0f41        	call	L7431_expou
4808  0ffe 84            	pop	a
4809  0fff 1f01          	ldw	(OFST-5,sp),x
4810  1001 ae03e8        	ldw	x,#1000
4811  1004 72f001        	subw	x,(OFST-5,sp)
4812  1007               L5441:
4813  1007 1f04          	ldw	(OFST-2,sp),x
4814                     ; 831 	return  neg ? -val : val;
4816  1009 7b03          	ld	a,(OFST-3,sp)
4817  100b 27b1          	jreq	L055
4818  100d 50            	negw	x
4819  100e 20ae          	jra	L055
4854                     ; 834 void lectureswitch(void)
4854                     ; 835 {
4855                     	switch	.text
4856  1010               _lectureswitch:
4860                     ; 838 	if (GPIO_ReadInputPin(GPIOD,GPIO_PIN_7)) memtrimdyn();
4862  1010 4b80          	push	#128
4863  1012 ae500f        	ldw	x,#20495
4864  1015 cd0000        	call	_GPIO_ReadInputPin
4866  1018 5b01          	addw	sp,#1
4867  101a 4d            	tnz	a
4868  101b 2703          	jreq	L7541
4871  101d cd0a1f        	call	_memtrimdyn
4873  1020               L7541:
4874                     ; 841 	secumot = !GPIO_ReadInputPin(GPIOE,GPIO_PIN_0);
4876  1020 4b01          	push	#1
4877  1022 ae5014        	ldw	x,#20500
4878  1025 cd0000        	call	_GPIO_ReadInputPin
4880  1028 5b01          	addw	sp,#1
4881  102a 4d            	tnz	a
4882  102b 2606          	jrne	L065
4883  102d 72100004      	bset	_secumot
4884  1031 2004          	jra	L465
4885  1033               L065:
4886  1033 72110004      	bres	_secumot
4887  1037               L465:
4888                     ; 844 	if (GPIO_ReadInputPin(GPIOE,GPIO_PIN_1))
4890  1037 4b02          	push	#2
4891  1039 ae5014        	ldw	x,#20500
4892  103c cd0000        	call	_GPIO_ReadInputPin
4894  103f 5b01          	addw	sp,#1
4895  1041 4d            	tnz	a
4896  1042 270e          	jreq	L1641
4897                     ; 846 		if (phase_actuelle == 0) phase_change = 1;
4899  1044 b600          	ld	a,_phase_actuelle
4900  1046 2604          	jrne	L3641
4903  1048 72100000      	bset	_phase_change
4904  104c               L3641:
4905                     ; 847 		phase_actuelle = 1;
4907  104c 35010000      	mov	_phase_actuelle,#1
4909  1050 200b          	jra	L5641
4910  1052               L1641:
4911                     ; 851 		if (phase_actuelle == 1) phase_change = 1;
4913  1052 b600          	ld	a,_phase_actuelle
4914  1054 4a            	dec	a
4915  1055 2604          	jrne	L7641
4918  1057 72100000      	bset	_phase_change
4919  105b               L7641:
4920                     ; 852 		phase_actuelle = 0;
4922  105b 3f00          	clr	_phase_actuelle
4923  105d               L5641:
4924                     ; 855 	outputdr = GPIO_ReadInputPin(GPIOE,GPIO_PIN_2);
4926  105d 4b04          	push	#4
4927  105f ae5014        	ldw	x,#20500
4928  1062 cd0000        	call	_GPIO_ReadInputPin
4930  1065 5b01          	addw	sp,#1
4931  1067 4d            	tnz	a
4932  1068 2706          	jreq	L075
4933  106a 72100002      	bset	_outputdr
4934  106e 2004          	jra	L475
4935  1070               L075:
4936  1070 72110002      	bres	_outputdr
4937  1074               L475:
4938                     ; 858 	expon = (GPIO_ReadInputPin(GPIOE,GPIO_PIN_3));
4940  1074 4b08          	push	#8
4941  1076 ae5014        	ldw	x,#20500
4942  1079 cd0000        	call	_GPIO_ReadInputPin
4944  107c 5b01          	addw	sp,#1
4945  107e 4d            	tnz	a
4946  107f 2706          	jreq	L675
4947  1081 72100003      	bset	_expon
4948  1085 2004          	jra	L206
4949  1087               L675:
4950  1087 72110003      	bres	_expon
4951  108b               L206:
4952                     ; 861 	tor1plus = GPIO_ReadInputPin(GPIOA,GPIO_PIN_3);
4954  108b 4b08          	push	#8
4955  108d ae5000        	ldw	x,#20480
4956  1090 cd0000        	call	_GPIO_ReadInputPin
4958  1093 5b01          	addw	sp,#1
4959  1095 4d            	tnz	a
4960  1096 2706          	jreq	L406
4961  1098 72100005      	bset	_tor1plus
4962  109c 2004          	jra	L016
4963  109e               L406:
4964  109e 72110005      	bres	_tor1plus
4965  10a2               L016:
4966                     ; 862 	tor1moins = GPIO_ReadInputPin(GPIOA,GPIO_PIN_4);
4968  10a2 4b10          	push	#16
4969  10a4 ae5000        	ldw	x,#20480
4970  10a7 cd0000        	call	_GPIO_ReadInputPin
4972  10aa 5b01          	addw	sp,#1
4973  10ac 4d            	tnz	a
4974  10ad 2706          	jreq	L216
4975  10af 72100006      	bset	_tor1moins
4976  10b3 2004          	jra	L616
4977  10b5               L216:
4978  10b5 72110006      	bres	_tor1moins
4979  10b9               L616:
4980                     ; 865 	tor2plus = GPIO_ReadInputPin(GPIOA,GPIO_PIN_5);
4982  10b9 4b20          	push	#32
4983  10bb ae5000        	ldw	x,#20480
4984  10be cd0000        	call	_GPIO_ReadInputPin
4986  10c1 5b01          	addw	sp,#1
4987  10c3 4d            	tnz	a
4988  10c4 2706          	jreq	L026
4989  10c6 72100007      	bset	_tor2plus
4990  10ca 2004          	jra	L426
4991  10cc               L026:
4992  10cc 72110007      	bres	_tor2plus
4993  10d0               L426:
4994                     ; 866 	tor2moins = GPIO_ReadInputPin(GPIOA,GPIO_PIN_6);
4996  10d0 4b40          	push	#64
4997  10d2 ae5000        	ldw	x,#20480
4998  10d5 cd0000        	call	_GPIO_ReadInputPin
5000  10d8 5b01          	addw	sp,#1
5001  10da 4d            	tnz	a
5002  10db 2705          	jreq	L626
5003  10dd 72100008      	bset	_tor2moins
5005  10e1 81            	ret	
5006  10e2               L626:
5007  10e2 72110008      	bres	_tor2moins
5008                     ; 868 }
5011  10e6 81            	ret	
5014                     	switch	.ubsct
5015  0000               L3741_fin:
5016  0000 0000          	ds.b	2
5017  0002               L1741_debut:
5018  0002 0000          	ds.b	2
5019  0004               L5741_temps:
5020  0004 0000          	ds.b	2
5073                     ; 870 void duree(void)
5073                     ; 871 {
5074                     	switch	.text
5075  10e7               _duree:
5079                     ; 875 	debut =  TIM3_GetCounter();  
5081  10e7 cd0000        	call	_TIM3_GetCounter
5083  10ea bf02          	ldw	L1741_debut,x
5084                     ; 881 	fin = TIM3_GetCounter();
5086  10ec cd0000        	call	_TIM3_GetCounter
5088  10ef bf00          	ldw	L3741_fin,x
5089                     ; 882 	if (fin > debut)
5091  10f1 b302          	cpw	x,L1741_debut
5092  10f3 232f          	jrule	L5251
5093                     ; 884 		temps =(fin - debut) * 32;
5095  10f5 72b00002      	subw	x,L1741_debut
5096  10f9 58            	sllw	x
5097  10fa 58            	sllw	x
5098  10fb 58            	sllw	x
5099  10fc 58            	sllw	x
5100  10fd 58            	sllw	x
5101  10fe bf04          	ldw	L5741_temps,x
5102                     ; 885 		LCD_printtruc(1,9,"%i\n",temps);
5104  1100 89            	pushw	x
5105  1101 ae010d        	ldw	x,#L512
5106  1104 89            	pushw	x
5107  1105 ae0009        	ldw	x,#9
5108  1108 a601          	ld	a,#1
5109  110a 95            	ld	xh,a
5110  110b cd0000        	call	_LCD_printtruc
5112  110e 5b04          	addw	sp,#4
5113                     ; 886 		LCD_printtruc(2,10,"%i\n",channel);
5115  1110 b600          	ld	a,_channel
5116  1112 5f            	clrw	x
5117  1113 97            	ld	xl,a
5118  1114 89            	pushw	x
5119  1115 ae010d        	ldw	x,#L512
5120  1118 89            	pushw	x
5121  1119 ae000a        	ldw	x,#10
5122  111c a602          	ld	a,#2
5123  111e 95            	ld	xh,a
5124  111f cd0000        	call	_LCD_printtruc
5126  1122 5b04          	addw	sp,#4
5127  1124               L5251:
5128                     ; 888 }
5131  1124 81            	ret	
5188                     ; 890 s16 entreswitch(u8 i,u8 in)
5188                     ; 891 { 
5189                     	switch	.text
5190  1125               _entreswitch:
5192  1125 89            	pushw	x
5193  1126 89            	pushw	x
5194       00000002      OFST:	set	2
5197                     ; 894 	val = 0;
5199  1127 5f            	clrw	x
5200  1128 1f01          	ldw	(OFST-1,sp),x
5201                     ; 896 	if (in == NUM_INPUT)
5203  112a 7b04          	ld	a,(OFST+2,sp)
5204  112c a106          	cp	a,#6
5205  112e 263a          	jrne	L5551
5206                     ; 898 		if (tor1moins) val = mixer[i].pente[0] * (-10);
5208  1130 7201000618    	btjf	_tor1moins,L7551
5211  1135 7b03          	ld	a,(OFST+1,sp)
5212  1137 97            	ld	xl,a
5213  1138 a604          	ld	a,#4
5214  113a 42            	mul	x,a
5215  113b d6006d        	ld	a,(_mixer+2,x)
5216  113e 5f            	clrw	x
5217  113f 4d            	tnz	a
5218  1140 2a01          	jrpl	L056
5219  1142 53            	cplw	x
5220  1143               L056:
5221  1143 97            	ld	xl,a
5222  1144 90aefff6      	ldw	y,#65526
5223  1148 cd0000        	call	c_imul
5225  114b 1f01          	ldw	(OFST-1,sp),x
5226  114d               L7551:
5227                     ; 899 		if (tor1plus) val = mixer[i].pente[1] * 10;
5229  114d 7201000518    	btjf	_tor1plus,L5551
5232  1152 7b03          	ld	a,(OFST+1,sp)
5233  1154 97            	ld	xl,a
5234  1155 a604          	ld	a,#4
5235  1157 42            	mul	x,a
5236  1158 d6006e        	ld	a,(_mixer+3,x)
5237  115b 5f            	clrw	x
5238  115c 4d            	tnz	a
5239  115d 2a01          	jrpl	L256
5240  115f 53            	cplw	x
5241  1160               L256:
5242  1160 97            	ld	xl,a
5243  1161 90ae000a      	ldw	y,#10
5244  1165 cd0000        	call	c_imul
5246  1168 1f01          	ldw	(OFST-1,sp),x
5247  116a               L5551:
5248                     ; 901 	if (in == (NUM_INPUT + 1))
5250  116a 7b04          	ld	a,(OFST+2,sp)
5251  116c a107          	cp	a,#7
5252  116e 2638          	jrne	L3651
5253                     ; 903 		if (tor2moins) val = mixer[i].pente[0] * (-10);
5255  1170 7201000818    	btjf	_tor2moins,L5651
5258  1175 7b03          	ld	a,(OFST+1,sp)
5259  1177 97            	ld	xl,a
5260  1178 a604          	ld	a,#4
5261  117a 42            	mul	x,a
5262  117b d6006d        	ld	a,(_mixer+2,x)
5263  117e 5f            	clrw	x
5264  117f 4d            	tnz	a
5265  1180 2a01          	jrpl	L456
5266  1182 53            	cplw	x
5267  1183               L456:
5268  1183 97            	ld	xl,a
5269  1184 90aefff6      	ldw	y,#65526
5270  1188 cd0000        	call	c_imul
5272  118b 1f01          	ldw	(OFST-1,sp),x
5273  118d               L5651:
5274                     ; 904 		if (tor2plus) val = mixer[i].pente[1] * 10;
5276  118d 7201000716    	btjf	_tor2plus,L3651
5279  1192 7b03          	ld	a,(OFST+1,sp)
5280  1194 97            	ld	xl,a
5281  1195 a604          	ld	a,#4
5282  1197 42            	mul	x,a
5283  1198 d6006e        	ld	a,(_mixer+3,x)
5284  119b 5f            	clrw	x
5285  119c 4d            	tnz	a
5286  119d 2a01          	jrpl	L656
5287  119f 53            	cplw	x
5288  11a0               L656:
5289  11a0 97            	ld	xl,a
5290  11a1 90ae000a      	ldw	y,#10
5291  11a5 cd0000        	call	c_imul
5293  11a8               L3651:
5294                     ; 906 	return val;
5298  11a8 5b04          	addw	sp,#4
5299  11aa 81            	ret	
5344                     ; 909 void compute_expo(void)
5344                     ; 910 {	
5345                     	switch	.text
5346  11ab               _compute_expo:
5348  11ab 5205          	subw	sp,#5
5349       00000005      OFST:	set	5
5352                     ; 914 	for(i =0 ; i < NUM_INPUT; i++)
5354  11ad 4f            	clr	a
5355  11ae 6b05          	ld	(OFST+0,sp),a
5356  11b0               L3161:
5357                     ; 917 		val16 = input.channel[i].usValue - 1000;
5359  11b0 97            	ld	xl,a
5360  11b1 a612          	ld	a,#18
5361  11b3 42            	mul	x,a
5362  11b4 de00ab        	ldw	x,(_input,x)
5363  11b7 1d03e8        	subw	x,#1000
5364  11ba 1f03          	ldw	(OFST-2,sp),x
5365                     ; 919 		input.channel[i].usValue = expo(val16,i) + 1000; 
5367  11bc 7b05          	ld	a,(OFST+0,sp)
5368  11be 88            	push	a
5369  11bf 1e04          	ldw	x,(OFST-1,sp)
5370  11c1 cd0fa3        	call	L3731_expo
5372  11c4 1c03e8        	addw	x,#1000
5373  11c7 84            	pop	a
5374  11c8 1f01          	ldw	(OFST-4,sp),x
5375  11ca 7b05          	ld	a,(OFST+0,sp)
5376  11cc 97            	ld	xl,a
5377  11cd a612          	ld	a,#18
5378  11cf 42            	mul	x,a
5379  11d0 1601          	ldw	y,(OFST-4,sp)
5380  11d2 df00ab        	ldw	(_input,x),y
5381                     ; 914 	for(i =0 ; i < NUM_INPUT; i++)
5383  11d5 0c05          	inc	(OFST+0,sp)
5386  11d7 7b05          	ld	a,(OFST+0,sp)
5387  11d9 a106          	cp	a,#6
5388  11db 25d3          	jrult	L3161
5389                     ; 921 }
5392  11dd 5b05          	addw	sp,#5
5393  11df 81            	ret	
5396                     	switch	.bit
5397  000f               L1261_sens:
5398  000f 01            	dc.b	1
5399                     	bsct
5400  004a               L3261_wave:
5401  004a 0000          	dc.w	0
5483                     ; 923 void compute_mixer(void)
5483                     ; 924 {
5484                     	switch	.text
5485  11e0               _compute_mixer:
5487  11e0 5207          	subw	sp,#7
5488       00000007      OFST:	set	7
5491                     ; 925 	u8 i = 0;
5493                     ; 931 	if (sens) wave+=10; else wave-=10;
5495  11e2 be4a          	ldw	x,L3261_wave
5496  11e4 7201000f05    	btjf	L1261_sens,L7661
5499  11e9 1c000a        	addw	x,#10
5501  11ec 2003          	jra	L1761
5502  11ee               L7661:
5505  11ee 1d000a        	subw	x,#10
5506  11f1               L1761:
5507  11f1 bf4a          	ldw	L3261_wave,x
5508                     ; 932 	if (wave < (-999)) sens = !sens;
5510  11f3 a3fc19        	cpw	x,#64537
5511  11f6 2e04          	jrsge	L3761
5514  11f8 9010000f      	bcpl	L1261_sens
5515  11fc               L3761:
5516                     ; 933 	if (wave > 999) sens = !sens;
5518  11fc a303e8        	cpw	x,#1000
5519  11ff 2f04          	jrslt	L5761
5522  1201 9010000f      	bcpl	L1261_sens
5523  1205               L5761:
5524                     ; 935 	for(i = 0; i < NUM_OUTPUT ; i++)
5526  1205 4f            	clr	a
5527  1206 6b03          	ld	(OFST-4,sp),a
5528  1208               L7761:
5529                     ; 937 		output.sValue[i] = 0;
5531  1208 97            	ld	xl,a
5532  1209 a604          	ld	a,#4
5533  120b 42            	mul	x,a
5534  120c 4f            	clr	a
5535  120d d7000c        	ld	(_output+12,x),a
5536  1210 d7000b        	ld	(_output+11,x),a
5537  1213 d7000a        	ld	(_output+10,x),a
5538  1216 d70009        	ld	(_output+9,x),a
5539                     ; 935 	for(i = 0; i < NUM_OUTPUT ; i++)
5541  1219 0c03          	inc	(OFST-4,sp)
5544  121b 7b03          	ld	a,(OFST-4,sp)
5545  121d a108          	cp	a,#8
5546  121f 25e7          	jrult	L7761
5547                     ; 940 	for(i = 0; i < NUM_MIXER ; i++)
5549  1221 4f            	clr	a
5550  1222 6b03          	ld	(OFST-4,sp),a
5551  1224               L5071:
5552                     ; 942 		u8 in = mixer[i].in;
5554  1224 97            	ld	xl,a
5555  1225 a604          	ld	a,#4
5556  1227 42            	mul	x,a
5557  1228 d6006b        	ld	a,(_mixer,x)
5558  122b 6b02          	ld	(OFST-5,sp),a
5559                     ; 943 		u8 out = mixer[i].out;
5561  122d d6006c        	ld	a,(_mixer+1,x)
5562  1230 6b01          	ld	(OFST-6,sp),a
5563                     ; 945 		if (out < NUM_OUTPUT)
5565  1232 a108          	cp	a,#8
5566  1234 2503cc139b    	jruge	L3171
5567                     ; 947 			if(in < NUM_INPUT)
5569  1239 7b02          	ld	a,(OFST-5,sp)
5570  123b a106          	cp	a,#6
5571  123d 2503cc1313    	jruge	L5171
5572                     ; 949 				if(input.channel[in].usValue < 1000)
5574  1242 97            	ld	xl,a
5575  1243 a612          	ld	a,#18
5576  1245 42            	mul	x,a
5577  1246 9093          	ldw	y,x
5578  1248 90de00ab      	ldw	y,(_input,y)
5579  124c 90a303e8      	cpw	y,#1000
5580  1250 2465          	jruge	L7171
5581                     ; 951 					delta32 = 1000 - input.channel[in].usValue;
5583  1252 90ae03e8      	ldw	y,#1000
5584  1256 de00ab        	ldw	x,(_input,x)
5585  1259 bf00          	ldw	c_y,x
5586  125b 72b20000      	subw	y,c_y
5587  125f cd0000        	call	c_uitoly
5589  1262 96            	ldw	x,sp
5590  1263 1c0004        	addw	x,#OFST-3
5591  1266 cd0000        	call	c_rtol
5593                     ; 952 					delta32 *= mixer[i].pente[0];
5595  1269 7b03          	ld	a,(OFST-4,sp)
5596  126b 97            	ld	xl,a
5597  126c a604          	ld	a,#4
5598  126e 42            	mul	x,a
5599  126f d6006d        	ld	a,(_mixer+2,x)
5600  1272 b703          	ld	c_lreg+3,a
5601  1274 48            	sll	a
5602  1275 4f            	clr	a
5603  1276 a200          	sbc	a,#0
5604  1278 b702          	ld	c_lreg+2,a
5605  127a b701          	ld	c_lreg+1,a
5606  127c b700          	ld	c_lreg,a
5607  127e 96            	ldw	x,sp
5608  127f 1c0004        	addw	x,#OFST-3
5609  1282 cd0000        	call	c_lgmul
5611                     ; 953 					delta32 /= 100;
5613  1285 96            	ldw	x,sp
5614  1286 1c0004        	addw	x,#OFST-3
5615  1289 cd0000        	call	c_ltor
5617  128c ae002c        	ldw	x,#L035
5618  128f cd0000        	call	c_ldiv
5620  1292 96            	ldw	x,sp
5621  1293 1c0004        	addw	x,#OFST-3
5622  1296 cd0000        	call	c_rtol
5624                     ; 954 					output.sValue[out] -= delta32; 
5626  1299 7b01          	ld	a,(OFST-6,sp)
5627  129b 97            	ld	xl,a
5628  129c a604          	ld	a,#4
5629  129e 42            	mul	x,a
5630  129f 7b07          	ld	a,(OFST+0,sp)
5631  12a1 b703          	ld	c_lreg+3,a
5632  12a3 7b06          	ld	a,(OFST-1,sp)
5633  12a5 b702          	ld	c_lreg+2,a
5634  12a7 7b05          	ld	a,(OFST-2,sp)
5635  12a9 b701          	ld	c_lreg+1,a
5636  12ab 7b04          	ld	a,(OFST-3,sp)
5637  12ad b700          	ld	c_lreg,a
5638  12af 1c0009        	addw	x,#_output+9
5639  12b2 cd0000        	call	c_lgsub
5642  12b5 205c          	jra	L5171
5643  12b7               L7171:
5644                     ; 958 					delta32 = input.channel[in].usValue - 1000;
5646  12b7 de00ab        	ldw	x,(_input,x)
5647  12ba 1d03e8        	subw	x,#1000
5648  12bd cd0000        	call	c_uitolx
5650  12c0 96            	ldw	x,sp
5651  12c1 1c0004        	addw	x,#OFST-3
5652  12c4 cd0000        	call	c_rtol
5654                     ; 959 					delta32 *= mixer[i].pente[1];
5656  12c7 7b03          	ld	a,(OFST-4,sp)
5657  12c9 97            	ld	xl,a
5658  12ca a604          	ld	a,#4
5659  12cc 42            	mul	x,a
5660  12cd d6006e        	ld	a,(_mixer+3,x)
5661  12d0 b703          	ld	c_lreg+3,a
5662  12d2 48            	sll	a
5663  12d3 4f            	clr	a
5664  12d4 a200          	sbc	a,#0
5665  12d6 b702          	ld	c_lreg+2,a
5666  12d8 b701          	ld	c_lreg+1,a
5667  12da b700          	ld	c_lreg,a
5668  12dc 96            	ldw	x,sp
5669  12dd 1c0004        	addw	x,#OFST-3
5670  12e0 cd0000        	call	c_lgmul
5672                     ; 960 					delta32 /= 100;
5674  12e3 96            	ldw	x,sp
5675  12e4 1c0004        	addw	x,#OFST-3
5676  12e7 cd0000        	call	c_ltor
5678  12ea ae002c        	ldw	x,#L035
5679  12ed cd0000        	call	c_ldiv
5681  12f0 96            	ldw	x,sp
5682  12f1 1c0004        	addw	x,#OFST-3
5683  12f4 cd0000        	call	c_rtol
5685                     ; 961 					output.sValue[out] += delta32;
5687  12f7 7b01          	ld	a,(OFST-6,sp)
5688  12f9 97            	ld	xl,a
5689  12fa a604          	ld	a,#4
5690  12fc 42            	mul	x,a
5691  12fd 7b07          	ld	a,(OFST+0,sp)
5692  12ff b703          	ld	c_lreg+3,a
5693  1301 7b06          	ld	a,(OFST-1,sp)
5694  1303 b702          	ld	c_lreg+2,a
5695  1305 7b05          	ld	a,(OFST-2,sp)
5696  1307 b701          	ld	c_lreg+1,a
5697  1309 7b04          	ld	a,(OFST-3,sp)
5698  130b b700          	ld	c_lreg,a
5699  130d 1c0009        	addw	x,#_output+9
5700  1310 cd0000        	call	c_lgadd
5702  1313               L5171:
5703                     ; 965 			if((in > (NUM_INPUT - 1)) && (in < (NUM_INPUT + NUM_INPUT_SWITCH))) // Switchs
5705  1313 7b02          	ld	a,(OFST-5,sp)
5706  1315 a106          	cp	a,#6
5707  1317 251c          	jrult	L3271
5709  1319 a108          	cp	a,#8
5710  131b 2418          	jruge	L3271
5711                     ; 967 				output.sValue[out] += entreswitch(i,in);
5713  131d 97            	ld	xl,a
5714  131e 7b03          	ld	a,(OFST-4,sp)
5715  1320 95            	ld	xh,a
5716  1321 cd1125        	call	_entreswitch
5718  1324 cd0000        	call	c_itolx
5720  1327 7b01          	ld	a,(OFST-6,sp)
5721  1329 97            	ld	xl,a
5722  132a a604          	ld	a,#4
5723  132c 42            	mul	x,a
5724  132d 1c0009        	addw	x,#_output+9
5725  1330 cd0000        	call	c_lgadd
5727  1333 7b02          	ld	a,(OFST-5,sp)
5728  1335               L3271:
5729                     ; 970 			if(in == (NUM_INPUT + NUM_INPUT_SWITCH)) // Voie test
5731  1335 a108          	cp	a,#8
5732  1337 2662          	jrne	L3171
5733                     ; 972 				delta32 = wave;
5735  1339 be4a          	ldw	x,L3261_wave
5736  133b cd0000        	call	c_itolx
5738  133e 96            	ldw	x,sp
5739  133f 1c0004        	addw	x,#OFST-3
5740  1342 cd0000        	call	c_rtol
5742                     ; 974 				if (sens)
5744  1345 7b03          	ld	a,(OFST-4,sp)
5745  1347 97            	ld	xl,a
5746  1348 a604          	ld	a,#4
5747  134a 42            	mul	x,a
5748  134b 7201000f05    	btjf	L1261_sens,L7271
5749                     ; 976 					delta32 *= mixer[i].pente[0];
5751  1350 d6006d        	ld	a,(_mixer+2,x)
5753                     ; 977 					delta32 /= 100;
5758  1353 2003          	jra	L1371
5759  1355               L7271:
5760                     ; 981 					delta32 *= mixer[i].pente[1];
5762  1355 d6006e        	ld	a,(_mixer+3,x)
5764                     ; 982 					delta32 /= 100;
5769  1358               L1371:
5770  1358 b703          	ld	c_lreg+3,a
5771  135a 48            	sll	a
5772  135b 4f            	clr	a
5773  135c a200          	sbc	a,#0
5774  135e b702          	ld	c_lreg+2,a
5775  1360 b701          	ld	c_lreg+1,a
5776  1362 b700          	ld	c_lreg,a
5777  1364 96            	ldw	x,sp
5778  1365 1c0004        	addw	x,#OFST-3
5779  1368 cd0000        	call	c_lgmul
5781  136b 96            	ldw	x,sp
5782  136c 1c0004        	addw	x,#OFST-3
5783  136f cd0000        	call	c_ltor
5784  1372 ae002c        	ldw	x,#L035
5785  1375 cd0000        	call	c_ldiv
5786  1378 96            	ldw	x,sp
5787  1379 1c0004        	addw	x,#OFST-3
5788  137c cd0000        	call	c_rtol
5789                     ; 985 				output.sValue[out] += delta32;
5791  137f 7b01          	ld	a,(OFST-6,sp)
5792  1381 97            	ld	xl,a
5793  1382 a604          	ld	a,#4
5794  1384 42            	mul	x,a
5795  1385 7b07          	ld	a,(OFST+0,sp)
5796  1387 b703          	ld	c_lreg+3,a
5797  1389 7b06          	ld	a,(OFST-1,sp)
5798  138b b702          	ld	c_lreg+2,a
5799  138d 7b05          	ld	a,(OFST-2,sp)
5800  138f b701          	ld	c_lreg+1,a
5801  1391 7b04          	ld	a,(OFST-3,sp)
5802  1393 b700          	ld	c_lreg,a
5803  1395 1c0009        	addw	x,#_output+9
5804  1398 cd0000        	call	c_lgadd
5806  139b               L3171:
5807                     ; 940 	for(i = 0; i < NUM_MIXER ; i++)
5809  139b 0c03          	inc	(OFST-4,sp)
5812  139d 7b03          	ld	a,(OFST-4,sp)
5813  139f a110          	cp	a,#16
5814  13a1 2403cc1224    	jrult	L5071
5815                     ; 989 }
5818  13a6 5b07          	addw	sp,#7
5819  13a8 81            	ret	
5876                     ; 991 void scale_output(void)
5876                     ; 992 { 
5877                     	switch	.text
5878  13a9               _scale_output:
5880  13a9 5207          	subw	sp,#7
5881       00000007      OFST:	set	7
5884                     ; 994 	u8 i = 0;
5886                     ; 997 	output.usValueOut[NUM_OUTPUT] = LONGUEUR_TRAME;
5888  13ab aeac44        	ldw	x,#44100
5889  13ae cf0069        	ldw	_output+105,x
5890                     ; 999 	for(i = 0; i < NUM_OUTPUT ; i++)
5892  13b1 0f07          	clr	(OFST+0,sp)
5893  13b3               L1671:
5894                     ; 1002 		if (outputdr) //outputdr
5896  13b3 720100024b    	btjf	_outputdr,L7671
5897                     ; 1004 			drtemp = output.dr[i];
5899  13b8 7b07          	ld	a,(OFST+0,sp)
5900  13ba 5f            	clrw	x
5901  13bb 97            	ld	xl,a
5902  13bc d60001        	ld	a,(_output+1,x)
5903  13bf 6b04          	ld	(OFST-3,sp),a
5904  13c1 4f            	clr	a
5905  13c2 6b03          	ld	(OFST-4,sp),a
5906  13c4 6b02          	ld	(OFST-5,sp),a
5907  13c6 6b01          	ld	(OFST-6,sp),a
5908                     ; 1005 			drtemp *= output.sValue[i];
5910  13c8 7b07          	ld	a,(OFST+0,sp)
5911  13ca 97            	ld	xl,a
5912  13cb a604          	ld	a,#4
5913  13cd 42            	mul	x,a
5914  13ce 1c0009        	addw	x,#_output+9
5915  13d1 cd0000        	call	c_ltor
5917  13d4 96            	ldw	x,sp
5918  13d5 5c            	incw	x
5919  13d6 cd0000        	call	c_lgmul
5921                     ; 1006 			drtemp /= 100;
5923  13d9 96            	ldw	x,sp
5924  13da 5c            	incw	x
5925  13db cd0000        	call	c_ltor
5927  13de ae002c        	ldw	x,#L035
5928  13e1 cd0000        	call	c_ldiv
5930  13e4 96            	ldw	x,sp
5931  13e5 5c            	incw	x
5932  13e6 cd0000        	call	c_rtol
5934                     ; 1007 			output.sValue[i] = drtemp;
5936  13e9 7b07          	ld	a,(OFST+0,sp)
5937  13eb 97            	ld	xl,a
5938  13ec a604          	ld	a,#4
5939  13ee 42            	mul	x,a
5940  13ef 7b04          	ld	a,(OFST-3,sp)
5941  13f1 d7000c        	ld	(_output+12,x),a
5942  13f4 7b03          	ld	a,(OFST-4,sp)
5943  13f6 d7000b        	ld	(_output+11,x),a
5944  13f9 7b02          	ld	a,(OFST-5,sp)
5945  13fb d7000a        	ld	(_output+10,x),a
5946  13fe 7b01          	ld	a,(OFST-6,sp)
5947  1400 d70009        	ld	(_output+9,x),a
5948  1403               L7671:
5949                     ; 1010 		val = output.sValue[i] + output.usNeutralValue[i];
5951  1403 7b07          	ld	a,(OFST+0,sp)
5952  1405 5f            	clrw	x
5953  1406 97            	ld	xl,a
5954  1407 58            	sllw	x
5955  1408 905f          	clrw	y
5956  140a de0039        	ldw	x,(_output+57,x)
5957  140d 9097          	ld	yl,a
5958  140f 9058          	sllw	y
5959  1411 9058          	sllw	y
5960  1413 90de000b      	ldw	y,(_output+11,y)
5961  1417 90bf00        	ldw	c_x,y
5962  141a 72bb0000      	addw	x,c_x
5963  141e 1f05          	ldw	(OFST-2,sp),x
5964                     ; 1012 		if(val < output.usMinValue[i])
5966  1420 5f            	clrw	x
5967  1421 97            	ld	xl,a
5968  1422 58            	sllw	x
5969  1423 de0029        	ldw	x,(_output+41,x)
5970  1426 1305          	cpw	x,(OFST-2,sp)
5971  1428 2308          	jrule	L1771
5972                     ; 1014 			val = output.usMinValue[i];
5974  142a 5f            	clrw	x
5975  142b 97            	ld	xl,a
5976  142c 58            	sllw	x
5977  142d de0029        	ldw	x,(_output+41,x)
5978  1430 1f05          	ldw	(OFST-2,sp),x
5979  1432               L1771:
5980                     ; 1016 		if(val > output.usMaxValue[i])
5982  1432 5f            	clrw	x
5983  1433 97            	ld	xl,a
5984  1434 58            	sllw	x
5985  1435 de0049        	ldw	x,(_output+73,x)
5986  1438 1305          	cpw	x,(OFST-2,sp)
5987  143a 2408          	jruge	L3771
5988                     ; 1018 			val = output.usMaxValue[i];
5990  143c 5f            	clrw	x
5991  143d 97            	ld	xl,a
5992  143e 58            	sllw	x
5993  143f de0049        	ldw	x,(_output+73,x)
5994  1442 1f05          	ldw	(OFST-2,sp),x
5995  1444               L3771:
5996                     ; 1021 		if ((secumot) && (i == output.secumoteur)) 	output.usValueOut[i] = output.usMinValue[i];
5998  1444 7201000410    	btjf	_secumot,L5771
6000  1449 c10000        	cp	a,_output
6001  144c 260b          	jrne	L5771
6004  144e 5f            	clrw	x
6005  144f 97            	ld	xl,a
6006  1450 58            	sllw	x
6007  1451 9093          	ldw	y,x
6008  1453 90de0029      	ldw	y,(_output+41,y)
6010  1457 2005          	jra	L7771
6011  1459               L5771:
6012                     ; 1022 		else output.usValueOut[i] = val;
6014  1459 5f            	clrw	x
6015  145a 97            	ld	xl,a
6016  145b 58            	sllw	x
6017  145c 1605          	ldw	y,(OFST-2,sp)
6018  145e               L7771:
6019  145e df0059        	ldw	(_output+89,x),y
6020                     ; 1024 		output.usValueOut[NUM_OUTPUT] = output.usValueOut[NUM_OUTPUT] - output.usValueOut[i];
6022  1461 905f          	clrw	y
6023  1463 ce0069        	ldw	x,_output+105
6024  1466 9097          	ld	yl,a
6025  1468 9058          	sllw	y
6026  146a 90de0059      	ldw	y,(_output+89,y)
6027  146e 90bf00        	ldw	c_x,y
6028  1471 72b00000      	subw	x,c_x
6029  1475 cf0069        	ldw	_output+105,x
6030                     ; 1026 		barout[i] = nivbar(output.usValueOut[i]); //calcul pour affichage
6032  1478 5f            	clrw	x
6033  1479 97            	ld	xl,a
6034  147a 89            	pushw	x
6035  147b 7b09          	ld	a,(OFST+2,sp)
6036  147d 5f            	clrw	x
6037  147e 97            	ld	xl,a
6038  147f 58            	sllw	x
6039  1480 de0059        	ldw	x,(_output+89,x)
6040  1483 cd034c        	call	_nivbar
6042  1486 85            	popw	x
6043  1487 e71b          	ld	(_barout,x),a
6044                     ; 999 	for(i = 0; i < NUM_OUTPUT ; i++)
6046  1489 0c07          	inc	(OFST+0,sp)
6049  148b 7b07          	ld	a,(OFST+0,sp)
6050  148d a108          	cp	a,#8
6051  148f 2403cc13b3    	jrult	L1671
6052                     ; 1029 }
6055  1494 5b07          	addw	sp,#7
6056  1496 81            	ret	
6106                     ; 1031 void initialise(void)
6106                     ; 1032 {
6107                     	switch	.text
6108  1497               _initialise:
6112                     ; 1034 	CLK_DeInit();
6114  1497 cd0000        	call	_CLK_DeInit
6116                     ; 1035 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
6118  149a 4b00          	push	#0
6119  149c 4b00          	push	#0
6120  149e ae00b4        	ldw	x,#180
6121  14a1 a601          	ld	a,#1
6122  14a3 95            	ld	xh,a
6123  14a4 cd0000        	call	_CLK_ClockSwitchConfig
6125  14a7 4f            	clr	a
6126  14a8 85            	popw	x
6127                     ; 1036 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
6129  14a9 cd0000        	call	_CLK_HSIPrescalerConfig
6131                     ; 1037 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
6133  14ac ae0001        	ldw	x,#1
6134  14af a613          	ld	a,#19
6135  14b1 95            	ld	xh,a
6136  14b2 cd0000        	call	_CLK_PeripheralClockConfig
6138                     ; 1038 	CLK_ClockSecuritySystemEnable();
6140  14b5 cd0000        	call	_CLK_ClockSecuritySystemEnable
6142                     ; 1041 	GPIO_DeInit(GPIOD);
6144  14b8 ae500f        	ldw	x,#20495
6145  14bb cd0000        	call	_GPIO_DeInit
6147                     ; 1042 	GPIO_Init(GPIOD, (GPIO_PIN_3 ), GPIO_MODE_OUT_PP_LOW_SLOW); // tim2 ppm
6149  14be 4bc0          	push	#192
6150  14c0 4b08          	push	#8
6151  14c2 ae500f        	ldw	x,#20495
6152  14c5 cd0000        	call	_GPIO_Init
6154  14c8 85            	popw	x
6155                     ; 1043 	GPIO_Init(GPIOD, (GPIO_PIN_4 ), GPIO_MODE_OUT_PP_LOW_SLOW); // bip
6157  14c9 4bc0          	push	#192
6158  14cb 4b10          	push	#16
6159  14cd ae500f        	ldw	x,#20495
6160  14d0 cd0000        	call	_GPIO_Init
6162  14d3 85            	popw	x
6163                     ; 1044 	GPIO_Init(GPIOD, (GPIO_PIN_0 ), GPIO_MODE_OUT_PP_LOW_SLOW); // led run
6165  14d4 4bc0          	push	#192
6166  14d6 4b01          	push	#1
6167  14d8 ae500f        	ldw	x,#20495
6168  14db cd0000        	call	_GPIO_Init
6170  14de 85            	popw	x
6171                     ; 1047 	GPIO_DeInit(LCDPort);
6173  14df ae500a        	ldw	x,#20490
6174  14e2 cd0000        	call	_GPIO_DeInit
6176                     ; 1048 	GPIO_DeInit(LCDControlPort);
6178  14e5 ae500a        	ldw	x,#20490
6179  14e8 cd0000        	call	_GPIO_DeInit
6181                     ; 1049 	GPIO_Init(LCDPort, GPIO_PIN_HNIB, GPIO_MODE_OUT_PP_LOW_FAST);
6183  14eb 4be0          	push	#224
6184  14ed 4bf0          	push	#240
6185  14ef ae500a        	ldw	x,#20490
6186  14f2 cd0000        	call	_GPIO_Init
6188  14f5 85            	popw	x
6189                     ; 1050 	GPIO_Init(LCDControlPort, LCD_RS, GPIO_MODE_OUT_PP_LOW_FAST);
6191  14f6 4be0          	push	#224
6192  14f8 4b04          	push	#4
6193  14fa ae500a        	ldw	x,#20490
6194  14fd cd0000        	call	_GPIO_Init
6196  1500 85            	popw	x
6197                     ; 1051 	GPIO_Init(LCDControlPort, LCD_Enable, GPIO_MODE_OUT_PP_LOW_FAST);
6199  1501 4be0          	push	#224
6200  1503 4b08          	push	#8
6201  1505 ae500a        	ldw	x,#20490
6202  1508 cd0000        	call	_GPIO_Init
6204  150b 85            	popw	x
6205                     ; 1054 	GPIO_DeInit(GPIOE);
6207  150c ae5014        	ldw	x,#20500
6208  150f cd0000        	call	_GPIO_DeInit
6210                     ; 1055 	GPIO_DeInit(GPIOG);
6212  1512 ae501e        	ldw	x,#20510
6213  1515 cd0000        	call	_GPIO_DeInit
6215                     ; 1056 	GPIO_DeInit(GPIOA);
6217  1518 ae5000        	ldw	x,#20480
6218  151b cd0000        	call	_GPIO_DeInit
6220                     ; 1058 	GPIO_Init(GPIOC,GPIO_PIN_1,GPIO_MODE_IN_FL_NO_IT);
6222  151e 4b00          	push	#0
6223  1520 4b02          	push	#2
6224  1522 ae500a        	ldw	x,#20490
6225  1525 cd0000        	call	_GPIO_Init
6227  1528 85            	popw	x
6228                     ; 1060 	GPIO_Init(GPIOE,GPIO_PIN_0|GPIO_PIN_1|GPIO_PIN_2|GPIO_PIN_3|GPIO_PIN_5,GPIO_MODE_IN_FL_NO_IT);
6230  1529 4b00          	push	#0
6231  152b 4b2f          	push	#47
6232  152d ae5014        	ldw	x,#20500
6233  1530 cd0000        	call	_GPIO_Init
6235  1533 85            	popw	x
6236                     ; 1062 	GPIO_Init(GPIOG,(GPIO_PIN_0 |GPIO_PIN_1),GPIO_MODE_IN_FL_NO_IT);
6238  1534 4b00          	push	#0
6239  1536 4b03          	push	#3
6240  1538 ae501e        	ldw	x,#20510
6241  153b cd0000        	call	_GPIO_Init
6243  153e 85            	popw	x
6244                     ; 1064 	GPIO_Init(GPIOA,GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6,GPIO_MODE_IN_FL_NO_IT);
6246  153f 4b00          	push	#0
6247  1541 4b78          	push	#120
6248  1543 ae5000        	ldw	x,#20480
6249  1546 cd0000        	call	_GPIO_Init
6251  1549 85            	popw	x
6252                     ; 1068 	GPIO_DeInit(GPIOB);
6254  154a ae5005        	ldw	x,#20485
6255  154d cd0000        	call	_GPIO_DeInit
6257                     ; 1069 	GPIO_Init(GPIOB, (GPIO_PIN_0 |GPIO_PIN_1|GPIO_PIN_2| GPIO_PIN_3| GPIO_PIN_4| GPIO_PIN_5| GPIO_PIN_6), GPIO_MODE_IN_FL_NO_IT);
6259  1550 4b00          	push	#0
6260  1552 4b7f          	push	#127
6261  1554 ae5005        	ldw	x,#20485
6262  1557 cd0000        	call	_GPIO_Init
6264  155a 85            	popw	x
6265                     ; 1072 	GPIO_WriteHigh(GPIOD,GPIO_PIN_4);
6267  155b 4b10          	push	#16
6268  155d ae500f        	ldw	x,#20495
6269  1560 cd0000        	call	_GPIO_WriteHigh
6271  1563 84            	pop	a
6272                     ; 1076 	LCD_INIT();
6274  1564 cd0000        	call	_LCD_INIT
6276                     ; 1077 	LCD_CMD(CGRAM_address_start);
6278  1567 a640          	ld	a,#64
6279  1569 cd0000        	call	_LCD_CMD
6281                     ; 1078 	LCD_LOAD_CGRAM(cur,8);
6283  156c 4b08          	push	#8
6284  156e ae000a        	ldw	x,#_cur
6285  1571 cd0000        	call	_LCD_LOAD_CGRAM
6287  1574 84            	pop	a
6288                     ; 1081 	ADC1_DeInit();
6290  1575 cd0000        	call	_ADC1_DeInit
6292                     ; 1082 	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE,
6292                     ; 1083 	ADC1_CHANNEL_6,
6292                     ; 1084 	ADC1_PRESSEL_FCPU_D2,
6292                     ; 1085 	ADC1_EXTTRIG_TIM,
6292                     ; 1086 	DISABLE,
6292                     ; 1087 	ADC1_ALIGN_RIGHT,
6292                     ; 1088 	ADC1_SCHMITTTRIG_ALL ,
6292                     ; 1089 	DISABLE);
6294  1578 4b00          	push	#0
6295  157a 4bff          	push	#255
6296  157c 4b08          	push	#8
6297  157e 4b00          	push	#0
6298  1580 4b00          	push	#0
6299  1582 4b00          	push	#0
6300  1584 ae0006        	ldw	x,#6
6301  1587 4f            	clr	a
6302  1588 95            	ld	xh,a
6303  1589 cd0000        	call	_ADC1_Init
6305  158c 5b06          	addw	sp,#6
6306                     ; 1090 	ADC1_ScanModeCmd(ENABLE);
6308  158e a601          	ld	a,#1
6309  1590 cd0000        	call	_ADC1_ScanModeCmd
6311                     ; 1091 	ADC1_DataBufferCmd(ENABLE);
6313  1593 a601          	ld	a,#1
6314  1595 cd0000        	call	_ADC1_DataBufferCmd
6316                     ; 1094 	TIM3_DeInit();
6318  1598 cd0000        	call	_TIM3_DeInit
6320                     ; 1095 	TIM3_TimeBaseInit(TIM3_PRESCALER_512,6249); // 0.2 Seconde
6322  159b ae1869        	ldw	x,#6249
6323  159e 89            	pushw	x
6324  159f a609          	ld	a,#9
6325  15a1 cd0000        	call	_TIM3_TimeBaseInit
6327  15a4 85            	popw	x
6328                     ; 1096 	TIM3_ITConfig(TIM3_IT_UPDATE, ENABLE);
6330  15a5 ae0001        	ldw	x,#1
6331  15a8 a601          	ld	a,#1
6332  15aa 95            	ld	xh,a
6333  15ab cd0000        	call	_TIM3_ITConfig
6335                     ; 1099 	TIM2_DeInit();
6337  15ae cd0000        	call	_TIM2_DeInit
6339                     ; 1100 	TIM2_TimeBaseInit(TIM2_PRESCALER_8, LONGUEUR_TRAME); //22.50ms
6341  15b1 aeac44        	ldw	x,#44100
6342  15b4 89            	pushw	x
6343  15b5 a603          	ld	a,#3
6344  15b7 cd0000        	call	_TIM2_TimeBaseInit
6346  15ba 4f            	clr	a
6347  15bb 85            	popw	x
6348                     ; 1101 	TIM2_ARRPreloadConfig(DISABLE);
6350  15bc cd0000        	call	_TIM2_ARRPreloadConfig
6352                     ; 1102 	TIM2_PrescalerConfig(TIM2_PRESCALER_8, TIM2_PSCRELOADMODE_IMMEDIATE);
6354  15bf ae0001        	ldw	x,#1
6355  15c2 a603          	ld	a,#3
6356  15c4 95            	ld	xh,a
6357  15c5 cd0000        	call	_TIM2_PrescalerConfig
6359                     ; 1103 	TIM2_OC2Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,LONGUEUR_PULSE,TIM2_OCPOLARITY_LOW);//0.3ms
6361  15c8 4b22          	push	#34
6362  15ca ae0258        	ldw	x,#600
6363  15cd 89            	pushw	x
6364  15ce ae0011        	ldw	x,#17
6365  15d1 a660          	ld	a,#96
6366  15d3 95            	ld	xh,a
6367  15d4 cd0000        	call	_TIM2_OC2Init
6369  15d7 5b03          	addw	sp,#3
6370                     ; 1104 	TIM2_OC2PreloadConfig(DISABLE);
6372  15d9 4f            	clr	a
6373  15da cd0000        	call	_TIM2_OC2PreloadConfig
6375                     ; 1105 	TIM2_SetCounter(0);
6377  15dd 5f            	clrw	x
6378  15de cd0000        	call	_TIM2_SetCounter
6380                     ; 1106 	TIM2_ITConfig(TIM2_IT_CC2 + TIM2_IT_UPDATE, ENABLE);
6382  15e1 ae0001        	ldw	x,#1
6383  15e4 a605          	ld	a,#5
6384  15e6 95            	ld	xh,a
6386                     ; 1108 }
6389  15e7 cc0000        	jp	_TIM2_ITConfig
6427                     ; 1110 void calcultrame(void) // Boucle principale irq14
6427                     ; 1111 {
6428                     	switch	.text
6429  15ea               _calcultrame:
6433                     ; 1112 	channel = 0xff;
6435  15ea 35ff0000      	mov	_channel,#255
6436                     ; 1113 	GPIO_WriteLow(GPIOD, GPIO_PIN_0); // led on
6438  15ee 4b01          	push	#1
6439  15f0 ae500f        	ldw	x,#20495
6440  15f3 cd0000        	call	_GPIO_WriteLow
6442  15f6 84            	pop	a
6443                     ; 1114 	captureADC();
6445  15f7 cd0e5f        	call	_captureADC
6447                     ; 1115 	lectureswitch();
6449  15fa cd1010        	call	_lectureswitch
6451                     ; 1116 	if (expon) compute_expo();
6453  15fd 7201000303    	btjf	_expon,L1202
6456  1602 cd11ab        	call	_compute_expo
6458  1605               L1202:
6459                     ; 1117 	compute_mixer();
6461  1605 cd11e0        	call	_compute_mixer
6463                     ; 1118 	if (!flashencour) scale_output();
6465  1608 7200000903    	btjt	_flashencour,L3202
6468  160d cd13a9        	call	_scale_output
6470  1610               L3202:
6471                     ; 1119 	if (phase_change) load_phase(phase_actuelle);
6473  1610 7201000005    	btjf	_phase_change,L5202
6476  1615 b600          	ld	a,_phase_actuelle
6477  1617 cd05e2        	call	_load_phase
6479  161a               L5202:
6480                     ; 1120 	if (trimdyn) settrimdyn();
6482  161a 7201000103    	btjf	_trimdyn,L7202
6485  161f cd09d2        	call	_settrimdyn
6487  1622               L7202:
6488                     ; 1121 	GPIO_WriteHigh(GPIOD, GPIO_PIN_0); // led off
6490  1622 4b01          	push	#1
6491  1624 ae500f        	ldw	x,#20495
6492  1627 cd0000        	call	_GPIO_WriteHigh
6494  162a 3f00          	clr	_channel
6495  162c 84            	pop	a
6496                     ; 1122 	channel = 0;
6498                     ; 1123 }
6501  162d 81            	ret	
6557                     ; 1125 void main(void)
6557                     ; 1126 {
6558                     	switch	.text
6559  162e               _main:
6563                     ; 1127 	initialise();
6565  162e cd1497        	call	_initialise
6567                     ; 1129 	TIM3_Cmd(ENABLE);
6569  1631 a601          	ld	a,#1
6570  1633 cd0000        	call	_TIM3_Cmd
6572                     ; 1132 	modele_actuel = FLASH_ReadByte(BASE_EEPROM);
6574  1636 ae4000        	ldw	x,#16384
6575  1639 89            	pushw	x
6576  163a 5f            	clrw	x
6577  163b 89            	pushw	x
6578  163c cd0000        	call	_FLASH_ReadByte
6580  163f 5b04          	addw	sp,#4
6581  1641 b733          	ld	_modele_actuel,a
6582                     ; 1134 	load_input(modele_actuel);
6584  1643 cd04a2        	call	_load_input
6586                     ; 1135 	lectureswitch();
6588  1646 cd1010        	call	_lectureswitch
6590                     ; 1136 	load_phase(phase_actuelle);
6592  1649 b600          	ld	a,_phase_actuelle
6593  164b cd05e2        	call	_load_phase
6595                     ; 1138 	LCD_printtruc(1,1,"Entr.: %d",NUM_INPUT);
6597  164e ae0006        	ldw	x,#6
6598  1651 89            	pushw	x
6599  1652 ae004b        	ldw	x,#L1402
6600  1655 89            	pushw	x
6601  1656 ae0001        	ldw	x,#1
6602  1659 a601          	ld	a,#1
6603  165b 95            	ld	xh,a
6604  165c cd0000        	call	_LCD_printtruc
6606  165f 5b04          	addw	sp,#4
6607                     ; 1139 	LCD_printtruc(1,10,"Mix : %d",NUM_MIXER);
6609  1661 ae0010        	ldw	x,#16
6610  1664 89            	pushw	x
6611  1665 ae0042        	ldw	x,#L3402
6612  1668 89            	pushw	x
6613  1669 ae000a        	ldw	x,#10
6614  166c a601          	ld	a,#1
6615  166e 95            	ld	xh,a
6616  166f cd0000        	call	_LCD_printtruc
6618  1672 5b04          	addw	sp,#4
6619                     ; 1140 	LCD_printtruc(2,1,"Voies:%d,2 phases",NUM_OUTPUT);
6621  1674 ae0008        	ldw	x,#8
6622  1677 89            	pushw	x
6623  1678 ae0030        	ldw	x,#L5402
6624  167b 89            	pushw	x
6625  167c ae0001        	ldw	x,#1
6626  167f a602          	ld	a,#2
6627  1681 95            	ld	xh,a
6628  1682 cd0000        	call	_LCD_printtruc
6630  1685 5b04          	addw	sp,#4
6631                     ; 1142 	Delayms(1000);
6633  1687 ae03e8        	ldw	x,#1000
6634  168a cd0000        	call	_Delayms
6636                     ; 1143 	LCD_CLEAR_DISPLAY();
6638  168d cd0000        	call	_LCD_CLEAR_DISPLAY
6640                     ; 1145 	synchro = 0;
6642  1690 72110000      	bres	_synchro
6643                     ; 1146 	channel = 0;
6645  1694 3f00          	clr	_channel
6646                     ; 1147 	calcultrame();
6648  1696 cd15ea        	call	_calcultrame
6650                     ; 1148 	TIM2_SetAutoreload(output.usValueOut[0]);
6652  1699 ce0059        	ldw	x,_output+89
6653  169c cd0000        	call	_TIM2_SetAutoreload
6655                     ; 1149 	TIM2_Cmd(ENABLE);	
6657  169f a601          	ld	a,#1
6658  16a1 cd0000        	call	_TIM2_Cmd
6660                     ; 1151 	enableInterrupts();
6663  16a4 9a            	rim	
6665  16a5               L7402:
6666                     ; 1158 		if (channel != 0xff)
6668  16a5 b600          	ld	a,_channel
6669  16a7 4c            	inc	a
6670  16a8 27fb          	jreq	L7402
6671                     ; 1162 			if (Menu_on)	
6673  16aa 7200000003cc  	btjf	_Menu_on,L5502
6674                     ; 1165 				bas = GPIO_ReadInputPin(GPIOC,GPIO_PIN_1);
6676  16b2 4b02          	push	#2
6677  16b4 ae500a        	ldw	x,#20490
6678  16b7 cd0000        	call	_GPIO_ReadInputPin
6680  16ba 5b01          	addw	sp,#1
6681  16bc 4d            	tnz	a
6682  16bd 2706          	jreq	L4011
6683  16bf 7210000b      	bset	_bas
6684  16c3 2004          	jra	L0111
6685  16c5               L4011:
6686  16c5 7211000b      	bres	_bas
6687  16c9               L0111:
6688                     ; 1167 				droite = GPIO_ReadInputPin(GPIOE,GPIO_PIN_5);
6690  16c9 4b20          	push	#32
6691  16cb ae5014        	ldw	x,#20500
6692  16ce cd0000        	call	_GPIO_ReadInputPin
6694  16d1 5b01          	addw	sp,#1
6695  16d3 4d            	tnz	a
6696  16d4 2706          	jreq	L2111
6697  16d6 7210000d      	bset	_droite
6698  16da 2004          	jra	L6111
6699  16dc               L2111:
6700  16dc 7211000d      	bres	_droite
6701  16e0               L6111:
6702                     ; 1169 				gauche = GPIO_ReadInputPin(GPIOG,GPIO_PIN_0);
6704  16e0 4b01          	push	#1
6705  16e2 ae501e        	ldw	x,#20510
6706  16e5 cd0000        	call	_GPIO_ReadInputPin
6708  16e8 5b01          	addw	sp,#1
6709  16ea 4d            	tnz	a
6710  16eb 2706          	jreq	L0211
6711  16ed 7210000c      	bset	_gauche
6712  16f1 2004          	jra	L4211
6713  16f3               L0211:
6714  16f3 7211000c      	bres	_gauche
6715  16f7               L4211:
6716                     ; 1171 				haut = GPIO_ReadInputPin(GPIOG,GPIO_PIN_1);
6718  16f7 4b02          	push	#2
6719  16f9 ae501e        	ldw	x,#20510
6720  16fc cd0000        	call	_GPIO_ReadInputPin
6722  16ff 5b01          	addw	sp,#1
6723  1701 4d            	tnz	a
6724  1702 2706          	jreq	L6211
6725  1704 7210000a      	bset	_haut
6726  1708 2004          	jra	L2311
6727  170a               L6211:
6728  170a 7211000a      	bres	_haut
6729  170e               L2311:
6730                     ; 1173 				Menu_on = 0;
6732  170e 72110000      	bres	_Menu_on
6733                     ; 1175 				if (((bas || gauche || droite) && Menu_actif) || haut)
6735  1712 7200000b0a    	btjt	_bas,L5602
6737  1717 7200000c05    	btjt	_gauche,L5602
6739  171c 7201000d05    	btjf	_droite,L3602
6740  1721               L5602:
6742  1721 7200000005    	btjt	_Menu_actif,L1602
6743  1726               L3602:
6745  1726 7201000a10    	btjf	_haut,L5502
6746  172b               L1602:
6747                     ; 1177 					Menu_actif = Menu_raz = 1;
6749  172b 72100000      	bset	_Menu_raz
6750                     	btst	_Menu_raz
6751  1734 90110000      	bccm	_Menu_actif
6752                     ; 1178 					Menu();
6754  1738 cd0000        	call	_Menu
6756  173b               L5502:
6757                     ; 1183 			if ((sec) && (Menu_actif == 0) && (channel == 0))	
6759  173b 7200000003cc  	btjf	_sec,L7402
6761  1743 72000000f8    	btjt	_Menu_actif,L7402
6763  1748 b600          	ld	a,_channel
6764  174a 26f4          	jrne	L7402
6765                     ; 1185 				chronobat();
6767  174c cd027a        	call	_chronobat
6769                     ; 1186 				info();
6771  174f cd00a0        	call	_info
6773                     ; 1187 				sec = 0;
6775  1752 72110000      	bres	_sec
6776                     ; 1188 				if (bas) razchrono();
6778  1756 7201000b03    	btjf	_bas,L3702
6781  175b cd0073        	call	_razchrono
6783  175e               L3702:
6784                     ; 1189 				if (gauche) razchronobat();
6786  175e 7201000c03    	btjf	_gauche,L5702
6789  1763 cd0089        	call	_razchronobat
6791  1766               L5702:
6792                     ; 1190 				if (droite) biponoff();
6794  1766 7201000dd5    	btjf	_droite,L7402
6797  176b cd0026        	call	_biponoff
6799  176e cc16a5        	jra	L7402
7342                     	xdef	_main
7343                     	xdef	_calcultrame
7344                     	xdef	_initialise
7345                     	xdef	_scale_output
7346                     	xdef	_compute_mixer
7347                     	xdef	_compute_expo
7348                     	xdef	_entreswitch
7349                     	xdef	_duree
7350                     	xdef	_lectureswitch
7351                     	xdef	_captureADC
7352                     	xdef	_etalonnage
7353                     	xdef	_memtrimdyn
7354                     	xdef	_settrimdyn
7355                     	xdef	_save_phase
7356                     	xdef	_save_input
7357                     	xdef	_load_phase
7358                     	xdef	_load_input
7359                     	xdef	_reset_model
7360                     	xdef	_FLASH_ReaddoubleByte
7361                     	xdef	_FLASH_ProgramdoubleByte
7362                     	xdef	_nivbar
7363                     	xdef	_pourcentsortie
7364                     	xdef	_sortiepourcent
7365                     	xdef	_chronobat
7366                     	xdef	_info
7367                     	xdef	_razchronobat
7368                     	xdef	_razchrono
7369                     	xdef	_biponoff
7370                     	xdef	_bip
7371                     	xdef	_cur
7372                     	xdef	_bipon
7373                     	xdef	_tempsbip5
7374                     	xdef	_tempsbip4
7375                     	xdef	_tempsbip3
7376                     	xdef	_tempsbip2
7377                     	xdef	_tempsbip1
7378                     	xdef	_tempotrimdyn
7379                     	xdef	_chargeeaccus
7380                     	xdef	_ratiobat
7381                     	switch	.ubsct
7382  0006               _lbas:
7383  0006 000000000000  	ds.b	9
7384                     	xdef	_lbas
7385  000f               _lhaut:
7386  000f 000000000000  	ds.b	9
7387                     	xdef	_lhaut
7388  0018               _minutes:
7389  0018 00            	ds.b	1
7390                     	xdef	_minutes
7391  0019               _secondes:
7392  0019 00            	ds.b	1
7393                     	xdef	_secondes
7394  001a               _secondesurcinq:
7395  001a 00            	ds.b	1
7396                     	xdef	_secondesurcinq
7397  001b               _barout:
7398  001b 000000000000  	ds.b	8
7399                     	xdef	_barout
7400                     	xdef	_droite
7401                     	xdef	_gauche
7402                     	xdef	_bas
7403                     	xdef	_haut
7404                     	xdef	_flashencour
7405  0023               _trimmem:
7406  0023 000000000000  	ds.b	16
7407                     	xdef	_trimmem
7408                     	xdef	_tor2moins
7409                     	xdef	_tor2plus
7410                     	xdef	_tor1moins
7411                     	xdef	_tor1plus
7412                     	xdef	_secumot
7413                     	xdef	_expon
7414                     	xdef	_outputdr
7415                     	xdef	_trimdyn
7416                     	xdef	_phase_change
7417                     	xref.b	_channel
7418                     	xref.b	_Tempo_menu
7419                     	xbit	_synchro
7420                     	xbit	_Menu_raz
7421                     	xbit	_Menu_actif
7422                     	xbit	_sec
7423                     	xbit	_Menu_on
7424                     	xref	_Menu
7425                     	xref	_LCD_printtruc
7426                     	xref	_LCD_LOCATE
7427                     	xref	_LCD_DISP_OFF
7428                     	xref	_LCD_DISP_ON
7429                     	xref	_LCD_CLEAR_DISPLAY
7430                     	xref	_LCD_CMD
7431                     	xref	_LCD_printstring
7432                     	xref	_LCD_INIT
7433                     	xref	_LCD_LOAD_CGRAM
7434                     	xref	_Delayms
7435                     	switch	.bss
7436  0000               _output:
7437  0000 000000000000  	ds.b	107
7438                     	xdef	_output
7439  006b               _mixer:
7440  006b 000000000000  	ds.b	64
7441                     	xdef	_mixer
7442  00ab               _input:
7443  00ab 000000000000  	ds.b	108
7444                     	xdef	_input
7445                     	xdef	_phase_actuelle
7446                     	switch	.ubsct
7447  0033               _modele_actuel:
7448  0033 00            	ds.b	1
7449                     	xdef	_modele_actuel
7450                     	xref	_TIM3_GetCounter
7451                     	xref	_TIM3_ITConfig
7452                     	xref	_TIM3_Cmd
7453                     	xref	_TIM3_TimeBaseInit
7454                     	xref	_TIM3_DeInit
7455                     	xref	_TIM2_SetAutoreload
7456                     	xref	_TIM2_SetCounter
7457                     	xref	_TIM2_OC2PreloadConfig
7458                     	xref	_TIM2_ARRPreloadConfig
7459                     	xref	_TIM2_PrescalerConfig
7460                     	xref	_TIM2_ITConfig
7461                     	xref	_TIM2_Cmd
7462                     	xref	_TIM2_OC2Init
7463                     	xref	_TIM2_TimeBaseInit
7464                     	xref	_TIM2_DeInit
7465                     	xref	_GPIO_ReadInputPin
7466                     	xref	_GPIO_WriteLow
7467                     	xref	_GPIO_WriteHigh
7468                     	xref	_GPIO_Init
7469                     	xref	_GPIO_DeInit
7470                     	xref	_FLASH_SetProgrammingTime
7471                     	xref	_FLASH_ReadByte
7472                     	xref	_FLASH_ProgramByte
7473                     	xref	_FLASH_DeInit
7474                     	xref	_FLASH_Unlock
7475                     	xref	_CLK_ClockSecuritySystemEnable
7476                     	xref	_CLK_HSIPrescalerConfig
7477                     	xref	_CLK_ClockSwitchConfig
7478                     	xref	_CLK_PeripheralClockConfig
7479                     	xref	_CLK_DeInit
7480                     	xref	_ADC1_ClearFlag
7481                     	xref	_ADC1_GetFlagStatus
7482                     	xref	_ADC1_GetBufferValue
7483                     	xref	_ADC1_StartConversion
7484                     	xref	_ADC1_DataBufferCmd
7485                     	xref	_ADC1_ScanModeCmd
7486                     	xref	_ADC1_Init
7487                     	xref	_ADC1_DeInit
7488                     	switch	.const
7489  0030               L5402:
7490  0030 566f6965733a  	dc.b	"Voies:%d,2 phases",0
7491  0042               L3402:
7492  0042 4d6978203a20  	dc.b	"Mix : %d",0
7493  004b               L1402:
7494  004b 456e74722e3a  	dc.b	"Entr.: %d",0
7495  0055               L3621:
7496  0055 417070757965  	dc.b	"Appuyer haut",10,0
7497  0063               L1621:
7498  0063 456e72656769  	dc.b	"Enregistre",10,0
7499  006f               L1521:
7500  006f 456e72656769  	dc.b	"Enregistrement...",10,0
7501  0082               L3021:
7502  0082 4d6573757265  	dc.b	"Mesures max/min",10,0
7503  0093               L3711:
7504  0093 6d696e2c2061  	dc.b	"min, appuyer bas",10,0
7505  00a5               L1711:
7506  00a5 4d616e636865  	dc.b	"Manches au max",10,0
7507  00b5               L5211:
7508  00b5 656e20636f75  	dc.b	"en cour",10,0
7509  00be               L3211:
7510  00be 4d6573757265  	dc.b	"Mesures zero",10,0
7511  00cc               L3111:
7512  00cc 417070757965  	dc.b	"Appuyer bas",10,0
7513  00d9               L1111:
7514  00d9 4d616e636865  	dc.b	"Manches a zero",10,0
7515  00e9               L752:
7516  00e9 25322e327525  	dc.b	"%2.2u%%",10,0
7517  00f2               L722:
7518  00f2 464149424c45  	dc.b	"FAIBLE",10,0
7519  00fa               L522:
7520  00fa 424154544552  	dc.b	"BATTERIE",10,0
7521  0104               L712:
7522  0104 2e25322e3269  	dc.b	".%2.2iV",10,0
7523  010d               L512:
7524  010d 25690a00      	dc.b	"%i",10,0
7525  0111               L312:
7526  0111 25750a00      	dc.b	"%u",10,0
7527  0115               L112:
7528  0115 3a25322e3275  	dc.b	":%2.2u",10,0
7529  011d               L702:
7530  011d 25322e32750a  	dc.b	"%2.2u",10,0
7531  0124               L76:
7532  0124 426970204f66  	dc.b	"Bip Off",0
7533  012c               L36:
7534  012c 426970204f6e  	dc.b	"Bip On",0
7535                     	xref.b	c_lreg
7536                     	xref.b	c_x
7537                     	xref.b	c_y
7557                     	xref	c_lgsub
7558                     	xref	c_lgmul
7559                     	xref	c_uitoly
7560                     	xref	c_ladc
7561                     	xref	c_cmulx
7562                     	xref	c_ludv
7563                     	xref	c_umul
7564                     	xref	c_lursh
7565                     	xref	c_lmul
7566                     	xref	c_lgadd
7567                     	xref	c_ldiv
7568                     	xref	c_uitolx
7569                     	xref	c_rtol
7570                     	xref	c_ladd
7571                     	xref	c_itolx
7572                     	xref	c_ltor
7573                     	xref	c_lgadc
7574                     	xref	c_sdivx
7575                     	xref	c_imul
7576                     	end
