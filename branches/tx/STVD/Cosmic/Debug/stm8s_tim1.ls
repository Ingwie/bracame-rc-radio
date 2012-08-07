   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  46                     ; 52 void TIM1_DeInit(void)
  46                     ; 53 {
  48                     	switch	.text
  49  0000               _TIM1_DeInit:
  53                     ; 54     TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  55  0000 725f5250      	clr	21072
  56                     ; 55     TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  58  0004 725f5251      	clr	21073
  59                     ; 56     TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  61  0008 725f5252      	clr	21074
  62                     ; 57     TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  64  000c 725f5253      	clr	21075
  65                     ; 58     TIM1->IER  = TIM1_IER_RESET_VALUE;
  67  0010 725f5254      	clr	21076
  68                     ; 59     TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  70  0014 725f5256      	clr	21078
  71                     ; 61     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  73  0018 725f525c      	clr	21084
  74                     ; 62     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  76  001c 725f525d      	clr	21085
  77                     ; 64     TIM1->CCMR1 = 0x01;
  79  0020 35015258      	mov	21080,#1
  80                     ; 65     TIM1->CCMR2 = 0x01;
  82  0024 35015259      	mov	21081,#1
  83                     ; 66     TIM1->CCMR3 = 0x01;
  85  0028 3501525a      	mov	21082,#1
  86                     ; 67     TIM1->CCMR4 = 0x01;
  88  002c 3501525b      	mov	21083,#1
  89                     ; 69     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  91  0030 725f525c      	clr	21084
  92                     ; 70     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  94  0034 725f525d      	clr	21085
  95                     ; 71     TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  97  0038 725f5258      	clr	21080
  98                     ; 72     TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 100  003c 725f5259      	clr	21081
 101                     ; 73     TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 103  0040 725f525a      	clr	21082
 104                     ; 74     TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 106  0044 725f525b      	clr	21083
 107                     ; 75     TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 109  0048 725f525e      	clr	21086
 110                     ; 76     TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 112  004c 725f525f      	clr	21087
 113                     ; 77     TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 115  0050 725f5260      	clr	21088
 116                     ; 78     TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 118  0054 725f5261      	clr	21089
 119                     ; 79     TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 121  0058 35ff5262      	mov	21090,#255
 122                     ; 80     TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 124  005c 35ff5263      	mov	21091,#255
 125                     ; 81     TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 127  0060 725f5265      	clr	21093
 128                     ; 82     TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 130  0064 725f5266      	clr	21094
 131                     ; 83     TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 133  0068 725f5267      	clr	21095
 134                     ; 84     TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 136  006c 725f5268      	clr	21096
 137                     ; 85     TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 139  0070 725f5269      	clr	21097
 140                     ; 86     TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 142  0074 725f526a      	clr	21098
 143                     ; 87     TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 145  0078 725f526b      	clr	21099
 146                     ; 88     TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 148  007c 725f526c      	clr	21100
 149                     ; 89     TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 151  0080 725f526f      	clr	21103
 152                     ; 90     TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 154  0084 35015257      	mov	21079,#1
 155                     ; 91     TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 157  0088 725f526e      	clr	21102
 158                     ; 92     TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 160  008c 725f526d      	clr	21101
 161                     ; 93     TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 163  0090 725f5264      	clr	21092
 164                     ; 94     TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 166  0094 725f5255      	clr	21077
 167                     ; 95 }
 170  0098 81            	ret	
 279                     ; 105 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 279                     ; 106                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 279                     ; 107                        uint16_t TIM1_Period,
 279                     ; 108                        uint8_t TIM1_RepetitionCounter)
 279                     ; 109 {
 280                     	switch	.text
 281  0099               _TIM1_TimeBaseInit:
 283  0099 89            	pushw	x
 284       00000000      OFST:	set	0
 287                     ; 112     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 289                     ; 115     TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 291  009a 7b06          	ld	a,(OFST+6,sp)
 292  009c c75262        	ld	21090,a
 293                     ; 116     TIM1->ARRL = (uint8_t)(TIM1_Period);
 295  009f 7b07          	ld	a,(OFST+7,sp)
 296  00a1 c75263        	ld	21091,a
 297                     ; 119     TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 299  00a4 9e            	ld	a,xh
 300  00a5 c75260        	ld	21088,a
 301                     ; 120     TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 303  00a8 9f            	ld	a,xl
 304  00a9 c75261        	ld	21089,a
 305                     ; 123     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 305                     ; 124                            | (uint8_t)(TIM1_CounterMode));
 307  00ac c65250        	ld	a,21072
 308  00af a48f          	and	a,#143
 309  00b1 1a05          	or	a,(OFST+5,sp)
 310  00b3 c75250        	ld	21072,a
 311                     ; 127     TIM1->RCR = TIM1_RepetitionCounter;
 313  00b6 7b08          	ld	a,(OFST+8,sp)
 314  00b8 c75264        	ld	21092,a
 315                     ; 129 }
 318  00bb 85            	popw	x
 319  00bc 81            	ret	
 604                     ; 150 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 604                     ; 151                   TIM1_OutputState_TypeDef TIM1_OutputState,
 604                     ; 152                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 604                     ; 153                   uint16_t TIM1_Pulse,
 604                     ; 154                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 604                     ; 155                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 604                     ; 156                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 604                     ; 157                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 604                     ; 158 {
 605                     	switch	.text
 606  00bd               _TIM1_OC1Init:
 608  00bd 89            	pushw	x
 609  00be 5203          	subw	sp,#3
 610       00000003      OFST:	set	3
 613                     ; 160     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 615                     ; 161     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 617                     ; 162     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 619                     ; 163     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 621                     ; 164     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 623                     ; 165     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 625                     ; 166     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 627                     ; 170     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 627                     ; 171                                | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 629  00c0 c6525c        	ld	a,21084
 630  00c3 a4f0          	and	a,#240
 631  00c5 c7525c        	ld	21084,a
 632                     ; 174   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 632                     ; 175                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 632                     ; 176                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 632                     ; 177                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 634  00c8 7b0c          	ld	a,(OFST+9,sp)
 635  00ca a408          	and	a,#8
 636  00cc 6b03          	ld	(OFST+0,sp),a
 637  00ce 7b0b          	ld	a,(OFST+8,sp)
 638  00d0 a402          	and	a,#2
 639  00d2 1a03          	or	a,(OFST+0,sp)
 640  00d4 6b02          	ld	(OFST-1,sp),a
 641  00d6 7b08          	ld	a,(OFST+5,sp)
 642  00d8 a404          	and	a,#4
 643  00da 6b01          	ld	(OFST-2,sp),a
 644  00dc 9f            	ld	a,xl
 645  00dd a401          	and	a,#1
 646  00df 1a01          	or	a,(OFST-2,sp)
 647  00e1 1a02          	or	a,(OFST-1,sp)
 648  00e3 ca525c        	or	a,21084
 649  00e6 c7525c        	ld	21084,a
 650                     ; 180     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 650                     ; 181                             (uint8_t)TIM1_OCMode);
 652  00e9 c65258        	ld	a,21080
 653  00ec a48f          	and	a,#143
 654  00ee 1a04          	or	a,(OFST+1,sp)
 655  00f0 c75258        	ld	21080,a
 656                     ; 184     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 658  00f3 c6526f        	ld	a,21103
 659  00f6 a4fc          	and	a,#252
 660  00f8 c7526f        	ld	21103,a
 661                     ; 186     TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 661                     ; 187                             (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 663  00fb 7b0e          	ld	a,(OFST+11,sp)
 664  00fd a402          	and	a,#2
 665  00ff 6b03          	ld	(OFST+0,sp),a
 666  0101 7b0d          	ld	a,(OFST+10,sp)
 667  0103 a401          	and	a,#1
 668  0105 1a03          	or	a,(OFST+0,sp)
 669  0107 ca526f        	or	a,21103
 670  010a c7526f        	ld	21103,a
 671                     ; 190     TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 673  010d 7b09          	ld	a,(OFST+6,sp)
 674  010f c75265        	ld	21093,a
 675                     ; 191     TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 677  0112 7b0a          	ld	a,(OFST+7,sp)
 678  0114 c75266        	ld	21094,a
 679                     ; 192 }
 682  0117 5b05          	addw	sp,#5
 683  0119 81            	ret	
 787                     ; 213 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 787                     ; 214                   TIM1_OutputState_TypeDef TIM1_OutputState,
 787                     ; 215                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 787                     ; 216                   uint16_t TIM1_Pulse,
 787                     ; 217                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 787                     ; 218                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 787                     ; 219                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 787                     ; 220                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 787                     ; 221 {
 788                     	switch	.text
 789  011a               _TIM1_OC2Init:
 791  011a 89            	pushw	x
 792  011b 5203          	subw	sp,#3
 793       00000003      OFST:	set	3
 796                     ; 223     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 798                     ; 224     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 800                     ; 225     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 802                     ; 226     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 804                     ; 227     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 806                     ; 228     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 808                     ; 229     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 810                     ; 233     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 810                     ; 234                                 TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 812  011d c6525c        	ld	a,21084
 813  0120 a40f          	and	a,#15
 814  0122 c7525c        	ld	21084,a
 815                     ; 238     TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 815                     ; 239                              (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 815                     ; 240                              (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 815                     ; 241                              (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 817  0125 7b0c          	ld	a,(OFST+9,sp)
 818  0127 a480          	and	a,#128
 819  0129 6b03          	ld	(OFST+0,sp),a
 820  012b 7b0b          	ld	a,(OFST+8,sp)
 821  012d a420          	and	a,#32
 822  012f 1a03          	or	a,(OFST+0,sp)
 823  0131 6b02          	ld	(OFST-1,sp),a
 824  0133 7b08          	ld	a,(OFST+5,sp)
 825  0135 a440          	and	a,#64
 826  0137 6b01          	ld	(OFST-2,sp),a
 827  0139 9f            	ld	a,xl
 828  013a a410          	and	a,#16
 829  013c 1a01          	or	a,(OFST-2,sp)
 830  013e 1a02          	or	a,(OFST-1,sp)
 831  0140 ca525c        	or	a,21084
 832  0143 c7525c        	ld	21084,a
 833                     ; 244     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 833                     ; 245                              (uint8_t)TIM1_OCMode);
 835  0146 c65259        	ld	a,21081
 836  0149 a48f          	and	a,#143
 837  014b 1a04          	or	a,(OFST+1,sp)
 838  014d c75259        	ld	21081,a
 839                     ; 248     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 841  0150 c6526f        	ld	a,21103
 842  0153 a4f3          	and	a,#243
 843  0155 c7526f        	ld	21103,a
 844                     ; 250     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 844                     ; 251                             (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 846  0158 7b0e          	ld	a,(OFST+11,sp)
 847  015a a408          	and	a,#8
 848  015c 6b03          	ld	(OFST+0,sp),a
 849  015e 7b0d          	ld	a,(OFST+10,sp)
 850  0160 a404          	and	a,#4
 851  0162 1a03          	or	a,(OFST+0,sp)
 852  0164 ca526f        	or	a,21103
 853  0167 c7526f        	ld	21103,a
 854                     ; 254     TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 856  016a 7b09          	ld	a,(OFST+6,sp)
 857  016c c75267        	ld	21095,a
 858                     ; 255     TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 860  016f 7b0a          	ld	a,(OFST+7,sp)
 861  0171 c75268        	ld	21096,a
 862                     ; 257 }
 865  0174 5b05          	addw	sp,#5
 866  0176 81            	ret	
 970                     ; 278 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 970                     ; 279                   TIM1_OutputState_TypeDef TIM1_OutputState,
 970                     ; 280                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 970                     ; 281                   uint16_t TIM1_Pulse,
 970                     ; 282                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 970                     ; 283                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 970                     ; 284                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 970                     ; 285                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 970                     ; 286 {
 971                     	switch	.text
 972  0177               _TIM1_OC3Init:
 974  0177 89            	pushw	x
 975  0178 5203          	subw	sp,#3
 976       00000003      OFST:	set	3
 979                     ; 288     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 981                     ; 289     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 983                     ; 290     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 985                     ; 291     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 987                     ; 292     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 989                     ; 293     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 991                     ; 294     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 993                     ; 298     TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 993                     ; 299                                 TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
 995  017a c6525d        	ld	a,21085
 996  017d a4f0          	and	a,#240
 997  017f c7525d        	ld	21085,a
 998                     ; 302     TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
 998                     ; 303                              (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
 998                     ; 304                              (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
 998                     ; 305                              (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1000  0182 7b0c          	ld	a,(OFST+9,sp)
1001  0184 a408          	and	a,#8
1002  0186 6b03          	ld	(OFST+0,sp),a
1003  0188 7b0b          	ld	a,(OFST+8,sp)
1004  018a a402          	and	a,#2
1005  018c 1a03          	or	a,(OFST+0,sp)
1006  018e 6b02          	ld	(OFST-1,sp),a
1007  0190 7b08          	ld	a,(OFST+5,sp)
1008  0192 a404          	and	a,#4
1009  0194 6b01          	ld	(OFST-2,sp),a
1010  0196 9f            	ld	a,xl
1011  0197 a401          	and	a,#1
1012  0199 1a01          	or	a,(OFST-2,sp)
1013  019b 1a02          	or	a,(OFST-1,sp)
1014  019d ca525d        	or	a,21085
1015  01a0 c7525d        	ld	21085,a
1016                     ; 308     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1016                     ; 309                              (uint8_t)TIM1_OCMode);
1018  01a3 c6525a        	ld	a,21082
1019  01a6 a48f          	and	a,#143
1020  01a8 1a04          	or	a,(OFST+1,sp)
1021  01aa c7525a        	ld	21082,a
1022                     ; 312     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1024  01ad c6526f        	ld	a,21103
1025  01b0 a4cf          	and	a,#207
1026  01b2 c7526f        	ld	21103,a
1027                     ; 314     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1027                     ; 315                             (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1029  01b5 7b0e          	ld	a,(OFST+11,sp)
1030  01b7 a420          	and	a,#32
1031  01b9 6b03          	ld	(OFST+0,sp),a
1032  01bb 7b0d          	ld	a,(OFST+10,sp)
1033  01bd a410          	and	a,#16
1034  01bf 1a03          	or	a,(OFST+0,sp)
1035  01c1 ca526f        	or	a,21103
1036  01c4 c7526f        	ld	21103,a
1037                     ; 318     TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1039  01c7 7b09          	ld	a,(OFST+6,sp)
1040  01c9 c75269        	ld	21097,a
1041                     ; 319     TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1043  01cc 7b0a          	ld	a,(OFST+7,sp)
1044  01ce c7526a        	ld	21098,a
1045                     ; 321 }
1048  01d1 5b05          	addw	sp,#5
1049  01d3 81            	ret	
1123                     ; 336 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1123                     ; 337                   TIM1_OutputState_TypeDef TIM1_OutputState,
1123                     ; 338                   uint16_t TIM1_Pulse,
1123                     ; 339                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1123                     ; 340                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1123                     ; 341 {
1124                     	switch	.text
1125  01d4               _TIM1_OC4Init:
1127  01d4 89            	pushw	x
1128  01d5 88            	push	a
1129       00000001      OFST:	set	1
1132                     ; 343     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1134                     ; 344     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1136                     ; 345     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1138                     ; 346     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1140                     ; 349     TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1142  01d6 c6525d        	ld	a,21085
1143  01d9 a4cf          	and	a,#207
1144  01db c7525d        	ld	21085,a
1145                     ; 351     TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1145                     ; 352                              (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1147  01de 7b08          	ld	a,(OFST+7,sp)
1148  01e0 a420          	and	a,#32
1149  01e2 6b01          	ld	(OFST+0,sp),a
1150  01e4 9f            	ld	a,xl
1151  01e5 a410          	and	a,#16
1152  01e7 1a01          	or	a,(OFST+0,sp)
1153  01e9 ca525d        	or	a,21085
1154  01ec c7525d        	ld	21085,a
1155                     ; 355     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1155                     ; 356                             TIM1_OCMode);
1157  01ef c6525b        	ld	a,21083
1158  01f2 a48f          	and	a,#143
1159  01f4 1a02          	or	a,(OFST+1,sp)
1160  01f6 c7525b        	ld	21083,a
1161                     ; 359     if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1163  01f9 7b09          	ld	a,(OFST+8,sp)
1164  01fb 270a          	jreq	L534
1165                     ; 361         TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1167  01fd c6526f        	ld	a,21103
1168  0200 aadf          	or	a,#223
1169  0202 c7526f        	ld	21103,a
1171  0205 2004          	jra	L734
1172  0207               L534:
1173                     ; 365         TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1175  0207 721d526f      	bres	21103,#6
1176  020b               L734:
1177                     ; 369     TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1179  020b 7b06          	ld	a,(OFST+5,sp)
1180  020d c7526b        	ld	21099,a
1181                     ; 370     TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1183  0210 7b07          	ld	a,(OFST+6,sp)
1184  0212 c7526c        	ld	21100,a
1185                     ; 372 }
1188  0215 5b03          	addw	sp,#3
1189  0217 81            	ret	
1394                     ; 387 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1394                     ; 388                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1394                     ; 389                      uint8_t TIM1_DeadTime,
1394                     ; 390                      TIM1_BreakState_TypeDef TIM1_Break,
1394                     ; 391                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1394                     ; 392                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1394                     ; 393 {
1395                     	switch	.text
1396  0218               _TIM1_BDTRConfig:
1398  0218 89            	pushw	x
1399  0219 88            	push	a
1400       00000001      OFST:	set	1
1403                     ; 395     assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1405                     ; 396     assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1407                     ; 397     assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1409                     ; 398     assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1411                     ; 399     assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1413                     ; 401     TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1415  021a 7b06          	ld	a,(OFST+5,sp)
1416  021c c7526e        	ld	21102,a
1417                     ; 405     TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1417                     ; 406                             (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1417                     ; 407                             (uint8_t)TIM1_AutomaticOutput));
1419  021f 7b07          	ld	a,(OFST+6,sp)
1420  0221 1a08          	or	a,(OFST+7,sp)
1421  0223 1a09          	or	a,(OFST+8,sp)
1422  0225 6b01          	ld	(OFST+0,sp),a
1423  0227 9f            	ld	a,xl
1424  0228 1a02          	or	a,(OFST+1,sp)
1425  022a 1a01          	or	a,(OFST+0,sp)
1426  022c c7526d        	ld	21101,a
1427                     ; 409 }
1430  022f 5b03          	addw	sp,#3
1431  0231 81            	ret	
1633                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1633                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1633                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1633                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1633                     ; 427                  uint8_t TIM1_ICFilter)
1633                     ; 428 {
1634                     	switch	.text
1635  0232               _TIM1_ICInit:
1637  0232 89            	pushw	x
1638       00000000      OFST:	set	0
1641                     ; 431     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1643                     ; 432     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1645                     ; 433     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1647                     ; 434     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1649                     ; 435     assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1651                     ; 437     if (TIM1_Channel == TIM1_CHANNEL_1)
1653  0233 9e            	ld	a,xh
1654  0234 4d            	tnz	a
1655  0235 2614          	jrne	L766
1656                     ; 440         TI1_Config((uint8_t)TIM1_ICPolarity,
1656                     ; 441                    (uint8_t)TIM1_ICSelection,
1656                     ; 442                    (uint8_t)TIM1_ICFilter);
1658  0237 7b07          	ld	a,(OFST+7,sp)
1659  0239 88            	push	a
1660  023a 7b06          	ld	a,(OFST+6,sp)
1661  023c 97            	ld	xl,a
1662  023d 7b03          	ld	a,(OFST+3,sp)
1663  023f 95            	ld	xh,a
1664  0240 cd07a8        	call	L3_TI1_Config
1666  0243 84            	pop	a
1667                     ; 444         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1669  0244 7b06          	ld	a,(OFST+6,sp)
1670  0246 cd0685        	call	_TIM1_SetIC1Prescaler
1673  0249 2044          	jra	L176
1674  024b               L766:
1675                     ; 446     else if (TIM1_Channel == TIM1_CHANNEL_2)
1677  024b 7b01          	ld	a,(OFST+1,sp)
1678  024d a101          	cp	a,#1
1679  024f 2614          	jrne	L376
1680                     ; 449         TI2_Config((uint8_t)TIM1_ICPolarity,
1680                     ; 450                    (uint8_t)TIM1_ICSelection,
1680                     ; 451                    (uint8_t)TIM1_ICFilter);
1682  0251 7b07          	ld	a,(OFST+7,sp)
1683  0253 88            	push	a
1684  0254 7b06          	ld	a,(OFST+6,sp)
1685  0256 97            	ld	xl,a
1686  0257 7b03          	ld	a,(OFST+3,sp)
1687  0259 95            	ld	xh,a
1688  025a cd07d8        	call	L5_TI2_Config
1690  025d 84            	pop	a
1691                     ; 453         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1693  025e 7b06          	ld	a,(OFST+6,sp)
1694  0260 cd0692        	call	_TIM1_SetIC2Prescaler
1697  0263 202a          	jra	L176
1698  0265               L376:
1699                     ; 455     else if (TIM1_Channel == TIM1_CHANNEL_3)
1701  0265 a102          	cp	a,#2
1702  0267 2614          	jrne	L776
1703                     ; 458         TI3_Config((uint8_t)TIM1_ICPolarity,
1703                     ; 459                    (uint8_t)TIM1_ICSelection,
1703                     ; 460                    (uint8_t)TIM1_ICFilter);
1705  0269 7b07          	ld	a,(OFST+7,sp)
1706  026b 88            	push	a
1707  026c 7b06          	ld	a,(OFST+6,sp)
1708  026e 97            	ld	xl,a
1709  026f 7b03          	ld	a,(OFST+3,sp)
1710  0271 95            	ld	xh,a
1711  0272 cd0808        	call	L7_TI3_Config
1713  0275 84            	pop	a
1714                     ; 462         TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1716  0276 7b06          	ld	a,(OFST+6,sp)
1717  0278 cd069f        	call	_TIM1_SetIC3Prescaler
1720  027b 2012          	jra	L176
1721  027d               L776:
1722                     ; 467         TI4_Config((uint8_t)TIM1_ICPolarity,
1722                     ; 468                    (uint8_t)TIM1_ICSelection,
1722                     ; 469                    (uint8_t)TIM1_ICFilter);
1724  027d 7b07          	ld	a,(OFST+7,sp)
1725  027f 88            	push	a
1726  0280 7b06          	ld	a,(OFST+6,sp)
1727  0282 97            	ld	xl,a
1728  0283 7b03          	ld	a,(OFST+3,sp)
1729  0285 95            	ld	xh,a
1730  0286 cd0838        	call	L11_TI4_Config
1732  0289 84            	pop	a
1733                     ; 471         TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1735  028a 7b06          	ld	a,(OFST+6,sp)
1736  028c cd06ac        	call	_TIM1_SetIC4Prescaler
1738  028f               L176:
1739                     ; 474 }
1742  028f 85            	popw	x
1743  0290 81            	ret	
1839                     ; 490 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1839                     ; 491                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1839                     ; 492                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1839                     ; 493                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1839                     ; 494                      uint8_t TIM1_ICFilter)
1839                     ; 495 {
1840                     	switch	.text
1841  0291               _TIM1_PWMIConfig:
1843  0291 89            	pushw	x
1844  0292 89            	pushw	x
1845       00000002      OFST:	set	2
1848                     ; 496     uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1850                     ; 497     uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1852                     ; 500     assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1854                     ; 501     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1856                     ; 502     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1858                     ; 503     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1860                     ; 506     if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1862  0293 9f            	ld	a,xl
1863  0294 4a            	dec	a
1864  0295 2702          	jreq	L157
1865                     ; 508         icpolarity = TIM1_ICPOLARITY_FALLING;
1867  0297 a601          	ld	a,#1
1869  0299               L157:
1870                     ; 512         icpolarity = TIM1_ICPOLARITY_RISING;
1872  0299 6b01          	ld	(OFST-1,sp),a
1873                     ; 516     if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1875  029b 7b07          	ld	a,(OFST+5,sp)
1876  029d 4a            	dec	a
1877  029e 2604          	jrne	L557
1878                     ; 518         icselection = TIM1_ICSELECTION_INDIRECTTI;
1880  02a0 a602          	ld	a,#2
1882  02a2 2002          	jra	L757
1883  02a4               L557:
1884                     ; 522         icselection = TIM1_ICSELECTION_DIRECTTI;
1886  02a4 a601          	ld	a,#1
1887  02a6               L757:
1888  02a6 6b02          	ld	(OFST+0,sp),a
1889                     ; 525     if (TIM1_Channel == TIM1_CHANNEL_1)
1891  02a8 7b03          	ld	a,(OFST+1,sp)
1892  02aa 2626          	jrne	L167
1893                     ; 528         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1893                     ; 529                    (uint8_t)TIM1_ICFilter);
1895  02ac 7b09          	ld	a,(OFST+7,sp)
1896  02ae 88            	push	a
1897  02af 7b08          	ld	a,(OFST+6,sp)
1898  02b1 97            	ld	xl,a
1899  02b2 7b05          	ld	a,(OFST+3,sp)
1900  02b4 95            	ld	xh,a
1901  02b5 cd07a8        	call	L3_TI1_Config
1903  02b8 84            	pop	a
1904                     ; 532         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1906  02b9 7b08          	ld	a,(OFST+6,sp)
1907  02bb cd0685        	call	_TIM1_SetIC1Prescaler
1909                     ; 535         TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1911  02be 7b09          	ld	a,(OFST+7,sp)
1912  02c0 88            	push	a
1913  02c1 7b03          	ld	a,(OFST+1,sp)
1914  02c3 97            	ld	xl,a
1915  02c4 7b02          	ld	a,(OFST+0,sp)
1916  02c6 95            	ld	xh,a
1917  02c7 cd07d8        	call	L5_TI2_Config
1919  02ca 84            	pop	a
1920                     ; 538         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1922  02cb 7b08          	ld	a,(OFST+6,sp)
1923  02cd cd0692        	call	_TIM1_SetIC2Prescaler
1926  02d0 2024          	jra	L367
1927  02d2               L167:
1928                     ; 543         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1928                     ; 544                    (uint8_t)TIM1_ICFilter);
1930  02d2 7b09          	ld	a,(OFST+7,sp)
1931  02d4 88            	push	a
1932  02d5 7b08          	ld	a,(OFST+6,sp)
1933  02d7 97            	ld	xl,a
1934  02d8 7b05          	ld	a,(OFST+3,sp)
1935  02da 95            	ld	xh,a
1936  02db cd07d8        	call	L5_TI2_Config
1938  02de 84            	pop	a
1939                     ; 547         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1941  02df 7b08          	ld	a,(OFST+6,sp)
1942  02e1 cd0692        	call	_TIM1_SetIC2Prescaler
1944                     ; 550         TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1946  02e4 7b09          	ld	a,(OFST+7,sp)
1947  02e6 88            	push	a
1948  02e7 7b03          	ld	a,(OFST+1,sp)
1949  02e9 97            	ld	xl,a
1950  02ea 7b02          	ld	a,(OFST+0,sp)
1951  02ec 95            	ld	xh,a
1952  02ed cd07a8        	call	L3_TI1_Config
1954  02f0 84            	pop	a
1955                     ; 553         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1957  02f1 7b08          	ld	a,(OFST+6,sp)
1958  02f3 cd0685        	call	_TIM1_SetIC1Prescaler
1960  02f6               L367:
1961                     ; 555 }
1964  02f6 5b04          	addw	sp,#4
1965  02f8 81            	ret	
2020                     ; 563 void TIM1_Cmd(FunctionalState NewState)
2020                     ; 564 {
2021                     	switch	.text
2022  02f9               _TIM1_Cmd:
2026                     ; 566     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2028                     ; 569     if (NewState != DISABLE)
2030  02f9 4d            	tnz	a
2031  02fa 2705          	jreq	L3101
2032                     ; 571         TIM1->CR1 |= TIM1_CR1_CEN;
2034  02fc 72105250      	bset	21072,#0
2037  0300 81            	ret	
2038  0301               L3101:
2039                     ; 575         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2041  0301 72115250      	bres	21072,#0
2042                     ; 577 }
2045  0305 81            	ret	
2081                     ; 585 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2081                     ; 586 {
2082                     	switch	.text
2083  0306               _TIM1_CtrlPWMOutputs:
2087                     ; 588     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2089                     ; 592     if (NewState != DISABLE)
2091  0306 4d            	tnz	a
2092  0307 2705          	jreq	L5301
2093                     ; 594         TIM1->BKR |= TIM1_BKR_MOE;
2095  0309 721e526d      	bset	21101,#7
2098  030d 81            	ret	
2099  030e               L5301:
2100                     ; 598         TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2102  030e 721f526d      	bres	21101,#7
2103                     ; 600 }
2106  0312 81            	ret	
2213                     ; 619 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2213                     ; 620 {
2214                     	switch	.text
2215  0313               _TIM1_ITConfig:
2217  0313 89            	pushw	x
2218       00000000      OFST:	set	0
2221                     ; 622     assert_param(IS_TIM1_IT_OK(TIM1_IT));
2223                     ; 623     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2225                     ; 625     if (NewState != DISABLE)
2227  0314 9f            	ld	a,xl
2228  0315 4d            	tnz	a
2229  0316 2706          	jreq	L7011
2230                     ; 628         TIM1->IER |= (uint8_t)TIM1_IT;
2232  0318 9e            	ld	a,xh
2233  0319 ca5254        	or	a,21076
2235  031c 2006          	jra	L1111
2236  031e               L7011:
2237                     ; 633         TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2239  031e 7b01          	ld	a,(OFST+1,sp)
2240  0320 43            	cpl	a
2241  0321 c45254        	and	a,21076
2242  0324               L1111:
2243  0324 c75254        	ld	21076,a
2244                     ; 635 }
2247  0327 85            	popw	x
2248  0328 81            	ret	
2272                     ; 642 void TIM1_InternalClockConfig(void)
2272                     ; 643 {
2273                     	switch	.text
2274  0329               _TIM1_InternalClockConfig:
2278                     ; 645     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2280  0329 c65252        	ld	a,21074
2281  032c a4f8          	and	a,#248
2282  032e c75252        	ld	21074,a
2283                     ; 646 }
2286  0331 81            	ret	
2403                     ; 664 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2403                     ; 665                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2403                     ; 666                               uint8_t ExtTRGFilter)
2403                     ; 667 {
2404                     	switch	.text
2405  0332               _TIM1_ETRClockMode1Config:
2407  0332 89            	pushw	x
2408       00000000      OFST:	set	0
2411                     ; 669     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2413                     ; 670     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2415                     ; 673     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2417  0333 7b05          	ld	a,(OFST+5,sp)
2418  0335 88            	push	a
2419  0336 7b02          	ld	a,(OFST+2,sp)
2420  0338 95            	ld	xh,a
2421  0339 ad1b          	call	_TIM1_ETRConfig
2423  033b 84            	pop	a
2424                     ; 676     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2424                     ; 677                            | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2426  033c c65252        	ld	a,21074
2427  033f aa77          	or	a,#119
2428  0341 c75252        	ld	21074,a
2429                     ; 678 }
2432  0344 85            	popw	x
2433  0345 81            	ret	
2491                     ; 696 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2491                     ; 697                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2491                     ; 698                               uint8_t ExtTRGFilter)
2491                     ; 699 {
2492                     	switch	.text
2493  0346               _TIM1_ETRClockMode2Config:
2495  0346 89            	pushw	x
2496       00000000      OFST:	set	0
2499                     ; 701     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2501                     ; 702     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2503                     ; 705     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2505  0347 7b05          	ld	a,(OFST+5,sp)
2506  0349 88            	push	a
2507  034a 7b02          	ld	a,(OFST+2,sp)
2508  034c 95            	ld	xh,a
2509  034d ad07          	call	_TIM1_ETRConfig
2511  034f 721c5253      	bset	21075,#6
2512  0353 84            	pop	a
2513                     ; 708     TIM1->ETR |= TIM1_ETR_ECE;
2515                     ; 709 }
2518  0354 85            	popw	x
2519  0355 81            	ret	
2575                     ; 727 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2575                     ; 728                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2575                     ; 729                     uint8_t ExtTRGFilter)
2575                     ; 730 {
2576                     	switch	.text
2577  0356               _TIM1_ETRConfig:
2579  0356 89            	pushw	x
2580       00000000      OFST:	set	0
2583                     ; 732     assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2585                     ; 734     TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2585                     ; 735                       (uint8_t)ExtTRGFilter );
2587  0357 9f            	ld	a,xl
2588  0358 1a01          	or	a,(OFST+1,sp)
2589  035a 1a05          	or	a,(OFST+5,sp)
2590  035c ca5253        	or	a,21075
2591  035f c75253        	ld	21075,a
2592                     ; 736 }
2595  0362 85            	popw	x
2596  0363 81            	ret	
2685                     ; 753 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2685                     ; 754                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2685                     ; 755                                  uint8_t ICFilter)
2685                     ; 756 {
2686                     	switch	.text
2687  0364               _TIM1_TIxExternalClockConfig:
2689  0364 89            	pushw	x
2690       00000000      OFST:	set	0
2693                     ; 758     assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2695                     ; 759     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2697                     ; 760     assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2699                     ; 763     if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2701  0365 9e            	ld	a,xh
2702  0366 a160          	cp	a,#96
2703  0368 260e          	jrne	L1131
2704                     ; 765         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2706  036a 7b05          	ld	a,(OFST+5,sp)
2707  036c 88            	push	a
2708  036d ae0001        	ldw	x,#1
2709  0370 7b03          	ld	a,(OFST+3,sp)
2710  0372 95            	ld	xh,a
2711  0373 cd07d8        	call	L5_TI2_Config
2714  0376 200c          	jra	L3131
2715  0378               L1131:
2716                     ; 769         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2718  0378 7b05          	ld	a,(OFST+5,sp)
2719  037a 88            	push	a
2720  037b ae0001        	ldw	x,#1
2721  037e 7b03          	ld	a,(OFST+3,sp)
2722  0380 95            	ld	xh,a
2723  0381 cd07a8        	call	L3_TI1_Config
2725  0384               L3131:
2726  0384 84            	pop	a
2727                     ; 773     TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2729  0385 7b01          	ld	a,(OFST+1,sp)
2730  0387 ad0a          	call	_TIM1_SelectInputTrigger
2732                     ; 776     TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2734  0389 c65252        	ld	a,21074
2735  038c aa07          	or	a,#7
2736  038e c75252        	ld	21074,a
2737                     ; 777 }
2740  0391 85            	popw	x
2741  0392 81            	ret	
2826                     ; 789 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2826                     ; 790 {
2827                     	switch	.text
2828  0393               _TIM1_SelectInputTrigger:
2830  0393 88            	push	a
2831       00000000      OFST:	set	0
2834                     ; 792     assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2836                     ; 795     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2838  0394 c65252        	ld	a,21074
2839  0397 a48f          	and	a,#143
2840  0399 1a01          	or	a,(OFST+1,sp)
2841  039b c75252        	ld	21074,a
2842                     ; 796 }
2845  039e 84            	pop	a
2846  039f 81            	ret	
2882                     ; 806 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2882                     ; 807 {
2883                     	switch	.text
2884  03a0               _TIM1_UpdateDisableConfig:
2888                     ; 809     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2890                     ; 812     if (NewState != DISABLE)
2892  03a0 4d            	tnz	a
2893  03a1 2705          	jreq	L1731
2894                     ; 814         TIM1->CR1 |= TIM1_CR1_UDIS;
2896  03a3 72125250      	bset	21072,#1
2899  03a7 81            	ret	
2900  03a8               L1731:
2901                     ; 818         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2903  03a8 72135250      	bres	21072,#1
2904                     ; 820 }
2907  03ac 81            	ret	
2965                     ; 830 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2965                     ; 831 {
2966                     	switch	.text
2967  03ad               _TIM1_UpdateRequestConfig:
2971                     ; 833     assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
2973                     ; 836     if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
2975  03ad 4d            	tnz	a
2976  03ae 2705          	jreq	L3241
2977                     ; 838         TIM1->CR1 |= TIM1_CR1_URS;
2979  03b0 72145250      	bset	21072,#2
2982  03b4 81            	ret	
2983  03b5               L3241:
2984                     ; 842         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
2986  03b5 72155250      	bres	21072,#2
2987                     ; 844 }
2990  03b9 81            	ret	
3026                     ; 853 void TIM1_SelectHallSensor(FunctionalState NewState)
3026                     ; 854 {
3027                     	switch	.text
3028  03ba               _TIM1_SelectHallSensor:
3032                     ; 856     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3034                     ; 859     if (NewState != DISABLE)
3036  03ba 4d            	tnz	a
3037  03bb 2705          	jreq	L5441
3038                     ; 861         TIM1->CR2 |= TIM1_CR2_TI1S;
3040  03bd 721e5251      	bset	21073,#7
3043  03c1 81            	ret	
3044  03c2               L5441:
3045                     ; 865         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3047  03c2 721f5251      	bres	21073,#7
3048                     ; 867 }
3051  03c6 81            	ret	
3108                     ; 878 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3108                     ; 879 {
3109                     	switch	.text
3110  03c7               _TIM1_SelectOnePulseMode:
3114                     ; 881     assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3116                     ; 884     if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3118  03c7 4d            	tnz	a
3119  03c8 2705          	jreq	L7741
3120                     ; 886         TIM1->CR1 |= TIM1_CR1_OPM;
3122  03ca 72165250      	bset	21072,#3
3125  03ce 81            	ret	
3126  03cf               L7741:
3127                     ; 890         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3129  03cf 72175250      	bres	21072,#3
3130                     ; 893 }
3133  03d3 81            	ret	
3231                     ; 909 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3231                     ; 910 {
3232                     	switch	.text
3233  03d4               _TIM1_SelectOutputTrigger:
3235  03d4 88            	push	a
3236       00000000      OFST:	set	0
3239                     ; 912     assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3241                     ; 915     TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3241                     ; 916                           (uint8_t) TIM1_TRGOSource);
3243  03d5 c65251        	ld	a,21073
3244  03d8 a48f          	and	a,#143
3245  03da 1a01          	or	a,(OFST+1,sp)
3246  03dc c75251        	ld	21073,a
3247                     ; 917 }
3250  03df 84            	pop	a
3251  03e0 81            	ret	
3325                     ; 929 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3325                     ; 930 {
3326                     	switch	.text
3327  03e1               _TIM1_SelectSlaveMode:
3329  03e1 88            	push	a
3330       00000000      OFST:	set	0
3333                     ; 933     assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3335                     ; 936     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3335                     ; 937                            (uint8_t)TIM1_SlaveMode);
3337  03e2 c65252        	ld	a,21074
3338  03e5 a4f8          	and	a,#248
3339  03e7 1a01          	or	a,(OFST+1,sp)
3340  03e9 c75252        	ld	21074,a
3341                     ; 939 }
3344  03ec 84            	pop	a
3345  03ed 81            	ret	
3381                     ; 947 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3381                     ; 948 {
3382                     	switch	.text
3383  03ee               _TIM1_SelectMasterSlaveMode:
3387                     ; 950     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3389                     ; 953     if (NewState != DISABLE)
3391  03ee 4d            	tnz	a
3392  03ef 2705          	jreq	L3161
3393                     ; 955         TIM1->SMCR |= TIM1_SMCR_MSM;
3395  03f1 721e5252      	bset	21074,#7
3398  03f5 81            	ret	
3399  03f6               L3161:
3400                     ; 959         TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3402  03f6 721f5252      	bres	21074,#7
3403                     ; 961 }
3406  03fa 81            	ret	
3492                     ; 983 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3492                     ; 984                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3492                     ; 985                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3492                     ; 986 {
3493                     	switch	.text
3494  03fb               _TIM1_EncoderInterfaceConfig:
3496  03fb 89            	pushw	x
3497       00000000      OFST:	set	0
3500                     ; 990     assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3502                     ; 991     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3504                     ; 992     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3506                     ; 995     if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3508  03fc 9f            	ld	a,xl
3509  03fd 4d            	tnz	a
3510  03fe 2706          	jreq	L7561
3511                     ; 997         TIM1->CCER1 |= TIM1_CCER1_CC1P;
3513  0400 7212525c      	bset	21084,#1
3515  0404 2004          	jra	L1661
3516  0406               L7561:
3517                     ; 1001         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3519  0406 7213525c      	bres	21084,#1
3520  040a               L1661:
3521                     ; 1004     if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3523  040a 7b05          	ld	a,(OFST+5,sp)
3524  040c 2706          	jreq	L3661
3525                     ; 1006         TIM1->CCER1 |= TIM1_CCER1_CC2P;
3527  040e 721a525c      	bset	21084,#5
3529  0412 2004          	jra	L5661
3530  0414               L3661:
3531                     ; 1010         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3533  0414 721b525c      	bres	21084,#5
3534  0418               L5661:
3535                     ; 1013     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3535                     ; 1014                            | (uint8_t) TIM1_EncoderMode);
3537  0418 c65252        	ld	a,21074
3538  041b a4f0          	and	a,#240
3539  041d 1a01          	or	a,(OFST+1,sp)
3540  041f c75252        	ld	21074,a
3541                     ; 1017     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3541                     ; 1018                             | (uint8_t) CCMR_TIxDirect_Set);
3543  0422 c65258        	ld	a,21080
3544  0425 a4fc          	and	a,#252
3545  0427 aa01          	or	a,#1
3546  0429 c75258        	ld	21080,a
3547                     ; 1019     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3547                     ; 1020                             | (uint8_t) CCMR_TIxDirect_Set);
3549  042c c65259        	ld	a,21081
3550  042f a4fc          	and	a,#252
3551  0431 aa01          	or	a,#1
3552  0433 c75259        	ld	21081,a
3553                     ; 1022 }
3556  0436 85            	popw	x
3557  0437 81            	ret	
3624                     ; 1035 void TIM1_PrescalerConfig(uint16_t Prescaler,
3624                     ; 1036                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3624                     ; 1037 {
3625                     	switch	.text
3626  0438               _TIM1_PrescalerConfig:
3628  0438 89            	pushw	x
3629       00000000      OFST:	set	0
3632                     ; 1039     assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3634                     ; 1042     TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3636  0439 9e            	ld	a,xh
3637  043a c75260        	ld	21088,a
3638                     ; 1043     TIM1->PSCRL = (uint8_t)(Prescaler);
3640  043d 9f            	ld	a,xl
3641  043e c75261        	ld	21089,a
3642                     ; 1046     TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3644  0441 7b05          	ld	a,(OFST+5,sp)
3645  0443 c75257        	ld	21079,a
3646                     ; 1048 }
3649  0446 85            	popw	x
3650  0447 81            	ret	
3686                     ; 1061 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3686                     ; 1062 {
3687                     	switch	.text
3688  0448               _TIM1_CounterModeConfig:
3690  0448 88            	push	a
3691       00000000      OFST:	set	0
3694                     ; 1064     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3696                     ; 1068     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3696                     ; 1069                           | (uint8_t)TIM1_CounterMode);
3698  0449 c65250        	ld	a,21072
3699  044c a48f          	and	a,#143
3700  044e 1a01          	or	a,(OFST+1,sp)
3701  0450 c75250        	ld	21072,a
3702                     ; 1070 }
3705  0453 84            	pop	a
3706  0454 81            	ret	
3764                     ; 1081 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3764                     ; 1082 {
3765                     	switch	.text
3766  0455               _TIM1_ForcedOC1Config:
3768  0455 88            	push	a
3769       00000000      OFST:	set	0
3772                     ; 1084     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3774                     ; 1087     TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3774                     ; 1088                              (uint8_t)TIM1_ForcedAction);
3776  0456 c65258        	ld	a,21080
3777  0459 a48f          	and	a,#143
3778  045b 1a01          	or	a,(OFST+1,sp)
3779  045d c75258        	ld	21080,a
3780                     ; 1089 }
3783  0460 84            	pop	a
3784  0461 81            	ret	
3820                     ; 1100 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3820                     ; 1101 {
3821                     	switch	.text
3822  0462               _TIM1_ForcedOC2Config:
3824  0462 88            	push	a
3825       00000000      OFST:	set	0
3828                     ; 1103     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3830                     ; 1106     TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3830                     ; 1107                               | (uint8_t)TIM1_ForcedAction);
3832  0463 c65259        	ld	a,21081
3833  0466 a48f          	and	a,#143
3834  0468 1a01          	or	a,(OFST+1,sp)
3835  046a c75259        	ld	21081,a
3836                     ; 1108 }
3839  046d 84            	pop	a
3840  046e 81            	ret	
3876                     ; 1120 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3876                     ; 1121 {
3877                     	switch	.text
3878  046f               _TIM1_ForcedOC3Config:
3880  046f 88            	push	a
3881       00000000      OFST:	set	0
3884                     ; 1123     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3886                     ; 1126     TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3886                     ; 1127                               | (uint8_t)TIM1_ForcedAction);
3888  0470 c6525a        	ld	a,21082
3889  0473 a48f          	and	a,#143
3890  0475 1a01          	or	a,(OFST+1,sp)
3891  0477 c7525a        	ld	21082,a
3892                     ; 1128 }
3895  047a 84            	pop	a
3896  047b 81            	ret	
3932                     ; 1140 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3932                     ; 1141 {
3933                     	switch	.text
3934  047c               _TIM1_ForcedOC4Config:
3936  047c 88            	push	a
3937       00000000      OFST:	set	0
3940                     ; 1143     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3942                     ; 1146     TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3942                     ; 1147                               | (uint8_t)TIM1_ForcedAction);
3944  047d c6525b        	ld	a,21083
3945  0480 a48f          	and	a,#143
3946  0482 1a01          	or	a,(OFST+1,sp)
3947  0484 c7525b        	ld	21083,a
3948                     ; 1148 }
3951  0487 84            	pop	a
3952  0488 81            	ret	
3988                     ; 1157 void TIM1_ARRPreloadConfig(FunctionalState NewState)
3988                     ; 1158 {
3989                     	switch	.text
3990  0489               _TIM1_ARRPreloadConfig:
3994                     ; 1160     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3996                     ; 1163     if (NewState != DISABLE)
3998  0489 4d            	tnz	a
3999  048a 2705          	jreq	L5502
4000                     ; 1165         TIM1->CR1 |= TIM1_CR1_ARPE;
4002  048c 721e5250      	bset	21072,#7
4005  0490 81            	ret	
4006  0491               L5502:
4007                     ; 1169         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4009  0491 721f5250      	bres	21072,#7
4010                     ; 1171 }
4013  0495 81            	ret	
4048                     ; 1180 void TIM1_SelectCOM(FunctionalState NewState)
4048                     ; 1181 {
4049                     	switch	.text
4050  0496               _TIM1_SelectCOM:
4054                     ; 1183     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4056                     ; 1186     if (NewState != DISABLE)
4058  0496 4d            	tnz	a
4059  0497 2705          	jreq	L7702
4060                     ; 1188         TIM1->CR2 |= TIM1_CR2_COMS;
4062  0499 72145251      	bset	21073,#2
4065  049d 81            	ret	
4066  049e               L7702:
4067                     ; 1192         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4069  049e 72155251      	bres	21073,#2
4070                     ; 1194 }
4073  04a2 81            	ret	
4109                     ; 1202 void TIM1_CCPreloadControl(FunctionalState NewState)
4109                     ; 1203 {
4110                     	switch	.text
4111  04a3               _TIM1_CCPreloadControl:
4115                     ; 1205     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4117                     ; 1208     if (NewState != DISABLE)
4119  04a3 4d            	tnz	a
4120  04a4 2705          	jreq	L1212
4121                     ; 1210         TIM1->CR2 |= TIM1_CR2_CCPC;
4123  04a6 72105251      	bset	21073,#0
4126  04aa 81            	ret	
4127  04ab               L1212:
4128                     ; 1214         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4130  04ab 72115251      	bres	21073,#0
4131                     ; 1216 }
4134  04af 81            	ret	
4170                     ; 1225 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4170                     ; 1226 {
4171                     	switch	.text
4172  04b0               _TIM1_OC1PreloadConfig:
4176                     ; 1228     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4178                     ; 1231     if (NewState != DISABLE)
4180  04b0 4d            	tnz	a
4181  04b1 2705          	jreq	L3412
4182                     ; 1233         TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4184  04b3 72165258      	bset	21080,#3
4187  04b7 81            	ret	
4188  04b8               L3412:
4189                     ; 1237         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4191  04b8 72175258      	bres	21080,#3
4192                     ; 1239 }
4195  04bc 81            	ret	
4231                     ; 1248 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4231                     ; 1249 {
4232                     	switch	.text
4233  04bd               _TIM1_OC2PreloadConfig:
4237                     ; 1251     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4239                     ; 1254     if (NewState != DISABLE)
4241  04bd 4d            	tnz	a
4242  04be 2705          	jreq	L5612
4243                     ; 1256         TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4245  04c0 72165259      	bset	21081,#3
4248  04c4 81            	ret	
4249  04c5               L5612:
4250                     ; 1260         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4252  04c5 72175259      	bres	21081,#3
4253                     ; 1262 }
4256  04c9 81            	ret	
4292                     ; 1271 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4292                     ; 1272 {
4293                     	switch	.text
4294  04ca               _TIM1_OC3PreloadConfig:
4298                     ; 1274     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4300                     ; 1277     if (NewState != DISABLE)
4302  04ca 4d            	tnz	a
4303  04cb 2705          	jreq	L7022
4304                     ; 1279         TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4306  04cd 7216525a      	bset	21082,#3
4309  04d1 81            	ret	
4310  04d2               L7022:
4311                     ; 1283         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4313  04d2 7217525a      	bres	21082,#3
4314                     ; 1285 }
4317  04d6 81            	ret	
4353                     ; 1295 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4353                     ; 1296 {
4354                     	switch	.text
4355  04d7               _TIM1_OC4PreloadConfig:
4359                     ; 1298     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4361                     ; 1301     if (NewState != DISABLE)
4363  04d7 4d            	tnz	a
4364  04d8 2705          	jreq	L1322
4365                     ; 1303         TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4367  04da 7216525b      	bset	21083,#3
4370  04de 81            	ret	
4371  04df               L1322:
4372                     ; 1307         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4374  04df 7217525b      	bres	21083,#3
4375                     ; 1309 }
4378  04e3 81            	ret	
4413                     ; 1317 void TIM1_OC1FastConfig(FunctionalState NewState)
4413                     ; 1318 {
4414                     	switch	.text
4415  04e4               _TIM1_OC1FastConfig:
4419                     ; 1320     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4421                     ; 1323     if (NewState != DISABLE)
4423  04e4 4d            	tnz	a
4424  04e5 2705          	jreq	L3522
4425                     ; 1325         TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4427  04e7 72145258      	bset	21080,#2
4430  04eb 81            	ret	
4431  04ec               L3522:
4432                     ; 1329         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4434  04ec 72155258      	bres	21080,#2
4435                     ; 1331 }
4438  04f0 81            	ret	
4473                     ; 1341 void TIM1_OC2FastConfig(FunctionalState NewState)
4473                     ; 1342 {
4474                     	switch	.text
4475  04f1               _TIM1_OC2FastConfig:
4479                     ; 1344     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4481                     ; 1347     if (NewState != DISABLE)
4483  04f1 4d            	tnz	a
4484  04f2 2705          	jreq	L5722
4485                     ; 1349         TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4487  04f4 72145259      	bset	21081,#2
4490  04f8 81            	ret	
4491  04f9               L5722:
4492                     ; 1353         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4494  04f9 72155259      	bres	21081,#2
4495                     ; 1355 }
4498  04fd 81            	ret	
4533                     ; 1364 void TIM1_OC3FastConfig(FunctionalState NewState)
4533                     ; 1365 {
4534                     	switch	.text
4535  04fe               _TIM1_OC3FastConfig:
4539                     ; 1367     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4541                     ; 1370     if (NewState != DISABLE)
4543  04fe 4d            	tnz	a
4544  04ff 2705          	jreq	L7132
4545                     ; 1372         TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4547  0501 7214525a      	bset	21082,#2
4550  0505 81            	ret	
4551  0506               L7132:
4552                     ; 1376         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4554  0506 7215525a      	bres	21082,#2
4555                     ; 1378 }
4558  050a 81            	ret	
4593                     ; 1387 void TIM1_OC4FastConfig(FunctionalState NewState)
4593                     ; 1388 {
4594                     	switch	.text
4595  050b               _TIM1_OC4FastConfig:
4599                     ; 1390     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4601                     ; 1393     if (NewState != DISABLE)
4603  050b 4d            	tnz	a
4604  050c 2705          	jreq	L1432
4605                     ; 1395         TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4607  050e 7214525b      	bset	21083,#2
4610  0512 81            	ret	
4611  0513               L1432:
4612                     ; 1399         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4614  0513 7215525b      	bres	21083,#2
4615                     ; 1401 }
4618  0517 81            	ret	
4723                     ; 1418 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4723                     ; 1419 {
4724                     	switch	.text
4725  0518               _TIM1_GenerateEvent:
4729                     ; 1421     assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4731                     ; 1424     TIM1->EGR = (uint8_t)TIM1_EventSource;
4733  0518 c75257        	ld	21079,a
4734                     ; 1425 }
4737  051b 81            	ret	
4773                     ; 1436 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4773                     ; 1437 {
4774                     	switch	.text
4775  051c               _TIM1_OC1PolarityConfig:
4779                     ; 1439     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4781                     ; 1442     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4783  051c 4d            	tnz	a
4784  051d 2705          	jreq	L5242
4785                     ; 1444         TIM1->CCER1 |= TIM1_CCER1_CC1P;
4787  051f 7212525c      	bset	21084,#1
4790  0523 81            	ret	
4791  0524               L5242:
4792                     ; 1448         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4794  0524 7213525c      	bres	21084,#1
4795                     ; 1450 }
4798  0528 81            	ret	
4834                     ; 1461 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4834                     ; 1462 {
4835                     	switch	.text
4836  0529               _TIM1_OC1NPolarityConfig:
4840                     ; 1464     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4842                     ; 1467     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4844  0529 4d            	tnz	a
4845  052a 2705          	jreq	L7442
4846                     ; 1469         TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4848  052c 7216525c      	bset	21084,#3
4851  0530 81            	ret	
4852  0531               L7442:
4853                     ; 1473         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4855  0531 7217525c      	bres	21084,#3
4856                     ; 1475 }
4859  0535 81            	ret	
4895                     ; 1486 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4895                     ; 1487 {
4896                     	switch	.text
4897  0536               _TIM1_OC2PolarityConfig:
4901                     ; 1489     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4903                     ; 1492     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4905  0536 4d            	tnz	a
4906  0537 2705          	jreq	L1742
4907                     ; 1494         TIM1->CCER1 |= TIM1_CCER1_CC2P;
4909  0539 721a525c      	bset	21084,#5
4912  053d 81            	ret	
4913  053e               L1742:
4914                     ; 1498         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4916  053e 721b525c      	bres	21084,#5
4917                     ; 1500 }
4920  0542 81            	ret	
4956                     ; 1510 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4956                     ; 1511 {
4957                     	switch	.text
4958  0543               _TIM1_OC2NPolarityConfig:
4962                     ; 1513     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4964                     ; 1516     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4966  0543 4d            	tnz	a
4967  0544 2705          	jreq	L3152
4968                     ; 1518         TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4970  0546 721e525c      	bset	21084,#7
4973  054a 81            	ret	
4974  054b               L3152:
4975                     ; 1522         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
4977  054b 721f525c      	bres	21084,#7
4978                     ; 1524 }
4981  054f 81            	ret	
5017                     ; 1535 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5017                     ; 1536 {
5018                     	switch	.text
5019  0550               _TIM1_OC3PolarityConfig:
5023                     ; 1538     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5025                     ; 1541     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5027  0550 4d            	tnz	a
5028  0551 2705          	jreq	L5352
5029                     ; 1543         TIM1->CCER2 |= TIM1_CCER2_CC3P;
5031  0553 7212525d      	bset	21085,#1
5034  0557 81            	ret	
5035  0558               L5352:
5036                     ; 1547         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5038  0558 7213525d      	bres	21085,#1
5039                     ; 1549 }
5042  055c 81            	ret	
5078                     ; 1560 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5078                     ; 1561 {
5079                     	switch	.text
5080  055d               _TIM1_OC3NPolarityConfig:
5084                     ; 1563     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5086                     ; 1566     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5088  055d 4d            	tnz	a
5089  055e 2705          	jreq	L7552
5090                     ; 1568         TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5092  0560 7216525d      	bset	21085,#3
5095  0564 81            	ret	
5096  0565               L7552:
5097                     ; 1572         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5099  0565 7217525d      	bres	21085,#3
5100                     ; 1574 }
5103  0569 81            	ret	
5139                     ; 1584 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5139                     ; 1585 {
5140                     	switch	.text
5141  056a               _TIM1_OC4PolarityConfig:
5145                     ; 1587     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5147                     ; 1590     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5149  056a 4d            	tnz	a
5150  056b 2705          	jreq	L1062
5151                     ; 1592         TIM1->CCER2 |= TIM1_CCER2_CC4P;
5153  056d 721a525d      	bset	21085,#5
5156  0571 81            	ret	
5157  0572               L1062:
5158                     ; 1596         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5160  0572 721b525d      	bres	21085,#5
5161                     ; 1598 }
5164  0576 81            	ret	
5209                     ; 1613 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5209                     ; 1614 {
5210                     	switch	.text
5211  0577               _TIM1_CCxCmd:
5213  0577 89            	pushw	x
5214       00000000      OFST:	set	0
5217                     ; 1616     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5219                     ; 1617     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5221                     ; 1619     if (TIM1_Channel == TIM1_CHANNEL_1)
5223  0578 9e            	ld	a,xh
5224  0579 4d            	tnz	a
5225  057a 2610          	jrne	L7262
5226                     ; 1622         if (NewState != DISABLE)
5228  057c 9f            	ld	a,xl
5229  057d 4d            	tnz	a
5230  057e 2706          	jreq	L1362
5231                     ; 1624             TIM1->CCER1 |= TIM1_CCER1_CC1E;
5233  0580 7210525c      	bset	21084,#0
5235  0584 203e          	jra	L5362
5236  0586               L1362:
5237                     ; 1628             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5239  0586 7211525c      	bres	21084,#0
5240  058a 2038          	jra	L5362
5241  058c               L7262:
5242                     ; 1632     else if (TIM1_Channel == TIM1_CHANNEL_2)
5244  058c 7b01          	ld	a,(OFST+1,sp)
5245  058e a101          	cp	a,#1
5246  0590 2610          	jrne	L7362
5247                     ; 1635         if (NewState != DISABLE)
5249  0592 7b02          	ld	a,(OFST+2,sp)
5250  0594 2706          	jreq	L1462
5251                     ; 1637             TIM1->CCER1 |= TIM1_CCER1_CC2E;
5253  0596 7218525c      	bset	21084,#4
5255  059a 2028          	jra	L5362
5256  059c               L1462:
5257                     ; 1641             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5259  059c 7219525c      	bres	21084,#4
5260  05a0 2022          	jra	L5362
5261  05a2               L7362:
5262                     ; 1644     else if (TIM1_Channel == TIM1_CHANNEL_3)
5264  05a2 a102          	cp	a,#2
5265  05a4 2610          	jrne	L7462
5266                     ; 1647         if (NewState != DISABLE)
5268  05a6 7b02          	ld	a,(OFST+2,sp)
5269  05a8 2706          	jreq	L1562
5270                     ; 1649             TIM1->CCER2 |= TIM1_CCER2_CC3E;
5272  05aa 7210525d      	bset	21085,#0
5274  05ae 2014          	jra	L5362
5275  05b0               L1562:
5276                     ; 1653             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5278  05b0 7211525d      	bres	21085,#0
5279  05b4 200e          	jra	L5362
5280  05b6               L7462:
5281                     ; 1659         if (NewState != DISABLE)
5283  05b6 7b02          	ld	a,(OFST+2,sp)
5284  05b8 2706          	jreq	L7562
5285                     ; 1661             TIM1->CCER2 |= TIM1_CCER2_CC4E;
5287  05ba 7218525d      	bset	21085,#4
5289  05be 2004          	jra	L5362
5290  05c0               L7562:
5291                     ; 1665             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5293  05c0 7219525d      	bres	21085,#4
5294  05c4               L5362:
5295                     ; 1668 }
5298  05c4 85            	popw	x
5299  05c5 81            	ret	
5344                     ; 1681 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5344                     ; 1682 {
5345                     	switch	.text
5346  05c6               _TIM1_CCxNCmd:
5348  05c6 89            	pushw	x
5349       00000000      OFST:	set	0
5352                     ; 1684     assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5354                     ; 1685     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5356                     ; 1687     if (TIM1_Channel == TIM1_CHANNEL_1)
5358  05c7 9e            	ld	a,xh
5359  05c8 4d            	tnz	a
5360  05c9 2610          	jrne	L5072
5361                     ; 1690         if (NewState != DISABLE)
5363  05cb 9f            	ld	a,xl
5364  05cc 4d            	tnz	a
5365  05cd 2706          	jreq	L7072
5366                     ; 1692             TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5368  05cf 7214525c      	bset	21084,#2
5370  05d3 2029          	jra	L3172
5371  05d5               L7072:
5372                     ; 1696             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5374  05d5 7215525c      	bres	21084,#2
5375  05d9 2023          	jra	L3172
5376  05db               L5072:
5377                     ; 1699     else if (TIM1_Channel == TIM1_CHANNEL_2)
5379  05db 7b01          	ld	a,(OFST+1,sp)
5380  05dd 4a            	dec	a
5381  05de 2610          	jrne	L5172
5382                     ; 1702         if (NewState != DISABLE)
5384  05e0 7b02          	ld	a,(OFST+2,sp)
5385  05e2 2706          	jreq	L7172
5386                     ; 1704             TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5388  05e4 721c525c      	bset	21084,#6
5390  05e8 2014          	jra	L3172
5391  05ea               L7172:
5392                     ; 1708             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5394  05ea 721d525c      	bres	21084,#6
5395  05ee 200e          	jra	L3172
5396  05f0               L5172:
5397                     ; 1714         if (NewState != DISABLE)
5399  05f0 7b02          	ld	a,(OFST+2,sp)
5400  05f2 2706          	jreq	L5272
5401                     ; 1716             TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5403  05f4 7214525d      	bset	21085,#2
5405  05f8 2004          	jra	L3172
5406  05fa               L5272:
5407                     ; 1720             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5409  05fa 7215525d      	bres	21085,#2
5410  05fe               L3172:
5411                     ; 1723 }
5414  05fe 85            	popw	x
5415  05ff 81            	ret	
5460                     ; 1747 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5460                     ; 1748 {
5461                     	switch	.text
5462  0600               _TIM1_SelectOCxM:
5464  0600 89            	pushw	x
5465       00000000      OFST:	set	0
5468                     ; 1750     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5470                     ; 1751     assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5472                     ; 1753     if (TIM1_Channel == TIM1_CHANNEL_1)
5474  0601 9e            	ld	a,xh
5475  0602 4d            	tnz	a
5476  0603 2610          	jrne	L3572
5477                     ; 1756         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5479  0605 7211525c      	bres	21084,#0
5480                     ; 1759         TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5480                     ; 1760                                 | (uint8_t)TIM1_OCMode);
5482  0609 c65258        	ld	a,21080
5483  060c a48f          	and	a,#143
5484  060e 1a02          	or	a,(OFST+2,sp)
5485  0610 c75258        	ld	21080,a
5487  0613 2038          	jra	L5572
5488  0615               L3572:
5489                     ; 1762     else if (TIM1_Channel == TIM1_CHANNEL_2)
5491  0615 7b01          	ld	a,(OFST+1,sp)
5492  0617 a101          	cp	a,#1
5493  0619 2610          	jrne	L7572
5494                     ; 1765         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5496  061b 7219525c      	bres	21084,#4
5497                     ; 1768         TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5497                     ; 1769                                 | (uint8_t)TIM1_OCMode);
5499  061f c65259        	ld	a,21081
5500  0622 a48f          	and	a,#143
5501  0624 1a02          	or	a,(OFST+2,sp)
5502  0626 c75259        	ld	21081,a
5504  0629 2022          	jra	L5572
5505  062b               L7572:
5506                     ; 1771     else if (TIM1_Channel == TIM1_CHANNEL_3)
5508  062b a102          	cp	a,#2
5509  062d 2610          	jrne	L3672
5510                     ; 1774         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5512  062f 7211525d      	bres	21085,#0
5513                     ; 1777         TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5513                     ; 1778                                 | (uint8_t)TIM1_OCMode);
5515  0633 c6525a        	ld	a,21082
5516  0636 a48f          	and	a,#143
5517  0638 1a02          	or	a,(OFST+2,sp)
5518  063a c7525a        	ld	21082,a
5520  063d 200e          	jra	L5572
5521  063f               L3672:
5522                     ; 1783         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5524  063f 7219525d      	bres	21085,#4
5525                     ; 1786         TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5525                     ; 1787                                 | (uint8_t)TIM1_OCMode);
5527  0643 c6525b        	ld	a,21083
5528  0646 a48f          	and	a,#143
5529  0648 1a02          	or	a,(OFST+2,sp)
5530  064a c7525b        	ld	21083,a
5531  064d               L5572:
5532                     ; 1789 }
5535  064d 85            	popw	x
5536  064e 81            	ret	
5570                     ; 1798 void TIM1_SetCounter(uint16_t Counter)
5570                     ; 1799 {
5571                     	switch	.text
5572  064f               _TIM1_SetCounter:
5576                     ; 1801     TIM1->CNTRH = (uint8_t)(Counter >> 8);
5578  064f 9e            	ld	a,xh
5579  0650 c7525e        	ld	21086,a
5580                     ; 1802     TIM1->CNTRL = (uint8_t)(Counter);
5582  0653 9f            	ld	a,xl
5583  0654 c7525f        	ld	21087,a
5584                     ; 1804 }
5587  0657 81            	ret	
5621                     ; 1813 void TIM1_SetAutoreload(uint16_t Autoreload)
5621                     ; 1814 {
5622                     	switch	.text
5623  0658               _TIM1_SetAutoreload:
5627                     ; 1817     TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5629  0658 9e            	ld	a,xh
5630  0659 c75262        	ld	21090,a
5631                     ; 1818     TIM1->ARRL = (uint8_t)(Autoreload);
5633  065c 9f            	ld	a,xl
5634  065d c75263        	ld	21091,a
5635                     ; 1820 }
5638  0660 81            	ret	
5672                     ; 1829 void TIM1_SetCompare1(uint16_t Compare1)
5672                     ; 1830 {
5673                     	switch	.text
5674  0661               _TIM1_SetCompare1:
5678                     ; 1832     TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5680  0661 9e            	ld	a,xh
5681  0662 c75265        	ld	21093,a
5682                     ; 1833     TIM1->CCR1L = (uint8_t)(Compare1);
5684  0665 9f            	ld	a,xl
5685  0666 c75266        	ld	21094,a
5686                     ; 1835 }
5689  0669 81            	ret	
5723                     ; 1844 void TIM1_SetCompare2(uint16_t Compare2)
5723                     ; 1845 {
5724                     	switch	.text
5725  066a               _TIM1_SetCompare2:
5729                     ; 1847     TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5731  066a 9e            	ld	a,xh
5732  066b c75267        	ld	21095,a
5733                     ; 1848     TIM1->CCR2L = (uint8_t)(Compare2);
5735  066e 9f            	ld	a,xl
5736  066f c75268        	ld	21096,a
5737                     ; 1850 }
5740  0672 81            	ret	
5774                     ; 1859 void TIM1_SetCompare3(uint16_t Compare3)
5774                     ; 1860 {
5775                     	switch	.text
5776  0673               _TIM1_SetCompare3:
5780                     ; 1862     TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5782  0673 9e            	ld	a,xh
5783  0674 c75269        	ld	21097,a
5784                     ; 1863     TIM1->CCR3L = (uint8_t)(Compare3);
5786  0677 9f            	ld	a,xl
5787  0678 c7526a        	ld	21098,a
5788                     ; 1865 }
5791  067b 81            	ret	
5825                     ; 1874 void TIM1_SetCompare4(uint16_t Compare4)
5825                     ; 1875 {
5826                     	switch	.text
5827  067c               _TIM1_SetCompare4:
5831                     ; 1877     TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5833  067c 9e            	ld	a,xh
5834  067d c7526b        	ld	21099,a
5835                     ; 1878     TIM1->CCR4L = (uint8_t)(Compare4);
5837  0680 9f            	ld	a,xl
5838  0681 c7526c        	ld	21100,a
5839                     ; 1879 }
5842  0684 81            	ret	
5878                     ; 1892 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5878                     ; 1893 {
5879                     	switch	.text
5880  0685               _TIM1_SetIC1Prescaler:
5882  0685 88            	push	a
5883       00000000      OFST:	set	0
5886                     ; 1895     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5888                     ; 1898     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5888                     ; 1899                             | (uint8_t)TIM1_IC1Prescaler);
5890  0686 c65258        	ld	a,21080
5891  0689 a4f3          	and	a,#243
5892  068b 1a01          	or	a,(OFST+1,sp)
5893  068d c75258        	ld	21080,a
5894                     ; 1901 }
5897  0690 84            	pop	a
5898  0691 81            	ret	
5934                     ; 1913 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5934                     ; 1914 {
5935                     	switch	.text
5936  0692               _TIM1_SetIC2Prescaler:
5938  0692 88            	push	a
5939       00000000      OFST:	set	0
5942                     ; 1917     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5944                     ; 1920     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5944                     ; 1921                             | (uint8_t)TIM1_IC2Prescaler);
5946  0693 c65259        	ld	a,21081
5947  0696 a4f3          	and	a,#243
5948  0698 1a01          	or	a,(OFST+1,sp)
5949  069a c75259        	ld	21081,a
5950                     ; 1922 }
5953  069d 84            	pop	a
5954  069e 81            	ret	
5990                     ; 1935 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5990                     ; 1936 {
5991                     	switch	.text
5992  069f               _TIM1_SetIC3Prescaler:
5994  069f 88            	push	a
5995       00000000      OFST:	set	0
5998                     ; 1939     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
6000                     ; 1942     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
6000                     ; 1943                             (uint8_t)TIM1_IC3Prescaler);
6002  06a0 c6525a        	ld	a,21082
6003  06a3 a4f3          	and	a,#243
6004  06a5 1a01          	or	a,(OFST+1,sp)
6005  06a7 c7525a        	ld	21082,a
6006                     ; 1944 }
6009  06aa 84            	pop	a
6010  06ab 81            	ret	
6046                     ; 1956 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6046                     ; 1957 {
6047                     	switch	.text
6048  06ac               _TIM1_SetIC4Prescaler:
6050  06ac 88            	push	a
6051       00000000      OFST:	set	0
6054                     ; 1960     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6056                     ; 1963     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6056                     ; 1964                             (uint8_t)TIM1_IC4Prescaler);
6058  06ad c6525b        	ld	a,21083
6059  06b0 a4f3          	and	a,#243
6060  06b2 1a01          	or	a,(OFST+1,sp)
6061  06b4 c7525b        	ld	21083,a
6062                     ; 1965 }
6065  06b7 84            	pop	a
6066  06b8 81            	ret	
6118                     ; 1972 uint16_t TIM1_GetCapture1(void)
6118                     ; 1973 {
6119                     	switch	.text
6120  06b9               _TIM1_GetCapture1:
6122  06b9 5204          	subw	sp,#4
6123       00000004      OFST:	set	4
6126                     ; 1976     uint16_t tmpccr1 = 0;
6128                     ; 1977     uint8_t tmpccr1l=0, tmpccr1h=0;
6132                     ; 1979     tmpccr1h = TIM1->CCR1H;
6134  06bb c65265        	ld	a,21093
6135  06be 6b02          	ld	(OFST-2,sp),a
6136                     ; 1980     tmpccr1l = TIM1->CCR1L;
6138  06c0 c65266        	ld	a,21094
6139  06c3 6b01          	ld	(OFST-3,sp),a
6140                     ; 1982     tmpccr1 = (uint16_t)(tmpccr1l);
6142  06c5 5f            	clrw	x
6143  06c6 97            	ld	xl,a
6144  06c7 1f03          	ldw	(OFST-1,sp),x
6145                     ; 1983     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6147  06c9 5f            	clrw	x
6148  06ca 7b02          	ld	a,(OFST-2,sp)
6149  06cc 97            	ld	xl,a
6150  06cd 7b04          	ld	a,(OFST+0,sp)
6151  06cf 01            	rrwa	x,a
6152  06d0 1a03          	or	a,(OFST-1,sp)
6153  06d2 01            	rrwa	x,a
6154                     ; 1985     return (uint16_t)tmpccr1;
6158  06d3 5b04          	addw	sp,#4
6159  06d5 81            	ret	
6211                     ; 1993 uint16_t TIM1_GetCapture2(void)
6211                     ; 1994 {
6212                     	switch	.text
6213  06d6               _TIM1_GetCapture2:
6215  06d6 5204          	subw	sp,#4
6216       00000004      OFST:	set	4
6219                     ; 1997     uint16_t tmpccr2 = 0;
6221                     ; 1998     uint8_t tmpccr2l=0, tmpccr2h=0;
6225                     ; 2000     tmpccr2h = TIM1->CCR2H;
6227  06d8 c65267        	ld	a,21095
6228  06db 6b02          	ld	(OFST-2,sp),a
6229                     ; 2001     tmpccr2l = TIM1->CCR2L;
6231  06dd c65268        	ld	a,21096
6232  06e0 6b01          	ld	(OFST-3,sp),a
6233                     ; 2003     tmpccr2 = (uint16_t)(tmpccr2l);
6235  06e2 5f            	clrw	x
6236  06e3 97            	ld	xl,a
6237  06e4 1f03          	ldw	(OFST-1,sp),x
6238                     ; 2004     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6240  06e6 5f            	clrw	x
6241  06e7 7b02          	ld	a,(OFST-2,sp)
6242  06e9 97            	ld	xl,a
6243  06ea 7b04          	ld	a,(OFST+0,sp)
6244  06ec 01            	rrwa	x,a
6245  06ed 1a03          	or	a,(OFST-1,sp)
6246  06ef 01            	rrwa	x,a
6247                     ; 2006     return (uint16_t)tmpccr2;
6251  06f0 5b04          	addw	sp,#4
6252  06f2 81            	ret	
6304                     ; 2014 uint16_t TIM1_GetCapture3(void)
6304                     ; 2015 {
6305                     	switch	.text
6306  06f3               _TIM1_GetCapture3:
6308  06f3 5204          	subw	sp,#4
6309       00000004      OFST:	set	4
6312                     ; 2017     uint16_t tmpccr3 = 0;
6314                     ; 2018     uint8_t tmpccr3l=0, tmpccr3h=0;
6318                     ; 2020     tmpccr3h = TIM1->CCR3H;
6320  06f5 c65269        	ld	a,21097
6321  06f8 6b02          	ld	(OFST-2,sp),a
6322                     ; 2021     tmpccr3l = TIM1->CCR3L;
6324  06fa c6526a        	ld	a,21098
6325  06fd 6b01          	ld	(OFST-3,sp),a
6326                     ; 2023     tmpccr3 = (uint16_t)(tmpccr3l);
6328  06ff 5f            	clrw	x
6329  0700 97            	ld	xl,a
6330  0701 1f03          	ldw	(OFST-1,sp),x
6331                     ; 2024     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6333  0703 5f            	clrw	x
6334  0704 7b02          	ld	a,(OFST-2,sp)
6335  0706 97            	ld	xl,a
6336  0707 7b04          	ld	a,(OFST+0,sp)
6337  0709 01            	rrwa	x,a
6338  070a 1a03          	or	a,(OFST-1,sp)
6339  070c 01            	rrwa	x,a
6340                     ; 2026     return (uint16_t)tmpccr3;
6344  070d 5b04          	addw	sp,#4
6345  070f 81            	ret	
6397                     ; 2034 uint16_t TIM1_GetCapture4(void)
6397                     ; 2035 {
6398                     	switch	.text
6399  0710               _TIM1_GetCapture4:
6401  0710 5204          	subw	sp,#4
6402       00000004      OFST:	set	4
6405                     ; 2037     uint16_t tmpccr4 = 0;
6407                     ; 2038     uint8_t tmpccr4l=0, tmpccr4h=0;
6411                     ; 2040     tmpccr4h = TIM1->CCR4H;
6413  0712 c6526b        	ld	a,21099
6414  0715 6b02          	ld	(OFST-2,sp),a
6415                     ; 2041     tmpccr4l = TIM1->CCR4L;
6417  0717 c6526c        	ld	a,21100
6418  071a 6b01          	ld	(OFST-3,sp),a
6419                     ; 2043     tmpccr4 = (uint16_t)(tmpccr4l);
6421  071c 5f            	clrw	x
6422  071d 97            	ld	xl,a
6423  071e 1f03          	ldw	(OFST-1,sp),x
6424                     ; 2044     tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6426  0720 5f            	clrw	x
6427  0721 7b02          	ld	a,(OFST-2,sp)
6428  0723 97            	ld	xl,a
6429  0724 7b04          	ld	a,(OFST+0,sp)
6430  0726 01            	rrwa	x,a
6431  0727 1a03          	or	a,(OFST-1,sp)
6432  0729 01            	rrwa	x,a
6433                     ; 2046     return (uint16_t)tmpccr4;
6437  072a 5b04          	addw	sp,#4
6438  072c 81            	ret	
6472                     ; 2054 uint16_t TIM1_GetCounter(void)
6472                     ; 2055 {
6473                     	switch	.text
6474  072d               _TIM1_GetCounter:
6476  072d 89            	pushw	x
6477       00000002      OFST:	set	2
6480                     ; 2056   uint16_t tmpcntr = 0;
6482                     ; 2058   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6484  072e c6525e        	ld	a,21086
6485  0731 97            	ld	xl,a
6486  0732 4f            	clr	a
6487  0733 02            	rlwa	x,a
6488  0734 1f01          	ldw	(OFST-1,sp),x
6489                     ; 2061     return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6491  0736 5f            	clrw	x
6492  0737 c6525f        	ld	a,21087
6493  073a 97            	ld	xl,a
6494  073b 01            	rrwa	x,a
6495  073c 1a02          	or	a,(OFST+0,sp)
6496  073e 01            	rrwa	x,a
6497  073f 1a01          	or	a,(OFST-1,sp)
6498  0741 01            	rrwa	x,a
6501  0742 5b02          	addw	sp,#2
6502  0744 81            	ret	
6536                     ; 2069 uint16_t TIM1_GetPrescaler(void)
6536                     ; 2070 {
6537                     	switch	.text
6538  0745               _TIM1_GetPrescaler:
6540  0745 89            	pushw	x
6541       00000002      OFST:	set	2
6544                     ; 2071    uint16_t temp = 0;
6546                     ; 2073    temp = ((uint16_t)TIM1->PSCRH << 8);
6548  0746 c65260        	ld	a,21088
6549  0749 97            	ld	xl,a
6550  074a 4f            	clr	a
6551  074b 02            	rlwa	x,a
6552  074c 1f01          	ldw	(OFST-1,sp),x
6553                     ; 2076     return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6555  074e 5f            	clrw	x
6556  074f c65261        	ld	a,21089
6557  0752 97            	ld	xl,a
6558  0753 01            	rrwa	x,a
6559  0754 1a02          	or	a,(OFST+0,sp)
6560  0756 01            	rrwa	x,a
6561  0757 1a01          	or	a,(OFST-1,sp)
6562  0759 01            	rrwa	x,a
6565  075a 5b02          	addw	sp,#2
6566  075c 81            	ret	
6740                     ; 2097 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6740                     ; 2098 {
6741                     	switch	.text
6742  075d               _TIM1_GetFlagStatus:
6744  075d 89            	pushw	x
6745  075e 89            	pushw	x
6746       00000002      OFST:	set	2
6749                     ; 2099     FlagStatus bitstatus = RESET;
6751                     ; 2100     uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6755                     ; 2103     assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6757                     ; 2105     tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6759  075f 9f            	ld	a,xl
6760  0760 c45255        	and	a,21077
6761  0763 6b01          	ld	(OFST-1,sp),a
6762                     ; 2106     tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6764  0765 7b03          	ld	a,(OFST+1,sp)
6765  0767 6b02          	ld	(OFST+0,sp),a
6766                     ; 2108     if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6768  0769 c45256        	and	a,21078
6769  076c 1a01          	or	a,(OFST-1,sp)
6770  076e 2702          	jreq	L5643
6771                     ; 2110         bitstatus = SET;
6773  0770 a601          	ld	a,#1
6775  0772               L5643:
6776                     ; 2114         bitstatus = RESET;
6778                     ; 2116     return (FlagStatus)(bitstatus);
6782  0772 5b04          	addw	sp,#4
6783  0774 81            	ret	
6818                     ; 2137 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6818                     ; 2138 {
6819                     	switch	.text
6820  0775               _TIM1_ClearFlag:
6822  0775 89            	pushw	x
6823       00000000      OFST:	set	0
6826                     ; 2140     assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6828                     ; 2143     TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6830  0776 9f            	ld	a,xl
6831  0777 43            	cpl	a
6832  0778 c75255        	ld	21077,a
6833                     ; 2144     TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6833                     ; 2145                           (uint8_t)0x1E);
6835  077b 7b01          	ld	a,(OFST+1,sp)
6836  077d 43            	cpl	a
6837  077e a41e          	and	a,#30
6838  0780 c75256        	ld	21078,a
6839                     ; 2146 }
6842  0783 85            	popw	x
6843  0784 81            	ret	
6907                     ; 2162 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6907                     ; 2163 {
6908                     	switch	.text
6909  0785               _TIM1_GetITStatus:
6911  0785 88            	push	a
6912  0786 89            	pushw	x
6913       00000002      OFST:	set	2
6916                     ; 2164     ITStatus bitstatus = RESET;
6918                     ; 2165     uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
6922                     ; 2168     assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
6924                     ; 2170     TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
6926  0787 c45255        	and	a,21077
6927  078a 6b01          	ld	(OFST-1,sp),a
6928                     ; 2172     TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
6930  078c c65254        	ld	a,21076
6931  078f 1403          	and	a,(OFST+1,sp)
6932  0791 6b02          	ld	(OFST+0,sp),a
6933                     ; 2174     if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
6935  0793 7b01          	ld	a,(OFST-1,sp)
6936  0795 2708          	jreq	L1453
6938  0797 7b02          	ld	a,(OFST+0,sp)
6939  0799 2704          	jreq	L1453
6940                     ; 2176         bitstatus = SET;
6942  079b a601          	ld	a,#1
6944  079d 2001          	jra	L3453
6945  079f               L1453:
6946                     ; 2180         bitstatus = RESET;
6948  079f 4f            	clr	a
6949  07a0               L3453:
6950                     ; 2182     return (ITStatus)(bitstatus);
6954  07a0 5b03          	addw	sp,#3
6955  07a2 81            	ret	
6991                     ; 2199 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
6991                     ; 2200 {
6992                     	switch	.text
6993  07a3               _TIM1_ClearITPendingBit:
6997                     ; 2202     assert_param(IS_TIM1_IT_OK(TIM1_IT));
6999                     ; 2205     TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7001  07a3 43            	cpl	a
7002  07a4 c75255        	ld	21077,a
7003                     ; 2206 }
7006  07a7 81            	ret	
7058                     ; 2224 static void TI1_Config(uint8_t TIM1_ICPolarity,
7058                     ; 2225                        uint8_t TIM1_ICSelection,
7058                     ; 2226                        uint8_t TIM1_ICFilter)
7058                     ; 2227 {
7059                     	switch	.text
7060  07a8               L3_TI1_Config:
7062  07a8 89            	pushw	x
7063       00000001      OFST:	set	1
7066                     ; 2230     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7068  07a9 7211525c      	bres	21084,#0
7069  07ad 88            	push	a
7070                     ; 2233     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7070                     ; 2234                             (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7072  07ae 7b06          	ld	a,(OFST+5,sp)
7073  07b0 97            	ld	xl,a
7074  07b1 a610          	ld	a,#16
7075  07b3 42            	mul	x,a
7076  07b4 9f            	ld	a,xl
7077  07b5 1a03          	or	a,(OFST+2,sp)
7078  07b7 6b01          	ld	(OFST+0,sp),a
7079  07b9 c65258        	ld	a,21080
7080  07bc a40c          	and	a,#12
7081  07be 1a01          	or	a,(OFST+0,sp)
7082  07c0 c75258        	ld	21080,a
7083                     ; 2237     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7085  07c3 7b02          	ld	a,(OFST+1,sp)
7086  07c5 2706          	jreq	L1163
7087                     ; 2239         TIM1->CCER1 |= TIM1_CCER1_CC1P;
7089  07c7 7212525c      	bset	21084,#1
7091  07cb 2004          	jra	L3163
7092  07cd               L1163:
7093                     ; 2243         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7095  07cd 7213525c      	bres	21084,#1
7096  07d1               L3163:
7097                     ; 2247     TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7099  07d1 7210525c      	bset	21084,#0
7100                     ; 2248 }
7103  07d5 5b03          	addw	sp,#3
7104  07d7 81            	ret	
7156                     ; 2266 static void TI2_Config(uint8_t TIM1_ICPolarity,
7156                     ; 2267                        uint8_t TIM1_ICSelection,
7156                     ; 2268                        uint8_t TIM1_ICFilter)
7156                     ; 2269 {
7157                     	switch	.text
7158  07d8               L5_TI2_Config:
7160  07d8 89            	pushw	x
7161       00000001      OFST:	set	1
7164                     ; 2271     TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7166  07d9 7219525c      	bres	21084,#4
7167  07dd 88            	push	a
7168                     ; 2274     TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7168                     ; 2275                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7170  07de 7b06          	ld	a,(OFST+5,sp)
7171  07e0 97            	ld	xl,a
7172  07e1 a610          	ld	a,#16
7173  07e3 42            	mul	x,a
7174  07e4 9f            	ld	a,xl
7175  07e5 1a03          	or	a,(OFST+2,sp)
7176  07e7 6b01          	ld	(OFST+0,sp),a
7177  07e9 c65259        	ld	a,21081
7178  07ec a40c          	and	a,#12
7179  07ee 1a01          	or	a,(OFST+0,sp)
7180  07f0 c75259        	ld	21081,a
7181                     ; 2277     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7183  07f3 7b02          	ld	a,(OFST+1,sp)
7184  07f5 2706          	jreq	L3463
7185                     ; 2279         TIM1->CCER1 |= TIM1_CCER1_CC2P;
7187  07f7 721a525c      	bset	21084,#5
7189  07fb 2004          	jra	L5463
7190  07fd               L3463:
7191                     ; 2283         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7193  07fd 721b525c      	bres	21084,#5
7194  0801               L5463:
7195                     ; 2286     TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7197  0801 7218525c      	bset	21084,#4
7198                     ; 2287 }
7201  0805 5b03          	addw	sp,#3
7202  0807 81            	ret	
7254                     ; 2305 static void TI3_Config(uint8_t TIM1_ICPolarity,
7254                     ; 2306                        uint8_t TIM1_ICSelection,
7254                     ; 2307                        uint8_t TIM1_ICFilter)
7254                     ; 2308 {
7255                     	switch	.text
7256  0808               L7_TI3_Config:
7258  0808 89            	pushw	x
7259       00000001      OFST:	set	1
7262                     ; 2310     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7264  0809 7211525d      	bres	21085,#0
7265  080d 88            	push	a
7266                     ; 2313     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7266                     ; 2314                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7268  080e 7b06          	ld	a,(OFST+5,sp)
7269  0810 97            	ld	xl,a
7270  0811 a610          	ld	a,#16
7271  0813 42            	mul	x,a
7272  0814 9f            	ld	a,xl
7273  0815 1a03          	or	a,(OFST+2,sp)
7274  0817 6b01          	ld	(OFST+0,sp),a
7275  0819 c6525a        	ld	a,21082
7276  081c a40c          	and	a,#12
7277  081e 1a01          	or	a,(OFST+0,sp)
7278  0820 c7525a        	ld	21082,a
7279                     ; 2317     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7281  0823 7b02          	ld	a,(OFST+1,sp)
7282  0825 2706          	jreq	L5763
7283                     ; 2319         TIM1->CCER2 |= TIM1_CCER2_CC3P;
7285  0827 7212525d      	bset	21085,#1
7287  082b 2004          	jra	L7763
7288  082d               L5763:
7289                     ; 2323         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7291  082d 7213525d      	bres	21085,#1
7292  0831               L7763:
7293                     ; 2326     TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7295  0831 7210525d      	bset	21085,#0
7296                     ; 2327 }
7299  0835 5b03          	addw	sp,#3
7300  0837 81            	ret	
7352                     ; 2346 static void TI4_Config(uint8_t TIM1_ICPolarity,
7352                     ; 2347                        uint8_t TIM1_ICSelection,
7352                     ; 2348                        uint8_t TIM1_ICFilter)
7352                     ; 2349 {
7353                     	switch	.text
7354  0838               L11_TI4_Config:
7356  0838 89            	pushw	x
7357       00000001      OFST:	set	1
7360                     ; 2352     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7362  0839 7219525d      	bres	21085,#4
7363  083d 88            	push	a
7364                     ; 2355     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7364                     ; 2356                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7366  083e 7b06          	ld	a,(OFST+5,sp)
7367  0840 97            	ld	xl,a
7368  0841 a610          	ld	a,#16
7369  0843 42            	mul	x,a
7370  0844 9f            	ld	a,xl
7371  0845 1a03          	or	a,(OFST+2,sp)
7372  0847 6b01          	ld	(OFST+0,sp),a
7373  0849 c6525b        	ld	a,21083
7374  084c a40c          	and	a,#12
7375  084e 1a01          	or	a,(OFST+0,sp)
7376  0850 c7525b        	ld	21083,a
7377                     ; 2359     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7379  0853 7b02          	ld	a,(OFST+1,sp)
7380  0855 2706          	jreq	L7273
7381                     ; 2361         TIM1->CCER2 |= TIM1_CCER2_CC4P;
7383  0857 721a525d      	bset	21085,#5
7385  085b 2004          	jra	L1373
7386  085d               L7273:
7387                     ; 2365         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7389  085d 721b525d      	bres	21085,#5
7390  0861               L1373:
7391                     ; 2369     TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7393  0861 7218525d      	bset	21085,#4
7394                     ; 2370 }
7397  0865 5b03          	addw	sp,#3
7398  0867 81            	ret	
7411                     	xdef	_TIM1_ClearITPendingBit
7412                     	xdef	_TIM1_GetITStatus
7413                     	xdef	_TIM1_ClearFlag
7414                     	xdef	_TIM1_GetFlagStatus
7415                     	xdef	_TIM1_GetPrescaler
7416                     	xdef	_TIM1_GetCounter
7417                     	xdef	_TIM1_GetCapture4
7418                     	xdef	_TIM1_GetCapture3
7419                     	xdef	_TIM1_GetCapture2
7420                     	xdef	_TIM1_GetCapture1
7421                     	xdef	_TIM1_SetIC4Prescaler
7422                     	xdef	_TIM1_SetIC3Prescaler
7423                     	xdef	_TIM1_SetIC2Prescaler
7424                     	xdef	_TIM1_SetIC1Prescaler
7425                     	xdef	_TIM1_SetCompare4
7426                     	xdef	_TIM1_SetCompare3
7427                     	xdef	_TIM1_SetCompare2
7428                     	xdef	_TIM1_SetCompare1
7429                     	xdef	_TIM1_SetAutoreload
7430                     	xdef	_TIM1_SetCounter
7431                     	xdef	_TIM1_SelectOCxM
7432                     	xdef	_TIM1_CCxNCmd
7433                     	xdef	_TIM1_CCxCmd
7434                     	xdef	_TIM1_OC4PolarityConfig
7435                     	xdef	_TIM1_OC3NPolarityConfig
7436                     	xdef	_TIM1_OC3PolarityConfig
7437                     	xdef	_TIM1_OC2NPolarityConfig
7438                     	xdef	_TIM1_OC2PolarityConfig
7439                     	xdef	_TIM1_OC1NPolarityConfig
7440                     	xdef	_TIM1_OC1PolarityConfig
7441                     	xdef	_TIM1_GenerateEvent
7442                     	xdef	_TIM1_OC4FastConfig
7443                     	xdef	_TIM1_OC3FastConfig
7444                     	xdef	_TIM1_OC2FastConfig
7445                     	xdef	_TIM1_OC1FastConfig
7446                     	xdef	_TIM1_OC4PreloadConfig
7447                     	xdef	_TIM1_OC3PreloadConfig
7448                     	xdef	_TIM1_OC2PreloadConfig
7449                     	xdef	_TIM1_OC1PreloadConfig
7450                     	xdef	_TIM1_CCPreloadControl
7451                     	xdef	_TIM1_SelectCOM
7452                     	xdef	_TIM1_ARRPreloadConfig
7453                     	xdef	_TIM1_ForcedOC4Config
7454                     	xdef	_TIM1_ForcedOC3Config
7455                     	xdef	_TIM1_ForcedOC2Config
7456                     	xdef	_TIM1_ForcedOC1Config
7457                     	xdef	_TIM1_CounterModeConfig
7458                     	xdef	_TIM1_PrescalerConfig
7459                     	xdef	_TIM1_EncoderInterfaceConfig
7460                     	xdef	_TIM1_SelectMasterSlaveMode
7461                     	xdef	_TIM1_SelectSlaveMode
7462                     	xdef	_TIM1_SelectOutputTrigger
7463                     	xdef	_TIM1_SelectOnePulseMode
7464                     	xdef	_TIM1_SelectHallSensor
7465                     	xdef	_TIM1_UpdateRequestConfig
7466                     	xdef	_TIM1_UpdateDisableConfig
7467                     	xdef	_TIM1_SelectInputTrigger
7468                     	xdef	_TIM1_TIxExternalClockConfig
7469                     	xdef	_TIM1_ETRConfig
7470                     	xdef	_TIM1_ETRClockMode2Config
7471                     	xdef	_TIM1_ETRClockMode1Config
7472                     	xdef	_TIM1_InternalClockConfig
7473                     	xdef	_TIM1_ITConfig
7474                     	xdef	_TIM1_CtrlPWMOutputs
7475                     	xdef	_TIM1_Cmd
7476                     	xdef	_TIM1_PWMIConfig
7477                     	xdef	_TIM1_ICInit
7478                     	xdef	_TIM1_BDTRConfig
7479                     	xdef	_TIM1_OC4Init
7480                     	xdef	_TIM1_OC3Init
7481                     	xdef	_TIM1_OC2Init
7482                     	xdef	_TIM1_OC1Init
7483                     	xdef	_TIM1_TimeBaseInit
7484                     	xdef	_TIM1_DeInit
7503                     	end
