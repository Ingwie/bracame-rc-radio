   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  18                     .const:	section	.text
  19  0000               _APR_Array:
  20  0000 00            	dc.b	0
  21  0001 1e            	dc.b	30
  22  0002 1e            	dc.b	30
  23  0003 1e            	dc.b	30
  24  0004 1e            	dc.b	30
  25  0005 1e            	dc.b	30
  26  0006 1e            	dc.b	30
  27  0007 1e            	dc.b	30
  28  0008 1e            	dc.b	30
  29  0009 1e            	dc.b	30
  30  000a 1e            	dc.b	30
  31  000b 1e            	dc.b	30
  32  000c 1e            	dc.b	30
  33  000d 3d            	dc.b	61
  34  000e 17            	dc.b	23
  35  000f 17            	dc.b	23
  36  0010 3e            	dc.b	62
  37  0011               _TBR_Array:
  38  0011 00            	dc.b	0
  39  0012 01            	dc.b	1
  40  0013 02            	dc.b	2
  41  0014 03            	dc.b	3
  42  0015 04            	dc.b	4
  43  0016 05            	dc.b	5
  44  0017 06            	dc.b	6
  45  0018 07            	dc.b	7
  46  0019 08            	dc.b	8
  47  001a 09            	dc.b	9
  48  001b 0a            	dc.b	10
  49  001c 0b            	dc.b	11
  50  001d 0c            	dc.b	12
  51  001e 0c            	dc.b	12
  52  001f 0e            	dc.b	14
  53  0020 0f            	dc.b	15
  54  0021 0f            	dc.b	15
  83                     ; 67 void AWU_DeInit(void)
  83                     ; 68 {
  85                     	switch	.text
  86  0000               _AWU_DeInit:
  90                     ; 69     AWU->CSR = AWU_CSR_RESET_VALUE;
  92  0000 725f50f0      	clr	20720
  93                     ; 70     AWU->APR = AWU_APR_RESET_VALUE;
  95  0004 353f50f1      	mov	20721,#63
  96                     ; 71     AWU->TBR = AWU_TBR_RESET_VALUE;
  98  0008 725f50f2      	clr	20722
  99                     ; 72 }
 102  000c 81            	ret	
 264                     ; 82 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 264                     ; 83 {
 265                     	switch	.text
 266  000d               _AWU_Init:
 268       00000000      OFST:	set	0
 271                     ; 86     assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 273                     ; 89     AWU->CSR |= AWU_CSR_AWUEN;
 275  000d 721850f0      	bset	20720,#4
 276  0011 88            	push	a
 277                     ; 92     AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 279  0012 c650f2        	ld	a,20722
 280  0015 a4f0          	and	a,#240
 281  0017 c750f2        	ld	20722,a
 282                     ; 93     AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 284  001a 5f            	clrw	x
 285  001b 7b01          	ld	a,(OFST+1,sp)
 286  001d 97            	ld	xl,a
 287  001e c650f2        	ld	a,20722
 288  0021 da0011        	or	a,(_TBR_Array,x)
 289  0024 c750f2        	ld	20722,a
 290                     ; 96     AWU->APR &= (uint8_t)(~AWU_APR_APR);
 292  0027 c650f1        	ld	a,20721
 293  002a a4c0          	and	a,#192
 294  002c c750f1        	ld	20721,a
 295                     ; 97     AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 297  002f 5f            	clrw	x
 298  0030 7b01          	ld	a,(OFST+1,sp)
 299  0032 97            	ld	xl,a
 300  0033 c650f1        	ld	a,20721
 301  0036 da0000        	or	a,(_APR_Array,x)
 302  0039 c750f1        	ld	20721,a
 303                     ; 99 }
 306  003c 84            	pop	a
 307  003d 81            	ret	
 362                     ; 108 void AWU_Cmd(FunctionalState NewState)
 362                     ; 109 {
 363                     	switch	.text
 364  003e               _AWU_Cmd:
 368                     ; 110     if (NewState != DISABLE)
 370  003e 4d            	tnz	a
 371  003f 2705          	jreq	L331
 372                     ; 113         AWU->CSR |= AWU_CSR_AWUEN;
 374  0041 721850f0      	bset	20720,#4
 377  0045 81            	ret	
 378  0046               L331:
 379                     ; 118         AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 381  0046 721950f0      	bres	20720,#4
 382                     ; 120 }
 385  004a 81            	ret	
 438                     	switch	.const
 439  0022               L41:
 440  0022 000003e8      	dc.l	1000
 441                     ; 135 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 441                     ; 136 {
 442                     	switch	.text
 443  004b               _AWU_LSICalibrationConfig:
 445  004b 5206          	subw	sp,#6
 446       00000006      OFST:	set	6
 449                     ; 138     uint16_t lsifreqkhz = 0x0;
 451                     ; 139     uint16_t A = 0x0;
 453                     ; 142     assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 455                     ; 144     lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 457  004d 96            	ldw	x,sp
 458  004e 1c0009        	addw	x,#OFST+3
 459  0051 cd0000        	call	c_ltor
 461  0054 ae0022        	ldw	x,#L41
 462  0057 cd0000        	call	c_ludv
 464  005a be02          	ldw	x,c_lreg+2
 465  005c 1f03          	ldw	(OFST-3,sp),x
 466                     ; 148     A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 468  005e 54            	srlw	x
 469  005f 54            	srlw	x
 470  0060 1f05          	ldw	(OFST-1,sp),x
 471                     ; 150     if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 473  0062 58            	sllw	x
 474  0063 58            	sllw	x
 475  0064 1f01          	ldw	(OFST-5,sp),x
 476  0066 1e03          	ldw	x,(OFST-3,sp)
 477  0068 72f001        	subw	x,(OFST-5,sp)
 478  006b 1605          	ldw	y,(OFST-1,sp)
 479  006d 9058          	sllw	y
 480  006f 905c          	incw	y
 481  0071 cd0000        	call	c_imul
 483  0074 1605          	ldw	y,(OFST-1,sp)
 484  0076 9058          	sllw	y
 485  0078 bf00          	ldw	c_x,x
 486  007a 9058          	sllw	y
 487  007c 90b300        	cpw	y,c_x
 488  007f 7b06          	ld	a,(OFST+0,sp)
 489  0081 2504          	jrult	L561
 490                     ; 152         AWU->APR = (uint8_t)(A - 2U);
 492  0083 a002          	sub	a,#2
 494  0085 2001          	jra	L761
 495  0087               L561:
 496                     ; 156         AWU->APR = (uint8_t)(A - 1U);
 498  0087 4a            	dec	a
 499  0088               L761:
 500  0088 c750f1        	ld	20721,a
 501                     ; 158 }
 504  008b 5b06          	addw	sp,#6
 505  008d 81            	ret	
 528                     ; 165 void AWU_IdleModeEnable(void)
 528                     ; 166 {
 529                     	switch	.text
 530  008e               _AWU_IdleModeEnable:
 534                     ; 168     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 536  008e 721950f0      	bres	20720,#4
 537                     ; 171     AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 539  0092 35f050f2      	mov	20722,#240
 540                     ; 172 }
 543  0096 81            	ret	
 587                     ; 180 FlagStatus AWU_GetFlagStatus(void)
 587                     ; 181 {
 588                     	switch	.text
 589  0097               _AWU_GetFlagStatus:
 593                     ; 182     return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 595  0097 720a50f002    	btjt	20720,#5,L22
 596  009c 4f            	clr	a
 598  009d 81            	ret	
 599  009e               L22:
 600  009e a601          	ld	a,#1
 603  00a0 81            	ret	
 638                     	xdef	_TBR_Array
 639                     	xdef	_APR_Array
 640                     	xdef	_AWU_GetFlagStatus
 641                     	xdef	_AWU_IdleModeEnable
 642                     	xdef	_AWU_LSICalibrationConfig
 643                     	xdef	_AWU_Cmd
 644                     	xdef	_AWU_Init
 645                     	xdef	_AWU_DeInit
 646                     	xref.b	c_lreg
 647                     	xref.b	c_x
 666                     	xref	c_imul
 667                     	xref	c_ludv
 668                     	xref	c_ltor
 669                     	end
