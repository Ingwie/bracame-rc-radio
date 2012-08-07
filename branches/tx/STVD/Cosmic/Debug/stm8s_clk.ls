   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  18                     .const:	section	.text
  19  0000               _HSIDivFactor:
  20  0000 01            	dc.b	1
  21  0001 02            	dc.b	2
  22  0002 04            	dc.b	4
  23  0003 08            	dc.b	8
  24  0004               _CLKPrescTable:
  25  0004 01            	dc.b	1
  26  0005 02            	dc.b	2
  27  0006 04            	dc.b	4
  28  0007 08            	dc.b	8
  29  0008 0a            	dc.b	10
  30  0009 10            	dc.b	16
  31  000a 14            	dc.b	20
  32  000b 28            	dc.b	40
  61                     ; 66 void CLK_DeInit(void)
  61                     ; 67 {
  63                     	switch	.text
  64  0000               _CLK_DeInit:
  68                     ; 69     CLK->ICKR = CLK_ICKR_RESET_VALUE;
  70  0000 350150c0      	mov	20672,#1
  71                     ; 70     CLK->ECKR = CLK_ECKR_RESET_VALUE;
  73  0004 725f50c1      	clr	20673
  74                     ; 71     CLK->SWR  = CLK_SWR_RESET_VALUE;
  76  0008 35e150c4      	mov	20676,#225
  77                     ; 72     CLK->SWCR = CLK_SWCR_RESET_VALUE;
  79  000c 725f50c5      	clr	20677
  80                     ; 73     CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  82  0010 351850c6      	mov	20678,#24
  83                     ; 74     CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  85  0014 35ff50c7      	mov	20679,#255
  86                     ; 75     CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  88  0018 35ff50ca      	mov	20682,#255
  89                     ; 76     CLK->CSSR = CLK_CSSR_RESET_VALUE;
  91  001c 725f50c8      	clr	20680
  92                     ; 77     CLK->CCOR = CLK_CCOR_RESET_VALUE;
  94  0020 725f50c9      	clr	20681
  96  0024               L52:
  97                     ; 78     while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  99  0024 720050c9fb    	btjt	20681,#0,L52
 100                     ; 80     CLK->CCOR = CLK_CCOR_RESET_VALUE;
 102  0029 725f50c9      	clr	20681
 103                     ; 81     CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 105  002d 725f50cc      	clr	20684
 106                     ; 82     CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 108  0031 725f50cd      	clr	20685
 109                     ; 84 }
 112  0035 81            	ret	
 168                     ; 95 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 168                     ; 96 {
 169                     	switch	.text
 170  0036               _CLK_FastHaltWakeUpCmd:
 174                     ; 99     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 176                     ; 101     if (NewState != DISABLE)
 178  0036 4d            	tnz	a
 179  0037 2705          	jreq	L75
 180                     ; 104         CLK->ICKR |= CLK_ICKR_FHWU;
 182  0039 721450c0      	bset	20672,#2
 185  003d 81            	ret	
 186  003e               L75:
 187                     ; 109         CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 189  003e 721550c0      	bres	20672,#2
 190                     ; 112 }
 193  0042 81            	ret	
 228                     ; 119 void CLK_HSECmd(FunctionalState NewState)
 228                     ; 120 {
 229                     	switch	.text
 230  0043               _CLK_HSECmd:
 234                     ; 123     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 236                     ; 125     if (NewState != DISABLE)
 238  0043 4d            	tnz	a
 239  0044 2705          	jreq	L101
 240                     ; 128         CLK->ECKR |= CLK_ECKR_HSEEN;
 242  0046 721050c1      	bset	20673,#0
 245  004a 81            	ret	
 246  004b               L101:
 247                     ; 133         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 249  004b 721150c1      	bres	20673,#0
 250                     ; 136 }
 253  004f 81            	ret	
 288                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 288                     ; 144 {
 289                     	switch	.text
 290  0050               _CLK_HSICmd:
 294                     ; 147     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 296                     ; 149     if (NewState != DISABLE)
 298  0050 4d            	tnz	a
 299  0051 2705          	jreq	L321
 300                     ; 152         CLK->ICKR |= CLK_ICKR_HSIEN;
 302  0053 721050c0      	bset	20672,#0
 305  0057 81            	ret	
 306  0058               L321:
 307                     ; 157         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 309  0058 721150c0      	bres	20672,#0
 310                     ; 160 }
 313  005c 81            	ret	
 348                     ; 167 void CLK_LSICmd(FunctionalState NewState)
 348                     ; 168 {
 349                     	switch	.text
 350  005d               _CLK_LSICmd:
 354                     ; 171     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 356                     ; 173     if (NewState != DISABLE)
 358  005d 4d            	tnz	a
 359  005e 2705          	jreq	L541
 360                     ; 176         CLK->ICKR |= CLK_ICKR_LSIEN;
 362  0060 721650c0      	bset	20672,#3
 365  0064 81            	ret	
 366  0065               L541:
 367                     ; 181         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 369  0065 721750c0      	bres	20672,#3
 370                     ; 184 }
 373  0069 81            	ret	
 408                     ; 192 void CLK_CCOCmd(FunctionalState NewState)
 408                     ; 193 {
 409                     	switch	.text
 410  006a               _CLK_CCOCmd:
 414                     ; 196     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 416                     ; 198     if (NewState != DISABLE)
 418  006a 4d            	tnz	a
 419  006b 2705          	jreq	L761
 420                     ; 201         CLK->CCOR |= CLK_CCOR_CCOEN;
 422  006d 721050c9      	bset	20681,#0
 425  0071 81            	ret	
 426  0072               L761:
 427                     ; 206         CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 429  0072 721150c9      	bres	20681,#0
 430                     ; 209 }
 433  0076 81            	ret	
 468                     ; 218 void CLK_ClockSwitchCmd(FunctionalState NewState)
 468                     ; 219 {
 469                     	switch	.text
 470  0077               _CLK_ClockSwitchCmd:
 474                     ; 222     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 476                     ; 224     if (NewState != DISABLE )
 478  0077 4d            	tnz	a
 479  0078 2705          	jreq	L112
 480                     ; 227         CLK->SWCR |= CLK_SWCR_SWEN;
 482  007a 721250c5      	bset	20677,#1
 485  007e 81            	ret	
 486  007f               L112:
 487                     ; 232         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 489  007f 721350c5      	bres	20677,#1
 490                     ; 235 }
 493  0083 81            	ret	
 529                     ; 245 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 529                     ; 246 {
 530                     	switch	.text
 531  0084               _CLK_SlowActiveHaltWakeUpCmd:
 535                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 537                     ; 251     if (NewState != DISABLE)
 539  0084 4d            	tnz	a
 540  0085 2705          	jreq	L332
 541                     ; 254         CLK->ICKR |= CLK_ICKR_SWUAH;
 543  0087 721a50c0      	bset	20672,#5
 546  008b 81            	ret	
 547  008c               L332:
 548                     ; 259         CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 550  008c 721b50c0      	bres	20672,#5
 551                     ; 262 }
 554  0090 81            	ret	
 713                     ; 272 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 713                     ; 273 {
 714                     	switch	.text
 715  0091               _CLK_PeripheralClockConfig:
 717  0091 89            	pushw	x
 718       00000000      OFST:	set	0
 721                     ; 276     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 723                     ; 277     assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 725                     ; 279     if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 727  0092 9e            	ld	a,xh
 728  0093 a510          	bcp	a,#16
 729  0095 2630          	jrne	L123
 730                     ; 281         if (NewState != DISABLE)
 732  0097 7b02          	ld	a,(OFST+2,sp)
 733  0099 2714          	jreq	L323
 734                     ; 284             CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 736  009b 7b01          	ld	a,(OFST+1,sp)
 737  009d a40f          	and	a,#15
 738  009f 5f            	clrw	x
 739  00a0 97            	ld	xl,a
 740  00a1 a601          	ld	a,#1
 741  00a3 5d            	tnzw	x
 742  00a4 2704          	jreq	L62
 743  00a6               L03:
 744  00a6 48            	sll	a
 745  00a7 5a            	decw	x
 746  00a8 26fc          	jrne	L03
 747  00aa               L62:
 748  00aa ca50c7        	or	a,20679
 750  00ad 2013          	jp	LC002
 751  00af               L323:
 752                     ; 289             CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 754  00af 7b01          	ld	a,(OFST+1,sp)
 755  00b1 a40f          	and	a,#15
 756  00b3 5f            	clrw	x
 757  00b4 97            	ld	xl,a
 758  00b5 a601          	ld	a,#1
 759  00b7 5d            	tnzw	x
 760  00b8 2704          	jreq	L23
 761  00ba               L43:
 762  00ba 48            	sll	a
 763  00bb 5a            	decw	x
 764  00bc 26fc          	jrne	L43
 765  00be               L23:
 766  00be 43            	cpl	a
 767  00bf c450c7        	and	a,20679
 768  00c2               LC002:
 769  00c2 c750c7        	ld	20679,a
 770  00c5 202e          	jra	L723
 771  00c7               L123:
 772                     ; 294         if (NewState != DISABLE)
 774  00c7 7b02          	ld	a,(OFST+2,sp)
 775  00c9 2714          	jreq	L133
 776                     ; 297             CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 778  00cb 7b01          	ld	a,(OFST+1,sp)
 779  00cd a40f          	and	a,#15
 780  00cf 5f            	clrw	x
 781  00d0 97            	ld	xl,a
 782  00d1 a601          	ld	a,#1
 783  00d3 5d            	tnzw	x
 784  00d4 2704          	jreq	L63
 785  00d6               L04:
 786  00d6 48            	sll	a
 787  00d7 5a            	decw	x
 788  00d8 26fc          	jrne	L04
 789  00da               L63:
 790  00da ca50ca        	or	a,20682
 792  00dd 2013          	jp	LC001
 793  00df               L133:
 794                     ; 302             CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 796  00df 7b01          	ld	a,(OFST+1,sp)
 797  00e1 a40f          	and	a,#15
 798  00e3 5f            	clrw	x
 799  00e4 97            	ld	xl,a
 800  00e5 a601          	ld	a,#1
 801  00e7 5d            	tnzw	x
 802  00e8 2704          	jreq	L24
 803  00ea               L44:
 804  00ea 48            	sll	a
 805  00eb 5a            	decw	x
 806  00ec 26fc          	jrne	L44
 807  00ee               L24:
 808  00ee 43            	cpl	a
 809  00ef c450ca        	and	a,20682
 810  00f2               LC001:
 811  00f2 c750ca        	ld	20682,a
 812  00f5               L723:
 813                     ; 306 }
 816  00f5 85            	popw	x
 817  00f6 81            	ret	
1005                     ; 319 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1005                     ; 320 {
1006                     	switch	.text
1007  00f7               _CLK_ClockSwitchConfig:
1009  00f7 89            	pushw	x
1010  00f8 5204          	subw	sp,#4
1011       00000004      OFST:	set	4
1014                     ; 323     uint16_t DownCounter = CLK_TIMEOUT;
1016  00fa ae0491        	ldw	x,#1169
1017  00fd 1f03          	ldw	(OFST-1,sp),x
1018                     ; 324     ErrorStatus Swif = ERROR;
1020                     ; 327     assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1022                     ; 328     assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1024                     ; 329     assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1026                     ; 330     assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1028                     ; 333     clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1030  00ff c650c3        	ld	a,20675
1031  0102 6b01          	ld	(OFST-3,sp),a
1032                     ; 336     if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1034  0104 7b05          	ld	a,(OFST+1,sp)
1035  0106 4a            	dec	a
1036  0107 262d          	jrne	L544
1037                     ; 340         CLK->SWCR |= CLK_SWCR_SWEN;
1039  0109 721250c5      	bset	20677,#1
1040                     ; 343         if (ITState != DISABLE)
1042  010d 7b09          	ld	a,(OFST+5,sp)
1043  010f 2706          	jreq	L744
1044                     ; 345             CLK->SWCR |= CLK_SWCR_SWIEN;
1046  0111 721450c5      	bset	20677,#2
1048  0115 2004          	jra	L154
1049  0117               L744:
1050                     ; 349             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1052  0117 721550c5      	bres	20677,#2
1053  011b               L154:
1054                     ; 353         CLK->SWR = (uint8_t)CLK_NewClock;
1056  011b 7b06          	ld	a,(OFST+2,sp)
1057  011d c750c4        	ld	20676,a
1059  0120 2003          	jra	L754
1060  0122               L354:
1061                     ; 357             DownCounter--;
1063  0122 5a            	decw	x
1064  0123 1f03          	ldw	(OFST-1,sp),x
1065  0125               L754:
1066                     ; 355         while ((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1068  0125 720150c504    	btjf	20677,#0,L364
1070  012a 1e03          	ldw	x,(OFST-1,sp)
1071  012c 26f4          	jrne	L354
1072  012e               L364:
1073                     ; 360         if (DownCounter != 0)
1075  012e 1e03          	ldw	x,(OFST-1,sp)
1076                     ; 362             Swif = SUCCESS;
1078  0130 2617          	jrne	LC003
1079                     ; 366             Swif = ERROR;
1081  0132 0f02          	clr	(OFST-2,sp)
1082  0134 2017          	jra	L174
1083  0136               L544:
1084                     ; 374         if (ITState != DISABLE)
1086  0136 7b09          	ld	a,(OFST+5,sp)
1087  0138 2706          	jreq	L374
1088                     ; 376             CLK->SWCR |= CLK_SWCR_SWIEN;
1090  013a 721450c5      	bset	20677,#2
1092  013e 2004          	jra	L574
1093  0140               L374:
1094                     ; 380             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1096  0140 721550c5      	bres	20677,#2
1097  0144               L574:
1098                     ; 384         CLK->SWR = (uint8_t)CLK_NewClock;
1100  0144 7b06          	ld	a,(OFST+2,sp)
1101  0146 c750c4        	ld	20676,a
1102                     ; 388         Swif = SUCCESS;
1104  0149               LC003:
1106  0149 a601          	ld	a,#1
1107  014b 6b02          	ld	(OFST-2,sp),a
1108  014d               L174:
1109                     ; 393     if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1111  014d 7b0a          	ld	a,(OFST+6,sp)
1112  014f 260c          	jrne	L774
1114  0151 7b01          	ld	a,(OFST-3,sp)
1115  0153 a1e1          	cp	a,#225
1116  0155 2606          	jrne	L774
1117                     ; 395         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1119  0157 721150c0      	bres	20672,#0
1121  015b 201e          	jra	L105
1122  015d               L774:
1123                     ; 397     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1125  015d 7b0a          	ld	a,(OFST+6,sp)
1126  015f 260c          	jrne	L305
1128  0161 7b01          	ld	a,(OFST-3,sp)
1129  0163 a1d2          	cp	a,#210
1130  0165 2606          	jrne	L305
1131                     ; 399         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1133  0167 721750c0      	bres	20672,#3
1135  016b 200e          	jra	L105
1136  016d               L305:
1137                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1139  016d 7b0a          	ld	a,(OFST+6,sp)
1140  016f 260a          	jrne	L105
1142  0171 7b01          	ld	a,(OFST-3,sp)
1143  0173 a1b4          	cp	a,#180
1144  0175 2604          	jrne	L105
1145                     ; 403         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1147  0177 721150c1      	bres	20673,#0
1148  017b               L105:
1149                     ; 406     return(Swif);
1151  017b 7b02          	ld	a,(OFST-2,sp)
1154  017d 5b06          	addw	sp,#6
1155  017f 81            	ret	
1293                     ; 416 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1293                     ; 417 {
1294                     	switch	.text
1295  0180               _CLK_HSIPrescalerConfig:
1297  0180 88            	push	a
1298       00000000      OFST:	set	0
1301                     ; 420     assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1303                     ; 423     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1305  0181 c650c6        	ld	a,20678
1306  0184 a4e7          	and	a,#231
1307  0186 c750c6        	ld	20678,a
1308                     ; 426     CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1310  0189 c650c6        	ld	a,20678
1311  018c 1a01          	or	a,(OFST+1,sp)
1312  018e c750c6        	ld	20678,a
1313                     ; 428 }
1316  0191 84            	pop	a
1317  0192 81            	ret	
1452                     ; 439 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1452                     ; 440 {
1453                     	switch	.text
1454  0193               _CLK_CCOConfig:
1456  0193 88            	push	a
1457       00000000      OFST:	set	0
1460                     ; 443     assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1462                     ; 446     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1464  0194 c650c9        	ld	a,20681
1465  0197 a4e1          	and	a,#225
1466  0199 c750c9        	ld	20681,a
1467                     ; 449     CLK->CCOR |= (uint8_t)CLK_CCO;
1469  019c c650c9        	ld	a,20681
1470  019f 1a01          	or	a,(OFST+1,sp)
1471  01a1 c750c9        	ld	20681,a
1472                     ; 452     CLK->CCOR |= CLK_CCOR_CCOEN;
1474                     ; 454 }
1477  01a4 84            	pop	a
1478  01a5 721050c9      	bset	20681,#0
1479  01a9 81            	ret	
1544                     ; 464 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1544                     ; 465 {
1545                     	switch	.text
1546  01aa               _CLK_ITConfig:
1548  01aa 89            	pushw	x
1549       00000000      OFST:	set	0
1552                     ; 468     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1554                     ; 469     assert_param(IS_CLK_IT_OK(CLK_IT));
1556                     ; 471     if (NewState != DISABLE)
1558  01ab 9f            	ld	a,xl
1559  01ac 4d            	tnz	a
1560  01ad 2715          	jreq	L507
1561                     ; 473         switch (CLK_IT)
1563  01af 9e            	ld	a,xh
1565                     ; 481         default:
1565                     ; 482             break;
1566  01b0 a00c          	sub	a,#12
1567  01b2 270a          	jreq	L146
1568  01b4 a010          	sub	a,#16
1569  01b6 2620          	jrne	L317
1570                     ; 475         case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1570                     ; 476             CLK->SWCR |= CLK_SWCR_SWIEN;
1572  01b8 721450c5      	bset	20677,#2
1573                     ; 477             break;
1575  01bc 201a          	jra	L317
1576  01be               L146:
1577                     ; 478         case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1577                     ; 479             CLK->CSSR |= CLK_CSSR_CSSDIE;
1579  01be 721450c8      	bset	20680,#2
1580                     ; 480             break;
1582  01c2 2014          	jra	L317
1583                     ; 481         default:
1583                     ; 482             break;
1586  01c4               L507:
1587                     ; 487         switch (CLK_IT)
1589  01c4 7b01          	ld	a,(OFST+1,sp)
1591                     ; 495         default:
1591                     ; 496             break;
1592  01c6 a00c          	sub	a,#12
1593  01c8 270a          	jreq	L746
1594  01ca a010          	sub	a,#16
1595  01cc 260a          	jrne	L317
1596                     ; 489         case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1596                     ; 490             CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1598  01ce 721550c5      	bres	20677,#2
1599                     ; 491             break;
1601  01d2 2004          	jra	L317
1602  01d4               L746:
1603                     ; 492         case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1603                     ; 493             CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1605  01d4 721550c8      	bres	20680,#2
1606                     ; 494             break;
1607  01d8               L317:
1608                     ; 500 }
1611  01d8 85            	popw	x
1612  01d9 81            	ret	
1613                     ; 495         default:
1613                     ; 496             break;
1649                     ; 507 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1649                     ; 508 {
1650                     	switch	.text
1651  01da               _CLK_SYSCLKConfig:
1653  01da 88            	push	a
1654       00000000      OFST:	set	0
1657                     ; 511     assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1659                     ; 513     if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1661  01db a580          	bcp	a,#128
1662  01dd 260e          	jrne	L737
1663                     ; 515         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1665  01df c650c6        	ld	a,20678
1666  01e2 a4e7          	and	a,#231
1667  01e4 c750c6        	ld	20678,a
1668                     ; 516         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1670  01e7 7b01          	ld	a,(OFST+1,sp)
1671  01e9 a418          	and	a,#24
1673  01eb 200c          	jra	L147
1674  01ed               L737:
1675                     ; 520         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1677  01ed c650c6        	ld	a,20678
1678  01f0 a4f8          	and	a,#248
1679  01f2 c750c6        	ld	20678,a
1680                     ; 521         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1682  01f5 7b01          	ld	a,(OFST+1,sp)
1683  01f7 a407          	and	a,#7
1684  01f9               L147:
1685  01f9 ca50c6        	or	a,20678
1686  01fc c750c6        	ld	20678,a
1687                     ; 524 }
1690  01ff 84            	pop	a
1691  0200 81            	ret	
1747                     ; 531 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1747                     ; 532 {
1748                     	switch	.text
1749  0201               _CLK_SWIMConfig:
1753                     ; 535     assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1755                     ; 537     if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1757  0201 4d            	tnz	a
1758  0202 2705          	jreq	L177
1759                     ; 540         CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1761  0204 721050cd      	bset	20685,#0
1764  0208 81            	ret	
1765  0209               L177:
1766                     ; 545         CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1768  0209 721150cd      	bres	20685,#0
1769                     ; 548 }
1772  020d 81            	ret	
1796                     ; 557 void CLK_ClockSecuritySystemEnable(void)
1796                     ; 558 {
1797                     	switch	.text
1798  020e               _CLK_ClockSecuritySystemEnable:
1802                     ; 560     CLK->CSSR |= CLK_CSSR_CSSEN;
1804  020e 721050c8      	bset	20680,#0
1805                     ; 561 }
1808  0212 81            	ret	
1833                     ; 569 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1833                     ; 570 {
1834                     	switch	.text
1835  0213               _CLK_GetSYSCLKSource:
1839                     ; 571     return((CLK_Source_TypeDef)CLK->CMSR);
1841  0213 c650c3        	ld	a,20675
1844  0216 81            	ret	
1907                     ; 579 uint32_t CLK_GetClockFreq(void)
1907                     ; 580 {
1908                     	switch	.text
1909  0217               _CLK_GetClockFreq:
1911  0217 5209          	subw	sp,#9
1912       00000009      OFST:	set	9
1915                     ; 582     uint32_t clockfrequency = 0;
1917                     ; 583     CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1919                     ; 584     uint8_t tmp = 0, presc = 0;
1923                     ; 587     clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1925  0219 c650c3        	ld	a,20675
1926  021c 6b09          	ld	(OFST+0,sp),a
1927                     ; 589     if (clocksource == CLK_SOURCE_HSI)
1929  021e a1e1          	cp	a,#225
1930  0220 2634          	jrne	L7401
1931                     ; 591         tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1933  0222 c650c6        	ld	a,20678
1934  0225 a418          	and	a,#24
1935  0227 44            	srl	a
1936  0228 44            	srl	a
1937  0229 44            	srl	a
1938                     ; 592         tmp = (uint8_t)(tmp >> 3);
1940                     ; 593         presc = HSIDivFactor[tmp];
1942  022a 5f            	clrw	x
1943  022b 97            	ld	xl,a
1944  022c d60000        	ld	a,(_HSIDivFactor,x)
1945  022f 6b09          	ld	(OFST+0,sp),a
1946                     ; 594         clockfrequency = HSI_VALUE / presc;
1948  0231 b703          	ld	c_lreg+3,a
1949  0233 3f02          	clr	c_lreg+2
1950  0235 3f01          	clr	c_lreg+1
1951  0237 3f00          	clr	c_lreg
1952  0239 96            	ldw	x,sp
1953  023a 5c            	incw	x
1954  023b cd0000        	call	c_rtol
1956  023e ae2400        	ldw	x,#9216
1957  0241 bf02          	ldw	c_lreg+2,x
1958  0243 ae00f4        	ldw	x,#244
1959  0246 bf00          	ldw	c_lreg,x
1960  0248 96            	ldw	x,sp
1961  0249 5c            	incw	x
1962  024a cd0000        	call	c_ludv
1964  024d 96            	ldw	x,sp
1965  024e 1c0005        	addw	x,#OFST-4
1966  0251 cd0000        	call	c_rtol
1969  0254 2018          	jra	L1501
1970  0256               L7401:
1971                     ; 596     else if ( clocksource == CLK_SOURCE_LSI)
1973  0256 a1d2          	cp	a,#210
1974  0258 260a          	jrne	L3501
1975                     ; 598         clockfrequency = LSI_VALUE;
1977  025a aef400        	ldw	x,#62464
1978  025d 1f07          	ldw	(OFST-2,sp),x
1979  025f ae0001        	ldw	x,#1
1981  0262 2008          	jp	LC004
1982  0264               L3501:
1983                     ; 602         clockfrequency = HSE_VALUE;
1985  0264 ae2400        	ldw	x,#9216
1986  0267 1f07          	ldw	(OFST-2,sp),x
1987  0269 ae00f4        	ldw	x,#244
1988  026c               LC004:
1989  026c 1f05          	ldw	(OFST-4,sp),x
1990  026e               L1501:
1991                     ; 605     return((uint32_t)clockfrequency);
1993  026e 96            	ldw	x,sp
1994  026f 1c0005        	addw	x,#OFST-4
1995  0272 cd0000        	call	c_ltor
1999  0275 5b09          	addw	sp,#9
2000  0277 81            	ret	
2099                     ; 616 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2099                     ; 617 {
2100                     	switch	.text
2101  0278               _CLK_AdjustHSICalibrationValue:
2103  0278 88            	push	a
2104       00000000      OFST:	set	0
2107                     ; 620     assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2109                     ; 623     CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2111  0279 c650cc        	ld	a,20684
2112  027c a4f8          	and	a,#248
2113  027e 1a01          	or	a,(OFST+1,sp)
2114  0280 c750cc        	ld	20684,a
2115                     ; 625 }
2118  0283 84            	pop	a
2119  0284 81            	ret	
2143                     ; 636 void CLK_SYSCLKEmergencyClear(void)
2143                     ; 637 {
2144                     	switch	.text
2145  0285               _CLK_SYSCLKEmergencyClear:
2149                     ; 638     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2151  0285 721150c5      	bres	20677,#0
2152                     ; 639 }
2155  0289 81            	ret	
2308                     ; 648 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2308                     ; 649 {
2309                     	switch	.text
2310  028a               _CLK_GetFlagStatus:
2312  028a 89            	pushw	x
2313  028b 5203          	subw	sp,#3
2314       00000003      OFST:	set	3
2317                     ; 651     uint16_t statusreg = 0;
2319                     ; 652     uint8_t tmpreg = 0;
2321                     ; 653     FlagStatus bitstatus = RESET;
2323                     ; 656     assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2325                     ; 659     statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2327  028d 01            	rrwa	x,a
2328  028e 4f            	clr	a
2329  028f 02            	rlwa	x,a
2330  0290 1f01          	ldw	(OFST-2,sp),x
2331                     ; 662     if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2333  0292 a30100        	cpw	x,#256
2334  0295 2605          	jrne	L1221
2335                     ; 664         tmpreg = CLK->ICKR;
2337  0297 c650c0        	ld	a,20672
2339  029a 2021          	jra	L3221
2340  029c               L1221:
2341                     ; 666     else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2343  029c a30200        	cpw	x,#512
2344  029f 2605          	jrne	L5221
2345                     ; 668         tmpreg = CLK->ECKR;
2347  02a1 c650c1        	ld	a,20673
2349  02a4 2017          	jra	L3221
2350  02a6               L5221:
2351                     ; 670     else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2353  02a6 a30300        	cpw	x,#768
2354  02a9 2605          	jrne	L1321
2355                     ; 672         tmpreg = CLK->SWCR;
2357  02ab c650c5        	ld	a,20677
2359  02ae 200d          	jra	L3221
2360  02b0               L1321:
2361                     ; 674     else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2363  02b0 a30400        	cpw	x,#1024
2364  02b3 2605          	jrne	L5321
2365                     ; 676         tmpreg = CLK->CSSR;
2367  02b5 c650c8        	ld	a,20680
2369  02b8 2003          	jra	L3221
2370  02ba               L5321:
2371                     ; 680         tmpreg = CLK->CCOR;
2373  02ba c650c9        	ld	a,20681
2374  02bd               L3221:
2375  02bd 6b03          	ld	(OFST+0,sp),a
2376                     ; 683     if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2378  02bf 7b05          	ld	a,(OFST+2,sp)
2379  02c1 1503          	bcp	a,(OFST+0,sp)
2380  02c3 2704          	jreq	L1421
2381                     ; 685         bitstatus = SET;
2383  02c5 a601          	ld	a,#1
2385  02c7 2001          	jra	L3421
2386  02c9               L1421:
2387                     ; 689         bitstatus = RESET;
2389  02c9 4f            	clr	a
2390  02ca               L3421:
2391                     ; 693     return((FlagStatus)bitstatus);
2395  02ca 5b05          	addw	sp,#5
2396  02cc 81            	ret	
2442                     ; 703 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2442                     ; 704 {
2443                     	switch	.text
2444  02cd               _CLK_GetITStatus:
2446  02cd 88            	push	a
2447  02ce 88            	push	a
2448       00000001      OFST:	set	1
2451                     ; 706     ITStatus bitstatus = RESET;
2453                     ; 709     assert_param(IS_CLK_IT_OK(CLK_IT));
2455                     ; 711     if (CLK_IT == CLK_IT_SWIF)
2457  02cf a11c          	cp	a,#28
2458  02d1 2609          	jrne	L7621
2459                     ; 714         if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2461  02d3 c450c5        	and	a,20677
2462  02d6 a10c          	cp	a,#12
2463  02d8 260f          	jrne	L7721
2464                     ; 716             bitstatus = SET;
2466  02da 2009          	jp	LC006
2467                     ; 720             bitstatus = RESET;
2468  02dc               L7621:
2469                     ; 726         if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2471  02dc c650c8        	ld	a,20680
2472  02df 1402          	and	a,(OFST+1,sp)
2473  02e1 a10c          	cp	a,#12
2474  02e3 2604          	jrne	L7721
2475                     ; 728             bitstatus = SET;
2477  02e5               LC006:
2479  02e5 a601          	ld	a,#1
2481  02e7 2001          	jra	L5721
2482  02e9               L7721:
2483                     ; 732             bitstatus = RESET;
2486  02e9 4f            	clr	a
2487  02ea               L5721:
2488                     ; 737     return bitstatus;
2492  02ea 85            	popw	x
2493  02eb 81            	ret	
2529                     ; 747 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2529                     ; 748 {
2530                     	switch	.text
2531  02ec               _CLK_ClearITPendingBit:
2535                     ; 751     assert_param(IS_CLK_IT_OK(CLK_IT));
2537                     ; 753     if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2539  02ec a10c          	cp	a,#12
2540  02ee 2605          	jrne	L1231
2541                     ; 756         CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2543  02f0 721750c8      	bres	20680,#3
2546  02f4 81            	ret	
2547  02f5               L1231:
2548                     ; 761         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2550  02f5 721750c5      	bres	20677,#3
2551                     ; 764 }
2554  02f9 81            	ret	
2589                     	xdef	_CLKPrescTable
2590                     	xdef	_HSIDivFactor
2591                     	xdef	_CLK_ClearITPendingBit
2592                     	xdef	_CLK_GetITStatus
2593                     	xdef	_CLK_GetFlagStatus
2594                     	xdef	_CLK_GetSYSCLKSource
2595                     	xdef	_CLK_GetClockFreq
2596                     	xdef	_CLK_AdjustHSICalibrationValue
2597                     	xdef	_CLK_SYSCLKEmergencyClear
2598                     	xdef	_CLK_ClockSecuritySystemEnable
2599                     	xdef	_CLK_SWIMConfig
2600                     	xdef	_CLK_SYSCLKConfig
2601                     	xdef	_CLK_ITConfig
2602                     	xdef	_CLK_CCOConfig
2603                     	xdef	_CLK_HSIPrescalerConfig
2604                     	xdef	_CLK_ClockSwitchConfig
2605                     	xdef	_CLK_PeripheralClockConfig
2606                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2607                     	xdef	_CLK_FastHaltWakeUpCmd
2608                     	xdef	_CLK_ClockSwitchCmd
2609                     	xdef	_CLK_CCOCmd
2610                     	xdef	_CLK_LSICmd
2611                     	xdef	_CLK_HSICmd
2612                     	xdef	_CLK_HSECmd
2613                     	xdef	_CLK_DeInit
2614                     	xref.b	c_lreg
2615                     	xref.b	c_x
2634                     	xref	c_ltor
2635                     	xref	c_ludv
2636                     	xref	c_rtol
2637                     	end
