/* Includes ------------------------------------------------------------------*/

/* Ajout de trims electroniques pour fonctionnement avec nouveaux manches (aurora 9)*/
/* */
/* Ajout dans utilitaire : visualisation des entrées sorties et potars */

#include "stm8s.h"
#include "tx.h"
#include "Delay.h"
#include "hd44780.h"
#include "menu.h"

extern _Bool Menu_on;
extern _Bool sec;
extern _Bool Menu_actif;
extern _Bool Menu_raz;
extern _Bool synchro;
extern u8 Tempo_menu;

extern u8 jeton;
extern u8 channel;

u8 modele_actuel;
u8 phase_actuelle = 0;
_Bool phase_change = 0;

_Bool trimdyn = 0; // PD7
_Bool outputdr = 0; // PE2
_Bool expon = 0; // PE3
_Bool secumot = 0; // PE0
_Bool tor1plus = 0; // PA3
_Bool tor1moins = 0; // PA4
_Bool tor2plus = 0; // PA5
_Bool tor2moins = 0; // PA6

struct_input NEAR input;
struct_mixer_settings NEAR mixer[NUM_MIXER];
struct_output NEAR output;
u16 trimmem[NUM_OUTPUT];
_Bool flashencour = 0;
_Bool menudyn = 0;
_Bool haut = 0; // PG1
_Bool bas = 0; // PC1
_Bool gauche = 0; // PG0
_Bool droite = 0; // PE5

_Bool trim1plus = 0;
_Bool trim1moins = 0;
_Bool trim2plus = 0;
_Bool trim2moins = 0;
_Bool trim3plus = 0;
_Bool trim3moins = 0;
_Bool trim4plus = 0;
_Bool trim4moins = 0;
_Bool trimflag;
u8 trimstep = 10;

u8 barout[NUM_OUTPUT];

u8 secondesurcinq;
u8 secondes;
u8 minutes;
char lhaut[NUM_OUTPUT + 1];
char lbas[NUM_OUTPUT + 1];
u8 ratiobat = 1;
u16 chargeeaccus = 9999;

u8 ratiotrimdyn = 1;
u8 tempotrimdyn = 0;
u8 tempsbip1 = 0;
u8 tempsbip2 = 0;
u8 tempsbip3 = 0;
u8 tempsbip4 = 0;
u8 tempsbip5 = 0;
_Bool bipon = 0;

char cur[64] = {
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

/////////////////////////////////////////////////////////////////////////////

void bip(u8 temps1,u8 temps2,u8 temps3,u8 temps4,u8 temps5) // temps x 0.2 sec
{
	if (bipon)
	{
		GPIO_WriteLow(GPIOD,GPIO_PIN_4);
		tempsbip1 = temps1 + 1;
		tempsbip2 = temps2 + tempsbip1;
		tempsbip3 = temps3 + tempsbip2;
		tempsbip4 = temps4 + tempsbip3;
		tempsbip5 = temps5 + tempsbip4;
	}
}

void biponoff(void)
{
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	Menu_actif = 1;
	Tempo_menu = 13;

	bipon = !bipon;

	if (bipon)
	{
		LCD_printtruc(1,6,"Bip On",0);
		bip(2,1,1,0,0);
	} else
	{
		LCD_printtruc(1,6,"Bip Off",0);
	}
	
	LCD_DISP_ON();
}

void razchrono(void)
{
	minutes = secondes = 0;
	bip(2,1,2,0,0);

}

void razchronobat(void)
{
	chargeeaccus = 9999;
	bip(1,2,1,1,3);
}

void info(void) // Affichage pendant le vol ...
{
	u8 i;
	u16 volt;
	char esp = 32;
	
	for(i = 0; i < NUM_OUTPUT ; i++)
	{	
		
		switch (barout[i])
		{
		case 0:
			lbas[i] = '\1';
			lhaut[i] = esp;
			break;
		case 1:
			lbas[i] = '\2';
			lhaut[i] = esp;
			break;
		case 2:
			lbas[i] = '\3';
			lhaut[i] = esp;
			break;
		case 3:
			lbas[i] = '\4';
			lhaut[i] = esp;
			break;
		case 4:
			lbas[i] = '\5';
			lhaut[i] = esp;
			break;
		case 6:
			lbas[i] = '\6';
			lhaut[i] = esp;
			break;
		case 7:
			lbas[i] = '\7';
			lhaut[i] = esp;
			break;
		case 8:
			lbas[i] = esp;
			lhaut[i] = '\0';
			break;
		case 9:
			lbas[i] = esp;
			lhaut[i] = '\1';
			break;
		case 10:
			lbas[i] = esp;
			lhaut[i] = '\2';
			break;
		case 11:
			lbas[i] = esp;
			lhaut[i] = '\3';
			break;
		case 12:
			lbas[i] = esp;
			lhaut[i] = '\4';
			break;
		case 13:
			lbas[i] = esp;
			lhaut[i] = '\5';
			break;
		case 14:
			lbas[i] = esp;
			lhaut[i] = '\6';
			break;
		case 15:
			lbas[i] = esp;
			lhaut[i] = '\7';
			break;
		}
		
	}
	
	lhaut[NUM_OUTPUT] = 10; // Caractere "/n"
	lbas[NUM_OUTPUT] = 10;
	LCD_LOCATE(1,1);
	LCD_printstring(lhaut);
	LCD_LOCATE(2,1);
	LCD_printstring(lbas);



	//LCD_printtruc(1,1,"%u\n",ADC1_GetBufferValue(0));
	//LCD_printtruc(1,6,"%u\n",input.channel[0].usValue);
	//LCD_printtruc(2,1,"%u\n",output.usValueOut[0]);
	
	// Horloge
	LCD_printtruc(1,12,"%2.2u\n",minutes);
	LCD_printtruc(1,14,":%2.2u\n",secondes);

	// Canal en cours d'emission
	LCD_printtruc(1,10,"%u\n",channel);


	// Batterie
	volt = ADC1_GetBufferValue(6); //3.42 (697) 2.2 (452) ->  200.81 / VOLT + 0.05V *2 + diode
	volt = volt * 10;
	volt += 680;
	LCD_printtruc(2,12,"%i\n",volt/1000);
	volt /= 10;
	LCD_printtruc(2,13,".%2.2iV\n",volt%100);
	if (volt < 750)
	{
		if (secondes == 0)
		{
			bipon = 1;
			bip(0,1,1,1,1);
			LCD_DISP_OFF();
			LCD_CLEAR_DISPLAY();
			LCD_printtruc(1,5,"BATTERIE\n",0);
			LCD_printtruc(2,6,"FAIBLE\n",0);
			LCD_DISP_ON();
		}
	}
	
	
}

void chronobat(void) // Autonomie batterie f des gaz
{
	u16 temp;

	if (output.secumoteur != 255)
	{
		temp = output.usValueOut[output.secumoteur];
		temp -= MIN_COURSE;
		temp /= 20;
		temp *= ratiobat;
		if (temp == 0) temp = 1;
		temp /= 180;
		chargeeaccus -= temp;
		if (chargeeaccus > 9999) chargeeaccus = 0;
		temp = chargeeaccus/100;
		if (Menu_actif == 0)	LCD_printtruc(2,9,"%2.2u%%\n",temp);
		if (temp == 50) bip(3,0,0,0,0);
		if (temp == 40) bip(6,0,0,0,0);
		if (temp == 30) bip(12,1,12,1,12);
		if (temp == 20) bip(12,2,36,1,36);
	}
}

s8 sortiepourcent(u16 sortie) // Valeurs des temps en %
{	
	s16 a ;
	a= (sortie - NEUTRE_COURSE);
	a=a/10;
	return a;
}

u16 pourcentsortie(s8 pourcent)
{ 
	return ((pourcent * 10) + NEUTRE_COURSE);
	
}

u8 nivbar(u16 sortie) // Pour baragraphe info
{	
	u16 a ;
	a= (sortie - MIN_COURSE);
	a = (a >> 7);
	return (u8)a;
}

u32 FLASH_ProgramdoubleByte(u32 add,u16 val)
{
	u8 tval;
	
	tval = val  & 0xff;
	FLASH_ProgramByte(add, val);
	add ++;
	
	tval = (val >> 8) & 0xff;
	FLASH_ProgramByte(add, tval);
	add ++;

	return add;
}

u16 FLASH_ReaddoubleByte(u32 add)
{
	u8 datal; 
	u8 datah; 
	u16 val;
	
	datal = FLASH_ReadByte(add);
	add = add + 1;
	datah = FLASH_ReadByte(add);
	val = 256 * datah + datal;
	
	return val;
}

void reset_model(void)
{
	u8 i;
	
	//input
	for(i = 0; i < NUM_INPUT; i++)
	{
		input.channel[i].usMinValue = 0;
		input.channel[i].usNeutralValue = 511;
		input.channel[i].usMaxValue = 1023;
		input.channel[i].expo[0] = 0;
		input.channel[i].expo[1] = 0;
		
	}
	
	//mixer 
	for(i = 0; i < NUM_MIXER; i++)
	{
		if(i < NUM_INPUT + NUM_INPUT_SWITCH)
		{
			mixer[i].in = i;
			mixer[i].out = i;
			mixer[i].pente[0] = 100;
			mixer[i].pente[1] = 100;
			
		}
		else
		{
			mixer[i].in = 255;
			mixer[i].out = 255;
			mixer[i].pente[0] = 0;
			mixer[i].pente[1] = 0;
			
		}
		
	}

	//output
	
	output.usValueOut[NUM_OUTPUT] =  LONGUEUR_TRAME; //22.5 ms
	
	for(i = 0; i < NUM_OUTPUT ; i++)
	{
		output.dr[i] = 100;
		output.sValue[i] = 0;
		output.usValueOut[i] = NEUTRE_COURSE;
		output.usMinValue[i] = MIN_COURSE;
		output.usNeutralValue[i] = NEUTRE_COURSE;
		output.usMaxValue[i] = MAX_COURSE;
		output.usValueOut[NUM_OUTPUT] = output.usValueOut[NUM_OUTPUT] - output.usValueOut[i];
	}
	
	output.secumoteur = 255;
	ratiobat = 0;
}

void load_input(u8 model)
{
	u8 i = 0;
	u16 delta2;
	
	u32 addr = BASE_EEPROM + MODEL_ACTUEL_LENGTH + 1;
	
	addr = addr + (((NUM_PHASE * PHASE_LENGTH) + INPUT_LENGTH ) * model);

	flashencour = 1;
	//input
	for(i = 0; i < NUM_INPUT; i++)
	{	
		input.channel[i].usMinValue = FLASH_ReaddoubleByte(addr);
		addr = addr + 2;	
		
		input.channel[i].usNeutralValue = FLASH_ReaddoubleByte(addr);
		addr = addr + 2;	
		
		input.channel[i].usMaxValue = FLASH_ReaddoubleByte(addr);
		addr = addr + 2;	                
		
		delta2 = (input.channel[i].usNeutralValue - input.channel[i].usMinValue);
		if (delta2 > 4) input.channel[i].pente[0] = 256000 / delta2;
		else input.channel[i].pente[0] = 0xFFFF;
		
		delta2 = (input.channel[i].usMaxValue - input.channel[i].usNeutralValue);
		if (delta2 > 4) input.channel[i].pente[1] = 256000 / delta2;
		else input.channel[i].pente[1] = 0xFFFF;
	}
	flashencour = 0;
}

void load_phase(u8 phase)
{
	u8 i = 0;
	u8 j = 0;
	s8 temp;
	
	u32 addr = BASE_EEPROM + MODEL_ACTUEL_LENGTH + 1;
	
	addr = addr + INPUT_LENGTH  + (((NUM_PHASE * PHASE_LENGTH) + INPUT_LENGTH ) * modele_actuel);
	
	addr = addr + ( PHASE_LENGTH * phase );

	flashencour = 1;
	//input
	for(i = 0; i < NUM_INPUT; i++)
	{
		for(j = 0; j < 2; j++)
		{
			input.channel[i].expo[j] = FLASH_ReadByte(addr);
			addr++;
		}
	}
	
	//mixer
	for(i = 0; i < NUM_MIXER; i++)
	{
		mixer[i].in = FLASH_ReadByte(addr);
		addr++;
		mixer[i].out = FLASH_ReadByte(addr);
		addr++;
		mixer[i].pente[0] = FLASH_ReadByte(addr);
		addr++;
		mixer[i].pente[1] = FLASH_ReadByte(addr);
		addr++;		
	}
	
	//output
	
	
	for(i = 0; i < NUM_OUTPUT; i++)
	{
		output.dr[i] = FLASH_ReadByte(addr);
		addr++;
		temp = FLASH_ReadByte(addr);
		addr++;		
		output.usMinValue[i] = pourcentsortie(temp);
		temp = FLASH_ReadByte(addr);
		addr++;		
		output.usNeutralValue[i] = pourcentsortie(temp);
		temp = FLASH_ReadByte(addr);
		addr++;		
		output.usMaxValue[i] = pourcentsortie(temp);
		
	}
	
	output.secumoteur = FLASH_ReadByte(addr);
	addr++;		
	ratiobat = FLASH_ReadByte(addr);
	flashencour = 0;
	phase_change = 0;

}

void save_input(u8 model) // taille : (6 x NUM_INPUT) (36)
{
	u8 i = 0;
	
	u32 addr = BASE_EEPROM + MODEL_ACTUEL_LENGTH + 1;
	
	addr = addr + (((NUM_PHASE * PHASE_LENGTH) + INPUT_LENGTH ) * model);
	
	flashencour = 1;
	//write data to eeprom
	FLASH_DeInit();
	/*Define FLASH programming time*/
	FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
	/* Unlock Data memory */
	FLASH_Unlock(FLASH_MEMTYPE_DATA);
	
	
	//input
	for(i = 0; i < NUM_INPUT; i++)
	{
		addr = FLASH_ProgramdoubleByte(addr,input.channel[i].usMinValue);
		addr = FLASH_ProgramdoubleByte(addr,input.channel[i].usNeutralValue);
		addr = FLASH_ProgramdoubleByte(addr,input.channel[i].usMaxValue);
	}
	flashencour = 0;

}

void save_phase(u8 phase) // taille : (2 x NUM_INPUT) + (4 x NUM_MIXER) + (3 x NUM_OUTPUT) + SECUMOTEUR_LENGTH (96)
{
	u8 i = 0;
	u8 j = 0;
	s8 temp;
	
	u32 addr = BASE_EEPROM + MODEL_ACTUEL_LENGTH + 1;
	
	addr = addr + INPUT_LENGTH  + (((NUM_PHASE * PHASE_LENGTH) + INPUT_LENGTH ) * modele_actuel);
	
	addr = addr + ( PHASE_LENGTH * phase );
	
	flashencour = 1;
	//write data to eeprom
	FLASH_DeInit();
	/*Define FLASH programming time*/
	FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
	/* Unlock Data memory */
	FLASH_Unlock(FLASH_MEMTYPE_DATA);
	
	
	//input
	for(i = 0; i < NUM_INPUT; i++)
	{
		//expo
		for(j = 0; j < 2;j++)
		{
			FLASH_ProgramByte(addr, input.channel[i].expo[j]);
			addr ++;
		}
	}
	
	//mixer
	for(i = 0; i < NUM_MIXER; i++)
	{
		FLASH_ProgramByte(addr,mixer[i].in);
		addr ++;
		FLASH_ProgramByte(addr,mixer[i].out);
		addr ++;
		FLASH_ProgramByte(addr,mixer[i].pente[0]);
		addr ++;
		FLASH_ProgramByte(addr,mixer[i].pente[1]);
		addr ++;
	}
	
	//output
	
	
	for(i = 0; i < NUM_OUTPUT; i++)
	{
		
		FLASH_ProgramByte(addr,output.dr[i]);		
		addr++;
		temp = sortiepourcent(output.usMinValue[i]);
		FLASH_ProgramByte(addr,temp);
		addr ++;
		temp = sortiepourcent(output.usNeutralValue[i]);
		FLASH_ProgramByte(addr,temp);
		addr ++;
		temp = sortiepourcent(output.usMaxValue[i]);
		FLASH_ProgramByte(addr,temp);
		addr ++;

	}
	
	FLASH_ProgramByte(addr,output.secumoteur);
	addr ++;
	FLASH_ProgramByte(addr,ratiobat);
	
	flashencour = 0;
}

void settrimdyn(void)
{
	u8 i;

	for(i = 0; i < NUM_MIXER ; i++)
	{
		u8 in = mixer[i].in;
		u8 out = mixer[i].out;
		
		if ((out < NUM_OUTPUT) && (in < 4)) // trim dynamique que sur les sorties pilotées par les manches
		{
			if (out != output.secumoteur) output.usNeutralValue[out] = trimmem[out]; // et pas la voie moteur
		}
		bip(1,0,0,0,0);
	}
}

void memtrimdyn(void)
{
	u8 i;

	for(i = 0; i < NUM_OUTPUT; i++)
	{
		trimmem[i] = output.usValueOut[i];
	}
	trimdyn = 1;
	tempotrimdyn = 12; // lance le decompte
	bip(2,0,0,0,0);
}

void etalonnage(void) // taille : 6 x NUM_INPUT
{
	u8 i;
	u16 count = 0;
	u16 min[NUM_INPUT];
	u16 neutral[NUM_INPUT];
	u16 max[NUM_INPUT];
	
	//init neutral value
	flashencour = 1;

	bas = 0;
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,1,"Manches a zero\n",0);
	LCD_printtruc(2,1,"Appuyer bas\n",0);
	LCD_DISP_ON();
	Delayms(800);
	bip(1,0,0,0,0);
	
	while(!bas) 	bas = GPIO_ReadInputPin(GPIOC,GPIO_PIN_1);

	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,1,"Mesures zero\n",0);
	LCD_printtruc(2,1,"en cour\n",0);
	LCD_DISP_ON();
	Menu_raz = 1;
	
	if(synchro)
	{
		ADC1_StartConversion();
		while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == 0)
		{	
		}
	}
	
	for(i = 0; i < NUM_INPUT; i++)
	{
		neutral[i] = ADC1_GetBufferValue(i);
	}
	ADC1_ClearFlag(ADC1_FLAG_EOC);

	
	count = 100;
	while (count != 0)
	{
		if(synchro)
		{
			count--;
			synchro = 0;
			ADC1_StartConversion();
			while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == 0)
			{	
			}
			
			for(i = 0; i < NUM_INPUT; i++)
			{
				neutral[i] = (neutral[i] + ADC1_GetBufferValue(i)) / 2;
			}			

			ADC1_ClearFlag(ADC1_FLAG_EOC);
		}
	}
	
	Menu_raz = 1;
	bas = 0;
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,1,"Manches au max\n",0);
	LCD_printtruc(2,1,"min, appuyer bas\n",0);
	LCD_DISP_ON();
	Menu_raz = 1;
	bip(1,0,0,0,0);
	while(!bas) 	bas = GPIO_ReadInputPin(GPIOC,GPIO_PIN_1);
	bas = 0;
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,1,"Mesures max/min\n",0);
	LCD_printtruc(2,1,"en cour\n",0);
	LCD_DISP_ON();

	for(i = 0; i < NUM_INPUT; i++)
	{
		min[i] = neutral[i];
		max[i] = neutral[i];
	}
	
	count = 1000;
	while (count != 0)
	{
		if(synchro)
		{
			u16 val[6];
			count--;
			synchro = 0;
			ADC1_StartConversion();
			while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == 0)
			{
			}
			Menu_raz = 1;

			for(i = 0; i < NUM_INPUT; i++)
			{
				val[i] = ADC1_GetBufferValue(i);
			}

			for(i = 0; i < NUM_INPUT; i++)
			{
				if(val[i] < min[i])
				{
					min[i] = val[i];
				}
				if(val[i] > max[i])
				{
					max[i] = val[i];
				}
			}
			
			
			ADC1_ClearFlag(ADC1_FLAG_EOC);
		}
	}
	
	LCD_printtruc(2,1,"Enregistrement...\n",0);
	Menu_raz = 1;
	bip(1,2,1,0,0);
	Delayms(500);
	
	//write data to eeprom
	FLASH_DeInit();
	/*Define FLASH programming time*/
	FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
	/* Unlock Data memory */
	FLASH_Unlock(FLASH_MEMTYPE_DATA);
	
	{
		u32 addr = BASE_EEPROM + MODEL_ACTUEL_LENGTH + 1;
		
		addr = addr + (((NUM_PHASE * PHASE_LENGTH) + INPUT_LENGTH ) * modele_actuel);

		for(i = 0; i < NUM_INPUT; i++)
		{
			addr = FLASH_ProgramdoubleByte(addr,min[i]);
			addr = FLASH_ProgramdoubleByte(addr,neutral[i]);
			addr = FLASH_ProgramdoubleByte(addr,max[i]);
		}
	}

	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,1,"Enregistre\n",0);
	LCD_printtruc(2,1,"Appuyer haut\n",0);
	LCD_DISP_ON();
	
	Menu_raz = 1;
	
	while(!haut) 	haut = GPIO_ReadInputPin(GPIOG,GPIO_PIN_1);
	Tempo_menu = 14;
	Delayms(500);
	load_input(phase_actuelle);

}

void captureADC(void)
{
	u8 i;
	u16 value;
	u16 delta;
	
	ADC1_StartConversion();
	
	while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == 0)
	{
	}

	for(i = 0; i < NUM_INPUT; i++)
	{
		value = ADC1_GetBufferValue(i);
		
		if(value  < input.channel[i].usMinValue)
		{
			value = input.channel[i].usMinValue;
		}
		if(value  > input.channel[i].usMaxValue)
		{
			value = input.channel[i].usMaxValue;
		}
		
		if(value  < input.channel[i].usNeutralValue)
		{
			delta = value - input.channel[i].usMinValue;
			value = (delta * input.channel[i].pente[0]) / 256;
		}
		else
		{
			delta = value - input.channel[i].usNeutralValue;
			value = 1000 + ((delta * input.channel[i].pente[1]) / 256);
		}
		
		input.channel[i].usValue = value;
	}

	ADC1_ClearFlag(ADC1_FLAG_EOC);
}

// expo only for plus values: x: 0..1000, exp: 1..99
static s16 expou(u16 x, u8 exp)
{
	// (x*x/1000*x*exp/1000+x*(100-exp)+50)/100
	return (s16)(((u32)x * x / 1000 * x * exp / 1000
	+ (u32)x * (u8)(100 - exp) + 50) / 100);
}

// apply expo: inval: -1000..1000, exp: -99..99
static s16 expo(s16 inval, u8 i)
{
	u8  neg;
	s16 val;
	s8 exp;
	
	if ((input.channel[i].expo[0] == 0) && (input.channel[i].expo[1] == 0))    return inval;	// no expo
	if (inval == 0)  return inval;	// 0 don't change

	neg = (u8)(inval < 0 ? 1 : 0);
	
	if (neg) {
		inval = -inval;
		exp = input.channel[i].expo[0];
	}
	else {
		exp = input.channel[i].expo[1];
	}
	if (exp > 0)  val = expou(inval,exp);
	else          val = 1000 - expou(1000 - inval,-exp);

	return  neg ? -val : val;
}

void lectureswitch(void)
{
	
	// TRIM DYNAMIQUE
	if (GPIO_ReadInputPin(GPIOD,GPIO_PIN_7)) memtrimdyn();;

	// SECUMOTEUR
	secumot = !GPIO_ReadInputPin(GPIOE,GPIO_PIN_0);
	
	// PHASE
	if (GPIO_ReadInputPin(GPIOE,GPIO_PIN_1))
	{
		if (phase_actuelle == 0) phase_change = 1;
		phase_actuelle = 1;
	}
	else 
	{
		if (phase_actuelle == 1) phase_change = 1;
		phase_actuelle = 0;
	}	
	// DUALRATE
	outputdr = GPIO_ReadInputPin(GPIOE,GPIO_PIN_2);
	
	// EXPO
	expon = (GPIO_ReadInputPin(GPIOE,GPIO_PIN_3));
	
	// TOR1
	tor1plus = GPIO_ReadInputPin(GPIOA,GPIO_PIN_3);
	tor1moins = GPIO_ReadInputPin(GPIOA,GPIO_PIN_4);
	
	// TOR2
	tor2plus = GPIO_ReadInputPin(GPIOA,GPIO_PIN_5);
	tor2moins = GPIO_ReadInputPin(GPIOA,GPIO_PIN_6);

}

void lecturetrim(void)
{
	if (trimflag)
	{
		trim1plus = GPIO_ReadInputPin(GPIOD,GPIO_PIN_5);
		trim2plus = GPIO_ReadInputPin(GPIOD,GPIO_PIN_6);
		trim3plus = GPIO_ReadInputPin(GPIOE,GPIO_PIN_6);
		trim4plus = GPIO_ReadInputPin(GPIOE,GPIO_PIN_7);
		GPIO_WriteLow(GPIOD, GPIO_PIN_0); // led on trim+ off
		GPIO_WriteHigh(GPIOD, GPIO_PIN_2); // trim- on
	}
	else
	{
		trim1moins = GPIO_ReadInputPin(GPIOD,GPIO_PIN_5);
		trim2moins = GPIO_ReadInputPin(GPIOD,GPIO_PIN_6);
		trim3moins = GPIO_ReadInputPin(GPIOE,GPIO_PIN_6);
		trim4moins = GPIO_ReadInputPin(GPIOE,GPIO_PIN_7);
		GPIO_WriteHigh(GPIOD, GPIO_PIN_0); // led on trim+ on
		GPIO_WriteLow(GPIOD, GPIO_PIN_2); // trim- off
	}
	trimflag = !trimflag;
	
	if (trim1plus || trim2plus || trim3plus || trim4plus || trim1moins || trim2moins || trim3moins || trim4moins) bip(0,0,0,0,1);
}

void duree(void)
{
	static u16 debut;
	static u16 fin;
	static u16 temps;
	debut =  TIM3_GetCounter();  


	// fonction a mesurer
	//lectureswitch();

	fin = TIM3_GetCounter();
	if (fin > debut)
	{
		temps =(fin - debut) * 32;
		LCD_printtruc(1,9,"%i\n",temps);
		LCD_printtruc(2,10,"%i\n",channel);
	}
}

s16 entreswitch(u8 i,u8 in)
{ 
	s16 val;
	
	val = 0;
	
	if (in == NUM_INPUT)
	{
		if (tor1moins) val = mixer[i].pente[0] * (-10);
		if (tor1plus) val = mixer[i].pente[1] * 10;
	}
	if (in == (NUM_INPUT + 1))
	{
		if (tor2moins) val = mixer[i].pente[0] * (-10);
		if (tor2plus) val = mixer[i].pente[1] * 10;
	}
	return val;
}

void compute_expo(void)
{	
	u8 i;
	s16 val16;

	for(i =0 ; i < NUM_INPUT; i++)
	{
		
		val16 = input.channel[i].usValue - 1000;
		
		input.channel[i].usValue = expo(val16,i) + 1000; 
	}
}

void compute_mixer(void)
{
	u8 i = 0;
	static _Bool sens = 1;
	static s16 wave = 0;
	s32 delta32;
	
	// voie test
	if (sens) wave+=10; else wave-=10;
	if (wave < (-999)) sens = !sens;
	if (wave > 999) sens = !sens;
	
	for(i = 0; i < NUM_OUTPUT ; i++)
	{
		output.sValue[i] = 0;
	}
	
	for(i = 0; i < NUM_MIXER ; i++)
	{
		u8 in = mixer[i].in;
		u8 out = mixer[i].out;
		
		if (out < NUM_OUTPUT)
		{
			if(in < NUM_INPUT)
			{
				if(input.channel[in].usValue < 1000)
				{
					delta32 = 1000 - input.channel[in].usValue;
					delta32 *= mixer[i].pente[0];
					delta32 /= 100;
					if ((trimdyn) && (out != output.secumoteur) && (in < 4)) delta32 /= ratiotrimdyn;
					output.sValue[out] -= delta32; 
				}
				else
				{
					delta32 = input.channel[in].usValue - 1000;
					delta32 *= mixer[i].pente[1];
					delta32 /= 100;
					if ((trimdyn) && (out != output.secumoteur) && (in < 4)) delta32 /= ratiotrimdyn;
					output.sValue[out] += delta32;
				}
			}
			
			if((in > (NUM_INPUT - 1)) && (in < (NUM_INPUT + NUM_INPUT_SWITCH))) // Switchs
			{
				output.sValue[out] += entreswitch(i,in);
			}

			if(in == (NUM_INPUT + NUM_INPUT_SWITCH)) // Voie test
			{
				delta32 = wave;

				if (wave > 0)
				{
					delta32 *= mixer[i].pente[0];
					delta32 /= 100;
				} 
				else
				{
					delta32 *= mixer[i].pente[1];
					delta32 /= 100;
				}
				
				output.sValue[out] += delta32;
			}
		}			
	}
}

void compute_trim(void)
{
	u8 i = 0;

	for(i = 0; i < NUM_MIXER ; i++)
	{
		u8 in = mixer[i].in;
		u8 out = mixer[i].out;
		
		if (out < NUM_OUTPUT)
		{
			if(in == 0)
			{
				if (trim1plus) output.usNeutralValue[out] += trimstep;
				if (trim1moins) output.usNeutralValue[out] -= trimstep;
				trim1plus = trim1moins = 0;
			}
			if(in == 1)
			{
				if (trim2plus) output.usNeutralValue[out] += trimstep;
				if (trim2moins) output.usNeutralValue[out] -= trimstep;
				trim2plus = trim2moins = 0;
			}
			if(in == 2)
			{
				if (trim3plus) output.usNeutralValue[out] += trimstep;
				if (trim3moins) output.usNeutralValue[out] -= trimstep;
				trim3plus = trim3moins = 0;
			}
			if(in == 3)
			{
				if (trim4plus) output.usNeutralValue[out] += trimstep;
				if (trim4moins) output.usNeutralValue[out] -= trimstep;
				trim4plus = trim4moins = 0;
			}
		}
	}
}

void scale_output(void)
{ 
	s16 val;
	u8 i = 0;
	s32 drtemp;
	
	output.usValueOut[NUM_OUTPUT] = LONGUEUR_TRAME;
	
	for(i = 0; i < NUM_OUTPUT ; i++)
	{
		
		if (outputdr) //outputdr
		{
			drtemp = output.dr[i];
			drtemp *= output.sValue[i];
			drtemp /= 100;
			output.sValue[i] = drtemp;
		}

		val = output.sValue[i] + output.usNeutralValue[i];
		
		if(val < output.usMinValue[i])
		{
			val = output.usMinValue[i];
		}
		if(val > output.usMaxValue[i])
		{
			val = output.usMaxValue[i];
		}
		
		if ((secumot) && (i == output.secumoteur)) 	output.usValueOut[i] = output.usMinValue[i];
		else output.usValueOut[i] = val;
		
		output.usValueOut[NUM_OUTPUT] = output.usValueOut[NUM_OUTPUT] - output.usValueOut[i];
		
		barout[i] = nivbar(output.usValueOut[i]); //calcul pour affichage pendant le vol
		
	}
}

void initialise(void)
{
	//Horloge quartz
	CLK_DeInit();
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
	CLK_ClockSecuritySystemEnable();

	// init gpio  PD3 sortie tim2 + PD0 led run + trim electroniques
	GPIO_DeInit(GPIOD);
	GPIO_Init(GPIOD, (GPIO_PIN_3 ), GPIO_MODE_OUT_PP_LOW_SLOW); // tim2 ppm
	GPIO_Init(GPIOD, (GPIO_PIN_4 ), GPIO_MODE_OUT_PP_LOW_SLOW); // bip
	GPIO_Init(GPIOD, (GPIO_PIN_0 ), GPIO_MODE_OUT_PP_LOW_SLOW); // led run - trim +
	GPIO_Init(GPIOD, (GPIO_PIN_2 ), GPIO_MODE_OUT_PP_LOW_SLOW); // trim -
	GPIO_Init(GPIOD, (GPIO_PIN_5 ), GPIO_MODE_IN_FL_NO_IT); // Trim manche 1
	GPIO_Init(GPIOD, (GPIO_PIN_6 ), GPIO_MODE_IN_FL_NO_IT); // Trim manche 2

	//init lcd gpio
	GPIO_DeInit(LCDPort);
	GPIO_DeInit(LCDControlPort);
	GPIO_Init(LCDPort, GPIO_PIN_HNIB, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LCDControlPort, LCD_RS, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LCDControlPort, LCD_Enable, GPIO_MODE_OUT_PP_LOW_FAST);
	
	/*  Init GPIO pour les touches et switchs*/
	GPIO_DeInit(GPIOE);
	GPIO_DeInit(GPIOG);
	GPIO_DeInit(GPIOA);
	//BAS
	GPIO_Init(GPIOC,GPIO_PIN_1,GPIO_MODE_IN_FL_NO_IT);
	// SECUMOTEUR PHASE DUALRATE EXPO DROITE  et trim manches 3 et 4
	GPIO_Init(GPIOE,GPIO_PIN_ALL,GPIO_MODE_IN_FL_NO_IT);
	//GAUCHE (0) ET HAUT (1)
	GPIO_Init(GPIOG,(GPIO_PIN_0 |GPIO_PIN_1),GPIO_MODE_IN_FL_NO_IT);
	// TOR1 ET TOR2 (PLUS ET MOINS)
	GPIO_Init(GPIOA,GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6,GPIO_MODE_IN_FL_NO_IT);
	
	
	/*  Init GPIO pour ADC1 */
	GPIO_DeInit(GPIOB);
	GPIO_Init(GPIOB,GPIO_PIN_ALL,GPIO_MODE_IN_FL_NO_IT);
	
	//Bip off
	GPIO_WriteHigh(GPIOD,GPIO_PIN_4);

	
	/* LCD chargement table de caracteres*/
	LCD_INIT();
	LCD_CMD(CGRAM_address_start);
	LCD_LOAD_CGRAM(cur,8);

	/* adc 6 voies + batterie */
	ADC1_DeInit();
	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE,
	ADC1_CHANNEL_6,
	ADC1_PRESSEL_FCPU_D2,
	ADC1_EXTTRIG_TIM,
	DISABLE,
	ADC1_ALIGN_RIGHT,
	ADC1_SCHMITTTRIG_CHANNEL0|ADC1_SCHMITTTRIG_CHANNEL1|ADC1_SCHMITTTRIG_CHANNEL2|ADC1_SCHMITTTRIG_CHANNEL3|
ADC1_SCHMITTTRIG_CHANNEL4|ADC1_SCHMITTTRIG_CHANNEL5|ADC1_SCHMITTTRIG_CHANNEL6 ,
	DISABLE);
	ADC1_ScanModeCmd(ENABLE);
	ADC1_DataBufferCmd(ENABLE);
	
	//Horloge clavier affichage
	TIM3_DeInit();
	TIM3_TimeBaseInit(TIM3_PRESCALER_512,6249); // 0.2 Seconde
	TIM3_ITConfig(TIM3_IT_UPDATE, ENABLE);

	//Generateur ppm
	TIM2_DeInit();
	TIM2_TimeBaseInit(TIM2_PRESCALER_8, LONGUEUR_TRAME); //22.50ms
	TIM2_ARRPreloadConfig(DISABLE);
	TIM2_PrescalerConfig(TIM2_PRESCALER_8, TIM2_PSCRELOADMODE_IMMEDIATE);
	TIM2_OC2Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,LONGUEUR_PULSE,TIM2_OCPOLARITY_LOW);//0.3ms
	TIM2_OC2PreloadConfig(DISABLE);
	TIM2_SetCounter(0);
	TIM2_ITConfig(TIM2_IT_CC2 + TIM2_IT_UPDATE, ENABLE);
	
}

void calcultrame(void) // Boucle principale irq14
{
	channel = 0xff;
	captureADC();
	lectureswitch();
	if (expon) compute_expo();
	compute_mixer();
	compute_trim();
	if (!flashencour) scale_output();
	if (phase_change)
	{
		load_phase(phase_actuelle);
		if (Menu_actif == 1) Menu();
	}
	channel = 0;
}

void main(void)
{
	initialise();
	
	TIM3_Cmd(ENABLE);
	
	modele_actuel = FLASH_ReadByte(BASE_EEPROM);
	
	load_input(modele_actuel);
	lectureswitch();
	load_phase(phase_actuelle);
	
	LCD_printtruc(1,3,"Modele : %d",modele_actuel);
	LCD_printtruc(2,4,"Phase : %d",phase_actuelle);

	Delayms(1000);
	LCD_CLEAR_DISPLAY();
	
	synchro = 0;
	channel = 0;
	calcultrame();
	TIM2_SetAutoreload(output.usValueOut[0]);
	TIM2_Cmd(ENABLE);	
	
	enableInterrupts();
	
	GPIO_WriteLow(GPIOD, GPIO_PIN_0); // led on trim+ off
	GPIO_WriteHigh(GPIOD, GPIO_PIN_2); // trim- on
	trimflag = 0;

	while (1)
	{

		if (channel != 0xff)
		{	

			// menu
			if (Menu_on)	
			{
				//BAS
				bas = GPIO_ReadInputPin(GPIOC,GPIO_PIN_1);
				//DROITE
				droite = GPIO_ReadInputPin(GPIOE,GPIO_PIN_5);
				//GAUCHE
				gauche = GPIO_ReadInputPin(GPIOG,GPIO_PIN_0);
				//HAUT
				haut = GPIO_ReadInputPin(GPIOG,GPIO_PIN_1);
				
				lecturetrim();
				
				Menu_on = 0;
				
				if (((bas || gauche || droite || menudyn) && Menu_actif) || haut)
				{				
					if (menudyn) menudyn = 0;
					Menu_actif = Menu_raz = 1;
					Menu();
				}	
			}

			// baragraphe, etc
			if ((sec) && (Menu_actif == 0) && (channel == 0))	
			{
				chronobat();
				info();
				sec = 0;
				if (bas) razchrono();
				if (gauche) razchronobat();
				if (droite) biponoff();
			}
			
			
		}
	}
	
}

#ifdef USE_FULL_ASSERT

/**
* @brief  Reports the name of the source file and the source line number
* where the assert_param error has occurred.
* @param file: pointer to the source file name
* @param line: assert_param error line source number
* @retval 
* None
*/
void assert_failed(u8* file, u32 line)
{ 
	/* User can add his own implementation to report the file name and line number,
	ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
	LCD_printtruc(1,1,"file %s \n",file);
	LCD_printtruc(1,1,"line %d\r\n",line));

	/* Infinite loop */
	while (1)
	{

	}
}
#endif



/******************* fin *****END OF FILE****/
