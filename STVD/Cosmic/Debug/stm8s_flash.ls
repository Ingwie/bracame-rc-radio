   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  78                     ; 81 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  78                     ; 82 {
  80                     	switch	.text
  81  0000               _FLASH_Unlock:
  85                     ; 84     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  87                     ; 87     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
  89  0000 a1fd          	cp	a,#253
  90  0002 2609          	jrne	L73
  91                     ; 89         FLASH->PUKR = FLASH_RASS_KEY1;
  93  0004 35565062      	mov	20578,#86
  94                     ; 90         FLASH->PUKR = FLASH_RASS_KEY2;
  96  0008 35ae5062      	mov	20578,#174
  99  000c 81            	ret	
 100  000d               L73:
 101                     ; 95         FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 103  000d 35ae5064      	mov	20580,#174
 104                     ; 96         FLASH->DUKR = FLASH_RASS_KEY1;
 106  0011 35565064      	mov	20580,#86
 107                     ; 98 }
 110  0015 81            	ret	
 145                     ; 106 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 145                     ; 107 {
 146                     	switch	.text
 147  0016               _FLASH_Lock:
 151                     ; 109     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 153                     ; 112   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 155  0016 c4505f        	and	a,20575
 156  0019 c7505f        	ld	20575,a
 157                     ; 113 }
 160  001c 81            	ret	
 183                     ; 120 void FLASH_DeInit(void)
 183                     ; 121 {
 184                     	switch	.text
 185  001d               _FLASH_DeInit:
 189                     ; 122     FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 191  001d 725f505a      	clr	20570
 192                     ; 123     FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 194  0021 725f505b      	clr	20571
 195                     ; 124     FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 197  0025 35ff505c      	mov	20572,#255
 198                     ; 125     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 200  0029 7217505f      	bres	20575,#3
 201                     ; 126     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 203  002d 7213505f      	bres	20575,#1
 204                     ; 127     (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 206  0031 c6505f        	ld	a,20575
 207                     ; 128 }
 210  0034 81            	ret	
 265                     ; 136 void FLASH_ITConfig(FunctionalState NewState)
 265                     ; 137 {
 266                     	switch	.text
 267  0035               _FLASH_ITConfig:
 271                     ; 139   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 273                     ; 141     if (NewState != DISABLE)
 275  0035 4d            	tnz	a
 276  0036 2705          	jreq	L711
 277                     ; 143         FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 279  0038 7212505a      	bset	20570,#1
 282  003c 81            	ret	
 283  003d               L711:
 284                     ; 147         FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 286  003d 7213505a      	bres	20570,#1
 287                     ; 149 }
 290  0041 81            	ret	
 324                     ; 158 void FLASH_EraseByte(uint32_t Address)
 324                     ; 159 {
 325                     	switch	.text
 326  0042               _FLASH_EraseByte:
 328       00000000      OFST:	set	0
 331                     ; 161     assert_param(IS_FLASH_ADDRESS_OK(Address));
 333                     ; 164    *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; 
 335  0042 1e05          	ldw	x,(OFST+5,sp)
 336  0044 7f            	clr	(x)
 337                     ; 166 }
 340  0045 81            	ret	
 383                     ; 176 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 383                     ; 177 {
 384                     	switch	.text
 385  0046               _FLASH_ProgramByte:
 387       00000000      OFST:	set	0
 390                     ; 179     assert_param(IS_FLASH_ADDRESS_OK(Address));
 392                     ; 180     *(PointerAttr uint8_t*) (uint16_t)Address = Data;
 394  0046 1e05          	ldw	x,(OFST+5,sp)
 395  0048 7b07          	ld	a,(OFST+7,sp)
 396  004a f7            	ld	(x),a
 397                     ; 181 }
 400  004b 81            	ret	
 434                     ; 190 uint8_t FLASH_ReadByte(uint32_t Address)
 434                     ; 191 {
 435                     	switch	.text
 436  004c               _FLASH_ReadByte:
 438       00000000      OFST:	set	0
 441                     ; 193     assert_param(IS_FLASH_ADDRESS_OK(Address));
 443                     ; 196     return(*(PointerAttr uint8_t *) (uint16_t)Address); 
 445  004c 1e05          	ldw	x,(OFST+5,sp)
 446  004e f6            	ld	a,(x)
 449  004f 81            	ret	
 492                     ; 207 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 492                     ; 208 {
 493                     	switch	.text
 494  0050               _FLASH_ProgramWord:
 496       00000000      OFST:	set	0
 499                     ; 210     assert_param(IS_FLASH_ADDRESS_OK(Address));
 501                     ; 213     FLASH->CR2 |= FLASH_CR2_WPRG;
 503  0050 721c505b      	bset	20571,#6
 504                     ; 214     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 506  0054 721d505c      	bres	20572,#6
 507                     ; 217     *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));
 509  0058 1e05          	ldw	x,(OFST+5,sp)
 510  005a 7b07          	ld	a,(OFST+7,sp)
 511  005c f7            	ld	(x),a
 512                     ; 219     *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data)+1); 
 514  005d 7b08          	ld	a,(OFST+8,sp)
 515  005f e701          	ld	(1,x),a
 516                     ; 221     *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data)+2); 
 518  0061 7b09          	ld	a,(OFST+9,sp)
 519  0063 e702          	ld	(2,x),a
 520                     ; 223     *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data)+3); 
 522  0065 7b0a          	ld	a,(OFST+10,sp)
 523  0067 e703          	ld	(3,x),a
 524                     ; 224 }
 527  0069 81            	ret	
 572                     ; 232 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 572                     ; 233 {
 573                     	switch	.text
 574  006a               _FLASH_ProgramOptionByte:
 576       00000000      OFST:	set	0
 579                     ; 235     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 581                     ; 238     FLASH->CR2 |= FLASH_CR2_OPT;
 583  006a 721e505b      	bset	20571,#7
 584  006e 89            	pushw	x
 585                     ; 239     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 587  006f 721f505c      	bres	20572,#7
 588                     ; 242     if (Address == 0x4800)
 590  0073 a34800        	cpw	x,#18432
 591  0076 2607          	jrne	L542
 592                     ; 245        *((NEAR uint8_t*)Address) = Data;
 594  0078 1e01          	ldw	x,(OFST+1,sp)
 595  007a 7b05          	ld	a,(OFST+5,sp)
 596  007c f7            	ld	(x),a
 598  007d 2008          	jra	L742
 599  007f               L542:
 600                     ; 250        *((NEAR uint8_t*)Address) = Data;
 602  007f 1e01          	ldw	x,(OFST+1,sp)
 603  0081 7b05          	ld	a,(OFST+5,sp)
 604  0083 f7            	ld	(x),a
 605                     ; 251        *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 607  0084 43            	cpl	a
 608  0085 e701          	ld	(1,x),a
 609  0087               L742:
 610                     ; 253     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 612  0087 a6fd          	ld	a,#253
 613  0089 cd0153        	call	_FLASH_WaitForLastOperation
 615                     ; 256     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 617  008c 721f505b      	bres	20571,#7
 618                     ; 257     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 620                     ; 258 }
 623  0090 85            	popw	x
 624  0091 721e505c      	bset	20572,#7
 625  0095 81            	ret	
 661                     ; 265 void FLASH_EraseOptionByte(uint16_t Address)
 661                     ; 266 {
 662                     	switch	.text
 663  0096               _FLASH_EraseOptionByte:
 665       00000000      OFST:	set	0
 668                     ; 268     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 670                     ; 271     FLASH->CR2 |= FLASH_CR2_OPT;
 672  0096 721e505b      	bset	20571,#7
 673  009a 89            	pushw	x
 674                     ; 272     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 676  009b 721f505c      	bres	20572,#7
 677                     ; 275      if (Address == 0x4800)
 679  009f a34800        	cpw	x,#18432
 680  00a2 2603          	jrne	L762
 681                     ; 278        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 683  00a4 7f            	clr	(x)
 685  00a5 2007          	jra	L172
 686  00a7               L762:
 687                     ; 283        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 689  00a7 1e01          	ldw	x,(OFST+1,sp)
 690                     ; 284        *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 692  00a9 a6ff          	ld	a,#255
 693  00ab 7f            	clr	(x)
 694  00ac e701          	ld	(1,x),a
 695  00ae               L172:
 696                     ; 286     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 698  00ae a6fd          	ld	a,#253
 699  00b0 cd0153        	call	_FLASH_WaitForLastOperation
 701                     ; 289     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 703  00b3 721f505b      	bres	20571,#7
 704                     ; 290     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 706                     ; 291 }
 709  00b7 85            	popw	x
 710  00b8 721e505c      	bset	20572,#7
 711  00bc 81            	ret	
 774                     ; 297 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 774                     ; 298 {
 775                     	switch	.text
 776  00bd               _FLASH_ReadOptionByte:
 778  00bd 5204          	subw	sp,#4
 779       00000004      OFST:	set	4
 782                     ; 299     uint8_t value_optbyte, value_optbyte_complement = 0;
 784                     ; 300     uint16_t res_value = 0;
 786                     ; 303     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 788                     ; 306     value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 790  00bf f6            	ld	a,(x)
 791  00c0 6b02          	ld	(OFST-2,sp),a
 792                     ; 307     value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 794  00c2 e601          	ld	a,(1,x)
 795  00c4 6b01          	ld	(OFST-3,sp),a
 796                     ; 310     if (Address == 0x4800)	 
 798  00c6 a34800        	cpw	x,#18432
 799  00c9 2606          	jrne	L523
 800                     ; 312         res_value =	 value_optbyte;
 802  00cb 7b02          	ld	a,(OFST-2,sp)
 803  00cd 5f            	clrw	x
 804  00ce 97            	ld	xl,a
 806  00cf 201c          	jra	L723
 807  00d1               L523:
 808                     ; 316         if (value_optbyte == (uint8_t)(~value_optbyte_complement))
 810  00d1 43            	cpl	a
 811  00d2 1102          	cp	a,(OFST-2,sp)
 812  00d4 2614          	jrne	L133
 813                     ; 318             res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 815  00d6 7b02          	ld	a,(OFST-2,sp)
 816  00d8 97            	ld	xl,a
 817  00d9 4f            	clr	a
 818  00da 02            	rlwa	x,a
 819  00db 1f03          	ldw	(OFST-1,sp),x
 820                     ; 319             res_value = res_value | (uint16_t)value_optbyte_complement;
 822  00dd 5f            	clrw	x
 823  00de 7b01          	ld	a,(OFST-3,sp)
 824  00e0 97            	ld	xl,a
 825  00e1 01            	rrwa	x,a
 826  00e2 1a04          	or	a,(OFST+0,sp)
 827  00e4 01            	rrwa	x,a
 828  00e5 1a03          	or	a,(OFST-1,sp)
 829  00e7 01            	rrwa	x,a
 831  00e8 2003          	jra	L723
 832  00ea               L133:
 833                     ; 323             res_value = FLASH_OPTIONBYTE_ERROR;
 835  00ea ae5555        	ldw	x,#21845
 836  00ed               L723:
 837                     ; 326     return(res_value);
 841  00ed 5b04          	addw	sp,#4
 842  00ef 81            	ret	
 916                     ; 335 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 916                     ; 336 {
 917                     	switch	.text
 918  00f0               _FLASH_SetLowPowerMode:
 920  00f0 88            	push	a
 921       00000000      OFST:	set	0
 924                     ; 338     assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 926                     ; 341     FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 928  00f1 c6505a        	ld	a,20570
 929  00f4 a4f3          	and	a,#243
 930  00f6 c7505a        	ld	20570,a
 931                     ; 344     FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 933  00f9 c6505a        	ld	a,20570
 934  00fc 1a01          	or	a,(OFST+1,sp)
 935  00fe c7505a        	ld	20570,a
 936                     ; 345 }
 939  0101 84            	pop	a
 940  0102 81            	ret	
 998                     ; 353 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
 998                     ; 354 {
 999                     	switch	.text
1000  0103               _FLASH_SetProgrammingTime:
1004                     ; 356     assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1006                     ; 358     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1008  0103 7211505a      	bres	20570,#0
1009                     ; 359     FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1011  0107 ca505a        	or	a,20570
1012  010a c7505a        	ld	20570,a
1013                     ; 360 }
1016  010d 81            	ret	
1041                     ; 367 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1041                     ; 368 {
1042                     	switch	.text
1043  010e               _FLASH_GetLowPowerMode:
1047                     ; 369     return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1049  010e c6505a        	ld	a,20570
1050  0111 a40c          	and	a,#12
1053  0113 81            	ret	
1078                     ; 377 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1078                     ; 378 {
1079                     	switch	.text
1080  0114               _FLASH_GetProgrammingTime:
1084                     ; 379     return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1086  0114 c6505a        	ld	a,20570
1087  0117 a401          	and	a,#1
1090  0119 81            	ret	
1124                     ; 387 uint32_t FLASH_GetBootSize(void)
1124                     ; 388 {
1125                     	switch	.text
1126  011a               _FLASH_GetBootSize:
1128  011a 5204          	subw	sp,#4
1129       00000004      OFST:	set	4
1132                     ; 389     uint32_t temp = 0;
1134                     ; 392     temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1136  011c c6505d        	ld	a,20573
1137  011f 5f            	clrw	x
1138  0120 97            	ld	xl,a
1139  0121 90ae0200      	ldw	y,#512
1140  0125 cd0000        	call	c_umul
1142  0128 96            	ldw	x,sp
1143  0129 5c            	incw	x
1144  012a cd0000        	call	c_rtol
1146                     ; 395     if (FLASH->FPR == 0xFF)
1148  012d c6505d        	ld	a,20573
1149  0130 4c            	inc	a
1150  0131 260d          	jrne	L354
1151                     ; 397         temp += 512;
1153  0133 ae0200        	ldw	x,#512
1154  0136 bf02          	ldw	c_lreg+2,x
1155  0138 5f            	clrw	x
1156  0139 bf00          	ldw	c_lreg,x
1157  013b 96            	ldw	x,sp
1158  013c 5c            	incw	x
1159  013d cd0000        	call	c_lgadd
1161  0140               L354:
1162                     ; 401     return(temp);
1164  0140 96            	ldw	x,sp
1165  0141 5c            	incw	x
1166  0142 cd0000        	call	c_ltor
1170  0145 5b04          	addw	sp,#4
1171  0147 81            	ret	
1280                     ; 412 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1280                     ; 413 {
1281                     	switch	.text
1282  0148               _FLASH_GetFlagStatus:
1284  0148 88            	push	a
1285       00000001      OFST:	set	1
1288                     ; 414     FlagStatus status = RESET;
1290                     ; 416     assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1292                     ; 419     if ((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1294  0149 c4505f        	and	a,20575
1295  014c 2702          	jreq	L525
1296                     ; 421         status = SET; /* FLASH_FLAG is set */
1298  014e a601          	ld	a,#1
1300  0150               L525:
1301                     ; 425         status = RESET; /* FLASH_FLAG is reset*/
1303                     ; 429     return status;
1307  0150 5b01          	addw	sp,#1
1308  0152 81            	ret	
1401                     ; 531 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1401                     ; 532 {
1402                     	switch	.text
1403  0153               _FLASH_WaitForLastOperation:
1405  0153 5205          	subw	sp,#5
1406       00000005      OFST:	set	5
1409                     ; 533     uint8_t flagstatus = 0x00;
1411  0155 0f05          	clr	(OFST+0,sp)
1412                     ; 534     uint32_t timeout = OPERATION_TIMEOUT;
1414  0157 aeffff        	ldw	x,#65535
1415  015a 1f03          	ldw	(OFST-2,sp),x
1416  015c ae000f        	ldw	x,#15
1417  015f 1f01          	ldw	(OFST-4,sp),x
1418                     ; 539     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1420  0161 a1fd          	cp	a,#253
1421  0163 262b          	jrne	L116
1423  0165 200e          	jra	L775
1424  0167               L575:
1425                     ; 543             flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1425                     ; 544                                               FLASH_IAPSR_WR_PG_DIS));
1427  0167 c6505f        	ld	a,20575
1428  016a a405          	and	a,#5
1429  016c 6b05          	ld	(OFST+0,sp),a
1430                     ; 545             timeout--;
1432  016e 96            	ldw	x,sp
1433  016f 5c            	incw	x
1434  0170 a601          	ld	a,#1
1435  0172 cd0000        	call	c_lgsbc
1437  0175               L775:
1438                     ; 541         while ((flagstatus == 0x00) && (timeout != 0x00))
1440  0175 7b05          	ld	a,(OFST+0,sp)
1441  0177 2622          	jrne	L506
1443  0179 96            	ldw	x,sp
1444  017a 5c            	incw	x
1445  017b cd0000        	call	c_lzmp
1447  017e 26e7          	jrne	L575
1448  0180 2019          	jra	L506
1449  0182               L706:
1450                     ; 552             flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1450                     ; 553                                               FLASH_IAPSR_WR_PG_DIS));
1452  0182 c6505f        	ld	a,20575
1453  0185 a441          	and	a,#65
1454  0187 6b05          	ld	(OFST+0,sp),a
1455                     ; 554             timeout--;
1457  0189 96            	ldw	x,sp
1458  018a 5c            	incw	x
1459  018b a601          	ld	a,#1
1460  018d cd0000        	call	c_lgsbc
1462  0190               L116:
1463                     ; 550         while ((flagstatus == 0x00) && (timeout != 0x00))
1465  0190 7b05          	ld	a,(OFST+0,sp)
1466  0192 2607          	jrne	L506
1468  0194 96            	ldw	x,sp
1469  0195 5c            	incw	x
1470  0196 cd0000        	call	c_lzmp
1472  0199 26e7          	jrne	L706
1473  019b               L506:
1474                     ; 566     if (timeout == 0x00 )
1476  019b 96            	ldw	x,sp
1477  019c 5c            	incw	x
1478  019d cd0000        	call	c_lzmp
1480  01a0 2604          	jrne	L716
1481                     ; 568         flagstatus = FLASH_STATUS_TIMEOUT;
1483  01a2 a602          	ld	a,#2
1484  01a4 6b05          	ld	(OFST+0,sp),a
1485  01a6               L716:
1486                     ; 571     return((FLASH_Status_TypeDef)flagstatus);
1488  01a6 7b05          	ld	a,(OFST+0,sp)
1491  01a8 5b05          	addw	sp,#5
1492  01aa 81            	ret	
1555                     ; 581 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1555                     ; 582 {
1556                     	switch	.text
1557  01ab               _FLASH_EraseBlock:
1559  01ab 89            	pushw	x
1560  01ac 5206          	subw	sp,#6
1561       00000006      OFST:	set	6
1564                     ; 583   uint32_t startaddress = 0;
1566                     ; 593   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1568                     ; 594   if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1570  01ae 7b0b          	ld	a,(OFST+5,sp)
1571  01b0 a1fd          	cp	a,#253
1572  01b2 2605          	jrne	L356
1573                     ; 596       assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1575                     ; 597       startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1577  01b4 ae8000        	ldw	x,#32768
1579  01b7 2003          	jra	L556
1580  01b9               L356:
1581                     ; 601       assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1583                     ; 602       startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1585  01b9 ae4000        	ldw	x,#16384
1586  01bc               L556:
1587  01bc 1f05          	ldw	(OFST-1,sp),x
1588  01be 5f            	clrw	x
1589  01bf 1f03          	ldw	(OFST-3,sp),x
1590                     ; 610     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1592  01c1 a680          	ld	a,#128
1593  01c3 1e07          	ldw	x,(OFST+1,sp)
1594  01c5 cd0000        	call	c_cmulx
1596  01c8 96            	ldw	x,sp
1597  01c9 1c0003        	addw	x,#OFST-3
1598  01cc cd0000        	call	c_ladd
1600  01cf be02          	ldw	x,c_lreg+2
1601  01d1 1f01          	ldw	(OFST-5,sp),x
1602                     ; 614     FLASH->CR2 |= FLASH_CR2_ERASE;
1604  01d3 721a505b      	bset	20571,#5
1605                     ; 615     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1607                     ; 619     *pwFlash = (uint32_t)0;
1609  01d7 4f            	clr	a
1610  01d8 721b505c      	bres	20572,#5
1611  01dc e703          	ld	(3,x),a
1612  01de e702          	ld	(2,x),a
1613  01e0 e701          	ld	(1,x),a
1614  01e2 f7            	ld	(x),a
1615                     ; 627 }
1618  01e3 5b08          	addw	sp,#8
1619  01e5 81            	ret	
1723                     ; 638 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1723                     ; 639                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1723                     ; 640 {
1724                     	switch	.text
1725  01e6               _FLASH_ProgramBlock:
1727  01e6 89            	pushw	x
1728  01e7 5206          	subw	sp,#6
1729       00000006      OFST:	set	6
1732                     ; 641     uint16_t Count = 0;
1734                     ; 642     uint32_t startaddress = 0;
1736                     ; 645     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1738                     ; 646     assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1740                     ; 647     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1742  01e9 7b0b          	ld	a,(OFST+5,sp)
1743  01eb a1fd          	cp	a,#253
1744  01ed 2605          	jrne	L137
1745                     ; 649         assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1747                     ; 650         startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1749  01ef ae8000        	ldw	x,#32768
1751  01f2 2003          	jra	L337
1752  01f4               L137:
1753                     ; 654         assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1755                     ; 655         startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1757  01f4 ae4000        	ldw	x,#16384
1758  01f7               L337:
1759  01f7 1f03          	ldw	(OFST-3,sp),x
1760  01f9 5f            	clrw	x
1761  01fa 1f01          	ldw	(OFST-5,sp),x
1762                     ; 659     startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1764  01fc a680          	ld	a,#128
1765  01fe 1e07          	ldw	x,(OFST+1,sp)
1766  0200 cd0000        	call	c_cmulx
1768  0203 96            	ldw	x,sp
1769  0204 5c            	incw	x
1770  0205 cd0000        	call	c_lgadd
1772                     ; 662     if (FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1774  0208 7b0c          	ld	a,(OFST+6,sp)
1775  020a 260a          	jrne	L537
1776                     ; 665         FLASH->CR2 |= FLASH_CR2_PRG;
1778  020c 7210505b      	bset	20571,#0
1779                     ; 666         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1781  0210 7211505c      	bres	20572,#0
1783  0214 2008          	jra	L737
1784  0216               L537:
1785                     ; 671         FLASH->CR2 |= FLASH_CR2_FPRG;
1787  0216 7218505b      	bset	20571,#4
1788                     ; 672         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1790  021a 7219505c      	bres	20572,#4
1791  021e               L737:
1792                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1794  021e 5f            	clrw	x
1795  021f 1f05          	ldw	(OFST-1,sp),x
1796  0221               L147:
1797                     ; 680   *((PointerAttr uint8_t*) (uint16_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1799  0221 1e0d          	ldw	x,(OFST+7,sp)
1800  0223 72fb05        	addw	x,(OFST-1,sp)
1801  0226 f6            	ld	a,(x)
1802  0227 1e03          	ldw	x,(OFST-3,sp)
1803  0229 72fb05        	addw	x,(OFST-1,sp)
1804  022c f7            	ld	(x),a
1805                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1807  022d 1e05          	ldw	x,(OFST-1,sp)
1808  022f 5c            	incw	x
1809  0230 1f05          	ldw	(OFST-1,sp),x
1812  0232 a30080        	cpw	x,#128
1813  0235 25ea          	jrult	L147
1814                     ; 685 }
1817  0237 5b08          	addw	sp,#8
1818  0239 81            	ret	
1831                     	xdef	_FLASH_WaitForLastOperation
1832                     	xdef	_FLASH_ProgramBlock
1833                     	xdef	_FLASH_EraseBlock
1834                     	xdef	_FLASH_GetFlagStatus
1835                     	xdef	_FLASH_GetBootSize
1836                     	xdef	_FLASH_GetProgrammingTime
1837                     	xdef	_FLASH_GetLowPowerMode
1838                     	xdef	_FLASH_SetProgrammingTime
1839                     	xdef	_FLASH_SetLowPowerMode
1840                     	xdef	_FLASH_EraseOptionByte
1841                     	xdef	_FLASH_ProgramOptionByte
1842                     	xdef	_FLASH_ReadOptionByte
1843                     	xdef	_FLASH_ProgramWord
1844                     	xdef	_FLASH_ReadByte
1845                     	xdef	_FLASH_ProgramByte
1846                     	xdef	_FLASH_EraseByte
1847                     	xdef	_FLASH_ITConfig
1848                     	xdef	_FLASH_DeInit
1849                     	xdef	_FLASH_Lock
1850                     	xdef	_FLASH_Unlock
1851                     	xref.b	c_lreg
1852                     	xref.b	c_x
1853                     	xref.b	c_y
1872                     	xref	c_ladd
1873                     	xref	c_cmulx
1874                     	xref	c_lzmp
1875                     	xref	c_lgsbc
1876                     	xref	c_ltor
1877                     	xref	c_lgadd
1878                     	xref	c_rtol
1879                     	xref	c_umul
1880                     	end
