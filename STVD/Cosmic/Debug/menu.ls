   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  18                     	bsct
  19  0000               _jeton:
  20  0000 0a            	dc.b	10
  56                     ; 19 void m10(void)
  56                     ; 20 { 
  58                     	switch	.text
  59  0000               _m10:
  63                     ; 21 	LCD_DISP_OFF();
  65  0000 cd0000        	call	_LCD_DISP_OFF
  67                     ; 22 	LCD_CLEAR_DISPLAY();
  69  0003 cd0000        	call	_LCD_CLEAR_DISPLAY
  71                     ; 23 	LCD_printtruc(1,1,"Modele %u\n",modele_actuel);
  73  0006 b600          	ld	a,_modele_actuel
  74  0008 5f            	clrw	x
  75  0009 97            	ld	xl,a
  76  000a 89            	pushw	x
  77  000b ae019f        	ldw	x,#L12
  78  000e 89            	pushw	x
  79  000f ae0001        	ldw	x,#1
  80  0012 a601          	ld	a,#1
  81  0014 95            	ld	xh,a
  82  0015 cd0000        	call	_LCD_printtruc
  84  0018 5b04          	addw	sp,#4
  85                     ; 24 	LCD_printtruc(1,10,"Phase %u\n",phase_actuelle);
  87  001a b600          	ld	a,_phase_actuelle
  88  001c 5f            	clrw	x
  89  001d 97            	ld	xl,a
  90  001e 89            	pushw	x
  91  001f ae0195        	ldw	x,#L32
  92  0022 89            	pushw	x
  93  0023 ae000a        	ldw	x,#10
  94  0026 a601          	ld	a,#1
  95  0028 95            	ld	xh,a
  96  0029 cd0000        	call	_LCD_printtruc
  98  002c 5b04          	addw	sp,#4
  99                     ; 25 	LCD_printtruc(2,5,"Actions",0);
 101  002e 5f            	clrw	x
 102  002f 89            	pushw	x
 103  0030 ae018d        	ldw	x,#L52
 104  0033 89            	pushw	x
 105  0034 ae0005        	ldw	x,#5
 106  0037 a602          	ld	a,#2
 107  0039 95            	ld	xh,a
 108  003a cd0000        	call	_LCD_printtruc
 110  003d 5b04          	addw	sp,#4
 111                     ; 26 	LCD_DISP_ON();
 113  003f cd0000        	call	_LCD_DISP_ON
 115                     ; 28 	navigue(10,10,11,70,20);
 117  0042 4b14          	push	#20
 118  0044 4b46          	push	#70
 119  0046 4b0b          	push	#11
 120  0048 ae000a        	ldw	x,#10
 121  004b a60a          	ld	a,#10
 122  004d 95            	ld	xh,a
 123  004e cd09b8        	call	_navigue
 125  0051 5b03          	addw	sp,#3
 126                     ; 30 }
 129  0053 81            	ret	
 168                     ; 33 void m11(void)
 168                     ; 34 { 
 169                     	switch	.text
 170  0054               _m11:
 174                     ; 35 	if (gauche)
 176  0054 720100003e    	btjf	_gauche,L73
 177                     ; 37 		if (modele_actuel != (NUM_MODEL - 1)) modele_actuel++;
 179  0059 b600          	ld	a,_modele_actuel
 180  005b a103          	cp	a,#3
 181  005d 2704          	jreq	L14
 184  005f 3c00          	inc	_modele_actuel
 186  0061 2002          	jra	L34
 187  0063               L14:
 188                     ; 38 		else modele_actuel = 0;
 190  0063 3f00          	clr	_modele_actuel
 191  0065               L34:
 192                     ; 40 		load_input(modele_actuel);
 194  0065 b600          	ld	a,_modele_actuel
 195  0067 cd0000        	call	_load_input
 197                     ; 41 		load_phase(phase_actuelle);
 199  006a b600          	ld	a,_phase_actuelle
 200  006c cd0000        	call	_load_phase
 202                     ; 42 		flashencour = 1;
 204  006f 72100000      	bset	_flashencour
 205                     ; 44 		FLASH_DeInit();
 207  0073 cd0000        	call	_FLASH_DeInit
 209                     ; 46 		FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
 211  0076 4f            	clr	a
 212  0077 cd0000        	call	_FLASH_SetProgrammingTime
 214                     ; 48 		FLASH_Unlock(FLASH_MEMTYPE_DATA);
 216  007a a6f7          	ld	a,#247
 217  007c cd0000        	call	_FLASH_Unlock
 219                     ; 50 		FLASH_ProgramByte(BASE_EEPROM, modele_actuel);
 221  007f 3b0000        	push	_modele_actuel
 222  0082 ae4000        	ldw	x,#16384
 223  0085 89            	pushw	x
 224  0086 5f            	clrw	x
 225  0087 89            	pushw	x
 226  0088 cd0000        	call	_FLASH_ProgramByte
 228  008b 5b05          	addw	sp,#5
 229                     ; 51 		flashencour = 0;
 231  008d 72110000      	bres	_flashencour
 232                     ; 52 		Delayms(200);
 234  0091 ae00c8        	ldw	x,#200
 235  0094 cd0000        	call	_Delayms
 237  0097               L73:
 238                     ; 56 	LCD_DISP_OFF();
 240  0097 cd0000        	call	_LCD_DISP_OFF
 242                     ; 57 	LCD_CLEAR_DISPLAY();
 244  009a cd0000        	call	_LCD_CLEAR_DISPLAY
 246                     ; 58 	LCD_printtruc(1,1,"Modele %u\n",modele_actuel);
 248  009d b600          	ld	a,_modele_actuel
 249  009f 5f            	clrw	x
 250  00a0 97            	ld	xl,a
 251  00a1 89            	pushw	x
 252  00a2 ae019f        	ldw	x,#L12
 253  00a5 89            	pushw	x
 254  00a6 ae0001        	ldw	x,#1
 255  00a9 a601          	ld	a,#1
 256  00ab 95            	ld	xh,a
 257  00ac cd0000        	call	_LCD_printtruc
 259  00af 5b04          	addw	sp,#4
 260                     ; 59 	LCD_printtruc(1,10,"Phase %u\n",phase_actuelle);
 262  00b1 b600          	ld	a,_phase_actuelle
 263  00b3 5f            	clrw	x
 264  00b4 97            	ld	xl,a
 265  00b5 89            	pushw	x
 266  00b6 ae0195        	ldw	x,#L32
 267  00b9 89            	pushw	x
 268  00ba ae000a        	ldw	x,#10
 269  00bd a601          	ld	a,#1
 270  00bf 95            	ld	xh,a
 271  00c0 cd0000        	call	_LCD_printtruc
 273  00c3 5b04          	addw	sp,#4
 274                     ; 60 	LCD_printtruc(2,1,"Change Sauve Raz \n",0);
 276  00c5 5f            	clrw	x
 277  00c6 89            	pushw	x
 278  00c7 ae017a        	ldw	x,#L54
 279  00ca 89            	pushw	x
 280  00cb ae0001        	ldw	x,#1
 281  00ce a602          	ld	a,#2
 282  00d0 95            	ld	xh,a
 283  00d1 cd0000        	call	_LCD_printtruc
 285  00d4 5b04          	addw	sp,#4
 286                     ; 61 	LCD_DISP_ON();
 288  00d6 cd0000        	call	_LCD_DISP_ON
 290                     ; 63 	Delayms(100);
 292  00d9 ae0064        	ldw	x,#100
 293  00dc cd0000        	call	_Delayms
 295                     ; 65 	navigue(11,10,12,11,13);
 297  00df 4b0d          	push	#13
 298  00e1 4b0b          	push	#11
 299  00e3 4b0c          	push	#12
 300  00e5 ae000a        	ldw	x,#10
 301  00e8 a60b          	ld	a,#11
 302  00ea 95            	ld	xh,a
 303  00eb cd09b8        	call	_navigue
 305  00ee 5b03          	addw	sp,#3
 306                     ; 67 }
 309  00f0 81            	ret	
 341                     ; 70 void m12(void)
 341                     ; 71 { 
 342                     	switch	.text
 343  00f1               _m12:
 347                     ; 72 	LCD_DISP_OFF();
 349  00f1 cd0000        	call	_LCD_DISP_OFF
 351                     ; 73 	LCD_CLEAR_DISPLAY();
 353  00f4 cd0000        	call	_LCD_CLEAR_DISPLAY
 355                     ; 74 	LCD_printtruc(1,2,"Sauvegarder ?\n",0);
 357  00f7 5f            	clrw	x
 358  00f8 89            	pushw	x
 359  00f9 ae016b        	ldw	x,#L75
 360  00fc 89            	pushw	x
 361  00fd ae0002        	ldw	x,#2
 362  0100 a601          	ld	a,#1
 363  0102 95            	ld	xh,a
 364  0103 cd0000        	call	_LCD_printtruc
 366  0106 5b04          	addw	sp,#4
 367                     ; 75 	LCD_printtruc(2,1,"Appuyer gauche\n",0);
 369  0108 5f            	clrw	x
 370  0109 89            	pushw	x
 371  010a ae015b        	ldw	x,#L16
 372  010d 89            	pushw	x
 373  010e ae0001        	ldw	x,#1
 374  0111 a602          	ld	a,#2
 375  0113 95            	ld	xh,a
 376  0114 cd0000        	call	_LCD_printtruc
 378  0117 5b04          	addw	sp,#4
 379                     ; 76 	LCD_DISP_ON();
 381  0119 cd0000        	call	_LCD_DISP_ON
 383                     ; 78 	if (gauche)
 385  011c 720100001c    	btjf	_gauche,L36
 386                     ; 80 		save_phase(phase_actuelle);
 388  0121 b600          	ld	a,_phase_actuelle
 389  0123 cd0000        	call	_save_phase
 391                     ; 81 		LCD_printtruc(2,1,"   sauvegarde   \n",0);
 393  0126 5f            	clrw	x
 394  0127 89            	pushw	x
 395  0128 ae0149        	ldw	x,#L56
 396  012b 89            	pushw	x
 397  012c ae0001        	ldw	x,#1
 398  012f a602          	ld	a,#2
 399  0131 95            	ld	xh,a
 400  0132 cd0000        	call	_LCD_printtruc
 402  0135 5b04          	addw	sp,#4
 403                     ; 82 		Delayms(500);
 405  0137 ae01f4        	ldw	x,#500
 406  013a cd0000        	call	_Delayms
 408  013d               L36:
 409                     ; 85 	navigue(12,11,121,10,12);
 411  013d 4b0c          	push	#12
 412  013f 4b0a          	push	#10
 413  0141 4b79          	push	#121
 414  0143 ae000b        	ldw	x,#11
 415  0146 a60c          	ld	a,#12
 416  0148 95            	ld	xh,a
 417  0149 cd09b8        	call	_navigue
 419  014c 5b03          	addw	sp,#3
 420                     ; 87 }
 423  014e 81            	ret	
 466                     ; 90 void m121(void)
 466                     ; 91 { 
 467                     	switch	.text
 468  014f               _m121:
 470  014f 88            	push	a
 471       00000001      OFST:	set	1
 474                     ; 94 	i = phase_actuelle;
 476  0150 b600          	ld	a,_phase_actuelle
 477  0152 4c            	inc	a
 478  0153 6b01          	ld	(OFST+0,sp),a
 479                     ; 95 	i++;
 481                     ; 96 	if (i == NUM_PHASE) i = 0;
 483  0155 a102          	cp	a,#2
 484  0157 2602          	jrne	L501
 487  0159 0f01          	clr	(OFST+0,sp)
 488  015b               L501:
 489                     ; 98 	LCD_DISP_OFF();
 491  015b cd0000        	call	_LCD_DISP_OFF
 493                     ; 99 	LCD_CLEAR_DISPLAY();
 495  015e cd0000        	call	_LCD_CLEAR_DISPLAY
 497                     ; 100 	LCD_printtruc(1,1,"Sauve en phase %u\n",i);
 499  0161 7b01          	ld	a,(OFST+0,sp)
 500  0163 5f            	clrw	x
 501  0164 97            	ld	xl,a
 502  0165 89            	pushw	x
 503  0166 ae0136        	ldw	x,#L701
 504  0169 89            	pushw	x
 505  016a ae0001        	ldw	x,#1
 506  016d a601          	ld	a,#1
 507  016f 95            	ld	xh,a
 508  0170 cd0000        	call	_LCD_printtruc
 510  0173 5b04          	addw	sp,#4
 511                     ; 101 	LCD_printtruc(2,1,"Appuyer gauche\n",0);
 513  0175 5f            	clrw	x
 514  0176 89            	pushw	x
 515  0177 ae015b        	ldw	x,#L16
 516  017a 89            	pushw	x
 517  017b ae0001        	ldw	x,#1
 518  017e a602          	ld	a,#2
 519  0180 95            	ld	xh,a
 520  0181 cd0000        	call	_LCD_printtruc
 522  0184 5b04          	addw	sp,#4
 523                     ; 102 	LCD_DISP_ON();
 525  0186 cd0000        	call	_LCD_DISP_ON
 527                     ; 104 	if (gauche)
 529  0189 720100001c    	btjf	_gauche,L111
 530                     ; 106 		save_phase(i);
 532  018e 7b01          	ld	a,(OFST+0,sp)
 533  0190 cd0000        	call	_save_phase
 535                     ; 107 		LCD_printtruc(2,1,"   sauvegarde   \n",0);
 537  0193 5f            	clrw	x
 538  0194 89            	pushw	x
 539  0195 ae0149        	ldw	x,#L56
 540  0198 89            	pushw	x
 541  0199 ae0001        	ldw	x,#1
 542  019c a602          	ld	a,#2
 543  019e 95            	ld	xh,a
 544  019f cd0000        	call	_LCD_printtruc
 546  01a2 5b04          	addw	sp,#4
 547                     ; 108 		Delayms(500);
 549  01a4 ae01f4        	ldw	x,#500
 550  01a7 cd0000        	call	_Delayms
 552  01aa               L111:
 553                     ; 111 	navigue(121,11,12,10,121);
 555  01aa 4b79          	push	#121
 556  01ac 4b0a          	push	#10
 557  01ae 4b0c          	push	#12
 558  01b0 ae000b        	ldw	x,#11
 559  01b3 a679          	ld	a,#121
 560  01b5 95            	ld	xh,a
 561  01b6 cd09b8        	call	_navigue
 563  01b9 5b03          	addw	sp,#3
 564                     ; 113 }
 567  01bb 84            	pop	a
 568  01bc 81            	ret	
 605                     ; 116 void m13(void)
 605                     ; 117 { 
 606                     	switch	.text
 607  01bd               _m13:
 611                     ; 118 	LCD_DISP_OFF();
 613  01bd cd0000        	call	_LCD_DISP_OFF
 615                     ; 119 	LCD_CLEAR_DISPLAY();
 617  01c0 cd0000        	call	_LCD_CLEAR_DISPLAY
 619                     ; 120 	LCD_printtruc(1,2,"RAZ et sauve ?\n",0);
 621  01c3 5f            	clrw	x
 622  01c4 89            	pushw	x
 623  01c5 ae0126        	ldw	x,#L321
 624  01c8 89            	pushw	x
 625  01c9 ae0002        	ldw	x,#2
 626  01cc a601          	ld	a,#1
 627  01ce 95            	ld	xh,a
 628  01cf cd0000        	call	_LCD_printtruc
 630  01d2 5b04          	addw	sp,#4
 631                     ; 121 	LCD_printtruc(2,1,"Appuyer gauche\n",0);
 633  01d4 5f            	clrw	x
 634  01d5 89            	pushw	x
 635  01d6 ae015b        	ldw	x,#L16
 636  01d9 89            	pushw	x
 637  01da ae0001        	ldw	x,#1
 638  01dd a602          	ld	a,#2
 639  01df 95            	ld	xh,a
 640  01e0 cd0000        	call	_LCD_printtruc
 642  01e3 5b04          	addw	sp,#4
 643                     ; 122 	LCD_DISP_ON();
 645  01e5 cd0000        	call	_LCD_DISP_ON
 647                     ; 124 	if (gauche)
 649  01e8 7201000047    	btjf	_gauche,L521
 650                     ; 126 		reset_model();
 652  01ed cd0000        	call	_reset_model
 654                     ; 127 		save_input(modele_actuel);
 656  01f0 b600          	ld	a,_modele_actuel
 657  01f2 cd0000        	call	_save_input
 659                     ; 128 		LCD_DISP_OFF();
 661  01f5 cd0000        	call	_LCD_DISP_OFF
 663                     ; 129 		LCD_CLEAR_DISPLAY();
 665  01f8 cd0000        	call	_LCD_CLEAR_DISPLAY
 667                     ; 130 		LCD_printtruc(1,4,"reset ok\n",0);
 669  01fb 5f            	clrw	x
 670  01fc 89            	pushw	x
 671  01fd ae011c        	ldw	x,#L721
 672  0200 89            	pushw	x
 673  0201 ae0004        	ldw	x,#4
 674  0204 a601          	ld	a,#1
 675  0206 95            	ld	xh,a
 676  0207 cd0000        	call	_LCD_printtruc
 678  020a 5b04          	addw	sp,#4
 679                     ; 131 		LCD_DISP_ON();
 681  020c cd0000        	call	_LCD_DISP_ON
 683                     ; 133 		save_phase(phase_actuelle);
 685  020f b600          	ld	a,_phase_actuelle
 686  0211 cd0000        	call	_save_phase
 688                     ; 134 		LCD_printtruc(2,1,"   sauvegarde   \n",0);
 690  0214 5f            	clrw	x
 691  0215 89            	pushw	x
 692  0216 ae0149        	ldw	x,#L56
 693  0219 89            	pushw	x
 694  021a ae0001        	ldw	x,#1
 695  021d a602          	ld	a,#2
 696  021f 95            	ld	xh,a
 697  0220 cd0000        	call	_LCD_printtruc
 699  0223 5b04          	addw	sp,#4
 700                     ; 135 		load_input(modele_actuel);
 702  0225 b600          	ld	a,_modele_actuel
 703  0227 cd0000        	call	_load_input
 705                     ; 136 		Delayms(500);
 707  022a ae01f4        	ldw	x,#500
 708  022d cd0000        	call	_Delayms
 710                     ; 137 		haut = 1;
 712  0230 72100000      	bset	_haut
 713  0234               L521:
 714                     ; 140 	navigue(13,11,13,10,13);
 716  0234 4b0d          	push	#13
 717  0236 4b0a          	push	#10
 718  0238 4b0d          	push	#13
 719  023a ae000b        	ldw	x,#11
 720  023d a60d          	ld	a,#13
 721  023f 95            	ld	xh,a
 722  0240 cd09b8        	call	_navigue
 724  0243 5b03          	addw	sp,#3
 725                     ; 142 }
 728  0245 81            	ret	
 756                     ; 145 void m20(void)
 756                     ; 146 { 
 757                     	switch	.text
 758  0246               _m20:
 762                     ; 147 	LCD_DISP_OFF();
 764  0246 cd0000        	call	_LCD_DISP_OFF
 766                     ; 148 	LCD_CLEAR_DISPLAY();
 768  0249 cd0000        	call	_LCD_CLEAR_DISPLAY
 770                     ; 149 	LCD_printtruc(1,3,"Reglage des\n",0);
 772  024c 5f            	clrw	x
 773  024d 89            	pushw	x
 774  024e ae010f        	ldw	x,#L141
 775  0251 89            	pushw	x
 776  0252 ae0003        	ldw	x,#3
 777  0255 a601          	ld	a,#1
 778  0257 95            	ld	xh,a
 779  0258 cd0000        	call	_LCD_printtruc
 781  025b 5b04          	addw	sp,#4
 782                     ; 150 	LCD_printtruc(2,5,"Entrees\n",0);
 784  025d 5f            	clrw	x
 785  025e 89            	pushw	x
 786  025f ae0106        	ldw	x,#L341
 787  0262 89            	pushw	x
 788  0263 ae0005        	ldw	x,#5
 789  0266 a602          	ld	a,#2
 790  0268 95            	ld	xh,a
 791  0269 cd0000        	call	_LCD_printtruc
 793  026c 5b04          	addw	sp,#4
 794                     ; 151 	LCD_DISP_ON();
 796  026e cd0000        	call	_LCD_DISP_ON
 798                     ; 153 	navigue(20,0,21,10,30);
 800  0271 4b1e          	push	#30
 801  0273 4b0a          	push	#10
 802  0275 4b15          	push	#21
 803  0277 5f            	clrw	x
 804  0278 a614          	ld	a,#20
 805  027a 95            	ld	xh,a
 806  027b cd09b8        	call	_navigue
 808  027e 5b03          	addw	sp,#3
 809                     ; 155 }
 812  0280 81            	ret	
 815                     	bsct
 816  0001               L541_i:
 817  0001 00            	dc.b	0
 818  0002               L741_j:
 819  0002 00            	dc.b	0
 877                     ; 158 void m21(void)
 877                     ; 159 {	
 878                     	switch	.text
 879  0281               _m21:
 881  0281 88            	push	a
 882       00000001      OFST:	set	1
 885                     ; 163 	LCD_DISP_OFF();
 887  0282 cd0000        	call	_LCD_DISP_OFF
 889                     ; 164 	LCD_CLEAR_DISPLAY();
 891  0285 cd0000        	call	_LCD_CLEAR_DISPLAY
 893                     ; 165 	LCD_printtruc(1,1,"Expo\n",0);
 895  0288 5f            	clrw	x
 896  0289 89            	pushw	x
 897  028a ae0100        	ldw	x,#L771
 898  028d 89            	pushw	x
 899  028e ae0001        	ldw	x,#1
 900  0291 a601          	ld	a,#1
 901  0293 95            	ld	xh,a
 902  0294 cd0000        	call	_LCD_printtruc
 904  0297 5b04          	addw	sp,#4
 905                     ; 166 	LCD_printtruc(1,11,"Valeur\n",0);
 907  0299 5f            	clrw	x
 908  029a 89            	pushw	x
 909  029b ae00f8        	ldw	x,#L102
 910  029e 89            	pushw	x
 911  029f ae000b        	ldw	x,#11
 912  02a2 a601          	ld	a,#1
 913  02a4 95            	ld	xh,a
 914  02a5 cd0000        	call	_LCD_printtruc
 916  02a8 5b04          	addw	sp,#4
 917                     ; 167 	LCD_DISP_ON();
 919  02aa cd0000        	call	_LCD_DISP_ON
 921                     ; 168 	if (bas)
 923  02ad 7201000017    	btjf	_bas,L302
 924                     ; 170 		if (j != 1) j++; 		
 926  02b2 b602          	ld	a,L741_j
 927  02b4 4a            	dec	a
 928  02b5 2704          	jreq	L502
 931  02b7 3c02          	inc	L741_j
 933  02b9 200e          	jra	L302
 934  02bb               L502:
 935                     ; 173 			j = 0;
 937  02bb b702          	ld	L741_j,a
 938                     ; 174 			if (i != (NUM_INPUT -1)) i++;
 940  02bd b601          	ld	a,L541_i
 941  02bf a105          	cp	a,#5
 942  02c1 2704          	jreq	L112
 945  02c3 3c01          	inc	L541_i
 947  02c5 2002          	jra	L302
 948  02c7               L112:
 949                     ; 175 			else i = 0;
 951  02c7 3f01          	clr	L541_i
 952  02c9               L302:
 953                     ; 178 	if (j	== 0) LCD_printtruc(1,5,"+\n",0); else LCD_printtruc(1,5,"-\n",0);
 955  02c9 b602          	ld	a,L741_j
 956  02cb 2607          	jrne	L512
 959  02cd 5f            	clrw	x
 960  02ce 89            	pushw	x
 961  02cf ae00f5        	ldw	x,#L712
 964  02d2 2005          	jra	L122
 965  02d4               L512:
 968  02d4 5f            	clrw	x
 969  02d5 89            	pushw	x
 970  02d6 ae00f2        	ldw	x,#L322
 972  02d9               L122:
 973  02d9 89            	pushw	x
 974  02da ae0005        	ldw	x,#5
 975  02dd a601          	ld	a,#1
 976  02df 95            	ld	xh,a
 977  02e0 cd0000        	call	_LCD_printtruc
 978  02e3 5b04          	addw	sp,#4
 979                     ; 180 	val = reglage_variable(i,input.channel[i].expo[j],-99,99,3);
 981  02e5 4b03          	push	#3
 982  02e7 4b63          	push	#99
 983  02e9 4b9d          	push	#157
 984  02eb b601          	ld	a,L541_i
 985  02ed 97            	ld	xl,a
 986  02ee a612          	ld	a,#18
 987  02f0 42            	mul	x,a
 988  02f1 01            	rrwa	x,a
 989  02f2 bb02          	add	a,L741_j
 990  02f4 2401          	jrnc	L632
 991  02f6 5c            	incw	x
 992  02f7               L632:
 993  02f7 02            	rlwa	x,a
 994  02f8 d60010        	ld	a,(_input+16,x)
 995  02fb 97            	ld	xl,a
 996  02fc b601          	ld	a,L541_i
 997  02fe 95            	ld	xh,a
 998  02ff cd09f7        	call	_reglage_variable
1000  0302 5b03          	addw	sp,#3
1001  0304 6b01          	ld	(OFST+0,sp),a
1002                     ; 181 	input.channel[i].expo[j] = val;
1004  0306 b601          	ld	a,L541_i
1005  0308 97            	ld	xl,a
1006  0309 a612          	ld	a,#18
1007  030b 42            	mul	x,a
1008  030c 01            	rrwa	x,a
1009  030d bb02          	add	a,L741_j
1010  030f 2401          	jrnc	L042
1011  0311 5c            	incw	x
1012  0312               L042:
1013  0312 02            	rlwa	x,a
1014  0313 7b01          	ld	a,(OFST+0,sp)
1015  0315 d70010        	ld	(_input+16,x),a
1016                     ; 183 	navigue(21,20,21,21,21);
1018  0318 4b15          	push	#21
1019  031a 4b15          	push	#21
1020  031c 4b15          	push	#21
1021  031e ae0014        	ldw	x,#20
1022  0321 a615          	ld	a,#21
1023  0323 95            	ld	xh,a
1024  0324 cd09b8        	call	_navigue
1026  0327 5b03          	addw	sp,#3
1027                     ; 185 }
1030  0329 84            	pop	a
1031  032a 81            	ret	
1059                     ; 188 void m30(void)
1059                     ; 189 { 
1060                     	switch	.text
1061  032b               _m30:
1065                     ; 190 	LCD_DISP_OFF();
1067  032b cd0000        	call	_LCD_DISP_OFF
1069                     ; 191 	LCD_CLEAR_DISPLAY();
1071  032e cd0000        	call	_LCD_CLEAR_DISPLAY
1073                     ; 192 	LCD_printtruc(1,3,"Reglage des\n",0);
1075  0331 5f            	clrw	x
1076  0332 89            	pushw	x
1077  0333 ae010f        	ldw	x,#L141
1078  0336 89            	pushw	x
1079  0337 ae0003        	ldw	x,#3
1080  033a a601          	ld	a,#1
1081  033c 95            	ld	xh,a
1082  033d cd0000        	call	_LCD_printtruc
1084  0340 5b04          	addw	sp,#4
1085                     ; 193 	LCD_printtruc(2,5,"Mixeurs\n",0);
1087  0342 5f            	clrw	x
1088  0343 89            	pushw	x
1089  0344 ae00e9        	ldw	x,#L532
1090  0347 89            	pushw	x
1091  0348 ae0005        	ldw	x,#5
1092  034b a602          	ld	a,#2
1093  034d 95            	ld	xh,a
1094  034e cd0000        	call	_LCD_printtruc
1096  0351 5b04          	addw	sp,#4
1097                     ; 194 	LCD_DISP_ON();
1099  0353 cd0000        	call	_LCD_DISP_ON
1101                     ; 196 	navigue(30,0,31,20,40);
1103  0356 4b28          	push	#40
1104  0358 4b14          	push	#20
1105  035a 4b1f          	push	#31
1106  035c 5f            	clrw	x
1107  035d a61e          	ld	a,#30
1108  035f 95            	ld	xh,a
1109  0360 cd09b8        	call	_navigue
1111  0363 5b03          	addw	sp,#3
1112                     ; 198 }
1115  0365 81            	ret	
1143                     ; 201 void m31(void)
1143                     ; 202 { 
1144                     	switch	.text
1145  0366               _m31:
1149                     ; 203 	LCD_DISP_OFF();
1151  0366 cd0000        	call	_LCD_DISP_OFF
1153                     ; 204 	LCD_CLEAR_DISPLAY();
1155  0369 cd0000        	call	_LCD_CLEAR_DISPLAY
1157                     ; 205 	LCD_printtruc(1,6,"Mixeur\n",0);
1159  036c 5f            	clrw	x
1160  036d 89            	pushw	x
1161  036e ae00e1        	ldw	x,#L742
1162  0371 89            	pushw	x
1163  0372 ae0006        	ldw	x,#6
1164  0375 a601          	ld	a,#1
1165  0377 95            	ld	xh,a
1166  0378 cd0000        	call	_LCD_printtruc
1168  037b 5b04          	addw	sp,#4
1169                     ; 206 	LCD_printtruc(2,1,"in/out\n",0);
1171  037d 5f            	clrw	x
1172  037e 89            	pushw	x
1173  037f ae00d9        	ldw	x,#L152
1174  0382 89            	pushw	x
1175  0383 ae0001        	ldw	x,#1
1176  0386 a602          	ld	a,#2
1177  0388 95            	ld	xh,a
1178  0389 cd0000        	call	_LCD_printtruc
1180  038c 5b04          	addw	sp,#4
1181                     ; 207 	LCD_printtruc(2,13,"gain\n",0);
1183  038e 5f            	clrw	x
1184  038f 89            	pushw	x
1185  0390 ae00d3        	ldw	x,#L352
1186  0393 89            	pushw	x
1187  0394 ae000d        	ldw	x,#13
1188  0397 a602          	ld	a,#2
1189  0399 95            	ld	xh,a
1190  039a cd0000        	call	_LCD_printtruc
1192  039d 5b04          	addw	sp,#4
1193                     ; 208 	LCD_DISP_ON();
1195  039f cd0000        	call	_LCD_DISP_ON
1197                     ; 210 	navigue(31,30,31,32,33);
1199  03a2 4b21          	push	#33
1200  03a4 4b20          	push	#32
1201  03a6 4b1f          	push	#31
1202  03a8 ae001e        	ldw	x,#30
1203  03ab a61f          	ld	a,#31
1204  03ad 95            	ld	xh,a
1205  03ae cd09b8        	call	_navigue
1207  03b1 5b03          	addw	sp,#3
1208                     ; 212 }
1211  03b3 81            	ret	
1214                     	bsct
1215  0003               L552_i:
1216  0003 ff            	dc.b	255
1217  0004               L752_j:
1218  0004 ff            	dc.b	255
1219  0005               L162_k:
1220  0005 ff            	dc.b	255
1279                     ; 215 void m32(void)
1279                     ; 216 { 
1280                     	switch	.text
1281  03b4               _m32:
1285                     ; 221 	LCD_DISP_OFF();
1287  03b4 cd0000        	call	_LCD_DISP_OFF
1289                     ; 222 	LCD_CLEAR_DISPLAY();
1291  03b7 cd0000        	call	_LCD_CLEAR_DISPLAY
1293                     ; 223 	LCD_printtruc(1,5,"Mixeur\n",0);
1295  03ba 5f            	clrw	x
1296  03bb 89            	pushw	x
1297  03bc ae00e1        	ldw	x,#L742
1298  03bf 89            	pushw	x
1299  03c0 ae0005        	ldw	x,#5
1300  03c3 a601          	ld	a,#1
1301  03c5 95            	ld	xh,a
1302  03c6 cd0000        	call	_LCD_printtruc
1304  03c9 5b04          	addw	sp,#4
1305                     ; 224 	LCD_printtruc(1,1,"in\n",0);
1307  03cb 5f            	clrw	x
1308  03cc 89            	pushw	x
1309  03cd ae00cf        	ldw	x,#L113
1310  03d0 89            	pushw	x
1311  03d1 ae0001        	ldw	x,#1
1312  03d4 a601          	ld	a,#1
1313  03d6 95            	ld	xh,a
1314  03d7 cd0000        	call	_LCD_printtruc
1316  03da 5b04          	addw	sp,#4
1317                     ; 225 	LCD_printtruc(1,12,"out\n",0);
1319  03dc 5f            	clrw	x
1320  03dd 89            	pushw	x
1321  03de ae00ca        	ldw	x,#L313
1322  03e1 89            	pushw	x
1323  03e2 ae000c        	ldw	x,#12
1324  03e5 a601          	ld	a,#1
1325  03e7 95            	ld	xh,a
1326  03e8 cd0000        	call	_LCD_printtruc
1328  03eb 5b04          	addw	sp,#4
1329                     ; 226 	LCD_DISP_ON();
1331  03ed cd0000        	call	_LCD_DISP_ON
1333                     ; 228 	if (bas) 
1335  03f0 720100000e    	btjf	_bas,L513
1336                     ; 230 		if (i != (NUM_MIXER -1)) i++;	else i = 255;
1338  03f5 b603          	ld	a,L552_i
1339  03f7 a10f          	cp	a,#15
1340  03f9 2704          	jreq	L713
1343  03fb 3c03          	inc	L552_i
1345  03fd 2004          	jra	L513
1346  03ff               L713:
1349  03ff 35ff0003      	mov	L552_i,#255
1350  0403               L513:
1351                     ; 232 	if (i != 255)
1353  0403 b603          	ld	a,L552_i
1354  0405 a1ff          	cp	a,#255
1355  0407 2746          	jreq	L323
1356                     ; 234 		j = mixer[i].in;
1358  0409 97            	ld	xl,a
1359  040a a604          	ld	a,#4
1360  040c 42            	mul	x,a
1361  040d d60000        	ld	a,(_mixer,x)
1362  0410 b704          	ld	L752_j,a
1363                     ; 235 		k = mixer[i].out;
1365  0412 d60001        	ld	a,(_mixer+1,x)
1366  0415 b705          	ld	L162_k,a
1367                     ; 237 		if (gauche)
1369  0417 720100000e    	btjf	_gauche,L523
1370                     ; 239 			if (j != (NUM_INPUT+ NUM_INPUT_SWITCH)) j++; else j = 255;
1372  041c b604          	ld	a,L752_j
1373  041e a108          	cp	a,#8
1374  0420 2704          	jreq	L723
1377  0422 3c04          	inc	L752_j
1379  0424 2004          	jra	L523
1380  0426               L723:
1383  0426 35ff0004      	mov	L752_j,#255
1384  042a               L523:
1385                     ; 241 		if (droite)
1387  042a 720100000e    	btjf	_droite,L333
1388                     ; 243 			if (k != (NUM_OUTPUT -1)) k++; else k = 255;
1390  042f b605          	ld	a,L162_k
1391  0431 a107          	cp	a,#7
1392  0433 2704          	jreq	L533
1395  0435 3c05          	inc	L162_k
1397  0437 2004          	jra	L333
1398  0439               L533:
1401  0439 35ff0005      	mov	L162_k,#255
1402  043d               L333:
1403                     ; 245 		mixer[i].in = j;
1405  043d b603          	ld	a,L552_i
1406  043f 97            	ld	xl,a
1407  0440 a604          	ld	a,#4
1408  0442 42            	mul	x,a
1409  0443 b604          	ld	a,L752_j
1410  0445 d70000        	ld	(_mixer,x),a
1411                     ; 246 		mixer[i].out = k;
1413  0448 b605          	ld	a,L162_k
1414  044a d70001        	ld	(_mixer+1,x),a
1415  044d b603          	ld	a,L552_i
1416  044f               L323:
1417                     ; 248 	if (i != 255)
1419  044f a1ff          	cp	a,#255
1420  0451 2760          	jreq	L143
1421                     ; 249 	{	LCD_printtruc(2,8,"%u\n",(i + 1));
1423  0453 5f            	clrw	x
1424  0454 97            	ld	xl,a
1425  0455 5c            	incw	x
1426  0456 89            	pushw	x
1427  0457 ae00c6        	ldw	x,#L343
1428  045a 89            	pushw	x
1429  045b ae0008        	ldw	x,#8
1430  045e a602          	ld	a,#2
1431  0460 95            	ld	xh,a
1432  0461 cd0000        	call	_LCD_printtruc
1434  0464 5b04          	addw	sp,#4
1435                     ; 250 		if ((j != 255) || (j == NUM_INPUT)) LCD_printtruc(2,2,"%u\n",(j + 1));
1437  0466 b604          	ld	a,L752_j
1438  0468 a1ff          	cp	a,#255
1439  046a 2604          	jrne	L743
1441  046c a106          	cp	a,#6
1442  046e 2615          	jrne	L543
1443  0470               L743:
1446  0470 5f            	clrw	x
1447  0471 97            	ld	xl,a
1448  0472 5c            	incw	x
1449  0473 89            	pushw	x
1450  0474 ae00c6        	ldw	x,#L343
1451  0477 89            	pushw	x
1452  0478 ae0002        	ldw	x,#2
1453  047b a602          	ld	a,#2
1454  047d 95            	ld	xh,a
1455  047e cd0000        	call	_LCD_printtruc
1457  0481 5b04          	addw	sp,#4
1458  0483 b604          	ld	a,L752_j
1459  0485               L543:
1460                     ; 251 		if (j == (NUM_INPUT+ NUM_INPUT_SWITCH)) LCD_printtruc(2,1,"test\n",0);
1462  0485 a108          	cp	a,#8
1463  0487 2611          	jrne	L153
1466  0489 5f            	clrw	x
1467  048a 89            	pushw	x
1468  048b ae00c0        	ldw	x,#L353
1469  048e 89            	pushw	x
1470  048f ae0001        	ldw	x,#1
1471  0492 a602          	ld	a,#2
1472  0494 95            	ld	xh,a
1473  0495 cd0000        	call	_LCD_printtruc
1475  0498 5b04          	addw	sp,#4
1476  049a               L153:
1477                     ; 252 		if (k != 255) LCD_printtruc(2,13,"%u\n",(k + 1));
1479  049a b605          	ld	a,L162_k
1480  049c a1ff          	cp	a,#255
1481  049e 2713          	jreq	L143
1484  04a0 5f            	clrw	x
1485  04a1 97            	ld	xl,a
1486  04a2 5c            	incw	x
1487  04a3 89            	pushw	x
1488  04a4 ae00c6        	ldw	x,#L343
1489  04a7 89            	pushw	x
1490  04a8 ae000d        	ldw	x,#13
1491  04ab a602          	ld	a,#2
1492  04ad 95            	ld	xh,a
1493  04ae cd0000        	call	_LCD_printtruc
1495  04b1 5b04          	addw	sp,#4
1496  04b3               L143:
1497                     ; 255 	navigue(32,31,32,32,32);
1499  04b3 4b20          	push	#32
1500  04b5 4b20          	push	#32
1501  04b7 4b20          	push	#32
1502  04b9 ae001f        	ldw	x,#31
1503  04bc a620          	ld	a,#32
1504  04be 95            	ld	xh,a
1505  04bf cd09b8        	call	_navigue
1507  04c2 5b03          	addw	sp,#3
1508                     ; 257 }
1511  04c4 81            	ret	
1514                     	bsct
1515  0006               L753_i:
1516  0006 00            	dc.b	0
1517  0007               L163_j:
1518  0007 00            	dc.b	0
1594                     ; 260 void m33(void)
1594                     ; 261 { 
1595                     	switch	.text
1596  04c5               _m33:
1598  04c5 89            	pushw	x
1599       00000002      OFST:	set	2
1602                     ; 268 	LCD_DISP_OFF();
1604  04c6 cd0000        	call	_LCD_DISP_OFF
1606                     ; 269 	LCD_CLEAR_DISPLAY();
1608  04c9 cd0000        	call	_LCD_CLEAR_DISPLAY
1610                     ; 270 	LCD_printtruc(1,1,"Mixer\n",0);
1612  04cc 5f            	clrw	x
1613  04cd 89            	pushw	x
1614  04ce ae00b9        	ldw	x,#L124
1615  04d1 89            	pushw	x
1616  04d2 ae0001        	ldw	x,#1
1617  04d5 a601          	ld	a,#1
1618  04d7 95            	ld	xh,a
1619  04d8 cd0000        	call	_LCD_printtruc
1621  04db 5b04          	addw	sp,#4
1622                     ; 271 	LCD_printtruc(1,13,"Gain\n",0);
1624  04dd 5f            	clrw	x
1625  04de 89            	pushw	x
1626  04df ae00b3        	ldw	x,#L324
1627  04e2 89            	pushw	x
1628  04e3 ae000d        	ldw	x,#13
1629  04e6 a601          	ld	a,#1
1630  04e8 95            	ld	xh,a
1631  04e9 cd0000        	call	_LCD_printtruc
1633  04ec 5b04          	addw	sp,#4
1634                     ; 272 	LCD_DISP_ON();
1636  04ee cd0000        	call	_LCD_DISP_ON
1638                     ; 274 	if (bas)
1640  04f1 7201000017    	btjf	_bas,L524
1641                     ; 276 		if (j != 1) j++; 		
1643  04f6 b607          	ld	a,L163_j
1644  04f8 4a            	dec	a
1645  04f9 2704          	jreq	L724
1648  04fb 3c07          	inc	L163_j
1650  04fd 200e          	jra	L524
1651  04ff               L724:
1652                     ; 279 			j = 0;
1654  04ff b707          	ld	L163_j,a
1655                     ; 280 			if (i != (NUM_MIXER -1)) i++;
1657  0501 b606          	ld	a,L753_i
1658  0503 a10f          	cp	a,#15
1659  0505 2704          	jreq	L334
1662  0507 3c06          	inc	L753_i
1664  0509 2002          	jra	L524
1665  050b               L334:
1666                     ; 281 			else i = 0;
1668  050b 3f06          	clr	L753_i
1669  050d               L524:
1670                     ; 284 	if (j != 0) LCD_printtruc(1,6,"+\n",0); else LCD_printtruc(1,6,"-\n",0);
1672  050d b607          	ld	a,L163_j
1673  050f 2707          	jreq	L734
1676  0511 5f            	clrw	x
1677  0512 89            	pushw	x
1678  0513 ae00f5        	ldw	x,#L712
1681  0516 2005          	jra	L144
1682  0518               L734:
1685  0518 5f            	clrw	x
1686  0519 89            	pushw	x
1687  051a ae00f2        	ldw	x,#L322
1689  051d               L144:
1690  051d 89            	pushw	x
1691  051e ae0006        	ldw	x,#6
1692  0521 a601          	ld	a,#1
1693  0523 95            	ld	xh,a
1694  0524 cd0000        	call	_LCD_printtruc
1695  0527 5b04          	addw	sp,#4
1696                     ; 286 	if ((mixer[i].in < (NUM_INPUT + NUM_INPUT_SWITCH)) && (mixer[i].out < NUM_OUTPUT))
1698  0529 b606          	ld	a,L753_i
1699  052b 97            	ld	xl,a
1700  052c a604          	ld	a,#4
1701  052e 42            	mul	x,a
1702  052f d60000        	ld	a,(_mixer,x)
1703  0532 a108          	cp	a,#8
1704  0534 243b          	jruge	L344
1706  0536 d60001        	ld	a,(_mixer+1,x)
1707  0539 a108          	cp	a,#8
1708  053b 2434          	jruge	L344
1709                     ; 288 		mixin = mixer[i].in + 1;
1711  053d d60000        	ld	a,(_mixer,x)
1712  0540 4c            	inc	a
1713  0541 6b02          	ld	(OFST+0,sp),a
1714                     ; 289 		mixout = mixer[i].out + 1;
1716  0543 d60001        	ld	a,(_mixer+1,x)
1717  0546 4c            	inc	a
1718  0547 6b01          	ld	(OFST-1,sp),a
1719                     ; 290 		LCD_printtruc(2,6,"(%u\n",mixin);
1721  0549 5f            	clrw	x
1722  054a 7b02          	ld	a,(OFST+0,sp)
1723  054c 97            	ld	xl,a
1724  054d 89            	pushw	x
1725  054e ae00ae        	ldw	x,#L544
1726  0551 89            	pushw	x
1727  0552 ae0006        	ldw	x,#6
1728  0555 a602          	ld	a,#2
1729  0557 95            	ld	xh,a
1730  0558 cd0000        	call	_LCD_printtruc
1732  055b 5b04          	addw	sp,#4
1733                     ; 291 		LCD_printtruc(2,8,"~%u)\n",mixout);
1735  055d 7b01          	ld	a,(OFST-1,sp)
1736  055f 5f            	clrw	x
1737  0560 97            	ld	xl,a
1738  0561 89            	pushw	x
1739  0562 ae00a8        	ldw	x,#L744
1740  0565 89            	pushw	x
1741  0566 ae0008        	ldw	x,#8
1742  0569 a602          	ld	a,#2
1743  056b 95            	ld	xh,a
1744  056c cd0000        	call	_LCD_printtruc
1746  056f 5b04          	addw	sp,#4
1747  0571               L344:
1748                     ; 293 	val = reglage_variable(i,mixer[i].pente[j],-120,120,5);
1750  0571 4b05          	push	#5
1751  0573 4b78          	push	#120
1752  0575 4b88          	push	#136
1753  0577 b606          	ld	a,L753_i
1754  0579 97            	ld	xl,a
1755  057a a604          	ld	a,#4
1756  057c 42            	mul	x,a
1757  057d 01            	rrwa	x,a
1758  057e bb07          	add	a,L163_j
1759  0580 2401          	jrnc	L063
1760  0582 5c            	incw	x
1761  0583               L063:
1762  0583 02            	rlwa	x,a
1763  0584 d60002        	ld	a,(_mixer+2,x)
1764  0587 97            	ld	xl,a
1765  0588 b606          	ld	a,L753_i
1766  058a 95            	ld	xh,a
1767  058b cd09f7        	call	_reglage_variable
1769  058e 5b03          	addw	sp,#3
1770  0590 6b02          	ld	(OFST+0,sp),a
1771                     ; 294 	mixer[i].pente[j] = val;
1773  0592 b606          	ld	a,L753_i
1774  0594 97            	ld	xl,a
1775  0595 a604          	ld	a,#4
1776  0597 42            	mul	x,a
1777  0598 01            	rrwa	x,a
1778  0599 bb07          	add	a,L163_j
1779  059b 2401          	jrnc	L263
1780  059d 5c            	incw	x
1781  059e               L263:
1782  059e 02            	rlwa	x,a
1783  059f 7b02          	ld	a,(OFST+0,sp)
1784  05a1 d70002        	ld	(_mixer+2,x),a
1785                     ; 296 	navigue(33,31,33,33,33);
1787  05a4 4b21          	push	#33
1788  05a6 4b21          	push	#33
1789  05a8 4b21          	push	#33
1790  05aa ae001f        	ldw	x,#31
1791  05ad a621          	ld	a,#33
1792  05af 95            	ld	xh,a
1793  05b0 cd09b8        	call	_navigue
1795  05b3 5b03          	addw	sp,#3
1796                     ; 298 }
1799  05b5 85            	popw	x
1800  05b6 81            	ret	
1828                     ; 301 void m40(void)
1828                     ; 302 { 
1829                     	switch	.text
1830  05b7               _m40:
1834                     ; 303 	LCD_DISP_OFF();
1836  05b7 cd0000        	call	_LCD_DISP_OFF
1838                     ; 304 	LCD_CLEAR_DISPLAY();
1840  05ba cd0000        	call	_LCD_CLEAR_DISPLAY
1842                     ; 305 	LCD_printtruc(1,3,"Reglage des\n",0);
1844  05bd 5f            	clrw	x
1845  05be 89            	pushw	x
1846  05bf ae010f        	ldw	x,#L141
1847  05c2 89            	pushw	x
1848  05c3 ae0003        	ldw	x,#3
1849  05c6 a601          	ld	a,#1
1850  05c8 95            	ld	xh,a
1851  05c9 cd0000        	call	_LCD_printtruc
1853  05cc 5b04          	addw	sp,#4
1854                     ; 306 	LCD_printtruc(2,5,"Sorties\n",0);
1856  05ce 5f            	clrw	x
1857  05cf 89            	pushw	x
1858  05d0 ae009f        	ldw	x,#L164
1859  05d3 89            	pushw	x
1860  05d4 ae0005        	ldw	x,#5
1861  05d7 a602          	ld	a,#2
1862  05d9 95            	ld	xh,a
1863  05da cd0000        	call	_LCD_printtruc
1865  05dd 5b04          	addw	sp,#4
1866                     ; 307 	LCD_DISP_ON();
1868  05df cd0000        	call	_LCD_DISP_ON
1870                     ; 309 	navigue(40,0,41,30,50);
1872  05e2 4b32          	push	#50
1873  05e4 4b1e          	push	#30
1874  05e6 4b29          	push	#41
1875  05e8 5f            	clrw	x
1876  05e9 a628          	ld	a,#40
1877  05eb 95            	ld	xh,a
1878  05ec cd09b8        	call	_navigue
1880  05ef 5b03          	addw	sp,#3
1881                     ; 311 }
1884  05f1 81            	ret	
1887                     	bsct
1888  0008               L364_i:
1889  0008 00            	dc.b	0
1890  0009               L564_j:
1891  0009 00            	dc.b	0
1951                     ; 314 void m41(void)
1951                     ; 315 { 	
1952                     	switch	.text
1953  05f2               _m41:
1955  05f2 88            	push	a
1956       00000001      OFST:	set	1
1959                     ; 319 	LCD_DISP_OFF();
1961  05f3 cd0000        	call	_LCD_DISP_OFF
1963                     ; 320 	LCD_CLEAR_DISPLAY();
1965  05f6 cd0000        	call	_LCD_CLEAR_DISPLAY
1967                     ; 321 	LCD_printtruc(1,1,"Sortie\n",0);
1969  05f9 5f            	clrw	x
1970  05fa 89            	pushw	x
1971  05fb ae0097        	ldw	x,#L515
1972  05fe 89            	pushw	x
1973  05ff ae0001        	ldw	x,#1
1974  0602 a601          	ld	a,#1
1975  0604 95            	ld	xh,a
1976  0605 cd0000        	call	_LCD_printtruc
1978  0608 5b04          	addw	sp,#4
1979                     ; 322 	LCD_DISP_ON();
1981  060a cd0000        	call	_LCD_DISP_ON
1983                     ; 324 	if (bas)
1985  060d 7201000018    	btjf	_bas,L715
1986                     ; 326 		if (j != 2) j++; 		
1988  0612 b609          	ld	a,L564_j
1989  0614 a102          	cp	a,#2
1990  0616 2704          	jreq	L125
1993  0618 3c09          	inc	L564_j
1995  061a 200e          	jra	L715
1996  061c               L125:
1997                     ; 329 			j = 0;
1999  061c 3f09          	clr	L564_j
2000                     ; 330 			if (i != (NUM_OUTPUT -1)) i++;
2002  061e b608          	ld	a,L364_i
2003  0620 a107          	cp	a,#7
2004  0622 2704          	jreq	L525
2007  0624 3c08          	inc	L364_i
2009  0626 2002          	jra	L715
2010  0628               L525:
2011                     ; 331 			else i = 0;
2013  0628 3f08          	clr	L364_i
2014  062a               L715:
2015                     ; 334 	if (j	== 0)
2017  062a b609          	ld	a,L564_j
2018  062c 2642          	jrne	L135
2019                     ; 336 		LCD_printtruc(1,12,"Mini\n",0);
2021  062e 5f            	clrw	x
2022  062f 89            	pushw	x
2023  0630 ae0091        	ldw	x,#L335
2024  0633 89            	pushw	x
2025  0634 ae000c        	ldw	x,#12
2026  0637 4c            	inc	a
2027  0638 95            	ld	xh,a
2028  0639 cd0000        	call	_LCD_printtruc
2030  063c 5b04          	addw	sp,#4
2031                     ; 338 		toto = sortiepourcent(output.usMinValue[i]);
2033  063e b608          	ld	a,L364_i
2034  0640 5f            	clrw	x
2035  0641 97            	ld	xl,a
2036  0642 58            	sllw	x
2037  0643 de0029        	ldw	x,(_output+41,x)
2038  0646 cd0000        	call	_sortiepourcent
2040  0649 6b01          	ld	(OFST+0,sp),a
2041                     ; 339 		toto = reglage_variable(i,toto,-120,120,5);	
2043  064b 4b05          	push	#5
2044  064d 4b78          	push	#120
2045  064f 4b88          	push	#136
2046  0651 7b04          	ld	a,(OFST+3,sp)
2047  0653 97            	ld	xl,a
2048  0654 b608          	ld	a,L364_i
2049  0656 95            	ld	xh,a
2050  0657 cd09f7        	call	_reglage_variable
2052  065a 5b03          	addw	sp,#3
2053  065c 6b01          	ld	(OFST+0,sp),a
2054                     ; 340 		output.usMinValue[i] = pourcentsortie(toto);
2056  065e cd0000        	call	_pourcentsortie
2058  0661 b608          	ld	a,L364_i
2059  0663 905f          	clrw	y
2060  0665 9097          	ld	yl,a
2061  0667 9058          	sllw	y
2062  0669 90df0029      	ldw	(_output+41,y),x
2064  066d cc06f4        	jra	L535
2065  0670               L135:
2066                     ; 343 	else if (j == 1)
2068  0670 4a            	dec	a
2069  0671 2641          	jrne	L735
2070                     ; 345 		LCD_printtruc(1,11,"Neutre\n",0);
2072  0673 5f            	clrw	x
2073  0674 89            	pushw	x
2074  0675 ae0089        	ldw	x,#L145
2075  0678 89            	pushw	x
2076  0679 ae000b        	ldw	x,#11
2077  067c 4c            	inc	a
2078  067d 95            	ld	xh,a
2079  067e cd0000        	call	_LCD_printtruc
2081  0681 5b04          	addw	sp,#4
2082                     ; 347 		toto = sortiepourcent(output.usNeutralValue[i]);
2084  0683 b608          	ld	a,L364_i
2085  0685 5f            	clrw	x
2086  0686 97            	ld	xl,a
2087  0687 58            	sllw	x
2088  0688 de0039        	ldw	x,(_output+57,x)
2089  068b cd0000        	call	_sortiepourcent
2091  068e 6b01          	ld	(OFST+0,sp),a
2092                     ; 348 		toto = reglage_variable(i,toto,-120,120,2);	
2094  0690 4b02          	push	#2
2095  0692 4b78          	push	#120
2096  0694 4b88          	push	#136
2097  0696 7b04          	ld	a,(OFST+3,sp)
2098  0698 97            	ld	xl,a
2099  0699 b608          	ld	a,L364_i
2100  069b 95            	ld	xh,a
2101  069c cd09f7        	call	_reglage_variable
2103  069f 5b03          	addw	sp,#3
2104  06a1 6b01          	ld	(OFST+0,sp),a
2105                     ; 349 		output.usNeutralValue[i] = pourcentsortie(toto);
2107  06a3 cd0000        	call	_pourcentsortie
2109  06a6 b608          	ld	a,L364_i
2110  06a8 905f          	clrw	y
2111  06aa 9097          	ld	yl,a
2112  06ac 9058          	sllw	y
2113  06ae 90df0039      	ldw	(_output+57,y),x
2115  06b2 2040          	jra	L535
2116  06b4               L735:
2117                     ; 354 		LCD_printtruc(1,12,"Maxi\n",0);
2119  06b4 5f            	clrw	x
2120  06b5 89            	pushw	x
2121  06b6 ae0083        	ldw	x,#L545
2122  06b9 89            	pushw	x
2123  06ba ae000c        	ldw	x,#12
2124  06bd a601          	ld	a,#1
2125  06bf 95            	ld	xh,a
2126  06c0 cd0000        	call	_LCD_printtruc
2128  06c3 5b04          	addw	sp,#4
2129                     ; 356 		toto = sortiepourcent(output.usMaxValue[i]);
2131  06c5 b608          	ld	a,L364_i
2132  06c7 5f            	clrw	x
2133  06c8 97            	ld	xl,a
2134  06c9 58            	sllw	x
2135  06ca de0049        	ldw	x,(_output+73,x)
2136  06cd cd0000        	call	_sortiepourcent
2138  06d0 6b01          	ld	(OFST+0,sp),a
2139                     ; 357 		toto = reglage_variable(i,toto,-120,120,5);	
2141  06d2 4b05          	push	#5
2142  06d4 4b78          	push	#120
2143  06d6 4b88          	push	#136
2144  06d8 7b04          	ld	a,(OFST+3,sp)
2145  06da 97            	ld	xl,a
2146  06db b608          	ld	a,L364_i
2147  06dd 95            	ld	xh,a
2148  06de cd09f7        	call	_reglage_variable
2150  06e1 5b03          	addw	sp,#3
2151  06e3 6b01          	ld	(OFST+0,sp),a
2152                     ; 358 		output.usMaxValue[i] = pourcentsortie(toto);
2154  06e5 cd0000        	call	_pourcentsortie
2156  06e8 b608          	ld	a,L364_i
2157  06ea 905f          	clrw	y
2158  06ec 9097          	ld	yl,a
2159  06ee 9058          	sllw	y
2160  06f0 90df0049      	ldw	(_output+73,y),x
2161  06f4               L535:
2162                     ; 362 	navigue(41,40,41,41,41);
2164  06f4 4b29          	push	#41
2165  06f6 4b29          	push	#41
2166  06f8 4b29          	push	#41
2167  06fa ae0028        	ldw	x,#40
2168  06fd a629          	ld	a,#41
2169  06ff 95            	ld	xh,a
2170  0700 cd09b8        	call	_navigue
2172  0703 5b03          	addw	sp,#3
2173                     ; 364 }
2176  0705 84            	pop	a
2177  0706 81            	ret	
2205                     ; 367 void m50(void)
2205                     ; 368 {
2206                     	switch	.text
2207  0707               _m50:
2211                     ; 369 	LCD_DISP_OFF();
2213  0707 cd0000        	call	_LCD_DISP_OFF
2215                     ; 370 	LCD_CLEAR_DISPLAY();
2217  070a cd0000        	call	_LCD_CLEAR_DISPLAY
2219                     ; 371 	LCD_printtruc(1,5,"Securite\n",0);
2221  070d 5f            	clrw	x
2222  070e 89            	pushw	x
2223  070f ae0079        	ldw	x,#L755
2224  0712 89            	pushw	x
2225  0713 ae0005        	ldw	x,#5
2226  0716 a601          	ld	a,#1
2227  0718 95            	ld	xh,a
2228  0719 cd0000        	call	_LCD_printtruc
2230  071c 5b04          	addw	sp,#4
2231                     ; 372 	LCD_printtruc(2,6,"Moteur\n",0);
2233  071e 5f            	clrw	x
2234  071f 89            	pushw	x
2235  0720 ae0071        	ldw	x,#L165
2236  0723 89            	pushw	x
2237  0724 ae0006        	ldw	x,#6
2238  0727 a602          	ld	a,#2
2239  0729 95            	ld	xh,a
2240  072a cd0000        	call	_LCD_printtruc
2242  072d 5b04          	addw	sp,#4
2243                     ; 373 	LCD_DISP_ON();
2245  072f cd0000        	call	_LCD_DISP_ON
2247                     ; 375 	navigue(50,0,51,40,60);
2249  0732 4b3c          	push	#60
2250  0734 4b28          	push	#40
2251  0736 4b33          	push	#51
2252  0738 5f            	clrw	x
2253  0739 a632          	ld	a,#50
2254  073b 95            	ld	xh,a
2255  073c cd09b8        	call	_navigue
2257  073f 5b03          	addw	sp,#3
2258                     ; 377 }
2261  0741 81            	ret	
2302                     ; 380 void m51(void)
2302                     ; 381 { 
2303                     	switch	.text
2304  0742               _m51:
2306  0742 88            	push	a
2307       00000001      OFST:	set	1
2310                     ; 384 	i = output.secumoteur;
2312  0743 c60000        	ld	a,_output
2313  0746 6b01          	ld	(OFST+0,sp),a
2314                     ; 385 	if (bas) 
2316  0748 720100000c    	btjf	_bas,L106
2317                     ; 387 		if (i != (NUM_OUTPUT -1)) i++;	else i = 255;
2319  074d a107          	cp	a,#7
2320  074f 2704          	jreq	L306
2323  0751 0c01          	inc	(OFST+0,sp)
2325  0753 2004          	jra	L106
2326  0755               L306:
2329  0755 a6ff          	ld	a,#255
2330  0757 6b01          	ld	(OFST+0,sp),a
2331  0759               L106:
2332                     ; 390 	LCD_DISP_OFF();
2334  0759 cd0000        	call	_LCD_DISP_OFF
2336                     ; 391 	LCD_CLEAR_DISPLAY();
2338  075c cd0000        	call	_LCD_CLEAR_DISPLAY
2340                     ; 392 	LCD_printtruc(1,2,"Choix du canal\n",0);
2342  075f 5f            	clrw	x
2343  0760 89            	pushw	x
2344  0761 ae0061        	ldw	x,#L706
2345  0764 89            	pushw	x
2346  0765 ae0002        	ldw	x,#2
2347  0768 a601          	ld	a,#1
2348  076a 95            	ld	xh,a
2349  076b cd0000        	call	_LCD_printtruc
2351  076e 5b04          	addw	sp,#4
2352                     ; 393 	if (i != 255) LCD_printtruc(2,8,"%u\n",(i + 1));
2354  0770 7b01          	ld	a,(OFST+0,sp)
2355  0772 a1ff          	cp	a,#255
2356  0774 2713          	jreq	L116
2359  0776 5f            	clrw	x
2360  0777 97            	ld	xl,a
2361  0778 5c            	incw	x
2362  0779 89            	pushw	x
2363  077a ae00c6        	ldw	x,#L343
2364  077d 89            	pushw	x
2365  077e ae0008        	ldw	x,#8
2366  0781 a602          	ld	a,#2
2367  0783 95            	ld	xh,a
2368  0784 cd0000        	call	_LCD_printtruc
2370  0787 5b04          	addw	sp,#4
2371  0789               L116:
2372                     ; 394 	LCD_DISP_ON();
2374  0789 cd0000        	call	_LCD_DISP_ON
2376                     ; 396 	output.secumoteur = i;
2378  078c 7b01          	ld	a,(OFST+0,sp)
2379  078e c70000        	ld	_output,a
2380                     ; 398 	navigue(51,50,51,51,51);
2382  0791 4b33          	push	#51
2383  0793 4b33          	push	#51
2384  0795 4b33          	push	#51
2385  0797 ae0032        	ldw	x,#50
2386  079a a633          	ld	a,#51
2387  079c 95            	ld	xh,a
2388  079d cd09b8        	call	_navigue
2390  07a0 5b03          	addw	sp,#3
2391                     ; 400 }
2394  07a2 84            	pop	a
2395  07a3 81            	ret	
2423                     ; 403 void m60(void)
2423                     ; 404 {
2424                     	switch	.text
2425  07a4               _m60:
2429                     ; 405 	LCD_DISP_OFF();
2431  07a4 cd0000        	call	_LCD_DISP_OFF
2433                     ; 406 	LCD_CLEAR_DISPLAY();
2435  07a7 cd0000        	call	_LCD_CLEAR_DISPLAY
2437                     ; 407 	LCD_printtruc(1,6,"Double\n",0);
2439  07aa 5f            	clrw	x
2440  07ab 89            	pushw	x
2441  07ac ae0059        	ldw	x,#L326
2442  07af 89            	pushw	x
2443  07b0 ae0006        	ldw	x,#6
2444  07b3 a601          	ld	a,#1
2445  07b5 95            	ld	xh,a
2446  07b6 cd0000        	call	_LCD_printtruc
2448  07b9 5b04          	addw	sp,#4
2449                     ; 408 	LCD_printtruc(2,7,"Taux\n",0);
2451  07bb 5f            	clrw	x
2452  07bc 89            	pushw	x
2453  07bd ae0053        	ldw	x,#L526
2454  07c0 89            	pushw	x
2455  07c1 ae0007        	ldw	x,#7
2456  07c4 a602          	ld	a,#2
2457  07c6 95            	ld	xh,a
2458  07c7 cd0000        	call	_LCD_printtruc
2460  07ca 5b04          	addw	sp,#4
2461                     ; 409 	LCD_DISP_ON();
2463  07cc cd0000        	call	_LCD_DISP_ON
2465                     ; 411 	navigue(60,0,61,50,70);
2467  07cf 4b46          	push	#70
2468  07d1 4b32          	push	#50
2469  07d3 4b3d          	push	#61
2470  07d5 5f            	clrw	x
2471  07d6 a63c          	ld	a,#60
2472  07d8 95            	ld	xh,a
2473  07d9 cd09b8        	call	_navigue
2475  07dc 5b03          	addw	sp,#3
2476                     ; 413 }
2479  07de 81            	ret	
2482                     	bsct
2483  000a               L726_i:
2484  000a 00            	dc.b	0
2533                     ; 416 void m61(void)
2533                     ; 417 { 
2534                     	switch	.text
2535  07df               _m61:
2537  07df 88            	push	a
2538       00000001      OFST:	set	1
2541                     ; 420 	LCD_DISP_OFF();
2543  07e0 cd0000        	call	_LCD_DISP_OFF
2545                     ; 421 	LCD_CLEAR_DISPLAY();
2547  07e3 cd0000        	call	_LCD_CLEAR_DISPLAY
2549                     ; 422 	LCD_printtruc(1,1,"Sortie\n",0);
2551  07e6 5f            	clrw	x
2552  07e7 89            	pushw	x
2553  07e8 ae0097        	ldw	x,#L515
2554  07eb 89            	pushw	x
2555  07ec ae0001        	ldw	x,#1
2556  07ef a601          	ld	a,#1
2557  07f1 95            	ld	xh,a
2558  07f2 cd0000        	call	_LCD_printtruc
2560  07f5 5b04          	addw	sp,#4
2561                     ; 423 	LCD_printtruc(1,12,"Taux\n",0);
2563  07f7 5f            	clrw	x
2564  07f8 89            	pushw	x
2565  07f9 ae0053        	ldw	x,#L526
2566  07fc 89            	pushw	x
2567  07fd ae000c        	ldw	x,#12
2568  0800 a601          	ld	a,#1
2569  0802 95            	ld	xh,a
2570  0803 cd0000        	call	_LCD_printtruc
2572  0806 5b04          	addw	sp,#4
2573                     ; 424 	LCD_DISP_ON();
2575  0808 cd0000        	call	_LCD_DISP_ON
2577                     ; 426 	if (bas) 
2579  080b 720100000c    	btjf	_bas,L356
2580                     ; 428 		if (i != (NUM_OUTPUT -1)) i++; else i = 0;
2582  0810 b60a          	ld	a,L726_i
2583  0812 a107          	cp	a,#7
2584  0814 2704          	jreq	L556
2587  0816 3c0a          	inc	L726_i
2589  0818 2002          	jra	L356
2590  081a               L556:
2593  081a 3f0a          	clr	L726_i
2594  081c               L356:
2595                     ; 431 	val = reglage_variable(i,output.dr[i],5,100,5);
2597  081c 4b05          	push	#5
2598  081e 4b64          	push	#100
2599  0820 4b05          	push	#5
2600  0822 b60a          	ld	a,L726_i
2601  0824 5f            	clrw	x
2602  0825 97            	ld	xl,a
2603  0826 d60001        	ld	a,(_output+1,x)
2604  0829 97            	ld	xl,a
2605  082a b60a          	ld	a,L726_i
2606  082c 95            	ld	xh,a
2607  082d cd09f7        	call	_reglage_variable
2609  0830 5b03          	addw	sp,#3
2610  0832 6b01          	ld	(OFST+0,sp),a
2611                     ; 432 	output.dr[i] = val;
2613  0834 5f            	clrw	x
2614  0835 b60a          	ld	a,L726_i
2615  0837 97            	ld	xl,a
2616  0838 7b01          	ld	a,(OFST+0,sp)
2617  083a d70001        	ld	(_output+1,x),a
2618                     ; 434 	navigue(61,60,61,61,61);
2620  083d 4b3d          	push	#61
2621  083f 4b3d          	push	#61
2622  0841 4b3d          	push	#61
2623  0843 ae003c        	ldw	x,#60
2624  0846 a63d          	ld	a,#61
2625  0848 95            	ld	xh,a
2626  0849 cd09b8        	call	_navigue
2628  084c 5b03          	addw	sp,#3
2629                     ; 436 }
2632  084e 84            	pop	a
2633  084f 81            	ret	
2661                     ; 439 void m70(void)
2661                     ; 440 {
2662                     	switch	.text
2663  0850               _m70:
2667                     ; 441 	LCD_DISP_OFF();
2669  0850 cd0000        	call	_LCD_DISP_OFF
2671                     ; 442 	LCD_CLEAR_DISPLAY();
2673  0853 cd0000        	call	_LCD_CLEAR_DISPLAY
2675                     ; 443 	LCD_printtruc(1,3,"Utilitaires\n",0);
2677  0856 5f            	clrw	x
2678  0857 89            	pushw	x
2679  0858 ae0046        	ldw	x,#L176
2680  085b 89            	pushw	x
2681  085c ae0003        	ldw	x,#3
2682  085f a601          	ld	a,#1
2683  0861 95            	ld	xh,a
2684  0862 cd0000        	call	_LCD_printtruc
2686  0865 5b04          	addw	sp,#4
2687                     ; 444 	LCD_printtruc(2,5,"Options\n",0);
2689  0867 5f            	clrw	x
2690  0868 89            	pushw	x
2691  0869 ae003d        	ldw	x,#L376
2692  086c 89            	pushw	x
2693  086d ae0005        	ldw	x,#5
2694  0870 a602          	ld	a,#2
2695  0872 95            	ld	xh,a
2696  0873 cd0000        	call	_LCD_printtruc
2698  0876 5b04          	addw	sp,#4
2699                     ; 445 	LCD_DISP_ON();
2701  0878 cd0000        	call	_LCD_DISP_ON
2703                     ; 447 	navigue(70,0,71,60,10);
2705  087b 4b0a          	push	#10
2706  087d 4b3c          	push	#60
2707  087f 4b47          	push	#71
2708  0881 5f            	clrw	x
2709  0882 a646          	ld	a,#70
2710  0884 95            	ld	xh,a
2711  0885 cd09b8        	call	_navigue
2713  0888 5b03          	addw	sp,#3
2714                     ; 449 }
2717  088a 81            	ret	
2750                     ; 452 void m71(void)
2750                     ; 453 {
2751                     	switch	.text
2752  088b               _m71:
2756                     ; 454 	LCD_DISP_OFF();
2758  088b cd0000        	call	_LCD_DISP_OFF
2760                     ; 455 	LCD_CLEAR_DISPLAY();
2762  088e cd0000        	call	_LCD_CLEAR_DISPLAY
2764                     ; 456 	LCD_printtruc(1,4,"Etalonnage\n",0);
2766  0891 5f            	clrw	x
2767  0892 89            	pushw	x
2768  0893 ae0031        	ldw	x,#L507
2769  0896 89            	pushw	x
2770  0897 ae0004        	ldw	x,#4
2771  089a a601          	ld	a,#1
2772  089c 95            	ld	xh,a
2773  089d cd0000        	call	_LCD_printtruc
2775  08a0 5b04          	addw	sp,#4
2776                     ; 457 	LCD_printtruc(2,3,"des manches\n",0);
2778  08a2 5f            	clrw	x
2779  08a3 89            	pushw	x
2780  08a4 ae0024        	ldw	x,#L707
2781  08a7 89            	pushw	x
2782  08a8 ae0003        	ldw	x,#3
2783  08ab a602          	ld	a,#2
2784  08ad 95            	ld	xh,a
2785  08ae cd0000        	call	_LCD_printtruc
2787  08b1 5b04          	addw	sp,#4
2788                     ; 458 	LCD_DISP_ON();
2790  08b3 cd0000        	call	_LCD_DISP_ON
2792                     ; 460 	if (droite) {
2794  08b6 720100000c    	btjf	_droite,L117
2795                     ; 461 		jeton = 10;
2797  08bb 350a0000      	mov	_jeton,#10
2798                     ; 462 		etalonnage();
2800  08bf cd0000        	call	_etalonnage
2802                     ; 463 		load_input(modele_actuel);
2804  08c2 b600          	ld	a,_modele_actuel
2808  08c4 cc0000        	jp	_load_input
2809  08c7               L117:
2810                     ; 467 		navigue(71,70,72,10,71);
2812  08c7 4b47          	push	#71
2813  08c9 4b0a          	push	#10
2814  08cb 4b48          	push	#72
2815  08cd ae0046        	ldw	x,#70
2816  08d0 a647          	ld	a,#71
2817  08d2 95            	ld	xh,a
2818  08d3 cd09b8        	call	_navigue
2820  08d6 5b03          	addw	sp,#3
2821                     ; 469 }
2824  08d8 81            	ret	
2855                     ; 472 void m72(void)
2855                     ; 473 {
2856                     	switch	.text
2857  08d9               _m72:
2861                     ; 474 	LCD_DISP_OFF();
2863  08d9 cd0000        	call	_LCD_DISP_OFF
2865                     ; 475 	LCD_CLEAR_DISPLAY();
2867  08dc cd0000        	call	_LCD_CLEAR_DISPLAY
2869                     ; 476 	LCD_printtruc(1,1,"Ratio moteur/bat\n",0);
2871  08df 5f            	clrw	x
2872  08e0 89            	pushw	x
2873  08e1 ae0012        	ldw	x,#L527
2874  08e4 89            	pushw	x
2875  08e5 ae0001        	ldw	x,#1
2876  08e8 a601          	ld	a,#1
2877  08ea 95            	ld	xh,a
2878  08eb cd0000        	call	_LCD_printtruc
2880  08ee 5b04          	addw	sp,#4
2881                     ; 477 	LCD_DISP_ON();
2883  08f0 cd0000        	call	_LCD_DISP_ON
2885                     ; 479 	if ((droite) && (ratiobat < 65)) ratiobat++;
2887  08f3 7201000008    	btjf	_droite,L727
2889  08f8 b600          	ld	a,_ratiobat
2890  08fa a141          	cp	a,#65
2891  08fc 2402          	jruge	L727
2894  08fe 3c00          	inc	_ratiobat
2895  0900               L727:
2896                     ; 480 	if ((gauche) && (ratiobat > 0)) ratiobat--;
2898  0900 7201000006    	btjf	_gauche,L137
2900  0905 b600          	ld	a,_ratiobat
2901  0907 2702          	jreq	L137
2904  0909 3a00          	dec	_ratiobat
2905  090b               L137:
2906                     ; 482 	LCD_printtruc(2,4,"%u Heure-1\n",ratiobat);
2908  090b b600          	ld	a,_ratiobat
2909  090d 5f            	clrw	x
2910  090e 97            	ld	xl,a
2911  090f 89            	pushw	x
2912  0910 ae0006        	ldw	x,#L337
2913  0913 89            	pushw	x
2914  0914 ae0004        	ldw	x,#4
2915  0917 a602          	ld	a,#2
2916  0919 95            	ld	xh,a
2917  091a cd0000        	call	_LCD_printtruc
2919  091d 5b04          	addw	sp,#4
2920                     ; 484 	navigue(72,71,70,72,72);
2922  091f 4b48          	push	#72
2923  0921 4b48          	push	#72
2924  0923 4b46          	push	#70
2925  0925 ae0047        	ldw	x,#71
2926  0928 a648          	ld	a,#72
2927  092a 95            	ld	xh,a
2928  092b cd09b8        	call	_navigue
2930  092e 5b03          	addw	sp,#3
2931                     ; 486 }
2934  0930 81            	ret	
2978                     ; 489 void Menu(void)
2978                     ; 490 {
2979                     	switch	.text
2980  0931               _Menu:
2984                     ; 493 	switch (jeton)
2986  0931 b600          	ld	a,_jeton
2988                     ; 576 	default:
2988                     ; 577 		jeton = 10;
2989  0933 a00a          	sub	a,#10
2990  0935 2745          	jreq	L537
2991  0937 4a            	dec	a
2992  0938 2745          	jreq	L737
2993  093a 4a            	dec	a
2994  093b 2745          	jreq	L147
2995  093d 4a            	dec	a
2996  093e 2748          	jreq	L547
2997  0940 a007          	sub	a,#7
2998  0942 2747          	jreq	L747
2999  0944 4a            	dec	a
3000  0945 2747          	jreq	L157
3001  0947 a009          	sub	a,#9
3002  0949 2746          	jreq	L357
3003  094b 4a            	dec	a
3004  094c 2746          	jreq	L557
3005  094e 4a            	dec	a
3006  094f 2746          	jreq	L757
3007  0951 4a            	dec	a
3008  0952 2746          	jreq	L167
3009  0954 a007          	sub	a,#7
3010  0956 2745          	jreq	L367
3011  0958 4a            	dec	a
3012  0959 2745          	jreq	L567
3013  095b a009          	sub	a,#9
3014  095d 2744          	jreq	L767
3015  095f 4a            	dec	a
3016  0960 2744          	jreq	L177
3017  0962 a009          	sub	a,#9
3018  0964 2743          	jreq	L377
3019  0966 4a            	dec	a
3020  0967 2743          	jreq	L577
3021  0969 a009          	sub	a,#9
3022  096b 2742          	jreq	L777
3023  096d 4a            	dec	a
3024  096e 2742          	jreq	L1001
3025  0970 4a            	dec	a
3026  0971 2742          	jreq	L3001
3027  0973 a031          	sub	a,#49
3028  0975 270e          	jreq	L347
3031  0977 350a0000      	mov	_jeton,#10
3033  097b 81            	ret	
3034  097c               L537:
3035                     ; 496 	case 10:
3035                     ; 497 		m10();
3038                     ; 498 		break;
3041  097c cc0000        	jp	_m10
3042  097f               L737:
3043                     ; 500 	case 11:
3043                     ; 501 		m11();
3046                     ; 502 		break;
3049  097f cc0054        	jp	_m11
3050  0982               L147:
3051                     ; 504 	case 12:
3051                     ; 505 		m12();
3054                     ; 506 		break;
3057  0982 cc00f1        	jp	_m12
3058  0985               L347:
3059                     ; 508 	case 121:
3059                     ; 509 		m121();
3062                     ; 510 		break;
3065  0985 cc014f        	jp	_m121
3066  0988               L547:
3067                     ; 512 	case 13:
3067                     ; 513 		m13();
3070                     ; 514 		break;
3073  0988 cc01bd        	jp	_m13
3074  098b               L747:
3075                     ; 516 	case 20:
3075                     ; 517 		m20();
3078                     ; 518 		break;
3081  098b cc0246        	jp	_m20
3082  098e               L157:
3083                     ; 520 	case 21:
3083                     ; 521 		m21();
3086                     ; 522 		break;
3089  098e cc0281        	jp	_m21
3090  0991               L357:
3091                     ; 524 	case 30:
3091                     ; 525 		m30();
3094                     ; 526 		break;
3097  0991 cc032b        	jp	_m30
3098  0994               L557:
3099                     ; 528 	case 31:
3099                     ; 529 		m31();
3102                     ; 530 		break;
3105  0994 cc0366        	jp	_m31
3106  0997               L757:
3107                     ; 532 	case 32:
3107                     ; 533 		m32();
3110                     ; 534 		break;
3113  0997 cc03b4        	jp	_m32
3114  099a               L167:
3115                     ; 536 	case 33:
3115                     ; 537 		m33();
3118                     ; 538 		break;
3121  099a cc04c5        	jp	_m33
3122  099d               L367:
3123                     ; 540 	case 40:
3123                     ; 541 		m40();
3126                     ; 542 		break;
3129  099d cc05b7        	jp	_m40
3130  09a0               L567:
3131                     ; 544 	case 41:
3131                     ; 545 		m41();
3134                     ; 546 		break;
3137  09a0 cc05f2        	jp	_m41
3138  09a3               L767:
3139                     ; 548 	case 50:
3139                     ; 549 		m50();
3142                     ; 550 		break;
3145  09a3 cc0707        	jp	_m50
3146  09a6               L177:
3147                     ; 552 	case 51:
3147                     ; 553 		m51();
3150                     ; 554 		break;
3153  09a6 cc0742        	jp	_m51
3154  09a9               L377:
3155                     ; 556 	case 60:
3155                     ; 557 		m60();
3158                     ; 558 		break;
3161  09a9 cc07a4        	jp	_m60
3162  09ac               L577:
3163                     ; 560 	case 61:
3163                     ; 561 		m61();
3166                     ; 562 		break;
3169  09ac cc07df        	jp	_m61
3170  09af               L777:
3171                     ; 564 	case 70:
3171                     ; 565 		m70();
3174                     ; 566 		break;
3177  09af cc0850        	jp	_m70
3178  09b2               L1001:
3179                     ; 568 	case 71:
3179                     ; 569 		m71();
3182                     ; 570 		break;
3185  09b2 cc088b        	jp	_m71
3186  09b5               L3001:
3187                     ; 572 	case 72:
3187                     ; 573 		m72();
3190                     ; 574 		break;
3192                     ; 579 }
3195  09b5 cc08d9        	jp	_m72
3272                     ; 581 void navigue(u8 dou,u8 jetonh,u8 jetonb,u8 jetong,u8 jetond)(void)
3272                     ; 582 {
3273                     	switch	.text
3274  09b8               _navigue:
3276  09b8 89            	pushw	x
3277       00000000      OFST:	set	0
3280                     ; 583 	if (haut)
3282  09b9 7201000003    	btjf	_haut,L1601
3283                     ; 585 		jeton = jetonh;
3285  09be 9f            	ld	a,xl
3287  09bf 2019          	jp	LC001
3288  09c1               L1601:
3289                     ; 586 	} else if (bas)
3291  09c1 7201000004    	btjf	_bas,L5601
3292                     ; 588 		jeton = jetonb;
3294  09c6 7b05          	ld	a,(OFST+5,sp)
3296  09c8 2010          	jp	LC001
3297  09ca               L5601:
3298                     ; 589 	} else if (gauche)
3300  09ca 7201000004    	btjf	_gauche,L1701
3301                     ; 591 		jeton = jetong;
3303  09cf 7b06          	ld	a,(OFST+6,sp)
3305  09d1 2007          	jp	LC001
3306  09d3               L1701:
3307                     ; 592 	} else if (droite)
3309  09d3 7201000004    	btjf	_droite,L3601
3310                     ; 594 		jeton = jetond;	
3312  09d8 7b07          	ld	a,(OFST+7,sp)
3313  09da               LC001:
3314  09da b700          	ld	_jeton,a
3315  09dc               L3601:
3316                     ; 596 	haut = bas = gauche = droite = 0;
3318  09dc 72110000      	bres	_droite
3319  09e0 72110000      	bres	_gauche
3320  09e4 72110000      	bres	_bas
3321  09e8 72110000      	bres	_haut
3322                     ; 597 	if (jeton != dou) Menu();
3324  09ec b600          	ld	a,_jeton
3325  09ee 1101          	cp	a,(OFST+1,sp)
3326  09f0 2703          	jreq	L7701
3329  09f2 cd0931        	call	_Menu
3331  09f5               L7701:
3332                     ; 598 }
3335  09f5 85            	popw	x
3336  09f6 81            	ret	
3409                     ; 600 s8 reglage_variable(s8 nom,s8 actuel,s8 mini,s8 maxi,s8 pas)
3409                     ; 601 {
3410                     	switch	.text
3411  09f7               _reglage_variable:
3413  09f7 89            	pushw	x
3414       00000000      OFST:	set	0
3417                     ; 602 	LCD_printtruc(2,3,"%u\n",(nom  + 1));
3419  09f8 9e            	ld	a,xh
3420  09f9 5f            	clrw	x
3421  09fa 4d            	tnz	a
3422  09fb 2a01          	jrpl	L407
3423  09fd 53            	cplw	x
3424  09fe               L407:
3425  09fe 97            	ld	xl,a
3426  09ff 5c            	incw	x
3427  0a00 89            	pushw	x
3428  0a01 ae00c6        	ldw	x,#L343
3429  0a04 89            	pushw	x
3430  0a05 ae0003        	ldw	x,#3
3431  0a08 a602          	ld	a,#2
3432  0a0a 95            	ld	xh,a
3433  0a0b cd0000        	call	_LCD_printtruc
3435  0a0e 5b04          	addw	sp,#4
3436                     ; 603 	if (gauche)
3438  0a10 720100000e    	btjf	_gauche,L7311
3439                     ; 605 		actuel = actuel - pas;
3441  0a15 7b02          	ld	a,(OFST+2,sp)
3442  0a17 1007          	sub	a,(OFST+7,sp)
3443  0a19 6b02          	ld	(OFST+2,sp),a
3444                     ; 606 		if (actuel < mini) actuel = mini;
3446  0a1b 1105          	cp	a,(OFST+5,sp)
3447  0a1d 2e04          	jrsge	L7311
3450  0a1f 7b05          	ld	a,(OFST+5,sp)
3451  0a21 6b02          	ld	(OFST+2,sp),a
3452  0a23               L7311:
3453                     ; 608 	if (droite)
3455  0a23 720100000e    	btjf	_droite,L3411
3456                     ; 610 		actuel = actuel + pas;
3458  0a28 7b02          	ld	a,(OFST+2,sp)
3459  0a2a 1b07          	add	a,(OFST+7,sp)
3460  0a2c 6b02          	ld	(OFST+2,sp),a
3461                     ; 611 		if (actuel > maxi) actuel = maxi;
3463  0a2e 1106          	cp	a,(OFST+6,sp)
3464  0a30 2d04          	jrsle	L3411
3467  0a32 7b06          	ld	a,(OFST+6,sp)
3468  0a34 6b02          	ld	(OFST+2,sp),a
3469  0a36               L3411:
3470                     ; 613 	LCD_printtruc(2,12,"%i%%\n",actuel);
3472  0a36 7b02          	ld	a,(OFST+2,sp)
3473  0a38 5f            	clrw	x
3474  0a39 4d            	tnz	a
3475  0a3a 2a01          	jrpl	L017
3476  0a3c 53            	cplw	x
3477  0a3d               L017:
3478  0a3d 97            	ld	xl,a
3479  0a3e 89            	pushw	x
3480  0a3f ae0000        	ldw	x,#L7411
3481  0a42 89            	pushw	x
3482  0a43 ae000c        	ldw	x,#12
3483  0a46 a602          	ld	a,#2
3484  0a48 95            	ld	xh,a
3485  0a49 cd0000        	call	_LCD_printtruc
3487  0a4c 5b04          	addw	sp,#4
3488                     ; 615 	return actuel;
3490  0a4e 7b02          	ld	a,(OFST+2,sp)
3493  0a50 85            	popw	x
3494  0a51 81            	ret	
3518                     	xdef	_m72
3519                     	xdef	_m71
3520                     	xdef	_m70
3521                     	xdef	_m61
3522                     	xdef	_m60
3523                     	xdef	_m51
3524                     	xdef	_m50
3525                     	xdef	_m41
3526                     	xdef	_m40
3527                     	xdef	_m33
3528                     	xdef	_m32
3529                     	xdef	_m31
3530                     	xdef	_m30
3531                     	xdef	_m21
3532                     	xdef	_m20
3533                     	xdef	_m13
3534                     	xdef	_m121
3535                     	xdef	_m12
3536                     	xdef	_m11
3537                     	xdef	_m10
3538                     	xref.b	_ratiobat
3539                     	xbit	_flashencour
3540                     	xbit	_droite
3541                     	xbit	_gauche
3542                     	xbit	_bas
3543                     	xbit	_haut
3544                     	xdef	_jeton
3545                     	xref	_Delayms
3546                     	xref	_output
3547                     	xref	_mixer
3548                     	xref	_input
3549                     	xref.b	_phase_actuelle
3550                     	xref.b	_modele_actuel
3551                     	xref	_pourcentsortie
3552                     	xref	_sortiepourcent
3553                     	xref	_load_input
3554                     	xref	_load_phase
3555                     	xref	_reset_model
3556                     	xref	_save_phase
3557                     	xref	_save_input
3558                     	xref	_etalonnage
3559                     	xdef	_reglage_variable
3560                     	xdef	_navigue
3561                     	xdef	_Menu
3562                     	xref	_LCD_printtruc
3563                     	xref	_LCD_DISP_OFF
3564                     	xref	_LCD_DISP_ON
3565                     	xref	_LCD_CLEAR_DISPLAY
3566                     	xref	_FLASH_SetProgrammingTime
3567                     	xref	_FLASH_ProgramByte
3568                     	xref	_FLASH_DeInit
3569                     	xref	_FLASH_Unlock
3570                     .const:	section	.text
3571  0000               L7411:
3572  0000 256925250a00  	dc.b	"%i%%",10,0
3573  0006               L337:
3574  0006 257520486575  	dc.b	"%u Heure-1",10,0
3575  0012               L527:
3576  0012 526174696f20  	dc.b	"Ratio moteur/bat",10,0
3577  0024               L707:
3578  0024 646573206d61  	dc.b	"des manches",10,0
3579  0031               L507:
3580  0031 4574616c6f6e  	dc.b	"Etalonnage",10,0
3581  003d               L376:
3582  003d 4f7074696f6e  	dc.b	"Options",10,0
3583  0046               L176:
3584  0046 5574696c6974  	dc.b	"Utilitaires",10,0
3585  0053               L526:
3586  0053 546175780a00  	dc.b	"Taux",10,0
3587  0059               L326:
3588  0059 446f75626c65  	dc.b	"Double",10,0
3589  0061               L706:
3590  0061 43686f697820  	dc.b	"Choix du canal",10,0
3591  0071               L165:
3592  0071 4d6f74657572  	dc.b	"Moteur",10,0
3593  0079               L755:
3594  0079 536563757269  	dc.b	"Securite",10,0
3595  0083               L545:
3596  0083 4d6178690a00  	dc.b	"Maxi",10,0
3597  0089               L145:
3598  0089 4e6575747265  	dc.b	"Neutre",10,0
3599  0091               L335:
3600  0091 4d696e690a00  	dc.b	"Mini",10,0
3601  0097               L515:
3602  0097 536f72746965  	dc.b	"Sortie",10,0
3603  009f               L164:
3604  009f 536f72746965  	dc.b	"Sorties",10,0
3605  00a8               L744:
3606  00a8 7e2575290a00  	dc.b	"~%u)",10,0
3607  00ae               L544:
3608  00ae 2825750a00    	dc.b	"(%u",10,0
3609  00b3               L324:
3610  00b3 4761696e0a00  	dc.b	"Gain",10,0
3611  00b9               L124:
3612  00b9 4d697865720a  	dc.b	"Mixer",10,0
3613  00c0               L353:
3614  00c0 746573740a00  	dc.b	"test",10,0
3615  00c6               L343:
3616  00c6 25750a00      	dc.b	"%u",10,0
3617  00ca               L313:
3618  00ca 6f75740a00    	dc.b	"out",10,0
3619  00cf               L113:
3620  00cf 696e0a00      	dc.b	"in",10,0
3621  00d3               L352:
3622  00d3 6761696e0a00  	dc.b	"gain",10,0
3623  00d9               L152:
3624  00d9 696e2f6f7574  	dc.b	"in/out",10,0
3625  00e1               L742:
3626  00e1 4d6978657572  	dc.b	"Mixeur",10,0
3627  00e9               L532:
3628  00e9 4d6978657572  	dc.b	"Mixeurs",10,0
3629  00f2               L322:
3630  00f2 2d0a00        	dc.b	"-",10,0
3631  00f5               L712:
3632  00f5 2b0a00        	dc.b	"+",10,0
3633  00f8               L102:
3634  00f8 56616c657572  	dc.b	"Valeur",10,0
3635  0100               L771:
3636  0100 4578706f0a00  	dc.b	"Expo",10,0
3637  0106               L341:
3638  0106 456e74726565  	dc.b	"Entrees",10,0
3639  010f               L141:
3640  010f 5265676c6167  	dc.b	"Reglage des",10,0
3641  011c               L721:
3642  011c 726573657420  	dc.b	"reset ok",10,0
3643  0126               L321:
3644  0126 52415a206574  	dc.b	"RAZ et sauve ?",10,0
3645  0136               L701:
3646  0136 536175766520  	dc.b	"Sauve en phase %u",10,0
3647  0149               L56:
3648  0149 202020736175  	dc.b	"   sauvegarde   ",10,0
3649  015b               L16:
3650  015b 417070757965  	dc.b	"Appuyer gauche",10,0
3651  016b               L75:
3652  016b 536175766567  	dc.b	"Sauvegarder ?",10,0
3653  017a               L54:
3654  017a 4368616e6765  	dc.b	"Change Sauve Raz ",10,0
3655  018d               L52:
3656  018d 416374696f6e  	dc.b	"Actions",0
3657  0195               L32:
3658  0195 506861736520  	dc.b	"Phase %u",10,0
3659  019f               L12:
3660  019f 4d6f64656c65  	dc.b	"Modele %u",10,0
3680                     	end
