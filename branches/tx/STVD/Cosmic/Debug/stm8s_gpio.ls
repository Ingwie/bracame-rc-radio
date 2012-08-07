   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
 112                     ; 47 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 112                     ; 48 {
 114                     	switch	.text
 115  0000               _GPIO_DeInit:
 119                     ; 49     GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 121  0000 7f            	clr	(x)
 122                     ; 50     GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 124  0001 6f02          	clr	(2,x)
 125                     ; 51     GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 127  0003 6f03          	clr	(3,x)
 128                     ; 52     GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 130  0005 6f04          	clr	(4,x)
 131                     ; 53 }
 134  0007 81            	ret	
 374                     ; 65 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 374                     ; 66 {
 375                     	switch	.text
 376  0008               _GPIO_Init:
 378  0008 89            	pushw	x
 379       00000000      OFST:	set	0
 382                     ; 71     assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 384                     ; 72     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 386                     ; 75   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 388  0009 7b05          	ld	a,(OFST+5,sp)
 389  000b 43            	cpl	a
 390  000c e404          	and	a,(4,x)
 391  000e e704          	ld	(4,x),a
 392                     ; 81     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 394  0010 7b06          	ld	a,(OFST+6,sp)
 395  0012 2a18          	jrpl	L771
 396                     ; 83         if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 398  0014 a510          	bcp	a,#16
 399  0016 2705          	jreq	L102
 400                     ; 85             GPIOx->ODR |= (uint8_t)GPIO_Pin;
 402  0018 f6            	ld	a,(x)
 403  0019 1a05          	or	a,(OFST+5,sp)
 405  001b 2006          	jra	L302
 406  001d               L102:
 407                     ; 89             GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 409  001d 1e01          	ldw	x,(OFST+1,sp)
 410  001f 7b05          	ld	a,(OFST+5,sp)
 411  0021 43            	cpl	a
 412  0022 f4            	and	a,(x)
 413  0023               L302:
 414  0023 f7            	ld	(x),a
 415                     ; 92         GPIOx->DDR |= (uint8_t)GPIO_Pin;
 417  0024 1e01          	ldw	x,(OFST+1,sp)
 418  0026 e602          	ld	a,(2,x)
 419  0028 1a05          	or	a,(OFST+5,sp)
 421  002a 2007          	jra	L502
 422  002c               L771:
 423                     ; 97         GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 425  002c 1e01          	ldw	x,(OFST+1,sp)
 426  002e 7b05          	ld	a,(OFST+5,sp)
 427  0030 43            	cpl	a
 428  0031 e402          	and	a,(2,x)
 429  0033               L502:
 430  0033 e702          	ld	(2,x),a
 431                     ; 104     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 433  0035 7b06          	ld	a,(OFST+6,sp)
 434  0037 a540          	bcp	a,#64
 435  0039 2706          	jreq	L702
 436                     ; 106         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 438  003b e603          	ld	a,(3,x)
 439  003d 1a05          	or	a,(OFST+5,sp)
 441  003f 2005          	jra	L112
 442  0041               L702:
 443                     ; 110         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 445  0041 7b05          	ld	a,(OFST+5,sp)
 446  0043 43            	cpl	a
 447  0044 e403          	and	a,(3,x)
 448  0046               L112:
 449  0046 e703          	ld	(3,x),a
 450                     ; 117     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 452  0048 7b06          	ld	a,(OFST+6,sp)
 453  004a a520          	bcp	a,#32
 454  004c 2706          	jreq	L312
 455                     ; 119         GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 457  004e e604          	ld	a,(4,x)
 458  0050 1a05          	or	a,(OFST+5,sp)
 460  0052 2005          	jra	L512
 461  0054               L312:
 462                     ; 123         GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 464  0054 7b05          	ld	a,(OFST+5,sp)
 465  0056 43            	cpl	a
 466  0057 e404          	and	a,(4,x)
 467  0059               L512:
 468  0059 e704          	ld	(4,x),a
 469                     ; 125 }
 472  005b 85            	popw	x
 473  005c 81            	ret	
 519                     ; 135 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 519                     ; 136 {
 520                     	switch	.text
 521  005d               _GPIO_Write:
 523  005d 89            	pushw	x
 524       00000000      OFST:	set	0
 527                     ; 137     GPIOx->ODR = PortVal;
 529  005e 1e01          	ldw	x,(OFST+1,sp)
 530  0060 7b05          	ld	a,(OFST+5,sp)
 531  0062 f7            	ld	(x),a
 532                     ; 138 }
 535  0063 85            	popw	x
 536  0064 81            	ret	
 583                     ; 148 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 583                     ; 149 {
 584                     	switch	.text
 585  0065               _GPIO_WriteHigh:
 587  0065 89            	pushw	x
 588       00000000      OFST:	set	0
 591                     ; 150     GPIOx->ODR |= (uint8_t)PortPins;
 593  0066 f6            	ld	a,(x)
 594  0067 1a05          	or	a,(OFST+5,sp)
 595  0069 f7            	ld	(x),a
 596                     ; 151 }
 599  006a 85            	popw	x
 600  006b 81            	ret	
 647                     ; 161 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 647                     ; 162 {
 648                     	switch	.text
 649  006c               _GPIO_WriteLow:
 651  006c 89            	pushw	x
 652       00000000      OFST:	set	0
 655                     ; 163     GPIOx->ODR &= (uint8_t)(~PortPins);
 657  006d 7b05          	ld	a,(OFST+5,sp)
 658  006f 43            	cpl	a
 659  0070 f4            	and	a,(x)
 660  0071 f7            	ld	(x),a
 661                     ; 164 }
 664  0072 85            	popw	x
 665  0073 81            	ret	
 712                     ; 174 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 712                     ; 175 {
 713                     	switch	.text
 714  0074               _GPIO_WriteReverse:
 716  0074 89            	pushw	x
 717       00000000      OFST:	set	0
 720                     ; 176     GPIOx->ODR ^= (uint8_t)PortPins;
 722  0075 f6            	ld	a,(x)
 723  0076 1805          	xor	a,(OFST+5,sp)
 724  0078 f7            	ld	(x),a
 725                     ; 177 }
 728  0079 85            	popw	x
 729  007a 81            	ret	
 767                     ; 185 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 767                     ; 186 {
 768                     	switch	.text
 769  007b               _GPIO_ReadOutputData:
 773                     ; 187     return ((uint8_t)GPIOx->ODR);
 775  007b f6            	ld	a,(x)
 778  007c 81            	ret	
 815                     ; 196 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 815                     ; 197 {
 816                     	switch	.text
 817  007d               _GPIO_ReadInputData:
 821                     ; 198     return ((uint8_t)GPIOx->IDR);
 823  007d e601          	ld	a,(1,x)
 826  007f 81            	ret	
 894                     ; 207 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 894                     ; 208 {
 895                     	switch	.text
 896  0080               _GPIO_ReadInputPin:
 898  0080 89            	pushw	x
 899       00000000      OFST:	set	0
 902                     ; 209     return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 904  0081 e601          	ld	a,(1,x)
 905  0083 1405          	and	a,(OFST+5,sp)
 908  0085 85            	popw	x
 909  0086 81            	ret	
 987                     ; 219 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 987                     ; 220 {
 988                     	switch	.text
 989  0087               _GPIO_ExternalPullUpConfig:
 991  0087 89            	pushw	x
 992       00000000      OFST:	set	0
 995                     ; 222     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 997                     ; 223     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 999                     ; 225     if (NewState != DISABLE) /* External Pull-Up Set*/
1001  0088 7b06          	ld	a,(OFST+6,sp)
1002  008a 2706          	jreq	L374
1003                     ; 227         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1005  008c e603          	ld	a,(3,x)
1006  008e 1a05          	or	a,(OFST+5,sp)
1008  0090 2007          	jra	L574
1009  0092               L374:
1010                     ; 230         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1012  0092 1e01          	ldw	x,(OFST+1,sp)
1013  0094 7b05          	ld	a,(OFST+5,sp)
1014  0096 43            	cpl	a
1015  0097 e403          	and	a,(3,x)
1016  0099               L574:
1017  0099 e703          	ld	(3,x),a
1018                     ; 232 }
1021  009b 85            	popw	x
1022  009c 81            	ret	
1035                     	xdef	_GPIO_ExternalPullUpConfig
1036                     	xdef	_GPIO_ReadInputPin
1037                     	xdef	_GPIO_ReadOutputData
1038                     	xdef	_GPIO_ReadInputData
1039                     	xdef	_GPIO_WriteReverse
1040                     	xdef	_GPIO_WriteLow
1041                     	xdef	_GPIO_WriteHigh
1042                     	xdef	_GPIO_Write
1043                     	xdef	_GPIO_Init
1044                     	xdef	_GPIO_DeInit
1063                     	end
