   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  18                     .bit:	section	.data,bit
  19  0000               _sec:
  20  0000 00            	dc.b	0
  21  0001               _Menu_on:
  22  0001 00            	dc.b	0
  23  0002               _Menu_actif:
  24  0002 00            	dc.b	0
  25  0003               _Menu_raz:
  26  0003 00            	dc.b	0
  27  0004               _synchro:
  28  0004 00            	dc.b	0
  29                     	bsct
  30  0000               _channel:
  31  0000 00            	dc.b	0
  61                     ; 65 @far @interrupt void NonHandledInterrupt(void)
  61                     ; 66 {
  62                     	switch	.text
  63  0000               f_NonHandledInterrupt:
  67                     ; 70 }
  70  0000 80            	iret	
  92                     ; 79 @far @interrupt void TRAP_IRQHandler(void)
  92                     ; 80 {
  93                     	switch	.text
  94  0001               f_TRAP_IRQHandler:
  98                     ; 84 }
 101  0001 80            	iret	
 123                     ; 110 @far @interrupt void TLI_IRQHandler(void)
 123                     ; 111 #else /* _RAISONANCE_ */
 123                     ; 112 void TLI_IRQHandler(void) interrupt 0
 123                     ; 113 #endif /* _COSMIC_ */
 123                     ; 114 {
 124                     	switch	.text
 125  0002               f_TLI_IRQHandler:
 129                     ; 118 }
 132  0002 80            	iret	
 154                     ; 128 @far @interrupt void AWU_IRQHandler(void)
 154                     ; 129 #else /* _RAISONANCE_ */
 154                     ; 130 void AWU_IRQHandler(void) interrupt 1
 154                     ; 131 #endif /* _COSMIC_ */
 154                     ; 132 {
 155                     	switch	.text
 156  0003               f_AWU_IRQHandler:
 160                     ; 136 }
 163  0003 80            	iret	
 185                     ; 146 @far @interrupt void CLK_IRQHandler(void)
 185                     ; 147 #else /* _RAISONANCE_ */
 185                     ; 148 void CLK_IRQHandler(void) interrupt 2
 185                     ; 149 #endif /* _COSMIC_ */
 185                     ; 150 {
 186                     	switch	.text
 187  0004               f_CLK_IRQHandler:
 191                     ; 154 }
 194  0004 80            	iret	
 217                     ; 164 @far @interrupt void EXTI_PORTA_IRQHandler(void)
 217                     ; 165 #else /* _RAISONANCE_ */
 217                     ; 166 void EXTI_PORTA_IRQHandler(void) interrupt 3
 217                     ; 167 #endif /* _COSMIC_ */
 217                     ; 168 {
 218                     	switch	.text
 219  0005               f_EXTI_PORTA_IRQHandler:
 223                     ; 172 }
 226  0005 80            	iret	
 249                     ; 182 @far @interrupt void EXTI_PORTB_IRQHandler(void)
 249                     ; 183 #else /* _RAISONANCE_ */
 249                     ; 184 void EXTI_PORTB_IRQHandler(void) interrupt 4
 249                     ; 185 #endif /* _COSMIC_ */
 249                     ; 186 {
 250                     	switch	.text
 251  0006               f_EXTI_PORTB_IRQHandler:
 255                     ; 190 }
 258  0006 80            	iret	
 281                     ; 200 @far @interrupt void EXTI_PORTC_IRQHandler(void)
 281                     ; 201 #else /* _RAISONANCE_ */
 281                     ; 202 void EXTI_PORTC_IRQHandler(void) interrupt 5
 281                     ; 203 #endif /* _COSMIC_ */
 281                     ; 204 {
 282                     	switch	.text
 283  0007               f_EXTI_PORTC_IRQHandler:
 287                     ; 208 }
 290  0007 80            	iret	
 313                     ; 218 @far @interrupt void EXTI_PORTD_IRQHandler(void)
 313                     ; 219 #else /* _RAISONANCE_ */
 313                     ; 220 void EXTI_PORTD_IRQHandler(void) interrupt 6
 313                     ; 221 #endif /* _COSMIC_ */
 313                     ; 222 {
 314                     	switch	.text
 315  0008               f_EXTI_PORTD_IRQHandler:
 319                     ; 226 }
 322  0008 80            	iret	
 345                     ; 236 @far @interrupt void EXTI_PORTE_IRQHandler(void)
 345                     ; 237 #else /* _RAISONANCE_ */
 345                     ; 238 void EXTI_PORTE_IRQHandler(void) interrupt 7
 345                     ; 239 #endif /* _COSMIC_ */
 345                     ; 240 {
 346                     	switch	.text
 347  0009               f_EXTI_PORTE_IRQHandler:
 351                     ; 244 }
 354  0009 80            	iret	
 376                     ; 311 @far @interrupt void SPI_IRQHandler(void)
 376                     ; 312 #else /* _RAISONANCE_ */
 376                     ; 313 void SPI_IRQHandler(void) interrupt 10
 376                     ; 314 #endif /* _COSMIC_ */
 376                     ; 315 {
 377                     	switch	.text
 378  000a               f_SPI_IRQHandler:
 382                     ; 319 }
 385  000a 80            	iret	
 408                     ; 329 @far @interrupt void TIM1_UPD_OVF_TRG_BRK_IRQHandler(void)
 408                     ; 330 #else /* _RAISONANCE_ */
 408                     ; 331 void TIM1_UPD_OVF_TRG_BRK_IRQHandler(void) interrupt 11
 408                     ; 332 #endif /* _COSMIC_ */
 408                     ; 333 {
 409                     	switch	.text
 410  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 414                     ; 337 }
 417  000b 80            	iret	
 440                     ; 347 @far @interrupt void TIM1_CAP_COM_IRQHandler(void)
 440                     ; 348 #else /* _RAISONANCE_ */
 440                     ; 349 void TIM1_CAP_COM_IRQHandler(void) interrupt 12
 440                     ; 350 #endif /* _COSMIC_ */
 440                     ; 351 {
 441                     	switch	.text
 442  000c               f_TIM1_CAP_COM_IRQHandler:
 446                     ; 355 }
 449  000c 80            	iret	
 475                     ; 402 @far @interrupt void TIM2_UPD_OVF_BRK_IRQHandler(void)
 475                     ; 403 #else /* _RAISONANCE_ */
 475                     ; 404 void TIM2_UPD_OVF_BRK_IRQHandler(void) interrupt 13
 475                     ; 405 #endif /* _COSMIC_ */
 475                     ; 406 {
 476                     	switch	.text
 477  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 479  000d 3b0002        	push	c_x+2
 480  0010 be00          	ldw	x,c_x
 481  0012 89            	pushw	x
 482  0013 3b0002        	push	c_y+2
 483  0016 be00          	ldw	x,c_y
 484  0018 89            	pushw	x
 487                     ; 410 	if(channel == 0)
 489  0019 b600          	ld	a,_channel
 490  001b 2604          	jrne	L171
 491                     ; 412 		synchro = 1;
 493  001d 72100004      	bset	_synchro
 494  0021               L171:
 495                     ; 415 	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 497  0021 a601          	ld	a,#1
 498  0023 cd0000        	call	_TIM2_ClearITPendingBit
 500                     ; 416 }
 503  0026 85            	popw	x
 504  0027 bf00          	ldw	c_y,x
 505  0029 320002        	pop	c_y+2
 506  002c 85            	popw	x
 507  002d bf00          	ldw	c_x,x
 508  002f 320002        	pop	c_x+2
 509  0032 80            	iret	
 537                     ; 426 @far @interrupt void TIM2_CAP_COM_IRQHandler(void)
 537                     ; 427 #else /* _RAISONANCE_ */
 537                     ; 428 void TIM2_CAP_COM_IRQHandler(void) interrupt 14
 537                     ; 429 #endif /* _COSMIC_ */
 537                     ; 430 {
 538                     	switch	.text
 539  0033               f_TIM2_CAP_COM_IRQHandler:
 541  0033 3b0002        	push	c_x+2
 542  0036 be00          	ldw	x,c_x
 543  0038 89            	pushw	x
 544  0039 3b0002        	push	c_y+2
 545  003c be00          	ldw	x,c_y
 546  003e 89            	pushw	x
 549                     ; 434 	TIM2_SetAutoreload(output.usValueOut[channel]);
 551  003f b600          	ld	a,_channel
 552  0041 5f            	clrw	x
 553  0042 97            	ld	xl,a
 554  0043 58            	sllw	x
 555  0044 de0059        	ldw	x,(_output+89,x)
 556  0047 cd0000        	call	_TIM2_SetAutoreload
 558                     ; 436 	if(channel != NUM_OUTPUT)
 560  004a b600          	ld	a,_channel
 561  004c a108          	cp	a,#8
 562  004e 2704          	jreq	L302
 563                     ; 438 		channel++;
 565  0050 3c00          	inc	_channel
 567  0052 2003          	jra	L502
 568  0054               L302:
 569                     ; 443 		calcultrame();
 571  0054 cd0000        	call	_calcultrame
 573  0057               L502:
 574                     ; 445 	TIM2_ClearITPendingBit(TIM2_IT_CC2);
 576  0057 a604          	ld	a,#4
 577  0059 cd0000        	call	_TIM2_ClearITPendingBit
 579                     ; 446 }
 582  005c 85            	popw	x
 583  005d bf00          	ldw	c_y,x
 584  005f 320002        	pop	c_y+2
 585  0062 85            	popw	x
 586  0063 bf00          	ldw	c_x,x
 587  0065 320002        	pop	c_x+2
 588  0068 80            	iret	
 630                     ; 458 @far @interrupt void TIM3_UPD_OVF_BRK_IRQHandler(void)
 630                     ; 459 #else /* _RAISONANCE_ */
 630                     ; 460 void TIM3_UPD_OVF_BRK_IRQHandler(void) interrupt 15
 630                     ; 461 #endif /* _COSMIC_ */
 630                     ; 462 {  
 631                     	switch	.text
 632  0069               f_TIM3_UPD_OVF_BRK_IRQHandler:
 634  0069 3b0002        	push	c_x+2
 635  006c be00          	ldw	x,c_x
 636  006e 89            	pushw	x
 637  006f 3b0002        	push	c_y+2
 638  0072 be00          	ldw	x,c_y
 641                     ; 463 	Menu_on = 1;
 643  0074 72100001      	bset	_Menu_on
 644                     ; 464 	secondesurcinq++;
 646  0078 3c00          	inc	_secondesurcinq
 647                     ; 465 	sec = 1;
 649  007a 72100000      	bset	_sec
 650  007e 89            	pushw	x
 651                     ; 467 	if (tempotrimdyn != 0)
 653  007f b600          	ld	a,_tempotrimdyn
 654  0081 270b          	jreq	L712
 655                     ; 469 		tempotrimdyn--;
 657  0083 3a00          	dec	_tempotrimdyn
 658                     ; 470 		if (tempotrimdyn == 1) trimdyn = 1;
 660  0085 b600          	ld	a,_tempotrimdyn
 661  0087 4a            	dec	a
 662  0088 2604          	jrne	L712
 665  008a 72100000      	bset	_trimdyn
 666  008e               L712:
 667                     ; 473 	if (tempsbip5 != 0)
 669  008e b600          	ld	a,_tempsbip5
 670  0090 2750          	jreq	L322
 671                     ; 475 		if (tempsbip1 == 1) GPIO_WriteHigh(GPIOD,GPIO_PIN_4); //off
 673  0092 b600          	ld	a,_tempsbip1
 674  0094 4a            	dec	a
 675  0095 2609          	jrne	L522
 678  0097 4b10          	push	#16
 679  0099 ae500f        	ldw	x,#20495
 680  009c cd0000        	call	_GPIO_WriteHigh
 682  009f 84            	pop	a
 683  00a0               L522:
 684                     ; 476 		if (tempsbip2 == 1) GPIO_WriteLow(GPIOD,GPIO_PIN_4); //on .. etc
 686  00a0 b600          	ld	a,_tempsbip2
 687  00a2 4a            	dec	a
 688  00a3 2609          	jrne	L722
 691  00a5 4b10          	push	#16
 692  00a7 ae500f        	ldw	x,#20495
 693  00aa cd0000        	call	_GPIO_WriteLow
 695  00ad 84            	pop	a
 696  00ae               L722:
 697                     ; 477 		if (tempsbip3 == 1) GPIO_WriteHigh(GPIOD,GPIO_PIN_4);
 699  00ae b600          	ld	a,_tempsbip3
 700  00b0 4a            	dec	a
 701  00b1 2609          	jrne	L132
 704  00b3 4b10          	push	#16
 705  00b5 ae500f        	ldw	x,#20495
 706  00b8 cd0000        	call	_GPIO_WriteHigh
 708  00bb 84            	pop	a
 709  00bc               L132:
 710                     ; 478 		if (tempsbip4 == 1) GPIO_WriteLow(GPIOD,GPIO_PIN_4);
 712  00bc b600          	ld	a,_tempsbip4
 713  00be 4a            	dec	a
 714  00bf 2609          	jrne	L332
 717  00c1 4b10          	push	#16
 718  00c3 ae500f        	ldw	x,#20495
 719  00c6 cd0000        	call	_GPIO_WriteLow
 721  00c9 84            	pop	a
 722  00ca               L332:
 723                     ; 479 		if (tempsbip5 == 1) GPIO_WriteHigh(GPIOD,GPIO_PIN_4);
 725  00ca b600          	ld	a,_tempsbip5
 726  00cc 4a            	dec	a
 727  00cd 2609          	jrne	L532
 730  00cf 4b10          	push	#16
 731  00d1 ae500f        	ldw	x,#20495
 732  00d4 cd0000        	call	_GPIO_WriteHigh
 734  00d7 84            	pop	a
 735  00d8               L532:
 736                     ; 481 		tempsbip1--;
 738  00d8 3a00          	dec	_tempsbip1
 739                     ; 482 		tempsbip2--;
 741  00da 3a00          	dec	_tempsbip2
 742                     ; 483 		tempsbip3--;
 744  00dc 3a00          	dec	_tempsbip3
 745                     ; 484 		tempsbip4--;
 747  00de 3a00          	dec	_tempsbip4
 748                     ; 485 		tempsbip5--;
 750  00e0 3a00          	dec	_tempsbip5
 751  00e2               L322:
 752                     ; 488 	if (secondesurcinq == 5)
 754  00e2 b600          	ld	a,_secondesurcinq
 755  00e4 a105          	cp	a,#5
 756  00e6 2625          	jrne	L732
 757                     ; 490 		secondesurcinq = 0;
 759  00e8 3f00          	clr	_secondesurcinq
 760                     ; 491 		secondes++;
 762  00ea 3c00          	inc	_secondes
 763                     ; 494 		if (Menu_actif) Tempo_menu++;
 765  00ec 7201000202    	btjf	_Menu_actif,L142
 768  00f1 3c00          	inc	_Tempo_menu
 769  00f3               L142:
 770                     ; 496 		if (Menu_raz)
 772  00f3 7201000306    	btjf	_Menu_raz,L342
 773                     ; 498 			Tempo_menu = 0;
 775  00f8 3f00          	clr	_Tempo_menu
 776                     ; 499 			Menu_raz = 0;
 778  00fa 72110003      	bres	_Menu_raz
 779  00fe               L342:
 780                     ; 502 		if (Tempo_menu == 15)
 782  00fe b600          	ld	a,_Tempo_menu
 783  0100 a10f          	cp	a,#15
 784  0102 2609          	jrne	L732
 785                     ; 504 			LCD_CLEAR_DISPLAY();
 787  0104 cd0000        	call	_LCD_CLEAR_DISPLAY
 789                     ; 505 			Menu_actif = 0;
 791  0107 72110002      	bres	_Menu_actif
 792                     ; 506 			Tempo_menu = 0;
 794  010b 3f00          	clr	_Tempo_menu
 795  010d               L732:
 796                     ; 510 	if (secondes == 60)
 798  010d b600          	ld	a,_secondes
 799  010f a13c          	cp	a,#60
 800  0111 2604          	jrne	L742
 801                     ; 512 		secondes = 0;
 803  0113 3f00          	clr	_secondes
 804                     ; 513 		minutes++;
 806  0115 3c00          	inc	_minutes
 807  0117               L742:
 808                     ; 516 	if (minutes == 60)
 810  0117 b600          	ld	a,_minutes
 811  0119 a13c          	cp	a,#60
 812  011b 2602          	jrne	L152
 813                     ; 518 		minutes = 0;
 815  011d 3f00          	clr	_minutes
 816  011f               L152:
 817                     ; 521 	TIM3_ClearITPendingBit(TIM3_IT_UPDATE);
 819  011f a601          	ld	a,#1
 820  0121 cd0000        	call	_TIM3_ClearITPendingBit
 822                     ; 525 }
 825  0124 85            	popw	x
 826  0125 bf00          	ldw	c_y,x
 827  0127 320002        	pop	c_y+2
 828  012a 85            	popw	x
 829  012b bf00          	ldw	c_x,x
 830  012d 320002        	pop	c_x+2
 831  0130 80            	iret	
 854                     ; 535 @far @interrupt void TIM3_CAP_COM_IRQHandler(void)
 854                     ; 536 #else /* _RAISONANCE_ */
 854                     ; 537 void TIM3_CAP_COM_IRQHandler(void) interrupt 16
 854                     ; 538 #endif /* _COSMIC_ */
 854                     ; 539 {
 855                     	switch	.text
 856  0131               f_TIM3_CAP_COM_IRQHandler:
 860                     ; 543 }
 863  0131 80            	iret	
 885                     ; 592 @far @interrupt void I2C_IRQHandler(void)
 885                     ; 593 #else /* _RAISONANCE_ */
 885                     ; 594 void I2C_IRQHandler(void) interrupt 19
 885                     ; 595 #endif /* _COSMIC_ */
 885                     ; 596 {
 886                     	switch	.text
 887  0132               f_I2C_IRQHandler:
 891                     ; 600 }
 894  0132 80            	iret	
 917                     ; 611 @far @interrupt void UART2_TX_IRQHandler(void)
 917                     ; 612 #else /* _RAISONANCE_ */
 917                     ; 613 void UART2_TX_IRQHandler(void) interrupt 20
 917                     ; 614 #endif /* _COSMIC_ */
 917                     ; 615 {
 918                     	switch	.text
 919  0133               f_UART2_TX_IRQHandler:
 923                     ; 619 }
 926  0133 80            	iret	
 949                     ; 629 @far @interrupt void UART2_RX_IRQHandler(void)
 949                     ; 630 #else /* _RAISONANCE_ */
 949                     ; 631 void UART2_RX_IRQHandler(void) interrupt 21
 949                     ; 632 #endif /* _COSMIC_ */
 949                     ; 633 {
 950                     	switch	.text
 951  0134               f_UART2_RX_IRQHandler:
 955                     ; 637 }
 958  0134 80            	iret	
 980                     ; 708 @far @interrupt void ADC1_IRQHandler(void)
 980                     ; 709 #else /* _RAISONANCE_ */
 980                     ; 710 void ADC1_IRQHandler(void) interrupt 22
 980                     ; 711 #endif /* _COSMIC_ */
 980                     ; 712 {
 981                     	switch	.text
 982  0135               f_ADC1_IRQHandler:
 986                     ; 717 	return;
 989  0135 80            	iret	
1012                     ; 749 @far @interrupt void TIM4_UPD_OVF_IRQHandler(void)
1012                     ; 750 #else /* _RAISONANCE_ */
1012                     ; 751 void TIM4_UPD_OVF_IRQHandler(void) interrupt 23
1012                     ; 752 #endif /* _COSMIC_ */
1012                     ; 753 {
1013                     	switch	.text
1014  0136               f_TIM4_UPD_OVF_IRQHandler:
1018                     ; 757 }
1021  0136 80            	iret	
1044                     ; 768 @far @interrupt void EEPROM_EEC_IRQHandler(void)
1044                     ; 769 #else /* _RAISONANCE_ */
1044                     ; 770 void EEPROM_EEC_IRQHandler(void) interrupt 24
1044                     ; 771 #endif /* _COSMIC_ */
1044                     ; 772 {
1045                     	switch	.text
1046  0137               f_EEPROM_EEC_IRQHandler:
1050                     ; 776 }
1053  0137 80            	iret	
1135                     	xref.b	_tempotrimdyn
1136                     	xref.b	_tempsbip5
1137                     	xref.b	_tempsbip4
1138                     	xref.b	_tempsbip3
1139                     	xref.b	_tempsbip2
1140                     	xref.b	_tempsbip1
1141                     	xref.b	_minutes
1142                     	xref.b	_secondes
1143                     	xref.b	_secondesurcinq
1144                     	xbit	_trimdyn
1145                     	switch	.ubsct
1146  0000               _Tempo_menu:
1147  0000 00            	ds.b	1
1148                     	xdef	_Tempo_menu
1149                     	xdef	_channel
1150                     	xdef	_synchro
1151                     	xdef	_Menu_raz
1152                     	xdef	_Menu_actif
1153                     	xdef	_Menu_on
1154                     	xdef	_sec
1155                     	xref	_calcultrame
1156                     	xref	_LCD_CLEAR_DISPLAY
1157                     	xref	_output
1158                     	xdef	f_EEPROM_EEC_IRQHandler
1159                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1160                     	xdef	f_ADC1_IRQHandler
1161                     	xdef	f_UART2_TX_IRQHandler
1162                     	xdef	f_UART2_RX_IRQHandler
1163                     	xdef	f_I2C_IRQHandler
1164                     	xdef	f_TIM3_CAP_COM_IRQHandler
1165                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
1166                     	xdef	f_TIM2_CAP_COM_IRQHandler
1167                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1168                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1169                     	xdef	f_TIM1_CAP_COM_IRQHandler
1170                     	xdef	f_SPI_IRQHandler
1171                     	xdef	f_EXTI_PORTE_IRQHandler
1172                     	xdef	f_EXTI_PORTD_IRQHandler
1173                     	xdef	f_EXTI_PORTC_IRQHandler
1174                     	xdef	f_EXTI_PORTB_IRQHandler
1175                     	xdef	f_EXTI_PORTA_IRQHandler
1176                     	xdef	f_CLK_IRQHandler
1177                     	xdef	f_AWU_IRQHandler
1178                     	xdef	f_TLI_IRQHandler
1179                     	xdef	f_TRAP_IRQHandler
1180                     	xdef	f_NonHandledInterrupt
1181                     	xref	_TIM3_ClearITPendingBit
1182                     	xref	_TIM2_ClearITPendingBit
1183                     	xref	_TIM2_SetAutoreload
1184                     	xref	_GPIO_WriteLow
1185                     	xref	_GPIO_WriteHigh
1186                     	xref.b	c_x
1187                     	xref.b	c_y
1207                     	end
