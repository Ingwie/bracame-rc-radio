   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  46                     ; 46 void TIM2_DeInit(void)
  46                     ; 47 {
  48                     	switch	.text
  49  0000               _TIM2_DeInit:
  53                     ; 49     TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  55  0000 725f5300      	clr	21248
  56                     ; 50     TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  58  0004 725f5301      	clr	21249
  59                     ; 51     TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  61  0008 725f5303      	clr	21251
  62                     ; 54     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  64  000c 725f5308      	clr	21256
  65                     ; 55     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  67  0010 725f5309      	clr	21257
  68                     ; 59     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  70  0014 725f5308      	clr	21256
  71                     ; 60     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  73  0018 725f5309      	clr	21257
  74                     ; 61     TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  76  001c 725f5305      	clr	21253
  77                     ; 62     TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  79  0020 725f5306      	clr	21254
  80                     ; 63     TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  82  0024 725f5307      	clr	21255
  83                     ; 64     TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  85  0028 725f530a      	clr	21258
  86                     ; 65     TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  88  002c 725f530b      	clr	21259
  89                     ; 66     TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  91  0030 725f530c      	clr	21260
  92                     ; 67     TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  94  0034 35ff530d      	mov	21261,#255
  95                     ; 68     TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  97  0038 35ff530e      	mov	21262,#255
  98                     ; 69     TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
 100  003c 725f530f      	clr	21263
 101                     ; 70     TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 103  0040 725f5310      	clr	21264
 104                     ; 71     TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 106  0044 725f5311      	clr	21265
 107                     ; 72     TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 109  0048 725f5312      	clr	21266
 110                     ; 73     TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 112  004c 725f5313      	clr	21267
 113                     ; 74     TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 115  0050 725f5314      	clr	21268
 116                     ; 75     TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 118  0054 725f5302      	clr	21250
 119                     ; 76 }
 122  0058 81            	ret	
 290                     ; 85 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 290                     ; 86                         uint16_t TIM2_Period)
 290                     ; 87 {
 291                     	switch	.text
 292  0059               _TIM2_TimeBaseInit:
 294       00000000      OFST:	set	0
 297                     ; 89     TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 299  0059 c7530c        	ld	21260,a
 300  005c 88            	push	a
 301                     ; 91     TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 303  005d 7b04          	ld	a,(OFST+4,sp)
 304  005f c7530d        	ld	21261,a
 305                     ; 92     TIM2->ARRL = (uint8_t)(TIM2_Period);
 307  0062 7b05          	ld	a,(OFST+5,sp)
 308  0064 c7530e        	ld	21262,a
 309                     ; 93 }
 312  0067 84            	pop	a
 313  0068 81            	ret	
 470                     ; 104 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 470                     ; 105                   TIM2_OutputState_TypeDef TIM2_OutputState,
 470                     ; 106                   uint16_t TIM2_Pulse,
 470                     ; 107                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 470                     ; 108 {
 471                     	switch	.text
 472  0069               _TIM2_OC1Init:
 474  0069 89            	pushw	x
 475  006a 88            	push	a
 476       00000001      OFST:	set	1
 479                     ; 110     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 481                     ; 111     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 483                     ; 112     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 485                     ; 115     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 487  006b c65308        	ld	a,21256
 488  006e a4fc          	and	a,#252
 489  0070 c75308        	ld	21256,a
 490                     ; 117     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 490                     ; 118                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 492  0073 7b08          	ld	a,(OFST+7,sp)
 493  0075 a402          	and	a,#2
 494  0077 6b01          	ld	(OFST+0,sp),a
 495  0079 9f            	ld	a,xl
 496  007a a401          	and	a,#1
 497  007c 1a01          	or	a,(OFST+0,sp)
 498  007e ca5308        	or	a,21256
 499  0081 c75308        	ld	21256,a
 500                     ; 121     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 500                     ; 122                             (uint8_t)TIM2_OCMode);
 502  0084 c65305        	ld	a,21253
 503  0087 a48f          	and	a,#143
 504  0089 1a02          	or	a,(OFST+1,sp)
 505  008b c75305        	ld	21253,a
 506                     ; 125     TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 508  008e 7b06          	ld	a,(OFST+5,sp)
 509  0090 c7530f        	ld	21263,a
 510                     ; 126     TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 512  0093 7b07          	ld	a,(OFST+6,sp)
 513  0095 c75310        	ld	21264,a
 514                     ; 127 }
 517  0098 5b03          	addw	sp,#3
 518  009a 81            	ret	
 582                     ; 138 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 582                     ; 139                   TIM2_OutputState_TypeDef TIM2_OutputState,
 582                     ; 140                   uint16_t TIM2_Pulse,
 582                     ; 141                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 582                     ; 142 {
 583                     	switch	.text
 584  009b               _TIM2_OC2Init:
 586  009b 89            	pushw	x
 587  009c 88            	push	a
 588       00000001      OFST:	set	1
 591                     ; 144     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 593                     ; 145     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 595                     ; 146     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 597                     ; 150     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 599  009d c65308        	ld	a,21256
 600  00a0 a4cf          	and	a,#207
 601  00a2 c75308        	ld	21256,a
 602                     ; 152     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 602                     ; 153                         (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 604  00a5 7b08          	ld	a,(OFST+7,sp)
 605  00a7 a420          	and	a,#32
 606  00a9 6b01          	ld	(OFST+0,sp),a
 607  00ab 9f            	ld	a,xl
 608  00ac a410          	and	a,#16
 609  00ae 1a01          	or	a,(OFST+0,sp)
 610  00b0 ca5308        	or	a,21256
 611  00b3 c75308        	ld	21256,a
 612                     ; 157     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 612                     ; 158                             (uint8_t)TIM2_OCMode);
 614  00b6 c65306        	ld	a,21254
 615  00b9 a48f          	and	a,#143
 616  00bb 1a02          	or	a,(OFST+1,sp)
 617  00bd c75306        	ld	21254,a
 618                     ; 162     TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 620  00c0 7b06          	ld	a,(OFST+5,sp)
 621  00c2 c75311        	ld	21265,a
 622                     ; 163     TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 624  00c5 7b07          	ld	a,(OFST+6,sp)
 625  00c7 c75312        	ld	21266,a
 626                     ; 164 }
 629  00ca 5b03          	addw	sp,#3
 630  00cc 81            	ret	
 694                     ; 175 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 694                     ; 176                   TIM2_OutputState_TypeDef TIM2_OutputState,
 694                     ; 177                   uint16_t TIM2_Pulse,
 694                     ; 178                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 694                     ; 179 {
 695                     	switch	.text
 696  00cd               _TIM2_OC3Init:
 698  00cd 89            	pushw	x
 699  00ce 88            	push	a
 700       00000001      OFST:	set	1
 703                     ; 181     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 705                     ; 182     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 707                     ; 183     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 709                     ; 185     TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 711  00cf c65309        	ld	a,21257
 712  00d2 a4fc          	and	a,#252
 713  00d4 c75309        	ld	21257,a
 714                     ; 187     TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 714                     ; 188                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 716  00d7 7b08          	ld	a,(OFST+7,sp)
 717  00d9 a402          	and	a,#2
 718  00db 6b01          	ld	(OFST+0,sp),a
 719  00dd 9f            	ld	a,xl
 720  00de a401          	and	a,#1
 721  00e0 1a01          	or	a,(OFST+0,sp)
 722  00e2 ca5309        	or	a,21257
 723  00e5 c75309        	ld	21257,a
 724                     ; 191     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 724                     ; 192                             (uint8_t)TIM2_OCMode);
 726  00e8 c65307        	ld	a,21255
 727  00eb a48f          	and	a,#143
 728  00ed 1a02          	or	a,(OFST+1,sp)
 729  00ef c75307        	ld	21255,a
 730                     ; 195     TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 732  00f2 7b06          	ld	a,(OFST+5,sp)
 733  00f4 c75313        	ld	21267,a
 734                     ; 196     TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 736  00f7 7b07          	ld	a,(OFST+6,sp)
 737  00f9 c75314        	ld	21268,a
 738                     ; 198 }
 741  00fc 5b03          	addw	sp,#3
 742  00fe 81            	ret	
 935                     ; 210 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 935                     ; 211                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 935                     ; 212                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 935                     ; 213                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 935                     ; 214                  uint8_t TIM2_ICFilter)
 935                     ; 215 {
 936                     	switch	.text
 937  00ff               _TIM2_ICInit:
 939  00ff 89            	pushw	x
 940       00000000      OFST:	set	0
 943                     ; 217     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 945                     ; 218     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 947                     ; 219     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 949                     ; 220     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 951                     ; 221     assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 953                     ; 223     if (TIM2_Channel == TIM2_CHANNEL_1)
 955  0100 9e            	ld	a,xh
 956  0101 4d            	tnz	a
 957  0102 2614          	jrne	L104
 958                     ; 226         TI1_Config((uint8_t)TIM2_ICPolarity,
 958                     ; 227                    (uint8_t)TIM2_ICSelection,
 958                     ; 228                    (uint8_t)TIM2_ICFilter);
 960  0104 7b07          	ld	a,(OFST+7,sp)
 961  0106 88            	push	a
 962  0107 7b06          	ld	a,(OFST+6,sp)
 963  0109 97            	ld	xl,a
 964  010a 7b03          	ld	a,(OFST+3,sp)
 965  010c 95            	ld	xh,a
 966  010d cd040b        	call	L3_TI1_Config
 968  0110 84            	pop	a
 969                     ; 231         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 971  0111 7b06          	ld	a,(OFST+6,sp)
 972  0113 cd032c        	call	_TIM2_SetIC1Prescaler
 975  0116 202b          	jra	L304
 976  0118               L104:
 977                     ; 233     else if (TIM2_Channel == TIM2_CHANNEL_2)
 979  0118 7b01          	ld	a,(OFST+1,sp)
 980  011a 4a            	dec	a
 981  011b 2614          	jrne	L504
 982                     ; 236         TI2_Config((uint8_t)TIM2_ICPolarity,
 982                     ; 237                    (uint8_t)TIM2_ICSelection,
 982                     ; 238                    (uint8_t)TIM2_ICFilter);
 984  011d 7b07          	ld	a,(OFST+7,sp)
 985  011f 88            	push	a
 986  0120 7b06          	ld	a,(OFST+6,sp)
 987  0122 97            	ld	xl,a
 988  0123 7b03          	ld	a,(OFST+3,sp)
 989  0125 95            	ld	xh,a
 990  0126 cd043b        	call	L5_TI2_Config
 992  0129 84            	pop	a
 993                     ; 241         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 995  012a 7b06          	ld	a,(OFST+6,sp)
 996  012c cd0339        	call	_TIM2_SetIC2Prescaler
 999  012f 2012          	jra	L304
1000  0131               L504:
1001                     ; 246         TI3_Config((uint8_t)TIM2_ICPolarity,
1001                     ; 247                    (uint8_t)TIM2_ICSelection,
1001                     ; 248                    (uint8_t)TIM2_ICFilter);
1003  0131 7b07          	ld	a,(OFST+7,sp)
1004  0133 88            	push	a
1005  0134 7b06          	ld	a,(OFST+6,sp)
1006  0136 97            	ld	xl,a
1007  0137 7b03          	ld	a,(OFST+3,sp)
1008  0139 95            	ld	xh,a
1009  013a cd046b        	call	L7_TI3_Config
1011  013d 84            	pop	a
1012                     ; 251         TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1014  013e 7b06          	ld	a,(OFST+6,sp)
1015  0140 cd0346        	call	_TIM2_SetIC3Prescaler
1017  0143               L304:
1018                     ; 253 }
1021  0143 85            	popw	x
1022  0144 81            	ret	
1118                     ; 265 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1118                     ; 266                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1118                     ; 267                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1118                     ; 268                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1118                     ; 269                      uint8_t TIM2_ICFilter)
1118                     ; 270 {
1119                     	switch	.text
1120  0145               _TIM2_PWMIConfig:
1122  0145 89            	pushw	x
1123  0146 89            	pushw	x
1124       00000002      OFST:	set	2
1127                     ; 271     uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1129                     ; 272     uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1131                     ; 275     assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1133                     ; 276     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1135                     ; 277     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1137                     ; 278     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1139                     ; 281     if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1141  0147 9f            	ld	a,xl
1142  0148 a144          	cp	a,#68
1143  014a 2706          	jreq	L754
1144                     ; 283         icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1146  014c a644          	ld	a,#68
1147  014e 6b01          	ld	(OFST-1,sp),a
1149  0150 2002          	jra	L164
1150  0152               L754:
1151                     ; 287         icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1153  0152 0f01          	clr	(OFST-1,sp)
1154  0154               L164:
1155                     ; 291     if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1157  0154 7b07          	ld	a,(OFST+5,sp)
1158  0156 4a            	dec	a
1159  0157 2604          	jrne	L364
1160                     ; 293         icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1162  0159 a602          	ld	a,#2
1164  015b 2002          	jra	L564
1165  015d               L364:
1166                     ; 297         icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1168  015d a601          	ld	a,#1
1169  015f               L564:
1170  015f 6b02          	ld	(OFST+0,sp),a
1171                     ; 300     if (TIM2_Channel == TIM2_CHANNEL_1)
1173  0161 7b03          	ld	a,(OFST+1,sp)
1174  0163 2626          	jrne	L764
1175                     ; 303         TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1175                     ; 304                    (uint8_t)TIM2_ICFilter);
1177  0165 7b09          	ld	a,(OFST+7,sp)
1178  0167 88            	push	a
1179  0168 7b08          	ld	a,(OFST+6,sp)
1180  016a 97            	ld	xl,a
1181  016b 7b05          	ld	a,(OFST+3,sp)
1182  016d 95            	ld	xh,a
1183  016e cd040b        	call	L3_TI1_Config
1185  0171 84            	pop	a
1186                     ; 307         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1188  0172 7b08          	ld	a,(OFST+6,sp)
1189  0174 cd032c        	call	_TIM2_SetIC1Prescaler
1191                     ; 310         TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1193  0177 7b09          	ld	a,(OFST+7,sp)
1194  0179 88            	push	a
1195  017a 7b03          	ld	a,(OFST+1,sp)
1196  017c 97            	ld	xl,a
1197  017d 7b02          	ld	a,(OFST+0,sp)
1198  017f 95            	ld	xh,a
1199  0180 cd043b        	call	L5_TI2_Config
1201  0183 84            	pop	a
1202                     ; 313         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1204  0184 7b08          	ld	a,(OFST+6,sp)
1205  0186 cd0339        	call	_TIM2_SetIC2Prescaler
1208  0189 2024          	jra	L174
1209  018b               L764:
1210                     ; 318         TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1210                     ; 319                    (uint8_t)TIM2_ICFilter);
1212  018b 7b09          	ld	a,(OFST+7,sp)
1213  018d 88            	push	a
1214  018e 7b08          	ld	a,(OFST+6,sp)
1215  0190 97            	ld	xl,a
1216  0191 7b05          	ld	a,(OFST+3,sp)
1217  0193 95            	ld	xh,a
1218  0194 cd043b        	call	L5_TI2_Config
1220  0197 84            	pop	a
1221                     ; 322         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1223  0198 7b08          	ld	a,(OFST+6,sp)
1224  019a cd0339        	call	_TIM2_SetIC2Prescaler
1226                     ; 325         TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1228  019d 7b09          	ld	a,(OFST+7,sp)
1229  019f 88            	push	a
1230  01a0 7b03          	ld	a,(OFST+1,sp)
1231  01a2 97            	ld	xl,a
1232  01a3 7b02          	ld	a,(OFST+0,sp)
1233  01a5 95            	ld	xh,a
1234  01a6 cd040b        	call	L3_TI1_Config
1236  01a9 84            	pop	a
1237                     ; 328         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1239  01aa 7b08          	ld	a,(OFST+6,sp)
1240  01ac cd032c        	call	_TIM2_SetIC1Prescaler
1242  01af               L174:
1243                     ; 330 }
1246  01af 5b04          	addw	sp,#4
1247  01b1 81            	ret	
1302                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1302                     ; 340 {
1303                     	switch	.text
1304  01b2               _TIM2_Cmd:
1308                     ; 342     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1310                     ; 345     if (NewState != DISABLE)
1312  01b2 4d            	tnz	a
1313  01b3 2705          	jreq	L125
1314                     ; 347         TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1316  01b5 72105300      	bset	21248,#0
1319  01b9 81            	ret	
1320  01ba               L125:
1321                     ; 351         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1323  01ba 72115300      	bres	21248,#0
1324                     ; 353 }
1327  01be 81            	ret	
1406                     ; 369 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1406                     ; 370 {
1407                     	switch	.text
1408  01bf               _TIM2_ITConfig:
1410  01bf 89            	pushw	x
1411       00000000      OFST:	set	0
1414                     ; 372     assert_param(IS_TIM2_IT_OK(TIM2_IT));
1416                     ; 373     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1418                     ; 375     if (NewState != DISABLE)
1420  01c0 9f            	ld	a,xl
1421  01c1 4d            	tnz	a
1422  01c2 2706          	jreq	L365
1423                     ; 378         TIM2->IER |= (uint8_t)TIM2_IT;
1425  01c4 9e            	ld	a,xh
1426  01c5 ca5301        	or	a,21249
1428  01c8 2006          	jra	L565
1429  01ca               L365:
1430                     ; 383         TIM2->IER &= (uint8_t)(~TIM2_IT);
1432  01ca 7b01          	ld	a,(OFST+1,sp)
1433  01cc 43            	cpl	a
1434  01cd c45301        	and	a,21249
1435  01d0               L565:
1436  01d0 c75301        	ld	21249,a
1437                     ; 385 }
1440  01d3 85            	popw	x
1441  01d4 81            	ret	
1477                     ; 394 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1477                     ; 395 {
1478                     	switch	.text
1479  01d5               _TIM2_UpdateDisableConfig:
1483                     ; 397     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1485                     ; 400     if (NewState != DISABLE)
1487  01d5 4d            	tnz	a
1488  01d6 2705          	jreq	L506
1489                     ; 402         TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1491  01d8 72125300      	bset	21248,#1
1494  01dc 81            	ret	
1495  01dd               L506:
1496                     ; 406         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1498  01dd 72135300      	bres	21248,#1
1499                     ; 408 }
1502  01e1 81            	ret	
1560                     ; 418 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1560                     ; 419 {
1561                     	switch	.text
1562  01e2               _TIM2_UpdateRequestConfig:
1566                     ; 421     assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1568                     ; 424     if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1570  01e2 4d            	tnz	a
1571  01e3 2705          	jreq	L736
1572                     ; 426         TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1574  01e5 72145300      	bset	21248,#2
1577  01e9 81            	ret	
1578  01ea               L736:
1579                     ; 430         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1581  01ea 72155300      	bres	21248,#2
1582                     ; 432 }
1585  01ee 81            	ret	
1642                     ; 443 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1642                     ; 444 {
1643                     	switch	.text
1644  01ef               _TIM2_SelectOnePulseMode:
1648                     ; 446     assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1650                     ; 449     if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1652  01ef 4d            	tnz	a
1653  01f0 2705          	jreq	L176
1654                     ; 451         TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1656  01f2 72165300      	bset	21248,#3
1659  01f6 81            	ret	
1660  01f7               L176:
1661                     ; 455         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1663  01f7 72175300      	bres	21248,#3
1664                     ; 458 }
1667  01fb 81            	ret	
1735                     ; 489 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1735                     ; 490                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1735                     ; 491 {
1736                     	switch	.text
1737  01fc               _TIM2_PrescalerConfig:
1741                     ; 493     assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1743                     ; 494     assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1745                     ; 497     TIM2->PSCR = (uint8_t)Prescaler;
1747  01fc 9e            	ld	a,xh
1748  01fd c7530c        	ld	21260,a
1749                     ; 500     TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1751  0200 9f            	ld	a,xl
1752  0201 c75304        	ld	21252,a
1753                     ; 501 }
1756  0204 81            	ret	
1814                     ; 512 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1814                     ; 513 {
1815                     	switch	.text
1816  0205               _TIM2_ForcedOC1Config:
1818  0205 88            	push	a
1819       00000000      OFST:	set	0
1822                     ; 515     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1824                     ; 518     TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1824                     ; 519                               | (uint8_t)TIM2_ForcedAction);
1826  0206 c65305        	ld	a,21253
1827  0209 a48f          	and	a,#143
1828  020b 1a01          	or	a,(OFST+1,sp)
1829  020d c75305        	ld	21253,a
1830                     ; 520 }
1833  0210 84            	pop	a
1834  0211 81            	ret	
1870                     ; 531 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1870                     ; 532 {
1871                     	switch	.text
1872  0212               _TIM2_ForcedOC2Config:
1874  0212 88            	push	a
1875       00000000      OFST:	set	0
1878                     ; 534     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1880                     ; 537     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1880                     ; 538                             | (uint8_t)TIM2_ForcedAction);
1882  0213 c65306        	ld	a,21254
1883  0216 a48f          	and	a,#143
1884  0218 1a01          	or	a,(OFST+1,sp)
1885  021a c75306        	ld	21254,a
1886                     ; 539 }
1889  021d 84            	pop	a
1890  021e 81            	ret	
1926                     ; 550 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1926                     ; 551 {
1927                     	switch	.text
1928  021f               _TIM2_ForcedOC3Config:
1930  021f 88            	push	a
1931       00000000      OFST:	set	0
1934                     ; 553     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1936                     ; 556     TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1936                     ; 557                               | (uint8_t)TIM2_ForcedAction);
1938  0220 c65307        	ld	a,21255
1939  0223 a48f          	and	a,#143
1940  0225 1a01          	or	a,(OFST+1,sp)
1941  0227 c75307        	ld	21255,a
1942                     ; 558 }
1945  022a 84            	pop	a
1946  022b 81            	ret	
1982                     ; 567 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1982                     ; 568 {
1983                     	switch	.text
1984  022c               _TIM2_ARRPreloadConfig:
1988                     ; 570     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1990                     ; 573     if (NewState != DISABLE)
1992  022c 4d            	tnz	a
1993  022d 2705          	jreq	L7201
1994                     ; 575         TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
1996  022f 721e5300      	bset	21248,#7
1999  0233 81            	ret	
2000  0234               L7201:
2001                     ; 579         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2003  0234 721f5300      	bres	21248,#7
2004                     ; 581 }
2007  0238 81            	ret	
2043                     ; 590 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2043                     ; 591 {
2044                     	switch	.text
2045  0239               _TIM2_OC1PreloadConfig:
2049                     ; 593     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2051                     ; 596     if (NewState != DISABLE)
2053  0239 4d            	tnz	a
2054  023a 2705          	jreq	L1501
2055                     ; 598         TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2057  023c 72165305      	bset	21253,#3
2060  0240 81            	ret	
2061  0241               L1501:
2062                     ; 602         TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2064  0241 72175305      	bres	21253,#3
2065                     ; 604 }
2068  0245 81            	ret	
2104                     ; 613 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2104                     ; 614 {
2105                     	switch	.text
2106  0246               _TIM2_OC2PreloadConfig:
2110                     ; 616     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2112                     ; 619     if (NewState != DISABLE)
2114  0246 4d            	tnz	a
2115  0247 2705          	jreq	L3701
2116                     ; 621         TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2118  0249 72165306      	bset	21254,#3
2121  024d 81            	ret	
2122  024e               L3701:
2123                     ; 625         TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2125  024e 72175306      	bres	21254,#3
2126                     ; 627 }
2129  0252 81            	ret	
2165                     ; 636 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2165                     ; 637 {
2166                     	switch	.text
2167  0253               _TIM2_OC3PreloadConfig:
2171                     ; 639     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2173                     ; 642     if (NewState != DISABLE)
2175  0253 4d            	tnz	a
2176  0254 2705          	jreq	L5111
2177                     ; 644         TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2179  0256 72165307      	bset	21255,#3
2182  025a 81            	ret	
2183  025b               L5111:
2184                     ; 648         TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2186  025b 72175307      	bres	21255,#3
2187                     ; 650 }
2190  025f 81            	ret	
2263                     ; 663 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2263                     ; 664 {
2264                     	switch	.text
2265  0260               _TIM2_GenerateEvent:
2269                     ; 666     assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2271                     ; 669     TIM2->EGR = (uint8_t)TIM2_EventSource;
2273  0260 c75304        	ld	21252,a
2274                     ; 670 }
2277  0263 81            	ret	
2313                     ; 681 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2313                     ; 682 {
2314                     	switch	.text
2315  0264               _TIM2_OC1PolarityConfig:
2319                     ; 684     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2321                     ; 687     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2323  0264 4d            	tnz	a
2324  0265 2705          	jreq	L1711
2325                     ; 689         TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2327  0267 72125308      	bset	21256,#1
2330  026b 81            	ret	
2331  026c               L1711:
2332                     ; 693         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2334  026c 72135308      	bres	21256,#1
2335                     ; 695 }
2338  0270 81            	ret	
2374                     ; 706 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2374                     ; 707 {
2375                     	switch	.text
2376  0271               _TIM2_OC2PolarityConfig:
2380                     ; 709     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2382                     ; 712     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2384  0271 4d            	tnz	a
2385  0272 2705          	jreq	L3121
2386                     ; 714         TIM2->CCER1 |= TIM2_CCER1_CC2P;
2388  0274 721a5308      	bset	21256,#5
2391  0278 81            	ret	
2392  0279               L3121:
2393                     ; 718         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2395  0279 721b5308      	bres	21256,#5
2396                     ; 720 }
2399  027d 81            	ret	
2435                     ; 731 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2435                     ; 732 {
2436                     	switch	.text
2437  027e               _TIM2_OC3PolarityConfig:
2441                     ; 734     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2443                     ; 737     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2445  027e 4d            	tnz	a
2446  027f 2705          	jreq	L5321
2447                     ; 739         TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2449  0281 72125309      	bset	21257,#1
2452  0285 81            	ret	
2453  0286               L5321:
2454                     ; 743         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2456  0286 72135309      	bres	21257,#1
2457                     ; 745 }
2460  028a 81            	ret	
2505                     ; 759 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2505                     ; 760 {
2506                     	switch	.text
2507  028b               _TIM2_CCxCmd:
2509  028b 89            	pushw	x
2510       00000000      OFST:	set	0
2513                     ; 762     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2515                     ; 763     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2517                     ; 765     if (TIM2_Channel == TIM2_CHANNEL_1)
2519  028c 9e            	ld	a,xh
2520  028d 4d            	tnz	a
2521  028e 2610          	jrne	L3621
2522                     ; 768         if (NewState != DISABLE)
2524  0290 9f            	ld	a,xl
2525  0291 4d            	tnz	a
2526  0292 2706          	jreq	L5621
2527                     ; 770             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2529  0294 72105308      	bset	21256,#0
2531  0298 2029          	jra	L1721
2532  029a               L5621:
2533                     ; 774             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2535  029a 72115308      	bres	21256,#0
2536  029e 2023          	jra	L1721
2537  02a0               L3621:
2538                     ; 778     else if (TIM2_Channel == TIM2_CHANNEL_2)
2540  02a0 7b01          	ld	a,(OFST+1,sp)
2541  02a2 4a            	dec	a
2542  02a3 2610          	jrne	L3721
2543                     ; 781         if (NewState != DISABLE)
2545  02a5 7b02          	ld	a,(OFST+2,sp)
2546  02a7 2706          	jreq	L5721
2547                     ; 783             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2549  02a9 72185308      	bset	21256,#4
2551  02ad 2014          	jra	L1721
2552  02af               L5721:
2553                     ; 787             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2555  02af 72195308      	bres	21256,#4
2556  02b3 200e          	jra	L1721
2557  02b5               L3721:
2558                     ; 793         if (NewState != DISABLE)
2560  02b5 7b02          	ld	a,(OFST+2,sp)
2561  02b7 2706          	jreq	L3031
2562                     ; 795             TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2564  02b9 72105309      	bset	21257,#0
2566  02bd 2004          	jra	L1721
2567  02bf               L3031:
2568                     ; 799             TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2570  02bf 72115309      	bres	21257,#0
2571  02c3               L1721:
2572                     ; 802 }
2575  02c3 85            	popw	x
2576  02c4 81            	ret	
2621                     ; 824 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2621                     ; 825 {
2622                     	switch	.text
2623  02c5               _TIM2_SelectOCxM:
2625  02c5 89            	pushw	x
2626       00000000      OFST:	set	0
2629                     ; 827     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2631                     ; 828     assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2633                     ; 830     if (TIM2_Channel == TIM2_CHANNEL_1)
2635  02c6 9e            	ld	a,xh
2636  02c7 4d            	tnz	a
2637  02c8 2610          	jrne	L1331
2638                     ; 833         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2640  02ca 72115308      	bres	21256,#0
2641                     ; 836         TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2641                     ; 837                                | (uint8_t)TIM2_OCMode);
2643  02ce c65305        	ld	a,21253
2644  02d1 a48f          	and	a,#143
2645  02d3 1a02          	or	a,(OFST+2,sp)
2646  02d5 c75305        	ld	21253,a
2648  02d8 2023          	jra	L3331
2649  02da               L1331:
2650                     ; 839     else if (TIM2_Channel == TIM2_CHANNEL_2)
2652  02da 7b01          	ld	a,(OFST+1,sp)
2653  02dc 4a            	dec	a
2654  02dd 2610          	jrne	L5331
2655                     ; 842         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2657  02df 72195308      	bres	21256,#4
2658                     ; 845         TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2658                     ; 846                                 | (uint8_t)TIM2_OCMode);
2660  02e3 c65306        	ld	a,21254
2661  02e6 a48f          	and	a,#143
2662  02e8 1a02          	or	a,(OFST+2,sp)
2663  02ea c75306        	ld	21254,a
2665  02ed 200e          	jra	L3331
2666  02ef               L5331:
2667                     ; 851         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2669  02ef 72115309      	bres	21257,#0
2670                     ; 854         TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2670                     ; 855                                 | (uint8_t)TIM2_OCMode);
2672  02f3 c65307        	ld	a,21255
2673  02f6 a48f          	and	a,#143
2674  02f8 1a02          	or	a,(OFST+2,sp)
2675  02fa c75307        	ld	21255,a
2676  02fd               L3331:
2677                     ; 857 }
2680  02fd 85            	popw	x
2681  02fe 81            	ret	
2715                     ; 866 void TIM2_SetCounter(uint16_t Counter)
2715                     ; 867 {
2716                     	switch	.text
2717  02ff               _TIM2_SetCounter:
2721                     ; 869     TIM2->CNTRH = (uint8_t)(Counter >> 8);
2723  02ff 9e            	ld	a,xh
2724  0300 c7530a        	ld	21258,a
2725                     ; 870     TIM2->CNTRL = (uint8_t)(Counter);
2727  0303 9f            	ld	a,xl
2728  0304 c7530b        	ld	21259,a
2729                     ; 872 }
2732  0307 81            	ret	
2766                     ; 881 void TIM2_SetAutoreload(uint16_t Autoreload)
2766                     ; 882 {
2767                     	switch	.text
2768  0308               _TIM2_SetAutoreload:
2772                     ; 885     TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2774  0308 9e            	ld	a,xh
2775  0309 c7530d        	ld	21261,a
2776                     ; 886     TIM2->ARRL = (uint8_t)(Autoreload);
2778  030c 9f            	ld	a,xl
2779  030d c7530e        	ld	21262,a
2780                     ; 888 }
2783  0310 81            	ret	
2817                     ; 897 void TIM2_SetCompare1(uint16_t Compare1)
2817                     ; 898 {
2818                     	switch	.text
2819  0311               _TIM2_SetCompare1:
2823                     ; 900     TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2825  0311 9e            	ld	a,xh
2826  0312 c7530f        	ld	21263,a
2827                     ; 901     TIM2->CCR1L = (uint8_t)(Compare1);
2829  0315 9f            	ld	a,xl
2830  0316 c75310        	ld	21264,a
2831                     ; 903 }
2834  0319 81            	ret	
2868                     ; 912 void TIM2_SetCompare2(uint16_t Compare2)
2868                     ; 913 {
2869                     	switch	.text
2870  031a               _TIM2_SetCompare2:
2874                     ; 915     TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2876  031a 9e            	ld	a,xh
2877  031b c75311        	ld	21265,a
2878                     ; 916     TIM2->CCR2L = (uint8_t)(Compare2);
2880  031e 9f            	ld	a,xl
2881  031f c75312        	ld	21266,a
2882                     ; 918 }
2885  0322 81            	ret	
2919                     ; 927 void TIM2_SetCompare3(uint16_t Compare3)
2919                     ; 928 {
2920                     	switch	.text
2921  0323               _TIM2_SetCompare3:
2925                     ; 930     TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2927  0323 9e            	ld	a,xh
2928  0324 c75313        	ld	21267,a
2929                     ; 931     TIM2->CCR3L = (uint8_t)(Compare3);
2931  0327 9f            	ld	a,xl
2932  0328 c75314        	ld	21268,a
2933                     ; 933 }
2936  032b 81            	ret	
2972                     ; 946 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2972                     ; 947 {
2973                     	switch	.text
2974  032c               _TIM2_SetIC1Prescaler:
2976  032c 88            	push	a
2977       00000000      OFST:	set	0
2980                     ; 949     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2982                     ; 952     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2982                     ; 953                             | (uint8_t)TIM2_IC1Prescaler);
2984  032d c65305        	ld	a,21253
2985  0330 a4f3          	and	a,#243
2986  0332 1a01          	or	a,(OFST+1,sp)
2987  0334 c75305        	ld	21253,a
2988                     ; 954 }
2991  0337 84            	pop	a
2992  0338 81            	ret	
3028                     ; 966 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3028                     ; 967 {
3029                     	switch	.text
3030  0339               _TIM2_SetIC2Prescaler:
3032  0339 88            	push	a
3033       00000000      OFST:	set	0
3036                     ; 969     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3038                     ; 972     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3038                     ; 973                             | (uint8_t)TIM2_IC2Prescaler);
3040  033a c65306        	ld	a,21254
3041  033d a4f3          	and	a,#243
3042  033f 1a01          	or	a,(OFST+1,sp)
3043  0341 c75306        	ld	21254,a
3044                     ; 974 }
3047  0344 84            	pop	a
3048  0345 81            	ret	
3084                     ; 986 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3084                     ; 987 {
3085                     	switch	.text
3086  0346               _TIM2_SetIC3Prescaler:
3088  0346 88            	push	a
3089       00000000      OFST:	set	0
3092                     ; 990     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3094                     ; 992     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3094                     ; 993                             | (uint8_t)TIM2_IC3Prescaler);
3096  0347 c65307        	ld	a,21255
3097  034a a4f3          	and	a,#243
3098  034c 1a01          	or	a,(OFST+1,sp)
3099  034e c75307        	ld	21255,a
3100                     ; 994 }
3103  0351 84            	pop	a
3104  0352 81            	ret	
3156                     ; 1001 uint16_t TIM2_GetCapture1(void)
3156                     ; 1002 {
3157                     	switch	.text
3158  0353               _TIM2_GetCapture1:
3160  0353 5204          	subw	sp,#4
3161       00000004      OFST:	set	4
3164                     ; 1004     uint16_t tmpccr1 = 0;
3166                     ; 1005     uint8_t tmpccr1l=0, tmpccr1h=0;
3170                     ; 1007     tmpccr1h = TIM2->CCR1H;
3172  0355 c6530f        	ld	a,21263
3173  0358 6b02          	ld	(OFST-2,sp),a
3174                     ; 1008     tmpccr1l = TIM2->CCR1L;
3176  035a c65310        	ld	a,21264
3177  035d 6b01          	ld	(OFST-3,sp),a
3178                     ; 1010     tmpccr1 = (uint16_t)(tmpccr1l);
3180  035f 5f            	clrw	x
3181  0360 97            	ld	xl,a
3182  0361 1f03          	ldw	(OFST-1,sp),x
3183                     ; 1011     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3185  0363 5f            	clrw	x
3186  0364 7b02          	ld	a,(OFST-2,sp)
3187  0366 97            	ld	xl,a
3188  0367 7b04          	ld	a,(OFST+0,sp)
3189  0369 01            	rrwa	x,a
3190  036a 1a03          	or	a,(OFST-1,sp)
3191  036c 01            	rrwa	x,a
3192                     ; 1013     return (uint16_t)tmpccr1;
3196  036d 5b04          	addw	sp,#4
3197  036f 81            	ret	
3249                     ; 1021 uint16_t TIM2_GetCapture2(void)
3249                     ; 1022 {
3250                     	switch	.text
3251  0370               _TIM2_GetCapture2:
3253  0370 5204          	subw	sp,#4
3254       00000004      OFST:	set	4
3257                     ; 1024     uint16_t tmpccr2 = 0;
3259                     ; 1025     uint8_t tmpccr2l=0, tmpccr2h=0;
3263                     ; 1027     tmpccr2h = TIM2->CCR2H;
3265  0372 c65311        	ld	a,21265
3266  0375 6b02          	ld	(OFST-2,sp),a
3267                     ; 1028     tmpccr2l = TIM2->CCR2L;
3269  0377 c65312        	ld	a,21266
3270  037a 6b01          	ld	(OFST-3,sp),a
3271                     ; 1030     tmpccr2 = (uint16_t)(tmpccr2l);
3273  037c 5f            	clrw	x
3274  037d 97            	ld	xl,a
3275  037e 1f03          	ldw	(OFST-1,sp),x
3276                     ; 1031     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3278  0380 5f            	clrw	x
3279  0381 7b02          	ld	a,(OFST-2,sp)
3280  0383 97            	ld	xl,a
3281  0384 7b04          	ld	a,(OFST+0,sp)
3282  0386 01            	rrwa	x,a
3283  0387 1a03          	or	a,(OFST-1,sp)
3284  0389 01            	rrwa	x,a
3285                     ; 1033     return (uint16_t)tmpccr2;
3289  038a 5b04          	addw	sp,#4
3290  038c 81            	ret	
3342                     ; 1041 uint16_t TIM2_GetCapture3(void)
3342                     ; 1042 {
3343                     	switch	.text
3344  038d               _TIM2_GetCapture3:
3346  038d 5204          	subw	sp,#4
3347       00000004      OFST:	set	4
3350                     ; 1044     uint16_t tmpccr3 = 0;
3352                     ; 1045     uint8_t tmpccr3l=0, tmpccr3h=0;
3356                     ; 1047     tmpccr3h = TIM2->CCR3H;
3358  038f c65313        	ld	a,21267
3359  0392 6b02          	ld	(OFST-2,sp),a
3360                     ; 1048     tmpccr3l = TIM2->CCR3L;
3362  0394 c65314        	ld	a,21268
3363  0397 6b01          	ld	(OFST-3,sp),a
3364                     ; 1050     tmpccr3 = (uint16_t)(tmpccr3l);
3366  0399 5f            	clrw	x
3367  039a 97            	ld	xl,a
3368  039b 1f03          	ldw	(OFST-1,sp),x
3369                     ; 1051     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3371  039d 5f            	clrw	x
3372  039e 7b02          	ld	a,(OFST-2,sp)
3373  03a0 97            	ld	xl,a
3374  03a1 7b04          	ld	a,(OFST+0,sp)
3375  03a3 01            	rrwa	x,a
3376  03a4 1a03          	or	a,(OFST-1,sp)
3377  03a6 01            	rrwa	x,a
3378                     ; 1053     return (uint16_t)tmpccr3;
3382  03a7 5b04          	addw	sp,#4
3383  03a9 81            	ret	
3417                     ; 1061 uint16_t TIM2_GetCounter(void)
3417                     ; 1062 {
3418                     	switch	.text
3419  03aa               _TIM2_GetCounter:
3421  03aa 89            	pushw	x
3422       00000002      OFST:	set	2
3425                     ; 1063      uint16_t tmpcntr = 0;
3427                     ; 1065     tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3429  03ab c6530a        	ld	a,21258
3430  03ae 97            	ld	xl,a
3431  03af 4f            	clr	a
3432  03b0 02            	rlwa	x,a
3433  03b1 1f01          	ldw	(OFST-1,sp),x
3434                     ; 1067     return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3436  03b3 5f            	clrw	x
3437  03b4 c6530b        	ld	a,21259
3438  03b7 97            	ld	xl,a
3439  03b8 01            	rrwa	x,a
3440  03b9 1a02          	or	a,(OFST+0,sp)
3441  03bb 01            	rrwa	x,a
3442  03bc 1a01          	or	a,(OFST-1,sp)
3443  03be 01            	rrwa	x,a
3446  03bf 5b02          	addw	sp,#2
3447  03c1 81            	ret	
3471                     ; 1076 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3471                     ; 1077 {
3472                     	switch	.text
3473  03c2               _TIM2_GetPrescaler:
3477                     ; 1079     return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3479  03c2 c6530c        	ld	a,21260
3482  03c5 81            	ret	
3621                     ; 1096 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3621                     ; 1097 {
3622                     	switch	.text
3623  03c6               _TIM2_GetFlagStatus:
3625  03c6 89            	pushw	x
3626  03c7 89            	pushw	x
3627       00000002      OFST:	set	2
3630                     ; 1098     FlagStatus bitstatus = RESET;
3632                     ; 1099     uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3636                     ; 1102     assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3638                     ; 1104     tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3640  03c8 9f            	ld	a,xl
3641  03c9 c45302        	and	a,21250
3642  03cc 6b01          	ld	(OFST-1,sp),a
3643                     ; 1105     tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3645  03ce 7b03          	ld	a,(OFST+1,sp)
3646  03d0 6b02          	ld	(OFST+0,sp),a
3647                     ; 1107     if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3649  03d2 c45303        	and	a,21251
3650  03d5 1a01          	or	a,(OFST-1,sp)
3651  03d7 2702          	jreq	L5371
3652                     ; 1109         bitstatus = SET;
3654  03d9 a601          	ld	a,#1
3656  03db               L5371:
3657                     ; 1113         bitstatus = RESET;
3659                     ; 1115     return (FlagStatus)bitstatus;
3663  03db 5b04          	addw	sp,#4
3664  03dd 81            	ret	
3699                     ; 1132 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3699                     ; 1133 {
3700                     	switch	.text
3701  03de               _TIM2_ClearFlag:
3705                     ; 1135     assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3707                     ; 1138     TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3709  03de 9f            	ld	a,xl
3710  03df 43            	cpl	a
3711  03e0 c75302        	ld	21250,a
3712                     ; 1139     TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3714  03e3 35ff5303      	mov	21251,#255
3715                     ; 1140 }
3718  03e7 81            	ret	
3782                     ; 1154 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3782                     ; 1155 {
3783                     	switch	.text
3784  03e8               _TIM2_GetITStatus:
3786  03e8 88            	push	a
3787  03e9 89            	pushw	x
3788       00000002      OFST:	set	2
3791                     ; 1156     ITStatus bitstatus = RESET;
3793                     ; 1157     uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3797                     ; 1160     assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3799                     ; 1162     TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3801  03ea c45302        	and	a,21250
3802  03ed 6b01          	ld	(OFST-1,sp),a
3803                     ; 1164     TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3805  03ef c65301        	ld	a,21249
3806  03f2 1403          	and	a,(OFST+1,sp)
3807  03f4 6b02          	ld	(OFST+0,sp),a
3808                     ; 1166     if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3810  03f6 7b01          	ld	a,(OFST-1,sp)
3811  03f8 2708          	jreq	L1102
3813  03fa 7b02          	ld	a,(OFST+0,sp)
3814  03fc 2704          	jreq	L1102
3815                     ; 1168         bitstatus = SET;
3817  03fe a601          	ld	a,#1
3819  0400 2001          	jra	L3102
3820  0402               L1102:
3821                     ; 1172         bitstatus = RESET;
3823  0402 4f            	clr	a
3824  0403               L3102:
3825                     ; 1174     return (ITStatus)(bitstatus);
3829  0403 5b03          	addw	sp,#3
3830  0405 81            	ret	
3866                     ; 1188 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3866                     ; 1189 {
3867                     	switch	.text
3868  0406               _TIM2_ClearITPendingBit:
3872                     ; 1191     assert_param(IS_TIM2_IT_OK(TIM2_IT));
3874                     ; 1194     TIM2->SR1 = (uint8_t)(~TIM2_IT);
3876  0406 43            	cpl	a
3877  0407 c75302        	ld	21250,a
3878                     ; 1195 }
3881  040a 81            	ret	
3933                     ; 1214 static void TI1_Config(uint8_t TIM2_ICPolarity,
3933                     ; 1215                        uint8_t TIM2_ICSelection,
3933                     ; 1216                        uint8_t TIM2_ICFilter)
3933                     ; 1217 {
3934                     	switch	.text
3935  040b               L3_TI1_Config:
3937  040b 89            	pushw	x
3938       00000001      OFST:	set	1
3941                     ; 1219     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3943  040c 72115308      	bres	21256,#0
3944  0410 88            	push	a
3945                     ; 1222     TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3945                     ; 1223                              | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3947  0411 7b06          	ld	a,(OFST+5,sp)
3948  0413 97            	ld	xl,a
3949  0414 a610          	ld	a,#16
3950  0416 42            	mul	x,a
3951  0417 9f            	ld	a,xl
3952  0418 1a03          	or	a,(OFST+2,sp)
3953  041a 6b01          	ld	(OFST+0,sp),a
3954  041c c65305        	ld	a,21253
3955  041f a40c          	and	a,#12
3956  0421 1a01          	or	a,(OFST+0,sp)
3957  0423 c75305        	ld	21253,a
3958                     ; 1226     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3960  0426 7b02          	ld	a,(OFST+1,sp)
3961  0428 2706          	jreq	L1602
3962                     ; 1228         TIM2->CCER1 |= TIM2_CCER1_CC1P;
3964  042a 72125308      	bset	21256,#1
3966  042e 2004          	jra	L3602
3967  0430               L1602:
3968                     ; 1232         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3970  0430 72135308      	bres	21256,#1
3971  0434               L3602:
3972                     ; 1235     TIM2->CCER1 |= TIM2_CCER1_CC1E;
3974  0434 72105308      	bset	21256,#0
3975                     ; 1236 }
3978  0438 5b03          	addw	sp,#3
3979  043a 81            	ret	
4031                     ; 1255 static void TI2_Config(uint8_t TIM2_ICPolarity,
4031                     ; 1256                        uint8_t TIM2_ICSelection,
4031                     ; 1257                        uint8_t TIM2_ICFilter)
4031                     ; 1258 {
4032                     	switch	.text
4033  043b               L5_TI2_Config:
4035  043b 89            	pushw	x
4036       00000001      OFST:	set	1
4039                     ; 1260     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4041  043c 72195308      	bres	21256,#4
4042  0440 88            	push	a
4043                     ; 1263     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4043                     ; 1264                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4045  0441 7b06          	ld	a,(OFST+5,sp)
4046  0443 97            	ld	xl,a
4047  0444 a610          	ld	a,#16
4048  0446 42            	mul	x,a
4049  0447 9f            	ld	a,xl
4050  0448 1a03          	or	a,(OFST+2,sp)
4051  044a 6b01          	ld	(OFST+0,sp),a
4052  044c c65306        	ld	a,21254
4053  044f a40c          	and	a,#12
4054  0451 1a01          	or	a,(OFST+0,sp)
4055  0453 c75306        	ld	21254,a
4056                     ; 1268     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4058  0456 7b02          	ld	a,(OFST+1,sp)
4059  0458 2706          	jreq	L3112
4060                     ; 1270         TIM2->CCER1 |= TIM2_CCER1_CC2P;
4062  045a 721a5308      	bset	21256,#5
4064  045e 2004          	jra	L5112
4065  0460               L3112:
4066                     ; 1274         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4068  0460 721b5308      	bres	21256,#5
4069  0464               L5112:
4070                     ; 1278     TIM2->CCER1 |= TIM2_CCER1_CC2E;
4072  0464 72185308      	bset	21256,#4
4073                     ; 1280 }
4076  0468 5b03          	addw	sp,#3
4077  046a 81            	ret	
4129                     ; 1296 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4129                     ; 1297                        uint8_t TIM2_ICFilter)
4129                     ; 1298 {
4130                     	switch	.text
4131  046b               L7_TI3_Config:
4133  046b 89            	pushw	x
4134       00000001      OFST:	set	1
4137                     ; 1300     TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4139  046c 72115309      	bres	21257,#0
4140  0470 88            	push	a
4141                     ; 1303     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4141                     ; 1304                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4143  0471 7b06          	ld	a,(OFST+5,sp)
4144  0473 97            	ld	xl,a
4145  0474 a610          	ld	a,#16
4146  0476 42            	mul	x,a
4147  0477 9f            	ld	a,xl
4148  0478 1a03          	or	a,(OFST+2,sp)
4149  047a 6b01          	ld	(OFST+0,sp),a
4150  047c c65307        	ld	a,21255
4151  047f a40c          	and	a,#12
4152  0481 1a01          	or	a,(OFST+0,sp)
4153  0483 c75307        	ld	21255,a
4154                     ; 1308     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4156  0486 7b02          	ld	a,(OFST+1,sp)
4157  0488 2706          	jreq	L5412
4158                     ; 1310         TIM2->CCER2 |= TIM2_CCER2_CC3P;
4160  048a 72125309      	bset	21257,#1
4162  048e 2004          	jra	L7412
4163  0490               L5412:
4164                     ; 1314         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4166  0490 72135309      	bres	21257,#1
4167  0494               L7412:
4168                     ; 1317     TIM2->CCER2 |= TIM2_CCER2_CC3E;
4170  0494 72105309      	bset	21257,#0
4171                     ; 1318 }
4174  0498 5b03          	addw	sp,#3
4175  049a 81            	ret	
4188                     	xdef	_TIM2_ClearITPendingBit
4189                     	xdef	_TIM2_GetITStatus
4190                     	xdef	_TIM2_ClearFlag
4191                     	xdef	_TIM2_GetFlagStatus
4192                     	xdef	_TIM2_GetPrescaler
4193                     	xdef	_TIM2_GetCounter
4194                     	xdef	_TIM2_GetCapture3
4195                     	xdef	_TIM2_GetCapture2
4196                     	xdef	_TIM2_GetCapture1
4197                     	xdef	_TIM2_SetIC3Prescaler
4198                     	xdef	_TIM2_SetIC2Prescaler
4199                     	xdef	_TIM2_SetIC1Prescaler
4200                     	xdef	_TIM2_SetCompare3
4201                     	xdef	_TIM2_SetCompare2
4202                     	xdef	_TIM2_SetCompare1
4203                     	xdef	_TIM2_SetAutoreload
4204                     	xdef	_TIM2_SetCounter
4205                     	xdef	_TIM2_SelectOCxM
4206                     	xdef	_TIM2_CCxCmd
4207                     	xdef	_TIM2_OC3PolarityConfig
4208                     	xdef	_TIM2_OC2PolarityConfig
4209                     	xdef	_TIM2_OC1PolarityConfig
4210                     	xdef	_TIM2_GenerateEvent
4211                     	xdef	_TIM2_OC3PreloadConfig
4212                     	xdef	_TIM2_OC2PreloadConfig
4213                     	xdef	_TIM2_OC1PreloadConfig
4214                     	xdef	_TIM2_ARRPreloadConfig
4215                     	xdef	_TIM2_ForcedOC3Config
4216                     	xdef	_TIM2_ForcedOC2Config
4217                     	xdef	_TIM2_ForcedOC1Config
4218                     	xdef	_TIM2_PrescalerConfig
4219                     	xdef	_TIM2_SelectOnePulseMode
4220                     	xdef	_TIM2_UpdateRequestConfig
4221                     	xdef	_TIM2_UpdateDisableConfig
4222                     	xdef	_TIM2_ITConfig
4223                     	xdef	_TIM2_Cmd
4224                     	xdef	_TIM2_PWMIConfig
4225                     	xdef	_TIM2_ICInit
4226                     	xdef	_TIM2_OC3Init
4227                     	xdef	_TIM2_OC2Init
4228                     	xdef	_TIM2_OC1Init
4229                     	xdef	_TIM2_TimeBaseInit
4230                     	xdef	_TIM2_DeInit
4249                     	end
