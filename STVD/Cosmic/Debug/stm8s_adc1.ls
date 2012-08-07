   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  46                     ; 48 void ADC1_DeInit(void)
  46                     ; 49 {
  48                     	switch	.text
  49  0000               _ADC1_DeInit:
  53                     ; 50     ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  55  0000 725f5400      	clr	21504
  56                     ; 51     ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  58  0004 725f5401      	clr	21505
  59                     ; 52     ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  61  0008 725f5402      	clr	21506
  62                     ; 53     ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  64  000c 725f5403      	clr	21507
  65                     ; 54     ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  67  0010 725f5406      	clr	21510
  68                     ; 55     ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  70  0014 725f5407      	clr	21511
  71                     ; 56     ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  73  0018 35ff5408      	mov	21512,#255
  74                     ; 57     ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  76  001c 35035409      	mov	21513,#3
  77                     ; 58     ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  79  0020 725f540a      	clr	21514
  80                     ; 59     ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  82  0024 725f540b      	clr	21515
  83                     ; 60     ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  85  0028 725f540e      	clr	21518
  86                     ; 61     ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  88  002c 725f540f      	clr	21519
  89                     ; 62 }
  92  0030 81            	ret	
 543                     ; 85 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 543                     ; 86 {
 544                     	switch	.text
 545  0031               _ADC1_Init:
 547  0031 89            	pushw	x
 548       00000000      OFST:	set	0
 551                     ; 89     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 553                     ; 90     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 555                     ; 91     assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 557                     ; 92     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 559                     ; 93     assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 561                     ; 94     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 563                     ; 95     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 565                     ; 96     assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 567                     ; 101     ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 569  0032 7b08          	ld	a,(OFST+8,sp)
 570  0034 88            	push	a
 571  0035 7b02          	ld	a,(OFST+2,sp)
 572  0037 95            	ld	xh,a
 573  0038 cd0121        	call	_ADC1_ConversionConfig
 575  003b 84            	pop	a
 576                     ; 103     ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 578  003c 7b05          	ld	a,(OFST+5,sp)
 579  003e ad54          	call	_ADC1_PrescalerConfig
 581                     ; 108     ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 583  0040 7b07          	ld	a,(OFST+7,sp)
 584  0042 97            	ld	xl,a
 585  0043 7b06          	ld	a,(OFST+6,sp)
 586  0045 95            	ld	xh,a
 587  0046 cd014e        	call	_ADC1_ExternalTriggerConfig
 589                     ; 113     ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 591  0049 7b0a          	ld	a,(OFST+10,sp)
 592  004b 97            	ld	xl,a
 593  004c 7b09          	ld	a,(OFST+9,sp)
 594  004e 95            	ld	xh,a
 595  004f ad56          	call	_ADC1_SchmittTriggerConfig
 597                     ; 116     ADC1->CR1 |= ADC1_CR1_ADON;
 599  0051 72105401      	bset	21505,#0
 600                     ; 118 }
 603  0055 85            	popw	x
 604  0056 81            	ret	
 639                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 639                     ; 127 {
 640                     	switch	.text
 641  0057               _ADC1_Cmd:
 645                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 647                     ; 132     if (NewState != DISABLE)
 649  0057 4d            	tnz	a
 650  0058 2705          	jreq	L362
 651                     ; 134         ADC1->CR1 |= ADC1_CR1_ADON;
 653  005a 72105401      	bset	21505,#0
 656  005e 81            	ret	
 657  005f               L362:
 658                     ; 138         ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 660  005f 72115401      	bres	21505,#0
 661                     ; 141 }
 664  0063 81            	ret	
 699                     ; 148 void ADC1_ScanModeCmd(FunctionalState NewState)
 699                     ; 149 {
 700                     	switch	.text
 701  0064               _ADC1_ScanModeCmd:
 705                     ; 152     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 707                     ; 154     if (NewState != DISABLE)
 709  0064 4d            	tnz	a
 710  0065 2705          	jreq	L503
 711                     ; 156         ADC1->CR2 |= ADC1_CR2_SCAN;
 713  0067 72125402      	bset	21506,#1
 716  006b 81            	ret	
 717  006c               L503:
 718                     ; 160         ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 720  006c 72135402      	bres	21506,#1
 721                     ; 163 }
 724  0070 81            	ret	
 759                     ; 170 void ADC1_DataBufferCmd(FunctionalState NewState)
 759                     ; 171 {
 760                     	switch	.text
 761  0071               _ADC1_DataBufferCmd:
 765                     ; 174     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 767                     ; 176     if (NewState != DISABLE)
 769  0071 4d            	tnz	a
 770  0072 2705          	jreq	L723
 771                     ; 178         ADC1->CR3 |= ADC1_CR3_DBUF;
 773  0074 721e5403      	bset	21507,#7
 776  0078 81            	ret	
 777  0079               L723:
 778                     ; 182         ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 780  0079 721f5403      	bres	21507,#7
 781                     ; 185 }
 784  007d 81            	ret	
 940                     ; 196 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 940                     ; 197 {
 941                     	switch	.text
 942  007e               _ADC1_ITConfig:
 944  007e 89            	pushw	x
 945       00000000      OFST:	set	0
 948                     ; 200     assert_param(IS_ADC1_IT_OK(ADC1_IT));
 950                     ; 201     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 952                     ; 203     if (NewState != DISABLE)
 954  007f 7b05          	ld	a,(OFST+5,sp)
 955  0081 2706          	jreq	L714
 956                     ; 206         ADC1->CSR |= (uint8_t)ADC1_IT;
 958  0083 9f            	ld	a,xl
 959  0084 ca5400        	or	a,21504
 961  0087 2006          	jra	L124
 962  0089               L714:
 963                     ; 211         ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 965  0089 7b02          	ld	a,(OFST+2,sp)
 966  008b 43            	cpl	a
 967  008c c45400        	and	a,21504
 968  008f               L124:
 969  008f c75400        	ld	21504,a
 970                     ; 214 }
 973  0092 85            	popw	x
 974  0093 81            	ret	
1010                     ; 222 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1010                     ; 223 {
1011                     	switch	.text
1012  0094               _ADC1_PrescalerConfig:
1014  0094 88            	push	a
1015       00000000      OFST:	set	0
1018                     ; 226     assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1020                     ; 229     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1022  0095 c65401        	ld	a,21505
1023  0098 a48f          	and	a,#143
1024  009a c75401        	ld	21505,a
1025                     ; 231     ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1027  009d c65401        	ld	a,21505
1028  00a0 1a01          	or	a,(OFST+1,sp)
1029  00a2 c75401        	ld	21505,a
1030                     ; 233 }
1033  00a5 84            	pop	a
1034  00a6 81            	ret	
1081                     ; 244 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1081                     ; 245 {
1082                     	switch	.text
1083  00a7               _ADC1_SchmittTriggerConfig:
1085  00a7 89            	pushw	x
1086       00000000      OFST:	set	0
1089                     ; 248     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1091                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1093                     ; 251     if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1095  00a8 9e            	ld	a,xh
1096  00a9 4c            	inc	a
1097  00aa 261d          	jrne	L364
1098                     ; 253         if (NewState != DISABLE)
1100  00ac 9f            	ld	a,xl
1101  00ad 4d            	tnz	a
1102  00ae 270a          	jreq	L564
1103                     ; 255             ADC1->TDRL &= (uint8_t)0x0;
1105  00b0 725f5407      	clr	21511
1106                     ; 256             ADC1->TDRH &= (uint8_t)0x0;
1108  00b4 725f5406      	clr	21510
1110  00b8 2065          	jra	L174
1111  00ba               L564:
1112                     ; 260             ADC1->TDRL |= (uint8_t)0xFF;
1114  00ba c65407        	ld	a,21511
1115  00bd aaff          	or	a,#255
1116  00bf c75407        	ld	21511,a
1117                     ; 261             ADC1->TDRH |= (uint8_t)0xFF;
1119  00c2 c65406        	ld	a,21510
1120  00c5 aaff          	or	a,#255
1121  00c7 2053          	jp	LC001
1122  00c9               L364:
1123                     ; 264     else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1125  00c9 7b01          	ld	a,(OFST+1,sp)
1126  00cb a108          	cp	a,#8
1127  00cd 0d02          	tnz	(OFST+2,sp)
1128  00cf 2426          	jruge	L374
1129                     ; 266         if (NewState != DISABLE)
1131  00d1 2714          	jreq	L574
1132                     ; 268             ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1134  00d3 5f            	clrw	x
1135  00d4 97            	ld	xl,a
1136  00d5 a601          	ld	a,#1
1137  00d7 5d            	tnzw	x
1138  00d8 2704          	jreq	L43
1139  00da               L63:
1140  00da 48            	sll	a
1141  00db 5a            	decw	x
1142  00dc 26fc          	jrne	L63
1143  00de               L43:
1144  00de 43            	cpl	a
1145  00df c45407        	and	a,21511
1146  00e2               LC002:
1147  00e2 c75407        	ld	21511,a
1149  00e5 2038          	jra	L174
1150  00e7               L574:
1151                     ; 272             ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1153  00e7 5f            	clrw	x
1154  00e8 97            	ld	xl,a
1155  00e9 a601          	ld	a,#1
1156  00eb 5d            	tnzw	x
1157  00ec 2704          	jreq	L04
1158  00ee               L24:
1159  00ee 48            	sll	a
1160  00ef 5a            	decw	x
1161  00f0 26fc          	jrne	L24
1162  00f2               L04:
1163  00f2 ca5407        	or	a,21511
1164  00f5 20eb          	jp	LC002
1165  00f7               L374:
1166                     ; 277         if (NewState != DISABLE)
1168  00f7 2713          	jreq	L305
1169                     ; 279             ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1171  00f9 a008          	sub	a,#8
1172  00fb 5f            	clrw	x
1173  00fc 97            	ld	xl,a
1174  00fd a601          	ld	a,#1
1175  00ff 5d            	tnzw	x
1176  0100 2704          	jreq	L44
1177  0102               L64:
1178  0102 48            	sll	a
1179  0103 5a            	decw	x
1180  0104 26fc          	jrne	L64
1181  0106               L44:
1182  0106 43            	cpl	a
1183  0107 c45406        	and	a,21510
1185  010a 2010          	jp	LC001
1186  010c               L305:
1187                     ; 283             ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1189  010c a008          	sub	a,#8
1190  010e 5f            	clrw	x
1191  010f 97            	ld	xl,a
1192  0110 a601          	ld	a,#1
1193  0112 5d            	tnzw	x
1194  0113 2704          	jreq	L05
1195  0115               L25:
1196  0115 48            	sll	a
1197  0116 5a            	decw	x
1198  0117 26fc          	jrne	L25
1199  0119               L05:
1200  0119 ca5406        	or	a,21510
1201  011c               LC001:
1202  011c c75406        	ld	21510,a
1203  011f               L174:
1204                     ; 287 }
1207  011f 85            	popw	x
1208  0120 81            	ret	
1265                     ; 300 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1265                     ; 301 {
1266                     	switch	.text
1267  0121               _ADC1_ConversionConfig:
1269       00000000      OFST:	set	0
1272                     ; 304     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1274                     ; 305     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1276                     ; 306     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1278                     ; 309     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1280  0121 72175402      	bres	21506,#3
1281  0125 89            	pushw	x
1282                     ; 311     ADC1->CR2 |= (uint8_t)(ADC1_Align);
1284  0126 c65402        	ld	a,21506
1285  0129 1a05          	or	a,(OFST+5,sp)
1286  012b c75402        	ld	21506,a
1287                     ; 313     if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1289  012e 9e            	ld	a,xh
1290  012f 4a            	dec	a
1291  0130 2606          	jrne	L535
1292                     ; 316         ADC1->CR1 |= ADC1_CR1_CONT;
1294  0132 72125401      	bset	21505,#1
1296  0136 2004          	jra	L735
1297  0138               L535:
1298                     ; 321         ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1300  0138 72135401      	bres	21505,#1
1301  013c               L735:
1302                     ; 325     ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1304  013c c65400        	ld	a,21504
1305  013f a4f0          	and	a,#240
1306  0141 c75400        	ld	21504,a
1307                     ; 327     ADC1->CSR |= (uint8_t)(ADC1_Channel);
1309  0144 c65400        	ld	a,21504
1310  0147 1a02          	or	a,(OFST+2,sp)
1311  0149 c75400        	ld	21504,a
1312                     ; 329 }
1315  014c 85            	popw	x
1316  014d 81            	ret	
1362                     ; 342 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1362                     ; 343 {
1363                     	switch	.text
1364  014e               _ADC1_ExternalTriggerConfig:
1366  014e 89            	pushw	x
1367       00000000      OFST:	set	0
1370                     ; 346     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1372                     ; 347     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1374                     ; 350     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1376  014f c65402        	ld	a,21506
1377  0152 a4cf          	and	a,#207
1378  0154 c75402        	ld	21506,a
1379                     ; 352     if (NewState != DISABLE)
1381  0157 9f            	ld	a,xl
1382  0158 4d            	tnz	a
1383  0159 2706          	jreq	L365
1384                     ; 355         ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1386  015b 721c5402      	bset	21506,#6
1388  015f 2004          	jra	L565
1389  0161               L365:
1390                     ; 360         ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1392  0161 721d5402      	bres	21506,#6
1393  0165               L565:
1394                     ; 364     ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1396  0165 c65402        	ld	a,21506
1397  0168 1a01          	or	a,(OFST+1,sp)
1398  016a c75402        	ld	21506,a
1399                     ; 366 }
1402  016d 85            	popw	x
1403  016e 81            	ret	
1427                     ; 378 void ADC1_StartConversion(void)
1427                     ; 379 {
1428                     	switch	.text
1429  016f               _ADC1_StartConversion:
1433                     ; 380     ADC1->CR1 |= ADC1_CR1_ADON;
1435  016f 72105401      	bset	21505,#0
1436                     ; 381 }
1439  0173 81            	ret	
1483                     ; 390 uint16_t ADC1_GetConversionValue(void)
1483                     ; 391 {
1484                     	switch	.text
1485  0174               _ADC1_GetConversionValue:
1487  0174 5205          	subw	sp,#5
1488       00000005      OFST:	set	5
1491                     ; 393     uint16_t temph = 0;
1493                     ; 394     uint8_t templ = 0;
1495                     ; 396     if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1497  0176 720754020e    	btjf	21506,#3,L126
1498                     ; 399         templ = ADC1->DRL;
1500  017b c65405        	ld	a,21509
1501  017e 6b03          	ld	(OFST-2,sp),a
1502                     ; 401         temph = ADC1->DRH;
1504  0180 c65404        	ld	a,21508
1505  0183 97            	ld	xl,a
1506                     ; 403         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1508  0184 7b03          	ld	a,(OFST-2,sp)
1509  0186 02            	rlwa	x,a
1511  0187 201a          	jra	L326
1512  0189               L126:
1513                     ; 408         temph = ADC1->DRH;
1515  0189 c65404        	ld	a,21508
1516  018c 97            	ld	xl,a
1517                     ; 410         templ = ADC1->DRL;
1519  018d c65405        	ld	a,21509
1520  0190 6b03          	ld	(OFST-2,sp),a
1521                     ; 412         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1523  0192 4f            	clr	a
1524  0193 02            	rlwa	x,a
1525  0194 1f01          	ldw	(OFST-4,sp),x
1526  0196 7b03          	ld	a,(OFST-2,sp)
1527  0198 97            	ld	xl,a
1528  0199 a640          	ld	a,#64
1529  019b 42            	mul	x,a
1530  019c 01            	rrwa	x,a
1531  019d 1a02          	or	a,(OFST-3,sp)
1532  019f 01            	rrwa	x,a
1533  01a0 1a01          	or	a,(OFST-4,sp)
1534  01a2 01            	rrwa	x,a
1535  01a3               L326:
1536                     ; 415     return ((uint16_t)temph);
1540  01a3 5b05          	addw	sp,#5
1541  01a5 81            	ret	
1587                     ; 427 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1587                     ; 428 {
1588                     	switch	.text
1589  01a6               _ADC1_AWDChannelConfig:
1591  01a6 89            	pushw	x
1592       00000000      OFST:	set	0
1595                     ; 430     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1597                     ; 431     assert_param(IS_ADC1_CHANNEL_OK(Channel));
1599                     ; 433     if (Channel < (uint8_t)8)
1601  01a7 9e            	ld	a,xh
1602  01a8 a108          	cp	a,#8
1603  01aa 242b          	jruge	L746
1604                     ; 435         if (NewState != DISABLE)
1606  01ac 9f            	ld	a,xl
1607  01ad 4d            	tnz	a
1608  01ae 2711          	jreq	L156
1609                     ; 437             ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1611  01b0 9e            	ld	a,xh
1612  01b1 5f            	clrw	x
1613  01b2 97            	ld	xl,a
1614  01b3 a601          	ld	a,#1
1615  01b5 5d            	tnzw	x
1616  01b6 2704          	jreq	L66
1617  01b8               L07:
1618  01b8 48            	sll	a
1619  01b9 5a            	decw	x
1620  01ba 26fc          	jrne	L07
1621  01bc               L66:
1622  01bc ca540f        	or	a,21519
1624  01bf 2011          	jp	LC004
1625  01c1               L156:
1626                     ; 441             ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1628  01c1 7b01          	ld	a,(OFST+1,sp)
1629  01c3 5f            	clrw	x
1630  01c4 97            	ld	xl,a
1631  01c5 a601          	ld	a,#1
1632  01c7 5d            	tnzw	x
1633  01c8 2704          	jreq	L27
1634  01ca               L47:
1635  01ca 48            	sll	a
1636  01cb 5a            	decw	x
1637  01cc 26fc          	jrne	L47
1638  01ce               L27:
1639  01ce 43            	cpl	a
1640  01cf c4540f        	and	a,21519
1641  01d2               LC004:
1642  01d2 c7540f        	ld	21519,a
1643  01d5 202e          	jra	L556
1644  01d7               L746:
1645                     ; 446         if (NewState != DISABLE)
1647  01d7 7b02          	ld	a,(OFST+2,sp)
1648  01d9 2714          	jreq	L756
1649                     ; 448             ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1651  01db 7b01          	ld	a,(OFST+1,sp)
1652  01dd a008          	sub	a,#8
1653  01df 5f            	clrw	x
1654  01e0 97            	ld	xl,a
1655  01e1 a601          	ld	a,#1
1656  01e3 5d            	tnzw	x
1657  01e4 2704          	jreq	L67
1658  01e6               L001:
1659  01e6 48            	sll	a
1660  01e7 5a            	decw	x
1661  01e8 26fc          	jrne	L001
1662  01ea               L67:
1663  01ea ca540e        	or	a,21518
1665  01ed 2013          	jp	LC003
1666  01ef               L756:
1667                     ; 452             ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1669  01ef 7b01          	ld	a,(OFST+1,sp)
1670  01f1 a008          	sub	a,#8
1671  01f3 5f            	clrw	x
1672  01f4 97            	ld	xl,a
1673  01f5 a601          	ld	a,#1
1674  01f7 5d            	tnzw	x
1675  01f8 2704          	jreq	L201
1676  01fa               L401:
1677  01fa 48            	sll	a
1678  01fb 5a            	decw	x
1679  01fc 26fc          	jrne	L401
1680  01fe               L201:
1681  01fe 43            	cpl	a
1682  01ff c4540e        	and	a,21518
1683  0202               LC003:
1684  0202 c7540e        	ld	21518,a
1685  0205               L556:
1686                     ; 455 }
1689  0205 85            	popw	x
1690  0206 81            	ret	
1725                     ; 463 void ADC1_SetHighThreshold(uint16_t Threshold)
1725                     ; 464 {
1726                     	switch	.text
1727  0207               _ADC1_SetHighThreshold:
1729  0207 89            	pushw	x
1730       00000000      OFST:	set	0
1733                     ; 465     ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1735  0208 54            	srlw	x
1736  0209 54            	srlw	x
1737  020a 9f            	ld	a,xl
1738  020b c75408        	ld	21512,a
1739                     ; 466     ADC1->HTRL = (uint8_t)Threshold;
1741  020e 7b02          	ld	a,(OFST+2,sp)
1742  0210 c75409        	ld	21513,a
1743                     ; 467 }
1746  0213 85            	popw	x
1747  0214 81            	ret	
1782                     ; 475 void ADC1_SetLowThreshold(uint16_t Threshold)
1782                     ; 476 {
1783                     	switch	.text
1784  0215               _ADC1_SetLowThreshold:
1788                     ; 477     ADC1->LTRL = (uint8_t)Threshold;
1790  0215 9f            	ld	a,xl
1791  0216 c7540b        	ld	21515,a
1792                     ; 478     ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1794  0219 54            	srlw	x
1795  021a 54            	srlw	x
1796  021b 9f            	ld	a,xl
1797  021c c7540a        	ld	21514,a
1798                     ; 479 }
1801  021f 81            	ret	
1854                     ; 488 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1854                     ; 489 {
1855                     	switch	.text
1856  0220               _ADC1_GetBufferValue:
1858  0220 88            	push	a
1859  0221 5205          	subw	sp,#5
1860       00000005      OFST:	set	5
1863                     ; 491     uint16_t temph = 0;
1865                     ; 492     uint8_t templ = 0;
1867                     ; 495     assert_param(IS_ADC1_BUFFER_OK(Buffer));
1869                     ; 497     if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1871  0223 7b06          	ld	a,(OFST+1,sp)
1872  0225 48            	sll	a
1873  0226 5f            	clrw	x
1874  0227 97            	ld	xl,a
1875  0228 7207540213    	btjf	21506,#3,L547
1876                     ; 500         templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1878  022d d653e1        	ld	a,(21473,x)
1879  0230 6b03          	ld	(OFST-2,sp),a
1880                     ; 502         temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1882  0232 7b06          	ld	a,(OFST+1,sp)
1883  0234 48            	sll	a
1884  0235 5f            	clrw	x
1885  0236 97            	ld	xl,a
1886  0237 d653e0        	ld	a,(21472,x)
1887  023a 97            	ld	xl,a
1888                     ; 504         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1890  023b 7b03          	ld	a,(OFST-2,sp)
1891  023d 02            	rlwa	x,a
1893  023e 2024          	jra	L747
1894  0240               L547:
1895                     ; 509         temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1897  0240 d653e0        	ld	a,(21472,x)
1898  0243 5f            	clrw	x
1899  0244 97            	ld	xl,a
1900  0245 1f04          	ldw	(OFST-1,sp),x
1901                     ; 511         templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1903  0247 7b06          	ld	a,(OFST+1,sp)
1904  0249 48            	sll	a
1905  024a 5f            	clrw	x
1906  024b 97            	ld	xl,a
1907  024c d653e1        	ld	a,(21473,x)
1908  024f 6b03          	ld	(OFST-2,sp),a
1909                     ; 513         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1911  0251 4f            	clr	a
1912  0252 1e04          	ldw	x,(OFST-1,sp)
1913  0254 02            	rlwa	x,a
1914  0255 1f01          	ldw	(OFST-4,sp),x
1915  0257 7b03          	ld	a,(OFST-2,sp)
1916  0259 97            	ld	xl,a
1917  025a a640          	ld	a,#64
1918  025c 42            	mul	x,a
1919  025d 01            	rrwa	x,a
1920  025e 1a02          	or	a,(OFST-3,sp)
1921  0260 01            	rrwa	x,a
1922  0261 1a01          	or	a,(OFST-4,sp)
1923  0263 01            	rrwa	x,a
1924  0264               L747:
1925                     ; 516     return ((uint16_t)temph);
1929  0264 5b06          	addw	sp,#6
1930  0266 81            	ret	
1996                     ; 526 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
1996                     ; 527 {
1997                     	switch	.text
1998  0267               _ADC1_GetAWDChannelStatus:
2000  0267 88            	push	a
2001  0268 88            	push	a
2002       00000001      OFST:	set	1
2005                     ; 528     uint8_t status = 0;
2007                     ; 531     assert_param(IS_ADC1_CHANNEL_OK(Channel));
2009                     ; 533     if (Channel < (uint8_t)8)
2011  0269 a108          	cp	a,#8
2012  026b 2410          	jruge	L3001
2013                     ; 535         status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2015  026d 5f            	clrw	x
2016  026e 97            	ld	xl,a
2017  026f a601          	ld	a,#1
2018  0271 5d            	tnzw	x
2019  0272 2704          	jreq	L611
2020  0274               L021:
2021  0274 48            	sll	a
2022  0275 5a            	decw	x
2023  0276 26fc          	jrne	L021
2024  0278               L611:
2025  0278 c4540d        	and	a,21517
2027  027b 2012          	jra	L5001
2028  027d               L3001:
2029                     ; 539         status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2031  027d 7b02          	ld	a,(OFST+1,sp)
2032  027f a008          	sub	a,#8
2033  0281 5f            	clrw	x
2034  0282 97            	ld	xl,a
2035  0283 a601          	ld	a,#1
2036  0285 5d            	tnzw	x
2037  0286 2704          	jreq	L221
2038  0288               L421:
2039  0288 48            	sll	a
2040  0289 5a            	decw	x
2041  028a 26fc          	jrne	L421
2042  028c               L221:
2043  028c c4540c        	and	a,21516
2044  028f               L5001:
2045                     ; 542     return ((FlagStatus)status);
2049  028f 85            	popw	x
2050  0290 81            	ret	
2208                     ; 551 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2208                     ; 552 {
2209                     	switch	.text
2210  0291               _ADC1_GetFlagStatus:
2212  0291 88            	push	a
2213  0292 88            	push	a
2214       00000001      OFST:	set	1
2217                     ; 553     uint8_t flagstatus = 0;
2219                     ; 554     uint8_t temp = 0;
2221                     ; 557     assert_param(IS_ADC1_FLAG_OK(Flag));
2223                     ; 559     if ((Flag & 0x0F) == 0x01)
2225  0293 a40f          	and	a,#15
2226  0295 4a            	dec	a
2227  0296 2607          	jrne	L5701
2228                     ; 562         flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2230  0298 c65403        	ld	a,21507
2231  029b a440          	and	a,#64
2233  029d 2039          	jra	L7701
2234  029f               L5701:
2235                     ; 564     else if ((Flag & 0xF0) == 0x10)
2237  029f 7b02          	ld	a,(OFST+1,sp)
2238  02a1 a4f0          	and	a,#240
2239  02a3 a110          	cp	a,#16
2240  02a5 262c          	jrne	L1011
2241                     ; 567         temp = (uint8_t)(Flag & (uint8_t)0x0F);
2243  02a7 7b02          	ld	a,(OFST+1,sp)
2244  02a9 a40f          	and	a,#15
2245  02ab 6b01          	ld	(OFST+0,sp),a
2246                     ; 568         if (temp < 8)
2248  02ad a108          	cp	a,#8
2249  02af 2410          	jruge	L3011
2250                     ; 570             flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2252  02b1 5f            	clrw	x
2253  02b2 97            	ld	xl,a
2254  02b3 a601          	ld	a,#1
2255  02b5 5d            	tnzw	x
2256  02b6 2704          	jreq	L031
2257  02b8               L231:
2258  02b8 48            	sll	a
2259  02b9 5a            	decw	x
2260  02ba 26fc          	jrne	L231
2261  02bc               L031:
2262  02bc c4540d        	and	a,21517
2264  02bf 2017          	jra	L7701
2265  02c1               L3011:
2266                     ; 574             flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2268  02c1 a008          	sub	a,#8
2269  02c3 5f            	clrw	x
2270  02c4 97            	ld	xl,a
2271  02c5 a601          	ld	a,#1
2272  02c7 5d            	tnzw	x
2273  02c8 2704          	jreq	L431
2274  02ca               L631:
2275  02ca 48            	sll	a
2276  02cb 5a            	decw	x
2277  02cc 26fc          	jrne	L631
2278  02ce               L431:
2279  02ce c4540c        	and	a,21516
2280  02d1 2005          	jra	L7701
2281  02d3               L1011:
2282                     ; 579         flagstatus = (uint8_t)(ADC1->CSR & Flag);
2284  02d3 c65400        	ld	a,21504
2285  02d6 1402          	and	a,(OFST+1,sp)
2286  02d8               L7701:
2287                     ; 581     return ((FlagStatus)flagstatus);
2291  02d8 85            	popw	x
2292  02d9 81            	ret	
2336                     ; 591 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2336                     ; 592 {
2337                     	switch	.text
2338  02da               _ADC1_ClearFlag:
2340  02da 88            	push	a
2341  02db 88            	push	a
2342       00000001      OFST:	set	1
2345                     ; 593     uint8_t temp = 0;
2347                     ; 596     assert_param(IS_ADC1_FLAG_OK(Flag));
2349                     ; 598     if ((Flag & 0x0F) == 0x01)
2351  02dc a40f          	and	a,#15
2352  02de 4a            	dec	a
2353  02df 2606          	jrne	L3311
2354                     ; 601         ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2356  02e1 721d5403      	bres	21507,#6
2358  02e5 2045          	jra	L5311
2359  02e7               L3311:
2360                     ; 603     else if ((Flag & 0xF0) == 0x10)
2362  02e7 7b02          	ld	a,(OFST+1,sp)
2363  02e9 a4f0          	and	a,#240
2364  02eb a110          	cp	a,#16
2365  02ed 2634          	jrne	L7311
2366                     ; 606         temp = (uint8_t)(Flag & (uint8_t)0x0F);
2368  02ef 7b02          	ld	a,(OFST+1,sp)
2369  02f1 a40f          	and	a,#15
2370  02f3 6b01          	ld	(OFST+0,sp),a
2371                     ; 607         if (temp < 8)
2373  02f5 a108          	cp	a,#8
2374  02f7 2414          	jruge	L1411
2375                     ; 609             ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2377  02f9 5f            	clrw	x
2378  02fa 97            	ld	xl,a
2379  02fb a601          	ld	a,#1
2380  02fd 5d            	tnzw	x
2381  02fe 2704          	jreq	L241
2382  0300               L441:
2383  0300 48            	sll	a
2384  0301 5a            	decw	x
2385  0302 26fc          	jrne	L441
2386  0304               L241:
2387  0304 43            	cpl	a
2388  0305 c4540d        	and	a,21517
2389  0308 c7540d        	ld	21517,a
2391  030b 201f          	jra	L5311
2392  030d               L1411:
2393                     ; 613             ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2395  030d a008          	sub	a,#8
2396  030f 5f            	clrw	x
2397  0310 97            	ld	xl,a
2398  0311 a601          	ld	a,#1
2399  0313 5d            	tnzw	x
2400  0314 2704          	jreq	L641
2401  0316               L051:
2402  0316 48            	sll	a
2403  0317 5a            	decw	x
2404  0318 26fc          	jrne	L051
2405  031a               L641:
2406  031a 43            	cpl	a
2407  031b c4540c        	and	a,21516
2408  031e c7540c        	ld	21516,a
2409  0321 2009          	jra	L5311
2410  0323               L7311:
2411                     ; 618         ADC1->CSR &= (uint8_t) (~Flag);
2413  0323 7b02          	ld	a,(OFST+1,sp)
2414  0325 43            	cpl	a
2415  0326 c45400        	and	a,21504
2416  0329 c75400        	ld	21504,a
2417  032c               L5311:
2418                     ; 620 }
2421  032c 85            	popw	x
2422  032d 81            	ret	
2477                     ; 640 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2477                     ; 641 {
2478                     	switch	.text
2479  032e               _ADC1_GetITStatus:
2481  032e 89            	pushw	x
2482  032f 88            	push	a
2483       00000001      OFST:	set	1
2486                     ; 642     ITStatus itstatus = RESET;
2488                     ; 643     uint8_t temp = 0;
2490                     ; 646     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2492                     ; 648     if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2494  0330 01            	rrwa	x,a
2495  0331 a4f0          	and	a,#240
2496  0333 5f            	clrw	x
2497  0334 02            	rlwa	x,a
2498  0335 a30010        	cpw	x,#16
2499  0338 262c          	jrne	L5711
2500                     ; 651         temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2502  033a 7b03          	ld	a,(OFST+2,sp)
2503  033c a40f          	and	a,#15
2504  033e 6b01          	ld	(OFST+0,sp),a
2505                     ; 652         if (temp < 8)
2507  0340 a108          	cp	a,#8
2508  0342 2410          	jruge	L7711
2509                     ; 654             itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2511  0344 5f            	clrw	x
2512  0345 97            	ld	xl,a
2513  0346 a601          	ld	a,#1
2514  0348 5d            	tnzw	x
2515  0349 2704          	jreq	L451
2516  034b               L651:
2517  034b 48            	sll	a
2518  034c 5a            	decw	x
2519  034d 26fc          	jrne	L651
2520  034f               L451:
2521  034f c4540d        	and	a,21517
2523  0352 2017          	jra	L3021
2524  0354               L7711:
2525                     ; 658             itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2527  0354 a008          	sub	a,#8
2528  0356 5f            	clrw	x
2529  0357 97            	ld	xl,a
2530  0358 a601          	ld	a,#1
2531  035a 5d            	tnzw	x
2532  035b 2704          	jreq	L061
2533  035d               L261:
2534  035d 48            	sll	a
2535  035e 5a            	decw	x
2536  035f 26fc          	jrne	L261
2537  0361               L061:
2538  0361 c4540c        	and	a,21516
2539  0364 2005          	jra	L3021
2540  0366               L5711:
2541                     ; 663         itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2543  0366 c65400        	ld	a,21504
2544  0369 1403          	and	a,(OFST+2,sp)
2545  036b               L3021:
2546                     ; 665     return ((ITStatus)itstatus);
2550  036b 5b03          	addw	sp,#3
2551  036d 81            	ret	
2596                     ; 687 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2596                     ; 688 {
2597                     	switch	.text
2598  036e               _ADC1_ClearITPendingBit:
2600  036e 89            	pushw	x
2601  036f 88            	push	a
2602       00000001      OFST:	set	1
2605                     ; 689     uint8_t temp = 0;
2607                     ; 692     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2609                     ; 694     if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2611  0370 01            	rrwa	x,a
2612  0371 a4f0          	and	a,#240
2613  0373 5f            	clrw	x
2614  0374 02            	rlwa	x,a
2615  0375 a30010        	cpw	x,#16
2616  0378 2634          	jrne	L7221
2617                     ; 697         temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2619  037a 7b03          	ld	a,(OFST+2,sp)
2620  037c a40f          	and	a,#15
2621  037e 6b01          	ld	(OFST+0,sp),a
2622                     ; 698         if (temp < 8)
2624  0380 a108          	cp	a,#8
2625  0382 2414          	jruge	L1321
2626                     ; 700             ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2628  0384 5f            	clrw	x
2629  0385 97            	ld	xl,a
2630  0386 a601          	ld	a,#1
2631  0388 5d            	tnzw	x
2632  0389 2704          	jreq	L661
2633  038b               L071:
2634  038b 48            	sll	a
2635  038c 5a            	decw	x
2636  038d 26fc          	jrne	L071
2637  038f               L661:
2638  038f 43            	cpl	a
2639  0390 c4540d        	and	a,21517
2640  0393 c7540d        	ld	21517,a
2642  0396 201f          	jra	L5321
2643  0398               L1321:
2644                     ; 704             ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2646  0398 a008          	sub	a,#8
2647  039a 5f            	clrw	x
2648  039b 97            	ld	xl,a
2649  039c a601          	ld	a,#1
2650  039e 5d            	tnzw	x
2651  039f 2704          	jreq	L271
2652  03a1               L471:
2653  03a1 48            	sll	a
2654  03a2 5a            	decw	x
2655  03a3 26fc          	jrne	L471
2656  03a5               L271:
2657  03a5 43            	cpl	a
2658  03a6 c4540c        	and	a,21516
2659  03a9 c7540c        	ld	21516,a
2660  03ac 2009          	jra	L5321
2661  03ae               L7221:
2662                     ; 709         ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2664  03ae 7b03          	ld	a,(OFST+2,sp)
2665  03b0 43            	cpl	a
2666  03b1 c45400        	and	a,21504
2667  03b4 c75400        	ld	21504,a
2668  03b7               L5321:
2669                     ; 711 }
2672  03b7 5b03          	addw	sp,#3
2673  03b9 81            	ret	
2686                     	xdef	_ADC1_ClearITPendingBit
2687                     	xdef	_ADC1_GetITStatus
2688                     	xdef	_ADC1_ClearFlag
2689                     	xdef	_ADC1_GetFlagStatus
2690                     	xdef	_ADC1_GetAWDChannelStatus
2691                     	xdef	_ADC1_GetBufferValue
2692                     	xdef	_ADC1_SetLowThreshold
2693                     	xdef	_ADC1_SetHighThreshold
2694                     	xdef	_ADC1_GetConversionValue
2695                     	xdef	_ADC1_StartConversion
2696                     	xdef	_ADC1_AWDChannelConfig
2697                     	xdef	_ADC1_ExternalTriggerConfig
2698                     	xdef	_ADC1_ConversionConfig
2699                     	xdef	_ADC1_SchmittTriggerConfig
2700                     	xdef	_ADC1_PrescalerConfig
2701                     	xdef	_ADC1_ITConfig
2702                     	xdef	_ADC1_DataBufferCmd
2703                     	xdef	_ADC1_ScanModeCmd
2704                     	xdef	_ADC1_Cmd
2705                     	xdef	_ADC1_Init
2706                     	xdef	_ADC1_DeInit
2725                     	end
