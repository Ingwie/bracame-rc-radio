   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  78                     ; 61 void LCD_LOAD_CGRAM(char tab[], u8 charnum)
  78                     ; 62 {
  80                     	switch	.text
  81  0000               _LCD_LOAD_CGRAM:
  83  0000 89            	pushw	x
  84  0001 88            	push	a
  85       00000001      OFST:	set	1
  88                     ; 65 	charnum = charnum * 8;
  90  0002 0806          	sll	(OFST+5,sp)
  91  0004 0806          	sll	(OFST+5,sp)
  92  0006 0806          	sll	(OFST+5,sp)
  93                     ; 66 	for (index = 0;index < charnum;index++)
  95  0008 0f01          	clr	(OFST+0,sp)
  97  000a 2017          	jra	L34
  98  000c               L73:
  99                     ; 69 		LCD_printchar(tab[index]);
 101  000c 7b02          	ld	a,(OFST+1,sp)
 102  000e 97            	ld	xl,a
 103  000f 7b03          	ld	a,(OFST+2,sp)
 104  0011 1b01          	add	a,(OFST+0,sp)
 105  0013 2401          	jrnc	L01
 106  0015 5c            	incw	x
 107  0016               L01:
 108  0016 02            	rlwa	x,a
 109  0017 f6            	ld	a,(x)
 110  0018 cd00e6        	call	_LCD_printchar
 112                     ; 70 		Delay(35);
 114  001b ae0023        	ldw	x,#35
 115  001e cd0000        	call	_Delay
 117                     ; 66 	for (index = 0;index < charnum;index++)
 119  0021 0c01          	inc	(OFST+0,sp)
 120  0023               L34:
 123  0023 7b01          	ld	a,(OFST+0,sp)
 124  0025 1106          	cp	a,(OFST+5,sp)
 125  0027 25e3          	jrult	L73
 126                     ; 72 }
 129  0029 5b03          	addw	sp,#3
 130  002b 81            	ret	
 154                     ; 81 void LCD_PWRON (void)
 154                     ; 82 {
 155                     	switch	.text
 156  002c               _LCD_PWRON:
 160                     ; 83 	GPIO_WriteHigh(LCDPwrPort, LCDPwrPin);
 162  002c 4b02          	push	#2
 163  002e ae500a        	ldw	x,#20490
 164  0031 cd0000        	call	_GPIO_WriteHigh
 166  0034 84            	pop	a
 167                     ; 84 }
 170  0035 81            	ret	
 194                     ; 92 void LCD_PWROFF (void)
 194                     ; 93 {
 195                     	switch	.text
 196  0036               _LCD_PWROFF:
 200                     ; 94 	GPIO_WriteLow(LCDPwrPort, LCDPwrPin);
 202  0036 4b02          	push	#2
 203  0038 ae500a        	ldw	x,#20490
 204  003b cd0000        	call	_GPIO_WriteLow
 206  003e 84            	pop	a
 207                     ; 95 }
 210  003f 81            	ret	
 236                     ; 103 void LCD_ENABLE (void)
 236                     ; 104 {
 237                     	switch	.text
 238  0040               _LCD_ENABLE:
 242                     ; 105 	GPIO_WriteHigh(LCDControlPort, LCD_Enable);
 244  0040 4b08          	push	#8
 245  0042 ae500a        	ldw	x,#20490
 246  0045 cd0000        	call	_GPIO_WriteHigh
 248  0048 ae0023        	ldw	x,#35
 249  004b 84            	pop	a
 250                     ; 106 	Delay(35);
 252  004c cd0000        	call	_Delay
 254                     ; 107 	GPIO_WriteLow(LCDControlPort, LCD_Enable);
 256  004f 4b08          	push	#8
 257  0051 ae500a        	ldw	x,#20490
 258  0054 cd0000        	call	_GPIO_WriteLow
 260  0057 84            	pop	a
 261                     ; 108 }
 264  0058 81            	ret	
 303                     ; 116 void LCD_CMD(unsigned char cmd_data)
 303                     ; 117 {
 304                     	switch	.text
 305  0059               _LCD_CMD:
 307  0059 88            	push	a
 308  005a 88            	push	a
 309       00000001      OFST:	set	1
 312                     ; 118 	GPIO_WriteLow(LCDControlPort, LCD_RS);
 314  005b 4b04          	push	#4
 315  005d ae500a        	ldw	x,#20490
 316  0060 cd0000        	call	_GPIO_WriteLow
 318  0063 84            	pop	a
 319                     ; 119 	GPIO_Write(LCDPort, (GPIO_ReadOutputData(LCDPort) & 0x0F) | (cmd_data & 0xF0));
 321  0064 7b02          	ld	a,(OFST+1,sp)
 322  0066 a4f0          	and	a,#240
 323  0068 6b01          	ld	(OFST+0,sp),a
 324  006a ae500a        	ldw	x,#20490
 325  006d cd0000        	call	_GPIO_ReadOutputData
 327  0070 a40f          	and	a,#15
 328  0072 1a01          	or	a,(OFST+0,sp)
 329  0074 88            	push	a
 330  0075 ae500a        	ldw	x,#20490
 331  0078 cd0000        	call	_GPIO_Write
 333  007b 84            	pop	a
 334                     ; 120 	LCD_ENABLE();
 336  007c adc2          	call	_LCD_ENABLE
 338                     ; 121 	GPIO_Write(LCDPort, (GPIO_ReadOutputData(LCDPort) & 0x0F) | ((cmd_data << 4) & 0xF0) );
 340  007e 7b02          	ld	a,(OFST+1,sp)
 341  0080 97            	ld	xl,a
 342  0081 a610          	ld	a,#16
 343  0083 42            	mul	x,a
 344  0084 9f            	ld	a,xl
 345  0085 a4f0          	and	a,#240
 346  0087 6b01          	ld	(OFST+0,sp),a
 347  0089 ae500a        	ldw	x,#20490
 348  008c cd0000        	call	_GPIO_ReadOutputData
 350  008f a40f          	and	a,#15
 351  0091 1a01          	or	a,(OFST+0,sp)
 352  0093 88            	push	a
 353  0094 ae500a        	ldw	x,#20490
 354  0097 cd0000        	call	_GPIO_Write
 356  009a 84            	pop	a
 357                     ; 122 	LCD_ENABLE();
 359  009b ada3          	call	_LCD_ENABLE
 361                     ; 123 	Delay(35);
 363  009d ae0023        	ldw	x,#35
 364  00a0 cd0000        	call	_Delay
 366                     ; 124 }
 369  00a3 85            	popw	x
 370  00a4 81            	ret	
 398                     ; 133 void LCD_INIT(void)
 398                     ; 134 {
 399                     	switch	.text
 400  00a5               _LCD_INIT:
 404                     ; 135 	GPIO_WriteHigh(LCDControlPort, LCD_Enable);
 406  00a5 4b08          	push	#8
 407  00a7 ae500a        	ldw	x,#20490
 408  00aa cd0000        	call	_GPIO_WriteHigh
 410  00ad 84            	pop	a
 411                     ; 136 	GPIO_WriteLow(LCDControlPort, LCD_RS);
 413  00ae 4b04          	push	#4
 414  00b0 ae500a        	ldw	x,#20490
 415  00b3 cd0000        	call	_GPIO_WriteLow
 417  00b6 aeafc8        	ldw	x,#45000
 418  00b9 84            	pop	a
 419                     ; 138 	Delay(45000);
 421  00ba cd0000        	call	_Delay
 423                     ; 139 	LCD_CMD(0x33);
 425  00bd a633          	ld	a,#51
 426  00bf ad98          	call	_LCD_CMD
 428                     ; 140 	Delay(4700);
 430  00c1 ae125c        	ldw	x,#4700
 431  00c4 cd0000        	call	_Delay
 433                     ; 141 	LCD_CMD(0x32);
 435  00c7 a632          	ld	a,#50
 436  00c9 ad8e          	call	_LCD_CMD
 438                     ; 142 	Delay(170);
 440  00cb ae00aa        	ldw	x,#170
 441  00ce cd0000        	call	_Delay
 443                     ; 144 	LCD_CMD(0x28);
 445  00d1 a628          	ld	a,#40
 446  00d3 ad84          	call	_LCD_CMD
 448                     ; 146 	LCD_CMD(0x0C);
 450  00d5 a60c          	ld	a,#12
 451  00d7 ad80          	call	_LCD_CMD
 453                     ; 148 	LCD_CMD(0x06);
 455  00d9 a606          	ld	a,#6
 456  00db cd0059        	call	_LCD_CMD
 458                     ; 149 	LCD_CLEAR_DISPLAY();
 460  00de ad6d          	call	_LCD_CLEAR_DISPLAY
 462                     ; 151 	Delay(4000);
 464  00e0 ae0fa0        	ldw	x,#4000
 466                     ; 152 }
 469  00e3 cc0000        	jp	_Delay
 508                     ; 160 void LCD_printchar(unsigned char ascode)
 508                     ; 161 {
 509                     	switch	.text
 510  00e6               _LCD_printchar:
 512  00e6 88            	push	a
 513  00e7 88            	push	a
 514       00000001      OFST:	set	1
 517                     ; 162 	GPIO_WriteHigh(LCDControlPort, LCD_RS);
 519  00e8 4b04          	push	#4
 520  00ea ae500a        	ldw	x,#20490
 521  00ed cd0000        	call	_GPIO_WriteHigh
 523  00f0 84            	pop	a
 524                     ; 163 	GPIO_Write(LCDPort, (GPIO_ReadOutputData(LCDPort) & 0x0F) | (ascode & 0xF0));
 526  00f1 7b02          	ld	a,(OFST+1,sp)
 527  00f3 a4f0          	and	a,#240
 528  00f5 6b01          	ld	(OFST+0,sp),a
 529  00f7 ae500a        	ldw	x,#20490
 530  00fa cd0000        	call	_GPIO_ReadOutputData
 532  00fd a40f          	and	a,#15
 533  00ff 1a01          	or	a,(OFST+0,sp)
 534  0101 88            	push	a
 535  0102 ae500a        	ldw	x,#20490
 536  0105 cd0000        	call	_GPIO_Write
 538  0108 84            	pop	a
 539                     ; 164 	LCD_ENABLE();
 541  0109 cd0040        	call	_LCD_ENABLE
 543                     ; 165 	Delay(35);
 545  010c ae0023        	ldw	x,#35
 546  010f cd0000        	call	_Delay
 548                     ; 166 	GPIO_Write(LCDPort, (GPIO_ReadOutputData(LCDPort) & 0x0F) | ((ascode << 4) & 0xF0));
 550  0112 7b02          	ld	a,(OFST+1,sp)
 551  0114 97            	ld	xl,a
 552  0115 a610          	ld	a,#16
 553  0117 42            	mul	x,a
 554  0118 9f            	ld	a,xl
 555  0119 a4f0          	and	a,#240
 556  011b 6b01          	ld	(OFST+0,sp),a
 557  011d ae500a        	ldw	x,#20490
 558  0120 cd0000        	call	_GPIO_ReadOutputData
 560  0123 a40f          	and	a,#15
 561  0125 1a01          	or	a,(OFST+0,sp)
 562  0127 88            	push	a
 563  0128 ae500a        	ldw	x,#20490
 564  012b cd0000        	call	_GPIO_Write
 566  012e 84            	pop	a
 567                     ; 167 	LCD_ENABLE();
 569  012f cd0040        	call	_LCD_ENABLE
 571                     ; 168 	Delay(35);
 573  0132 ae0023        	ldw	x,#35
 574  0135 cd0000        	call	_Delay
 576                     ; 169 }
 579  0138 85            	popw	x
 580  0139 81            	ret	
 616                     ; 177 void LCD_printstring(unsigned char *text)
 616                     ; 178 {
 617                     	switch	.text
 618  013a               _LCD_printstring:
 620  013a 89            	pushw	x
 621       00000000      OFST:	set	0
 624  013b 1e01          	ldw	x,(OFST+1,sp)
 625  013d               L161:
 626                     ; 181 		LCD_printchar(*text++);
 628  013d 5c            	incw	x
 629  013e 1f01          	ldw	(OFST+1,sp),x
 630  0140 5a            	decw	x
 631  0141 f6            	ld	a,(x)
 632  0142 ada2          	call	_LCD_printchar
 634                     ; 183 	while (*text != '\n');
 636  0144 1e01          	ldw	x,(OFST+1,sp)
 637  0146 f6            	ld	a,(x)
 638  0147 a10a          	cp	a,#10
 639  0149 26f2          	jrne	L161
 640                     ; 184 }
 643  014b 85            	popw	x
 644  014c 81            	ret	
 669                     ; 192 void LCD_CLEAR_DISPLAY(void)
 669                     ; 193 {
 670                     	switch	.text
 671  014d               _LCD_CLEAR_DISPLAY:
 675                     ; 194 	LCD_CMD(0x01);
 677  014d a601          	ld	a,#1
 678  014f cd0059        	call	_LCD_CMD
 680                     ; 195 	Delay(1500);
 682  0152 ae05dc        	ldw	x,#1500
 684                     ; 196 }
 687  0155 cc0000        	jp	_Delay
 712                     ; 204 void LCD_2ndROW(void)
 712                     ; 205 {
 713                     	switch	.text
 714  0158               _LCD_2ndROW:
 718                     ; 206 	LCD_CMD(0xC0);
 720  0158 a6c0          	ld	a,#192
 721  015a cd0059        	call	_LCD_CMD
 723                     ; 207 	Delay(37);
 725  015d ae0025        	ldw	x,#37
 727                     ; 208 }
 730  0160 cc0000        	jp	_Delay
 755                     ; 216 void LCD_HOME(void)
 755                     ; 217 {
 756                     	switch	.text
 757  0163               _LCD_HOME:
 761                     ; 218 	LCD_CMD(0x02);
 763  0163 a602          	ld	a,#2
 764  0165 cd0059        	call	_LCD_CMD
 766                     ; 219 	Delay(37);
 768  0168 ae0025        	ldw	x,#37
 770                     ; 220 }
 773  016b cc0000        	jp	_Delay
 797                     ; 228 void LCD_LSHIFT(void)
 797                     ; 229 {
 798                     	switch	.text
 799  016e               _LCD_LSHIFT:
 803                     ; 230 	LCD_CMD(0x18);
 805  016e a618          	ld	a,#24
 807                     ; 231 }
 810  0170 cc0059        	jp	_LCD_CMD
 834                     ; 239 void LCD_RSHIFT(void)
 834                     ; 240 {
 835                     	switch	.text
 836  0173               _LCD_RSHIFT:
 840                     ; 241 	LCD_CMD(0x1C);
 842  0173 a61c          	ld	a,#28
 844                     ; 242 }
 847  0175 cc0059        	jp	_LCD_CMD
 871                     ; 250 void LCD_DISP_ON(void)
 871                     ; 251 {
 872                     	switch	.text
 873  0178               _LCD_DISP_ON:
 877                     ; 252 	LCD_CMD(0x0C);
 879  0178 a60c          	ld	a,#12
 881                     ; 253 }
 884  017a cc0059        	jp	_LCD_CMD
 908                     ; 261 void LCD_DISP_OFF(void)
 908                     ; 262 {
 909                     	switch	.text
 910  017d               _LCD_DISP_OFF:
 914                     ; 263 	LCD_CMD(0x08);
 916  017d a608          	ld	a,#8
 918                     ; 264 }
 921  017f cc0059        	jp	_LCD_CMD
 965                     ; 272 void LCD_LOCATE(u8 row, u8 column)
 965                     ; 273 {
 966                     	switch	.text
 967  0182               _LCD_LOCATE:
 969  0182 89            	pushw	x
 970       00000000      OFST:	set	0
 973                     ; 274 	column--;
 975  0183 0a02          	dec	(OFST+2,sp)
 976                     ; 275 	switch (row)
 978  0185 7b01          	ld	a,(OFST+1,sp)
 980                     ; 285 	default:
 980                     ; 286 		break;
 981  0187 4a            	dec	a
 982  0188 2705          	jreq	L752
 983  018a 4a            	dec	a
 984  018b 2708          	jreq	L162
 985  018d 200f          	jra	L113
 986  018f               L752:
 987                     ; 277 	case 1:
 987                     ; 278 		/* Set cursor to 1st row address and add index*/
 987                     ; 279 		LCD_CMD(column |= 0x80);
 989  018f 7b02          	ld	a,(OFST+2,sp)
 990  0191 aa80          	or	a,#128
 992                     ; 280 		break;
 994  0193 2004          	jp	LC001
 995  0195               L162:
 996                     ; 281 	case 2:
 996                     ; 282 		/* Set cursor to 2nd row address and add index*/
 996                     ; 283 		LCD_CMD(column |= 0x40 | 0x80);
 998  0195 7b02          	ld	a,(OFST+2,sp)
 999  0197 aac0          	or	a,#192
1000  0199               LC001:
1001  0199 6b02          	ld	(OFST+2,sp),a
1002  019b cd0059        	call	_LCD_CMD
1004                     ; 284 		break;
1006                     ; 285 	default:
1006                     ; 286 		break;
1008  019e               L113:
1009                     ; 288 }
1012  019e 85            	popw	x
1013  019f 81            	ret	
1016                     	switch	.ubsct
1017  0000               L313_text_buffer:
1018  0000 000000000000  	ds.b	32
1100                     .const:	section	.text
1101  0000               L412:
1102  0000 0000000a      	dc.l	10
1103  0004               L612:
1104  0004 00000020      	dc.l	32
1105  0008               L022:
1106  0008 00000080      	dc.l	128
1107                     ; 296 void LCD_printf(const char *fmt, ...)
1107                     ; 297 {
1108                     	switch	.text
1109  01a0               _LCD_printf:
1111  01a0 89            	pushw	x
1112  01a1 520e          	subw	sp,#14
1113       0000000e      OFST:	set	14
1116                     ; 303 	va_start(args, fmt);
1118                     ; 304 	text_size = vsprintf(text_buffer, fmt, args);
1120  01a3 96            	ldw	x,sp
1121  01a4 1c0013        	addw	x,#OFST+5
1122  01a7 89            	pushw	x
1123  01a8 1e11          	ldw	x,(OFST+3,sp)
1124  01aa 89            	pushw	x
1125  01ab ae0000        	ldw	x,#L313_text_buffer
1126  01ae cd0000        	call	_vsprintf
1128  01b1 5b04          	addw	sp,#4
1129  01b3 cd0000        	call	c_itolx
1131  01b6 96            	ldw	x,sp
1132  01b7 1c0003        	addw	x,#OFST-11
1133  01ba cd0000        	call	c_rtol
1135                     ; 307 	for (i = 0; i < text_size; i++)
1137  01bd 5f            	clrw	x
1138  01be 1f09          	ldw	(OFST-5,sp),x
1139  01c0 1f07          	ldw	(OFST-7,sp),x
1141  01c2 204b          	jra	L363
1142  01c4               L753:
1143                     ; 309 		letter = text_buffer[i];
1145  01c4 1e09          	ldw	x,(OFST-5,sp)
1146  01c6 e600          	ld	a,(L313_text_buffer,x)
1147  01c8 6b0e          	ld	(OFST+0,sp),a
1148  01ca 4f            	clr	a
1149  01cb 6b0d          	ld	(OFST-1,sp),a
1150  01cd 6b0c          	ld	(OFST-2,sp),a
1151  01cf 6b0b          	ld	(OFST-3,sp),a
1152                     ; 311 		if (letter == 10)
1154  01d1 96            	ldw	x,sp
1155  01d2 1c000b        	addw	x,#OFST-3
1156  01d5 cd0000        	call	c_ltor
1158  01d8 ae0000        	ldw	x,#L412
1159  01db cd0000        	call	c_lcmp
1161  01de 2603          	jrne	L763
1162                     ; 312 		break;
1163  01e0               L563:
1164                     ; 319 }
1167  01e0 5b10          	addw	sp,#16
1168  01e2 81            	ret	
1169  01e3               L763:
1170                     ; 315 			if ((letter > 0x1F) && (letter < 0x80))
1172  01e3 96            	ldw	x,sp
1173  01e4 1c000b        	addw	x,#OFST-3
1174  01e7 cd0000        	call	c_ltor
1176  01ea ae0004        	ldw	x,#L612
1177  01ed cd0000        	call	c_lcmp
1179  01f0 2514          	jrult	L173
1181  01f2 96            	ldw	x,sp
1182  01f3 1c000b        	addw	x,#OFST-3
1183  01f6 cd0000        	call	c_ltor
1185  01f9 ae0008        	ldw	x,#L022
1186  01fc cd0000        	call	c_lcmp
1188  01ff 2405          	jruge	L173
1189                     ; 316 			LCD_printchar(letter);
1191  0201 7b0e          	ld	a,(OFST+0,sp)
1192  0203 cd00e6        	call	_LCD_printchar
1194  0206               L173:
1195                     ; 307 	for (i = 0; i < text_size; i++)
1197  0206 96            	ldw	x,sp
1198  0207 1c0007        	addw	x,#OFST-7
1199  020a a601          	ld	a,#1
1200  020c cd0000        	call	c_lgadc
1202  020f               L363:
1205  020f 96            	ldw	x,sp
1206  0210 1c0007        	addw	x,#OFST-7
1207  0213 cd0000        	call	c_ltor
1209  0216 96            	ldw	x,sp
1210  0217 1c0003        	addw	x,#OFST-11
1211  021a cd0000        	call	c_lcmp
1213  021d 25a5          	jrult	L753
1214  021f 20bf          	jra	L563
1278                     ; 321 void LCD_printtruc(u8 ligne,u8 colonne,char *texte,u16 variable)
1278                     ; 322 {	
1279                     	switch	.text
1280  0221               _LCD_printtruc:
1282  0221 89            	pushw	x
1283       00000000      OFST:	set	0
1286                     ; 323 	LCD_LOCATE(ligne,colonne);
1288  0222 7b01          	ld	a,(OFST+1,sp)
1289  0224 95            	ld	xh,a
1290  0225 cd0182        	call	_LCD_LOCATE
1292                     ; 324 	LCD_printf(texte,variable);
1294  0228 1e07          	ldw	x,(OFST+7,sp)
1295  022a 89            	pushw	x
1296  022b 1e07          	ldw	x,(OFST+7,sp)
1297  022d cd01a0        	call	_LCD_printf
1299  0230 85            	popw	x
1300                     ; 325 }
1303  0231 85            	popw	x
1304  0232 81            	ret	
1317                     	xdef	_LCD_ENABLE
1318                     	xref	_vsprintf
1319                     	xref	_Delay
1320                     	xdef	_LCD_printtruc
1321                     	xdef	_LCD_printf
1322                     	xdef	_LCD_LOCATE
1323                     	xdef	_LCD_DISP_OFF
1324                     	xdef	_LCD_DISP_ON
1325                     	xdef	_LCD_RSHIFT
1326                     	xdef	_LCD_LSHIFT
1327                     	xdef	_LCD_HOME
1328                     	xdef	_LCD_2ndROW
1329                     	xdef	_LCD_CLEAR_DISPLAY
1330                     	xdef	_LCD_CMD
1331                     	xdef	_LCD_printstring
1332                     	xdef	_LCD_printchar
1333                     	xdef	_LCD_INIT
1334                     	xdef	_LCD_PWROFF
1335                     	xdef	_LCD_PWRON
1336                     	xdef	_LCD_LOAD_CGRAM
1337                     	xref	_GPIO_ReadOutputData
1338                     	xref	_GPIO_WriteLow
1339                     	xref	_GPIO_WriteHigh
1340                     	xref	_GPIO_Write
1359                     	xref	c_lgadc
1360                     	xref	c_lcmp
1361                     	xref	c_ltor
1362                     	xref	c_rtol
1363                     	xref	c_itolx
1364                     	end
