   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  46                     ; 45 void TIM3_DeInit(void)
  46                     ; 46 {
  48                     	switch	.text
  49  0000               _TIM3_DeInit:
  53                     ; 48     TIM3->CR1 = (uint8_t)TIM3_CR1_RESET_VALUE;
  55  0000 725f5320      	clr	21280
  56                     ; 49     TIM3->IER = (uint8_t)TIM3_IER_RESET_VALUE;
  58  0004 725f5321      	clr	21281
  59                     ; 50     TIM3->SR2 = (uint8_t)TIM3_SR2_RESET_VALUE;
  61  0008 725f5323      	clr	21283
  62                     ; 53     TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  64  000c 725f5327      	clr	21287
  65                     ; 56     TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  67  0010 725f5327      	clr	21287
  68                     ; 57     TIM3->CCMR1 = (uint8_t)TIM3_CCMR1_RESET_VALUE;
  70  0014 725f5325      	clr	21285
  71                     ; 58     TIM3->CCMR2 = (uint8_t)TIM3_CCMR2_RESET_VALUE;
  73  0018 725f5326      	clr	21286
  74                     ; 59     TIM3->CNTRH = (uint8_t)TIM3_CNTRH_RESET_VALUE;
  76  001c 725f5328      	clr	21288
  77                     ; 60     TIM3->CNTRL = (uint8_t)TIM3_CNTRL_RESET_VALUE;
  79  0020 725f5329      	clr	21289
  80                     ; 61     TIM3->PSCR = (uint8_t)TIM3_PSCR_RESET_VALUE;
  82  0024 725f532a      	clr	21290
  83                     ; 62     TIM3->ARRH  = (uint8_t)TIM3_ARRH_RESET_VALUE;
  85  0028 35ff532b      	mov	21291,#255
  86                     ; 63     TIM3->ARRL  = (uint8_t)TIM3_ARRL_RESET_VALUE;
  88  002c 35ff532c      	mov	21292,#255
  89                     ; 64     TIM3->CCR1H = (uint8_t)TIM3_CCR1H_RESET_VALUE;
  91  0030 725f532d      	clr	21293
  92                     ; 65     TIM3->CCR1L = (uint8_t)TIM3_CCR1L_RESET_VALUE;
  94  0034 725f532e      	clr	21294
  95                     ; 66     TIM3->CCR2H = (uint8_t)TIM3_CCR2H_RESET_VALUE;
  97  0038 725f532f      	clr	21295
  98                     ; 67     TIM3->CCR2L = (uint8_t)TIM3_CCR2L_RESET_VALUE;
 100  003c 725f5330      	clr	21296
 101                     ; 68     TIM3->SR1 = (uint8_t)TIM3_SR1_RESET_VALUE;
 103  0040 725f5322      	clr	21282
 104                     ; 69 }
 107  0044 81            	ret	
 275                     ; 78 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 275                     ; 79                         uint16_t TIM3_Period)
 275                     ; 80 {
 276                     	switch	.text
 277  0045               _TIM3_TimeBaseInit:
 279       00000000      OFST:	set	0
 282                     ; 82     TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 284  0045 c7532a        	ld	21290,a
 285  0048 88            	push	a
 286                     ; 84     TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
 288  0049 7b04          	ld	a,(OFST+4,sp)
 289  004b c7532b        	ld	21291,a
 290                     ; 85     TIM3->ARRL = (uint8_t)(TIM3_Period);
 292  004e 7b05          	ld	a,(OFST+5,sp)
 293  0050 c7532c        	ld	21292,a
 294                     ; 86 }
 297  0053 84            	pop	a
 298  0054 81            	ret	
 455                     ; 96 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 455                     ; 97                   TIM3_OutputState_TypeDef TIM3_OutputState,
 455                     ; 98                   uint16_t TIM3_Pulse,
 455                     ; 99                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 455                     ; 100 {
 456                     	switch	.text
 457  0055               _TIM3_OC1Init:
 459  0055 89            	pushw	x
 460  0056 88            	push	a
 461       00000001      OFST:	set	1
 464                     ; 102     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 466                     ; 103     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 468                     ; 104     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 470                     ; 107     TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 472  0057 c65327        	ld	a,21287
 473  005a a4fc          	and	a,#252
 474  005c c75327        	ld	21287,a
 475                     ; 109     TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 477  005f 7b08          	ld	a,(OFST+7,sp)
 478  0061 a402          	and	a,#2
 479  0063 6b01          	ld	(OFST+0,sp),a
 480  0065 9f            	ld	a,xl
 481  0066 a401          	and	a,#1
 482  0068 1a01          	or	a,(OFST+0,sp)
 483  006a ca5327        	or	a,21287
 484  006d c75327        	ld	21287,a
 485                     ; 112     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 487  0070 c65325        	ld	a,21285
 488  0073 a48f          	and	a,#143
 489  0075 1a02          	or	a,(OFST+1,sp)
 490  0077 c75325        	ld	21285,a
 491                     ; 115     TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 493  007a 7b06          	ld	a,(OFST+5,sp)
 494  007c c7532d        	ld	21293,a
 495                     ; 116     TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 497  007f 7b07          	ld	a,(OFST+6,sp)
 498  0081 c7532e        	ld	21294,a
 499                     ; 117 }
 502  0084 5b03          	addw	sp,#3
 503  0086 81            	ret	
 567                     ; 128 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 567                     ; 129                   TIM3_OutputState_TypeDef TIM3_OutputState,
 567                     ; 130                   uint16_t TIM3_Pulse,
 567                     ; 131                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 567                     ; 132 {
 568                     	switch	.text
 569  0087               _TIM3_OC2Init:
 571  0087 89            	pushw	x
 572  0088 88            	push	a
 573       00000001      OFST:	set	1
 576                     ; 134     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 578                     ; 135     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 580                     ; 136     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 582                     ; 140     TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 584  0089 c65327        	ld	a,21287
 585  008c a4cf          	and	a,#207
 586  008e c75327        	ld	21287,a
 587                     ; 142     TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 589  0091 7b08          	ld	a,(OFST+7,sp)
 590  0093 a420          	and	a,#32
 591  0095 6b01          	ld	(OFST+0,sp),a
 592  0097 9f            	ld	a,xl
 593  0098 a410          	and	a,#16
 594  009a 1a01          	or	a,(OFST+0,sp)
 595  009c ca5327        	or	a,21287
 596  009f c75327        	ld	21287,a
 597                     ; 146     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 599  00a2 c65326        	ld	a,21286
 600  00a5 a48f          	and	a,#143
 601  00a7 1a02          	or	a,(OFST+1,sp)
 602  00a9 c75326        	ld	21286,a
 603                     ; 150     TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 605  00ac 7b06          	ld	a,(OFST+5,sp)
 606  00ae c7532f        	ld	21295,a
 607                     ; 151     TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 609  00b1 7b07          	ld	a,(OFST+6,sp)
 610  00b3 c75330        	ld	21296,a
 611                     ; 152 }
 614  00b6 5b03          	addw	sp,#3
 615  00b8 81            	ret	
 799                     ; 163 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 799                     ; 164                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 799                     ; 165                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 799                     ; 166                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 799                     ; 167                  uint8_t TIM3_ICFilter)
 799                     ; 168 {
 800                     	switch	.text
 801  00b9               _TIM3_ICInit:
 803  00b9 89            	pushw	x
 804       00000000      OFST:	set	0
 807                     ; 170     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 809                     ; 171     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 811                     ; 172     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 813                     ; 173     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 815                     ; 174     assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
 817                     ; 176     if (TIM3_Channel != TIM3_CHANNEL_2)
 819  00ba 9e            	ld	a,xh
 820  00bb 4a            	dec	a
 821  00bc 2714          	jreq	L343
 822                     ; 179         TI1_Config((uint8_t)TIM3_ICPolarity,
 822                     ; 180                    (uint8_t)TIM3_ICSelection,
 822                     ; 181                    (uint8_t)TIM3_ICFilter);
 824  00be 7b07          	ld	a,(OFST+7,sp)
 825  00c0 88            	push	a
 826  00c1 7b06          	ld	a,(OFST+6,sp)
 827  00c3 97            	ld	xl,a
 828  00c4 7b03          	ld	a,(OFST+3,sp)
 829  00c6 95            	ld	xh,a
 830  00c7 cd032d        	call	L3_TI1_Config
 832  00ca 84            	pop	a
 833                     ; 184         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 835  00cb 7b06          	ld	a,(OFST+6,sp)
 836  00cd cd0274        	call	_TIM3_SetIC1Prescaler
 839  00d0 2012          	jra	L543
 840  00d2               L343:
 841                     ; 189         TI2_Config((uint8_t)TIM3_ICPolarity,
 841                     ; 190                    (uint8_t)TIM3_ICSelection,
 841                     ; 191                    (uint8_t)TIM3_ICFilter);
 843  00d2 7b07          	ld	a,(OFST+7,sp)
 844  00d4 88            	push	a
 845  00d5 7b06          	ld	a,(OFST+6,sp)
 846  00d7 97            	ld	xl,a
 847  00d8 7b03          	ld	a,(OFST+3,sp)
 848  00da 95            	ld	xh,a
 849  00db cd035d        	call	L5_TI2_Config
 851  00de 84            	pop	a
 852                     ; 194         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 854  00df 7b06          	ld	a,(OFST+6,sp)
 855  00e1 cd0281        	call	_TIM3_SetIC2Prescaler
 857  00e4               L543:
 858                     ; 196 }
 861  00e4 85            	popw	x
 862  00e5 81            	ret	
 958                     ; 206 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
 958                     ; 207                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 958                     ; 208                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
 958                     ; 209                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 958                     ; 210                      uint8_t TIM3_ICFilter)
 958                     ; 211 {
 959                     	switch	.text
 960  00e6               _TIM3_PWMIConfig:
 962  00e6 89            	pushw	x
 963  00e7 89            	pushw	x
 964       00000002      OFST:	set	2
 967                     ; 212     uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 969                     ; 213     uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
 971                     ; 216     assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
 973                     ; 217     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 975                     ; 218     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 977                     ; 219     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 979                     ; 222     if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
 981  00e8 9f            	ld	a,xl
 982  00e9 a144          	cp	a,#68
 983  00eb 2706          	jreq	L514
 984                     ; 224         icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
 986  00ed a644          	ld	a,#68
 987  00ef 6b01          	ld	(OFST-1,sp),a
 989  00f1 2002          	jra	L714
 990  00f3               L514:
 991                     ; 228         icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 993  00f3 0f01          	clr	(OFST-1,sp)
 994  00f5               L714:
 995                     ; 232     if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
 997  00f5 7b07          	ld	a,(OFST+5,sp)
 998  00f7 4a            	dec	a
 999  00f8 2604          	jrne	L124
1000                     ; 234         icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
1002  00fa a602          	ld	a,#2
1004  00fc 2002          	jra	L324
1005  00fe               L124:
1006                     ; 238         icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
1008  00fe a601          	ld	a,#1
1009  0100               L324:
1010  0100 6b02          	ld	(OFST+0,sp),a
1011                     ; 241     if (TIM3_Channel != TIM3_CHANNEL_2)
1013  0102 7b03          	ld	a,(OFST+1,sp)
1014  0104 4a            	dec	a
1015  0105 2726          	jreq	L524
1016                     ; 244         TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1016                     ; 245                    (uint8_t)TIM3_ICFilter);
1018  0107 7b09          	ld	a,(OFST+7,sp)
1019  0109 88            	push	a
1020  010a 7b08          	ld	a,(OFST+6,sp)
1021  010c 97            	ld	xl,a
1022  010d 7b05          	ld	a,(OFST+3,sp)
1023  010f 95            	ld	xh,a
1024  0110 cd032d        	call	L3_TI1_Config
1026  0113 84            	pop	a
1027                     ; 248         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1029  0114 7b08          	ld	a,(OFST+6,sp)
1030  0116 cd0274        	call	_TIM3_SetIC1Prescaler
1032                     ; 251         TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1034  0119 7b09          	ld	a,(OFST+7,sp)
1035  011b 88            	push	a
1036  011c 7b03          	ld	a,(OFST+1,sp)
1037  011e 97            	ld	xl,a
1038  011f 7b02          	ld	a,(OFST+0,sp)
1039  0121 95            	ld	xh,a
1040  0122 cd035d        	call	L5_TI2_Config
1042  0125 84            	pop	a
1043                     ; 254         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1045  0126 7b08          	ld	a,(OFST+6,sp)
1046  0128 cd0281        	call	_TIM3_SetIC2Prescaler
1049  012b 2024          	jra	L724
1050  012d               L524:
1051                     ; 259         TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1051                     ; 260                    (uint8_t)TIM3_ICFilter);
1053  012d 7b09          	ld	a,(OFST+7,sp)
1054  012f 88            	push	a
1055  0130 7b08          	ld	a,(OFST+6,sp)
1056  0132 97            	ld	xl,a
1057  0133 7b05          	ld	a,(OFST+3,sp)
1058  0135 95            	ld	xh,a
1059  0136 cd035d        	call	L5_TI2_Config
1061  0139 84            	pop	a
1062                     ; 263         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1064  013a 7b08          	ld	a,(OFST+6,sp)
1065  013c cd0281        	call	_TIM3_SetIC2Prescaler
1067                     ; 266         TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1069  013f 7b09          	ld	a,(OFST+7,sp)
1070  0141 88            	push	a
1071  0142 7b03          	ld	a,(OFST+1,sp)
1072  0144 97            	ld	xl,a
1073  0145 7b02          	ld	a,(OFST+0,sp)
1074  0147 95            	ld	xh,a
1075  0148 cd032d        	call	L3_TI1_Config
1077  014b 84            	pop	a
1078                     ; 269         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1080  014c 7b08          	ld	a,(OFST+6,sp)
1081  014e cd0274        	call	_TIM3_SetIC1Prescaler
1083  0151               L724:
1084                     ; 271 }
1087  0151 5b04          	addw	sp,#4
1088  0153 81            	ret	
1143                     ; 280 void TIM3_Cmd(FunctionalState NewState)
1143                     ; 281 {
1144                     	switch	.text
1145  0154               _TIM3_Cmd:
1149                     ; 283     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1151                     ; 286     if (NewState != DISABLE)
1153  0154 4d            	tnz	a
1154  0155 2705          	jreq	L754
1155                     ; 288         TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
1157  0157 72105320      	bset	21280,#0
1160  015b 81            	ret	
1161  015c               L754:
1162                     ; 292         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
1164  015c 72115320      	bres	21280,#0
1165                     ; 294 }
1168  0160 81            	ret	
1240                     ; 309 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1240                     ; 310 {
1241                     	switch	.text
1242  0161               _TIM3_ITConfig:
1244  0161 89            	pushw	x
1245       00000000      OFST:	set	0
1248                     ; 312     assert_param(IS_TIM3_IT_OK(TIM3_IT));
1250                     ; 313     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1252                     ; 315     if (NewState != DISABLE)
1254  0162 9f            	ld	a,xl
1255  0163 4d            	tnz	a
1256  0164 2706          	jreq	L715
1257                     ; 318         TIM3->IER |= (uint8_t)TIM3_IT;
1259  0166 9e            	ld	a,xh
1260  0167 ca5321        	or	a,21281
1262  016a 2006          	jra	L125
1263  016c               L715:
1264                     ; 323         TIM3->IER &= (uint8_t)(~TIM3_IT);
1266  016c 7b01          	ld	a,(OFST+1,sp)
1267  016e 43            	cpl	a
1268  016f c45321        	and	a,21281
1269  0172               L125:
1270  0172 c75321        	ld	21281,a
1271                     ; 325 }
1274  0175 85            	popw	x
1275  0176 81            	ret	
1311                     ; 334 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1311                     ; 335 {
1312                     	switch	.text
1313  0177               _TIM3_UpdateDisableConfig:
1317                     ; 337     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1319                     ; 340     if (NewState != DISABLE)
1321  0177 4d            	tnz	a
1322  0178 2705          	jreq	L145
1323                     ; 342         TIM3->CR1 |= TIM3_CR1_UDIS;
1325  017a 72125320      	bset	21280,#1
1328  017e 81            	ret	
1329  017f               L145:
1330                     ; 346         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
1332  017f 72135320      	bres	21280,#1
1333                     ; 348 }
1336  0183 81            	ret	
1394                     ; 358 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1394                     ; 359 {
1395                     	switch	.text
1396  0184               _TIM3_UpdateRequestConfig:
1400                     ; 361     assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1402                     ; 364     if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1404  0184 4d            	tnz	a
1405  0185 2705          	jreq	L375
1406                     ; 366         TIM3->CR1 |= TIM3_CR1_URS;
1408  0187 72145320      	bset	21280,#2
1411  018b 81            	ret	
1412  018c               L375:
1413                     ; 370         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
1415  018c 72155320      	bres	21280,#2
1416                     ; 372 }
1419  0190 81            	ret	
1476                     ; 383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1476                     ; 384 {
1477                     	switch	.text
1478  0191               _TIM3_SelectOnePulseMode:
1482                     ; 386     assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1484                     ; 389     if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1486  0191 4d            	tnz	a
1487  0192 2705          	jreq	L526
1488                     ; 391         TIM3->CR1 |= TIM3_CR1_OPM;
1490  0194 72165320      	bset	21280,#3
1493  0198 81            	ret	
1494  0199               L526:
1495                     ; 395         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
1497  0199 72175320      	bres	21280,#3
1498                     ; 398 }
1501  019d 81            	ret	
1569                     ; 429 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
1569                     ; 430                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
1569                     ; 431 {
1570                     	switch	.text
1571  019e               _TIM3_PrescalerConfig:
1575                     ; 433     assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
1577                     ; 434     assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
1579                     ; 437     TIM3->PSCR = (uint8_t)Prescaler;
1581  019e 9e            	ld	a,xh
1582  019f c7532a        	ld	21290,a
1583                     ; 440     TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
1585  01a2 9f            	ld	a,xl
1586  01a3 c75324        	ld	21284,a
1587                     ; 441 }
1590  01a6 81            	ret	
1648                     ; 452 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1648                     ; 453 {
1649                     	switch	.text
1650  01a7               _TIM3_ForcedOC1Config:
1652  01a7 88            	push	a
1653       00000000      OFST:	set	0
1656                     ; 455     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1658                     ; 458     TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
1660  01a8 c65325        	ld	a,21285
1661  01ab a48f          	and	a,#143
1662  01ad 1a01          	or	a,(OFST+1,sp)
1663  01af c75325        	ld	21285,a
1664                     ; 459 }
1667  01b2 84            	pop	a
1668  01b3 81            	ret	
1704                     ; 470 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1704                     ; 471 {
1705                     	switch	.text
1706  01b4               _TIM3_ForcedOC2Config:
1708  01b4 88            	push	a
1709       00000000      OFST:	set	0
1712                     ; 473     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1714                     ; 476     TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
1716  01b5 c65326        	ld	a,21286
1717  01b8 a48f          	and	a,#143
1718  01ba 1a01          	or	a,(OFST+1,sp)
1719  01bc c75326        	ld	21286,a
1720                     ; 477 }
1723  01bf 84            	pop	a
1724  01c0 81            	ret	
1760                     ; 486 void TIM3_ARRPreloadConfig(FunctionalState NewState)
1760                     ; 487 {
1761                     	switch	.text
1762  01c1               _TIM3_ARRPreloadConfig:
1766                     ; 489     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1768                     ; 492     if (NewState != DISABLE)
1770  01c1 4d            	tnz	a
1771  01c2 2705          	jreq	L547
1772                     ; 494         TIM3->CR1 |= TIM3_CR1_ARPE;
1774  01c4 721e5320      	bset	21280,#7
1777  01c8 81            	ret	
1778  01c9               L547:
1779                     ; 498         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
1781  01c9 721f5320      	bres	21280,#7
1782                     ; 500 }
1785  01cd 81            	ret	
1821                     ; 509 void TIM3_OC1PreloadConfig(FunctionalState NewState)
1821                     ; 510 {
1822                     	switch	.text
1823  01ce               _TIM3_OC1PreloadConfig:
1827                     ; 512     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1829                     ; 515     if (NewState != DISABLE)
1831  01ce 4d            	tnz	a
1832  01cf 2705          	jreq	L767
1833                     ; 517         TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
1835  01d1 72165325      	bset	21285,#3
1838  01d5 81            	ret	
1839  01d6               L767:
1840                     ; 521         TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1842  01d6 72175325      	bres	21285,#3
1843                     ; 523 }
1846  01da 81            	ret	
1882                     ; 532 void TIM3_OC2PreloadConfig(FunctionalState NewState)
1882                     ; 533 {
1883                     	switch	.text
1884  01db               _TIM3_OC2PreloadConfig:
1888                     ; 535     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1890                     ; 538     if (NewState != DISABLE)
1892  01db 4d            	tnz	a
1893  01dc 2705          	jreq	L1101
1894                     ; 540         TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
1896  01de 72165326      	bset	21286,#3
1899  01e2 81            	ret	
1900  01e3               L1101:
1901                     ; 544         TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1903  01e3 72175326      	bres	21286,#3
1904                     ; 546 }
1907  01e7 81            	ret	
1972                     ; 557 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
1972                     ; 558 {
1973                     	switch	.text
1974  01e8               _TIM3_GenerateEvent:
1978                     ; 560     assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
1980                     ; 563     TIM3->EGR = (uint8_t)TIM3_EventSource;
1982  01e8 c75324        	ld	21284,a
1983                     ; 564 }
1986  01eb 81            	ret	
2022                     ; 575 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2022                     ; 576 {
2023                     	switch	.text
2024  01ec               _TIM3_OC1PolarityConfig:
2028                     ; 578     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2030                     ; 581     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2032  01ec 4d            	tnz	a
2033  01ed 2705          	jreq	L3601
2034                     ; 583         TIM3->CCER1 |= TIM3_CCER1_CC1P;
2036  01ef 72125327      	bset	21287,#1
2039  01f3 81            	ret	
2040  01f4               L3601:
2041                     ; 587         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
2043  01f4 72135327      	bres	21287,#1
2044                     ; 589 }
2047  01f8 81            	ret	
2083                     ; 600 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2083                     ; 601 {
2084                     	switch	.text
2085  01f9               _TIM3_OC2PolarityConfig:
2089                     ; 603     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2091                     ; 606     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2093  01f9 4d            	tnz	a
2094  01fa 2705          	jreq	L5011
2095                     ; 608         TIM3->CCER1 |= TIM3_CCER1_CC2P;
2097  01fc 721a5327      	bset	21287,#5
2100  0200 81            	ret	
2101  0201               L5011:
2102                     ; 612         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
2104  0201 721b5327      	bres	21287,#5
2105                     ; 614 }
2108  0205 81            	ret	
2153                     ; 627 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2153                     ; 628 {
2154                     	switch	.text
2155  0206               _TIM3_CCxCmd:
2157  0206 89            	pushw	x
2158       00000000      OFST:	set	0
2161                     ; 630     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2163                     ; 631     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2165                     ; 633     if (TIM3_Channel == TIM3_CHANNEL_1)
2167  0207 9e            	ld	a,xh
2168  0208 4d            	tnz	a
2169  0209 2610          	jrne	L3311
2170                     ; 636         if (NewState != DISABLE)
2172  020b 9f            	ld	a,xl
2173  020c 4d            	tnz	a
2174  020d 2706          	jreq	L5311
2175                     ; 638             TIM3->CCER1 |= TIM3_CCER1_CC1E;
2177  020f 72105327      	bset	21287,#0
2179  0213 2014          	jra	L1411
2180  0215               L5311:
2181                     ; 642             TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2183  0215 72115327      	bres	21287,#0
2184  0219 200e          	jra	L1411
2185  021b               L3311:
2186                     ; 649         if (NewState != DISABLE)
2188  021b 7b02          	ld	a,(OFST+2,sp)
2189  021d 2706          	jreq	L3411
2190                     ; 651             TIM3->CCER1 |= TIM3_CCER1_CC2E;
2192  021f 72185327      	bset	21287,#4
2194  0223 2004          	jra	L1411
2195  0225               L3411:
2196                     ; 655             TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2198  0225 72195327      	bres	21287,#4
2199  0229               L1411:
2200                     ; 659 }
2203  0229 85            	popw	x
2204  022a 81            	ret	
2249                     ; 680 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2249                     ; 681 {
2250                     	switch	.text
2251  022b               _TIM3_SelectOCxM:
2253  022b 89            	pushw	x
2254       00000000      OFST:	set	0
2257                     ; 683     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2259                     ; 684     assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2261                     ; 686     if (TIM3_Channel == TIM3_CHANNEL_1)
2263  022c 9e            	ld	a,xh
2264  022d 4d            	tnz	a
2265  022e 2610          	jrne	L1711
2266                     ; 689         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2268  0230 72115327      	bres	21287,#0
2269                     ; 692         TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2271  0234 c65325        	ld	a,21285
2272  0237 a48f          	and	a,#143
2273  0239 1a02          	or	a,(OFST+2,sp)
2274  023b c75325        	ld	21285,a
2276  023e 200e          	jra	L3711
2277  0240               L1711:
2278                     ; 697         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2280  0240 72195327      	bres	21287,#4
2281                     ; 700         TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2283  0244 c65326        	ld	a,21286
2284  0247 a48f          	and	a,#143
2285  0249 1a02          	or	a,(OFST+2,sp)
2286  024b c75326        	ld	21286,a
2287  024e               L3711:
2288                     ; 702 }
2291  024e 85            	popw	x
2292  024f 81            	ret	
2326                     ; 711 void TIM3_SetCounter(uint16_t Counter)
2326                     ; 712 {
2327                     	switch	.text
2328  0250               _TIM3_SetCounter:
2332                     ; 714     TIM3->CNTRH = (uint8_t)(Counter >> 8);
2334  0250 9e            	ld	a,xh
2335  0251 c75328        	ld	21288,a
2336                     ; 715     TIM3->CNTRL = (uint8_t)(Counter);
2338  0254 9f            	ld	a,xl
2339  0255 c75329        	ld	21289,a
2340                     ; 717 }
2343  0258 81            	ret	
2377                     ; 726 void TIM3_SetAutoreload(uint16_t Autoreload)
2377                     ; 727 {
2378                     	switch	.text
2379  0259               _TIM3_SetAutoreload:
2383                     ; 729     TIM3->ARRH = (uint8_t)(Autoreload >> 8);
2385  0259 9e            	ld	a,xh
2386  025a c7532b        	ld	21291,a
2387                     ; 730     TIM3->ARRL = (uint8_t)(Autoreload);
2389  025d 9f            	ld	a,xl
2390  025e c7532c        	ld	21292,a
2391                     ; 731 }
2394  0261 81            	ret	
2428                     ; 740 void TIM3_SetCompare1(uint16_t Compare1)
2428                     ; 741 {
2429                     	switch	.text
2430  0262               _TIM3_SetCompare1:
2434                     ; 743     TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
2436  0262 9e            	ld	a,xh
2437  0263 c7532d        	ld	21293,a
2438                     ; 744     TIM3->CCR1L = (uint8_t)(Compare1);
2440  0266 9f            	ld	a,xl
2441  0267 c7532e        	ld	21294,a
2442                     ; 745 }
2445  026a 81            	ret	
2479                     ; 754 void TIM3_SetCompare2(uint16_t Compare2)
2479                     ; 755 {
2480                     	switch	.text
2481  026b               _TIM3_SetCompare2:
2485                     ; 757     TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
2487  026b 9e            	ld	a,xh
2488  026c c7532f        	ld	21295,a
2489                     ; 758     TIM3->CCR2L = (uint8_t)(Compare2);
2491  026f 9f            	ld	a,xl
2492  0270 c75330        	ld	21296,a
2493                     ; 759 }
2496  0273 81            	ret	
2532                     ; 772 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
2532                     ; 773 {
2533                     	switch	.text
2534  0274               _TIM3_SetIC1Prescaler:
2536  0274 88            	push	a
2537       00000000      OFST:	set	0
2540                     ; 775     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
2542                     ; 778     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
2544  0275 c65325        	ld	a,21285
2545  0278 a4f3          	and	a,#243
2546  027a 1a01          	or	a,(OFST+1,sp)
2547  027c c75325        	ld	21285,a
2548                     ; 779 }
2551  027f 84            	pop	a
2552  0280 81            	ret	
2588                     ; 791 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
2588                     ; 792 {
2589                     	switch	.text
2590  0281               _TIM3_SetIC2Prescaler:
2592  0281 88            	push	a
2593       00000000      OFST:	set	0
2596                     ; 794     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
2598                     ; 797     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
2600  0282 c65326        	ld	a,21286
2601  0285 a4f3          	and	a,#243
2602  0287 1a01          	or	a,(OFST+1,sp)
2603  0289 c75326        	ld	21286,a
2604                     ; 798 }
2607  028c 84            	pop	a
2608  028d 81            	ret	
2660                     ; 804 uint16_t TIM3_GetCapture1(void)
2660                     ; 805 {
2661                     	switch	.text
2662  028e               _TIM3_GetCapture1:
2664  028e 5204          	subw	sp,#4
2665       00000004      OFST:	set	4
2668                     ; 807     uint16_t tmpccr1 = 0;
2670                     ; 808     uint8_t tmpccr1l=0, tmpccr1h=0;
2674                     ; 810     tmpccr1h = TIM3->CCR1H;
2676  0290 c6532d        	ld	a,21293
2677  0293 6b02          	ld	(OFST-2,sp),a
2678                     ; 811     tmpccr1l = TIM3->CCR1L;
2680  0295 c6532e        	ld	a,21294
2681  0298 6b01          	ld	(OFST-3,sp),a
2682                     ; 813     tmpccr1 = (uint16_t)(tmpccr1l);
2684  029a 5f            	clrw	x
2685  029b 97            	ld	xl,a
2686  029c 1f03          	ldw	(OFST-1,sp),x
2687                     ; 814     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
2689  029e 5f            	clrw	x
2690  029f 7b02          	ld	a,(OFST-2,sp)
2691  02a1 97            	ld	xl,a
2692  02a2 7b04          	ld	a,(OFST+0,sp)
2693  02a4 01            	rrwa	x,a
2694  02a5 1a03          	or	a,(OFST-1,sp)
2695  02a7 01            	rrwa	x,a
2696                     ; 816     return (uint16_t)tmpccr1;
2700  02a8 5b04          	addw	sp,#4
2701  02aa 81            	ret	
2753                     ; 824 uint16_t TIM3_GetCapture2(void)
2753                     ; 825 {
2754                     	switch	.text
2755  02ab               _TIM3_GetCapture2:
2757  02ab 5204          	subw	sp,#4
2758       00000004      OFST:	set	4
2761                     ; 827     uint16_t tmpccr2 = 0;
2763                     ; 828     uint8_t tmpccr2l=0, tmpccr2h=0;
2767                     ; 830     tmpccr2h = TIM3->CCR2H;
2769  02ad c6532f        	ld	a,21295
2770  02b0 6b02          	ld	(OFST-2,sp),a
2771                     ; 831     tmpccr2l = TIM3->CCR2L;
2773  02b2 c65330        	ld	a,21296
2774  02b5 6b01          	ld	(OFST-3,sp),a
2775                     ; 833     tmpccr2 = (uint16_t)(tmpccr2l);
2777  02b7 5f            	clrw	x
2778  02b8 97            	ld	xl,a
2779  02b9 1f03          	ldw	(OFST-1,sp),x
2780                     ; 834     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
2782  02bb 5f            	clrw	x
2783  02bc 7b02          	ld	a,(OFST-2,sp)
2784  02be 97            	ld	xl,a
2785  02bf 7b04          	ld	a,(OFST+0,sp)
2786  02c1 01            	rrwa	x,a
2787  02c2 1a03          	or	a,(OFST-1,sp)
2788  02c4 01            	rrwa	x,a
2789                     ; 836     return (uint16_t)tmpccr2;
2793  02c5 5b04          	addw	sp,#4
2794  02c7 81            	ret	
2828                     ; 844 uint16_t TIM3_GetCounter(void)
2828                     ; 845 {
2829                     	switch	.text
2830  02c8               _TIM3_GetCounter:
2832  02c8 89            	pushw	x
2833       00000002      OFST:	set	2
2836                     ; 846    uint16_t tmpcntr = 0;
2838                     ; 848    tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
2840  02c9 c65328        	ld	a,21288
2841  02cc 97            	ld	xl,a
2842  02cd 4f            	clr	a
2843  02ce 02            	rlwa	x,a
2844  02cf 1f01          	ldw	(OFST-1,sp),x
2845                     ; 850     return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
2847  02d1 5f            	clrw	x
2848  02d2 c65329        	ld	a,21289
2849  02d5 97            	ld	xl,a
2850  02d6 01            	rrwa	x,a
2851  02d7 1a02          	or	a,(OFST+0,sp)
2852  02d9 01            	rrwa	x,a
2853  02da 1a01          	or	a,(OFST-1,sp)
2854  02dc 01            	rrwa	x,a
2857  02dd 5b02          	addw	sp,#2
2858  02df 81            	ret	
2882                     ; 859 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
2882                     ; 860 {
2883                     	switch	.text
2884  02e0               _TIM3_GetPrescaler:
2888                     ; 862     return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
2890  02e0 c6532a        	ld	a,21290
2893  02e3 81            	ret	
3018                     ; 877 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3018                     ; 878 {
3019                     	switch	.text
3020  02e4               _TIM3_GetFlagStatus:
3022  02e4 89            	pushw	x
3023  02e5 89            	pushw	x
3024       00000002      OFST:	set	2
3027                     ; 879    FlagStatus bitstatus = RESET;
3029                     ; 880    uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3033                     ; 883     assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3035                     ; 885     tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
3037  02e6 9f            	ld	a,xl
3038  02e7 c45322        	and	a,21282
3039  02ea 6b01          	ld	(OFST-1,sp),a
3040                     ; 886     tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
3042  02ec 7b03          	ld	a,(OFST+1,sp)
3043  02ee 6b02          	ld	(OFST+0,sp),a
3044                     ; 888     if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
3046  02f0 c45323        	and	a,21283
3047  02f3 1a01          	or	a,(OFST-1,sp)
3048  02f5 2702          	jreq	L3051
3049                     ; 890         bitstatus = SET;
3051  02f7 a601          	ld	a,#1
3053  02f9               L3051:
3054                     ; 894         bitstatus = RESET;
3056                     ; 896     return (FlagStatus)bitstatus;
3060  02f9 5b04          	addw	sp,#4
3061  02fb 81            	ret	
3096                     ; 911 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3096                     ; 912 {
3097                     	switch	.text
3098  02fc               _TIM3_ClearFlag:
3100  02fc 89            	pushw	x
3101       00000000      OFST:	set	0
3104                     ; 914     assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3106                     ; 917     TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
3108  02fd 9f            	ld	a,xl
3109  02fe 43            	cpl	a
3110  02ff c75322        	ld	21282,a
3111                     ; 918     TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
3113  0302 7b01          	ld	a,(OFST+1,sp)
3114  0304 43            	cpl	a
3115  0305 c75323        	ld	21283,a
3116                     ; 919 }
3119  0308 85            	popw	x
3120  0309 81            	ret	
3184                     ; 932 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
3184                     ; 933 {
3185                     	switch	.text
3186  030a               _TIM3_GetITStatus:
3188  030a 88            	push	a
3189  030b 89            	pushw	x
3190       00000002      OFST:	set	2
3193                     ; 934     ITStatus bitstatus = RESET;
3195                     ; 935     uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
3199                     ; 938     assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
3201                     ; 940     TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
3203  030c c45322        	and	a,21282
3204  030f 6b01          	ld	(OFST-1,sp),a
3205                     ; 942     TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
3207  0311 c65321        	ld	a,21281
3208  0314 1403          	and	a,(OFST+1,sp)
3209  0316 6b02          	ld	(OFST+0,sp),a
3210                     ; 944     if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
3212  0318 7b01          	ld	a,(OFST-1,sp)
3213  031a 2708          	jreq	L7551
3215  031c 7b02          	ld	a,(OFST+0,sp)
3216  031e 2704          	jreq	L7551
3217                     ; 946         bitstatus = SET;
3219  0320 a601          	ld	a,#1
3221  0322 2001          	jra	L1651
3222  0324               L7551:
3223                     ; 950         bitstatus = RESET;
3225  0324 4f            	clr	a
3226  0325               L1651:
3227                     ; 952     return (ITStatus)(bitstatus);
3231  0325 5b03          	addw	sp,#3
3232  0327 81            	ret	
3268                     ; 965 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
3268                     ; 966 {
3269                     	switch	.text
3270  0328               _TIM3_ClearITPendingBit:
3274                     ; 968     assert_param(IS_TIM3_IT_OK(TIM3_IT));
3276                     ; 971     TIM3->SR1 = (uint8_t)(~TIM3_IT);
3278  0328 43            	cpl	a
3279  0329 c75322        	ld	21282,a
3280                     ; 972 }
3283  032c 81            	ret	
3335                     ; 991 static void TI1_Config(uint8_t TIM3_ICPolarity,
3335                     ; 992                        uint8_t TIM3_ICSelection,
3335                     ; 993                        uint8_t TIM3_ICFilter)
3335                     ; 994 {
3336                     	switch	.text
3337  032d               L3_TI1_Config:
3339  032d 89            	pushw	x
3340       00000001      OFST:	set	1
3343                     ; 996     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
3345  032e 72115327      	bres	21287,#0
3346  0332 88            	push	a
3347                     ; 999     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
3349  0333 7b06          	ld	a,(OFST+5,sp)
3350  0335 97            	ld	xl,a
3351  0336 a610          	ld	a,#16
3352  0338 42            	mul	x,a
3353  0339 9f            	ld	a,xl
3354  033a 1a03          	or	a,(OFST+2,sp)
3355  033c 6b01          	ld	(OFST+0,sp),a
3356  033e c65325        	ld	a,21285
3357  0341 a40c          	and	a,#12
3358  0343 1a01          	or	a,(OFST+0,sp)
3359  0345 c75325        	ld	21285,a
3360                     ; 1002     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3362  0348 7b02          	ld	a,(OFST+1,sp)
3363  034a 2706          	jreq	L7261
3364                     ; 1004         TIM3->CCER1 |= TIM3_CCER1_CC1P;
3366  034c 72125327      	bset	21287,#1
3368  0350 2004          	jra	L1361
3369  0352               L7261:
3370                     ; 1008         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
3372  0352 72135327      	bres	21287,#1
3373  0356               L1361:
3374                     ; 1011     TIM3->CCER1 |= TIM3_CCER1_CC1E;
3376  0356 72105327      	bset	21287,#0
3377                     ; 1012 }
3380  035a 5b03          	addw	sp,#3
3381  035c 81            	ret	
3433                     ; 1031 static void TI2_Config(uint8_t TIM3_ICPolarity,
3433                     ; 1032                        uint8_t TIM3_ICSelection,
3433                     ; 1033                        uint8_t TIM3_ICFilter)
3433                     ; 1034 {
3434                     	switch	.text
3435  035d               L5_TI2_Config:
3437  035d 89            	pushw	x
3438       00000001      OFST:	set	1
3441                     ; 1036     TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
3443  035e 72195327      	bres	21287,#4
3444  0362 88            	push	a
3445                     ; 1039     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
3445                     ; 1040                   TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
3445                     ; 1041                   ((uint8_t)( TIM3_ICFilter << 4))));
3447  0363 7b06          	ld	a,(OFST+5,sp)
3448  0365 97            	ld	xl,a
3449  0366 a610          	ld	a,#16
3450  0368 42            	mul	x,a
3451  0369 9f            	ld	a,xl
3452  036a 1a03          	or	a,(OFST+2,sp)
3453  036c 6b01          	ld	(OFST+0,sp),a
3454  036e c65326        	ld	a,21286
3455  0371 a40c          	and	a,#12
3456  0373 1a01          	or	a,(OFST+0,sp)
3457  0375 c75326        	ld	21286,a
3458                     ; 1044     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3460  0378 7b02          	ld	a,(OFST+1,sp)
3461  037a 2706          	jreq	L1661
3462                     ; 1046         TIM3->CCER1 |= TIM3_CCER1_CC2P;
3464  037c 721a5327      	bset	21287,#5
3466  0380 2004          	jra	L3661
3467  0382               L1661:
3468                     ; 1050         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
3470  0382 721b5327      	bres	21287,#5
3471  0386               L3661:
3472                     ; 1054     TIM3->CCER1 |= TIM3_CCER1_CC2E;
3474  0386 72185327      	bset	21287,#4
3475                     ; 1056 }
3478  038a 5b03          	addw	sp,#3
3479  038c 81            	ret	
3492                     	xdef	_TIM3_ClearITPendingBit
3493                     	xdef	_TIM3_GetITStatus
3494                     	xdef	_TIM3_ClearFlag
3495                     	xdef	_TIM3_GetFlagStatus
3496                     	xdef	_TIM3_GetPrescaler
3497                     	xdef	_TIM3_GetCounter
3498                     	xdef	_TIM3_GetCapture2
3499                     	xdef	_TIM3_GetCapture1
3500                     	xdef	_TIM3_SetIC2Prescaler
3501                     	xdef	_TIM3_SetIC1Prescaler
3502                     	xdef	_TIM3_SetCompare2
3503                     	xdef	_TIM3_SetCompare1
3504                     	xdef	_TIM3_SetAutoreload
3505                     	xdef	_TIM3_SetCounter
3506                     	xdef	_TIM3_SelectOCxM
3507                     	xdef	_TIM3_CCxCmd
3508                     	xdef	_TIM3_OC2PolarityConfig
3509                     	xdef	_TIM3_OC1PolarityConfig
3510                     	xdef	_TIM3_GenerateEvent
3511                     	xdef	_TIM3_OC2PreloadConfig
3512                     	xdef	_TIM3_OC1PreloadConfig
3513                     	xdef	_TIM3_ARRPreloadConfig
3514                     	xdef	_TIM3_ForcedOC2Config
3515                     	xdef	_TIM3_ForcedOC1Config
3516                     	xdef	_TIM3_PrescalerConfig
3517                     	xdef	_TIM3_SelectOnePulseMode
3518                     	xdef	_TIM3_UpdateRequestConfig
3519                     	xdef	_TIM3_UpdateDisableConfig
3520                     	xdef	_TIM3_ITConfig
3521                     	xdef	_TIM3_Cmd
3522                     	xdef	_TIM3_PWMIConfig
3523                     	xdef	_TIM3_ICInit
3524                     	xdef	_TIM3_OC2Init
3525                     	xdef	_TIM3_OC1Init
3526                     	xdef	_TIM3_TimeBaseInit
3527                     	xdef	_TIM3_DeInit
3546                     	end
