/* Bracame RC TX */
/* */
/* Ajout de trims electroniques pour fonctionnement avec nouveaux manches (hitec aurora 9)*/
/* */
/* Ajout dans utilitaire : visualisation des entr�es sorties et potars */
/* */
/* Ajout de la gestion du retour au neutre pour trimdyn */
/* */
/* Un seul etalonnage des manches pour tous les modeles : 5 possibles maintenant (petite modif), ajout r�glage tempo du menu*/
/* */
/* Multiplexage des switchs secumoteur, phase, expo et dr liberation des entr�es i2c pour ise en place d'une 24C256*/
/* */
/* */
/* */


#include "stm8s.h"
#include "tx.h"
#include "Delay.h"
#include "hd44780.h"
#include "menu.h"

extern _Bool Menu_on;
extern _Bool sec;
extern _Bool Menu_actif;
extern _Bool popup;
extern _Bool Menu_raz;
extern _Bool synchro;
extern u8 Tempo_menu;
extern u8 jeton;
extern u8 channel;

u8 modele_actuel;
u8 phase_actuelle = 0;
_Bool phase_change = 0;
_Bool phase_changemenu = 0;
u8 nom_modele[10] = "        \n";



_Bool trimdyn = 0; // Li� a PD7
_Bool switchdr = 0; // PE2
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
volatile _Bool flashencour = 0;
_Bool menudyn = 0;
_Bool switchinfo = 0;
_Bool haut = 0; // PG1
_Bool bas = 0; // PC1
_Bool gauche = 0; // PG0
_Bool droite = 0; // PE5

_Bool trim0plus = 0;
_Bool trim0moins = 0;
_Bool trim1plus = 0;
_Bool trim1moins = 0;
_Bool trim2plus = 0;
_Bool trim2moins = 0;
_Bool trim3plus = 0;
_Bool trim3moins = 0;
_Bool trimflag;
_Bool trimchange = 0;
u8 trimstep = 2;

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
u8 temptrimdyn = 20;
u8 tempsmenu = 10;
_Bool trimdynencour = 0;
_Bool manche0neutre = 0;
_Bool manche1neutre = 0;
_Bool manche2neutre = 0;
_Bool manche3neutre = 0;
_Bool trimdynmanche0 = 0;
_Bool trimdynmanche1 = 0;
_Bool trimdynmanche2 = 0;
_Bool trimdynmanche3 = 0;

u8 tempsbip1 = 0;
u8 tempsbip2 = 0;
u8 tempsbip3 = 0;
u8 tempsbip4 = 0;
u8 tempsbip5 = 0;
_Bool bipon = 1;

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
	popup = 1;
	Tempo_menu = 8;

	bipon = !bipon;
	switchinfo = 1;
	if (bipon)
	{
		LCD_printtruc(1,6,"Bip On",0);
		bip(2,1,1,0,0);
	}
	else
	{
		LCD_printtruc(1,6,"Bip Off",0);
	}
	
	LCD_DISP_ON();
}

void razchrono(void)
{
	minutes = secondes = 0;
	chargeeaccus = 9999;

	bip(2,1,2,0,0);
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
	u16 temp; static _Bool c = 0; static _Bool q = 0; static _Bool t = 0;
	static _Bool d = 0;

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
		if((temp == 50) && (c == 0)) {bip(3,0,3,0,0); c = 1;}
		if ((temp == 40) && (q == 0)) {bip(6,0,6,0,0); q = 1;}
		if ((temp == 30) && (t == 0)) {bip(12,1,12,1,12); t = 1;}
		if ((temp == 20) && (d == 0)) {bip(12,2,36,1,36); d = 1;}
	}
}

s8 sortiepourcent(u16 sortie) // Valeurs des temps en %
{	
	s16 a ;
	a= (sortie - NEUTRE_COURSE);
	a=a/10;
	return a;
}

u16 pourcentsortie(s8 pourcent) // % en temps
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

void prepareflash(void)
{
	//write data to eeprom
	FLASH_DeInit();
	/*Define FLASH programming time*/
	FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
	/* Unlock Data memory */
	FLASH_Unlock(FLASH_MEMTYPE_DATA);	
}

u32 FLASH_ProgramdoubleByte(u32 add,u16 val)
{
	u8 tval;
	
	tval = val & 0xff;
	FLASH_ProgramByte(add, tval);
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
		input.channel[i].expo[0] = 0;
		input.channel[i].expo[1] = 0;
	}
	
	//mixer 
	for(i = 0; i < NUM_MIXER; i++)
	{
		mixer[i].in = 0xFF;
		mixer[i].out = 0xFF;
		mixer[i].pente[0] = 0;
		mixer[i].pente[1] = 0;
	}

	//output
	
	output.usValueOut[NUM_OUTPUT] =  LONGUEUR_TRAME; //22.5 ms
	
	for(i = 0; i < (NUM_INPUT + NUM_INPUT_SWITCH) ; i++)
	{
		output.dr[i] = 100;
	}
	
	
	for(i = 0; i < NUM_OUTPUT ; i++)
	{
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

void reset_neutre(void)
{
	u8 i;
	
	//output
	
	for(i = 0; i < NUM_OUTPUT ; i++)
	{
		output.usNeutralValue[i] = NEUTRE_COURSE;
	}
	
}

void load_input(void) // taille : (6 x NUM_INPUT) (36) INPUT_LENGTH
{
	u8 i = 0;
	u16 delta2;
	
	u32 addr = BASE_EEPROM + MODEL_ACTUEL_LENGTH + 1;
	
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
	u8 mix;
	
	u32 addr = BASE_EEPROM + MODEL_ACTUEL_LENGTH + 1;
	
	addr = addr + INPUT_LENGTH  + ((NUM_PHASE * PHASE_LENGTH) * modele_actuel);
	
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
		mix = FLASH_ReadByte(addr);
		mix = (mix >> 4);
		mix = mix & 0xF;
		if (mix == 0xF) mixer[i].in = 255; else mixer[i].in = mix;
		mix = FLASH_ReadByte(addr);
		mix = mix & 0xF;
		if (mix == 0xF) mixer[i].out = 255; else mixer[i].out = mix;

		addr++;
		mixer[i].pente[0] = FLASH_ReadByte(addr);
		addr++;
		mixer[i].pente[1] = FLASH_ReadByte(addr);
		addr++;		
	}
	
	//output
	
	for(i = 0; i < (NUM_INPUT + NUM_INPUT_SWITCH) ; i++)
	{
		output.dr[i] = FLASH_ReadByte(addr);
		addr++;
	}

	for(i = 0; i < NUM_OUTPUT; i++)
	{
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

void save_phase(u8 modele,u8 phase) // taille : (2 x NUM_INPUT) + (3 x NUM_MIXER) + (NUM_INPUT + NUM_INPUT_SWITCH) + (3 x NUM_OUTPUT) + SECUMOTEUR_LENGTH (94) PHASE_LENGTH
{
	u8 i = 0;
	u8 j = 0;
	s8 temp;
	u8 mix;
	
	u32 addr = BASE_EEPROM + MODEL_ACTUEL_LENGTH + 1;
	
	addr = addr + INPUT_LENGTH  + ((NUM_PHASE * PHASE_LENGTH) * modele);
	
	addr = addr + ( PHASE_LENGTH * phase );
	
	flashencour = 1;

	prepareflash();
	
	//input
	for(i = 0; i < NUM_INPUT; i++)
	{
		//expo
		for(j = 0; j < 2;j++)
		{
			temp = input.channel[i].expo[j];
			FLASH_ProgramByte(addr, temp);
			addr ++;
		}
	}
	
	//mixer
	for(i = 0; i < NUM_MIXER; i++)
	{
		if (mixer[i].in == 255) mix = 0xF; else mix = mixer[i].in;
		mix = (mix << 4);
		if (mixer[i].out == 255) mix+= 0xF; else mix+= mixer[i].out;
		FLASH_ProgramByte(addr,mix);

		
		addr ++;
		temp = mixer[i].pente[0];
		FLASH_ProgramByte(addr,temp);
		addr ++;
		temp = mixer[i].pente[1];
		FLASH_ProgramByte(addr,temp);
		addr ++;
	}
	
	//output
	
	for(i = 0; i < (NUM_INPUT + NUM_INPUT_SWITCH) ; i++)
	{
		mix = output.dr[i];
		FLASH_ProgramByte(addr,mix);		
		addr++;
	}

	
	for(i = 0; i < NUM_OUTPUT; i++)
	{
		
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
	
	mix = output.secumoteur;
	FLASH_ProgramByte(addr,mix);
	addr ++;
	FLASH_ProgramByte(addr,ratiobat);
	
	FLASH_Lock(FLASH_MEMTYPE_DATA);	
	flashencour = 0;
}

void save_neutre(u8 phase) // Sauve les neutre si modifi�s (trimchange)
{
	u8 i = 0;
	s8 temp;
	
	u32 addr = BASE_EEPROM + MODEL_ACTUEL_LENGTH + 1;
	
	addr = addr + INPUT_LENGTH  + ((NUM_PHASE * PHASE_LENGTH) * modele_actuel);
	
	addr = addr + ( PHASE_LENGTH * phase );
	
	addr = addr + (2 * NUM_INPUT) + (3 * NUM_MIXER) + (NUM_INPUT + NUM_INPUT_SWITCH);
	
	flashencour = 1;

	prepareflash();

	
	for(i = 0; i < NUM_OUTPUT; i++)
	{
		
		addr++;
		temp = sortiepourcent(output.usNeutralValue[i]);
		FLASH_ProgramByte(addr,temp);
		addr++;
		addr++;

	}
	FLASH_Lock(FLASH_MEMTYPE_DATA);	
	
	flashencour = 0;
}

void changeratiotrimdyn(void)
{
	if (ratiotrimdyn < 4) ratiotrimdyn++;
	else ratiotrimdyn = 1;

	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	Menu_actif = 1;
	popup = 1;
	Tempo_menu = 8;
	switchinfo = 1;


	LCD_printtruc(1,2,"Ratio trimdyn",0);
	LCD_printtruc(2,6," ~ %u\n",ratiotrimdyn);
	LCD_DISP_ON();
	
	bip(1,1,0,1,0);

}

void settrimdyn(void) // Applique les trims dynamiques
{
	u8 i;

	for(i = 0; i < NUM_MIXER ; i++)
	{
		u8 in = mixer[i].in;
		u8 out = mixer[i].out;
		
		if ((out < NUM_OUTPUT) && (in < 4)) // trim dynamique que sur les sorties pilot�es par les manches
		{
			if (out != output.secumoteur) output.usNeutralValue[out] = trimmem[out]; // et pas la voie moteur
		}
		trimdynencour = trimdynmanche0 = trimdynmanche1 = trimdynmanche2 = trimdynmanche3 = 1; // recherches des neutres
		trimdyn = 0;
		trimchange = 1; // Sauvegarde des nouveaux neutres
	}
}

void memtrimdyn(void) // Active la memorisation des valeurs des sorties si appuis sur bouton trimdyn (dans compute_mixer)
{

	trimdyn = 1;
	tempotrimdyn = temptrimdyn; // Charge la tempo

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
	
	prepareflash();	
	{
		u32 addr = BASE_EEPROM + MODEL_ACTUEL_LENGTH + 1;
		
		addr = addr + ((NUM_PHASE * PHASE_LENGTH) * modele_actuel);

		for(i = 0; i < NUM_INPUT; i++)
		{
			addr = FLASH_ProgramdoubleByte(addr,min[i]);
			addr = FLASH_ProgramdoubleByte(addr,neutral[i]);
			addr = FLASH_ProgramdoubleByte(addr,max[i]);
		}
	}
	FLASH_Lock(FLASH_MEMTYPE_DATA);	


	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,1,"Enregistre\n",0);
	LCD_printtruc(2,1,"Appuyer haut\n",0);
	LCD_DISP_ON();
	
	Menu_raz = 1;
	
	while(!haut) 	haut = GPIO_ReadInputPin(GPIOG,GPIO_PIN_1);
	Tempo_menu = 14;
	Delayms(500);
	load_input();

}

static s16 expou(u16 x, u8 exp) // expo only for plus values: x: 0..1000, exp: 1..99
{
	// (x*x/1000*x*exp/1000+x*(100-exp)+50)/100
	return (s16)(((u32)x * x / 1000 * x * exp / 1000
	+ (u32)x * (u8)(100 - exp) + 50) / 100);
}

static s16 expo(s16 inval, u8 i) // apply expo: inval: -1000..1000, exp: -99..99
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

void duree(void) // pour debugger optimiser
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
	s32 drtemp;
	
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
	
	if (switchdr) 
	{
		
		drtemp = val;
		drtemp *= output.dr[in];
		drtemp /= 100;
		val = drtemp;
	}
	
	return val;
}

void lectureswitchmultiplex(void)
{
	if (trimflag)
	{
		// TRIM PLUS
		trim0plus = GPIO_ReadInputPin(GPIOD,GPIO_PIN_6);
		trim1plus = GPIO_ReadInputPin(GPIOD,GPIO_PIN_5);
		trim2plus = GPIO_ReadInputPin(GPIOE,GPIO_PIN_7);
		trim3plus = GPIO_ReadInputPin(GPIOE,GPIO_PIN_6);
		// SECUMOTEUR
		secumot = !GPIO_ReadInputPin(GPIOE,GPIO_PIN_0);
		// DUALRATE
		switchdr = GPIO_ReadInputPin(GPIOE,GPIO_PIN_3);
		GPIO_WriteLow(GPIOD, GPIO_PIN_0); // led on trim+ off
		GPIO_WriteHigh(GPIOD, GPIO_PIN_2); // trim- on
	}
	else
	{
		// TRIMS MOINS
		trim0moins = GPIO_ReadInputPin(GPIOD,GPIO_PIN_6);
		trim1moins = GPIO_ReadInputPin(GPIOD,GPIO_PIN_5);
		trim2moins = GPIO_ReadInputPin(GPIOE,GPIO_PIN_7);
		trim3moins = GPIO_ReadInputPin(GPIOE,GPIO_PIN_6);
		// PHASE
		if (GPIO_ReadInputPin(GPIOE,GPIO_PIN_0))
		{
			if (phase_actuelle == 0) phase_change = 1;
			phase_actuelle = 1;
		}
		else 
		{
			if (phase_actuelle == 1) phase_change = 1;
			phase_actuelle = 0;
		}	
		
		if (phase_change) phase_changemenu = 1;
		
		// EXPO
		expon = (GPIO_ReadInputPin(GPIOE,GPIO_PIN_3));
		
		GPIO_WriteHigh(GPIOD, GPIO_PIN_0); // led on trim+ on
		GPIO_WriteLow(GPIOD, GPIO_PIN_2); // trim- off
	}
	trimflag = !trimflag;
	
	if (trim0plus || trim1plus || trim2plus || trim3plus || trim0moins || trim1moins || trim2moins || trim3moins)
	{
		bip(1,0,0,0,0);
		trimchange = 1;
	}
}

void captureADC(void)
{
	u8 i;
	s16 value;
	u32 delta;
	
	ADC1_StartConversion();
	
	manche0neutre = manche1neutre = manche2neutre = manche3neutre = 0;

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
			delta = input.channel[i].usNeutralValue - value;
			value = -((delta * input.channel[i].pente[0]) / 256);
		}
		else
		{
			delta = value - input.channel[i].usNeutralValue;
			value = ((delta * input.channel[i].pente[1]) / 256);
		}
		
		
		input.channel[i].usValue = value;
		
		// Detection de manche au neutre
		
		if (delta < 5)
		{
			if (i == 0) manche0neutre = 1;
			if (i == 1) manche1neutre = 1;
			if (i == 2) manche2neutre = 1;
			if (i == 3) manche3neutre = 1;
		}
		
	}

	ADC1_ClearFlag(ADC1_FLAG_EOC);
}

void lectureswitch(void)
{
	
	// TRIM DYNAMIQUE
	if (GPIO_ReadInputPin(GPIOD,GPIO_PIN_7)) memtrimdyn();
	else
	if (trimdyn) settrimdyn(); // Applique les nouveaux neutres des sorties
	
	// TOR1
	tor1plus = GPIO_ReadInputPin(GPIOA,GPIO_PIN_3);
	tor1moins = GPIO_ReadInputPin(GPIOA,GPIO_PIN_4);
	
	// TOR2
	tor2plus = GPIO_ReadInputPin(GPIOA,GPIO_PIN_5);
	tor2moins = GPIO_ReadInputPin(GPIOA,GPIO_PIN_6);

}

void compute_expo(void)
{	
	u8 i;
	s16 val16;

	for(i =0 ; i < NUM_INPUT; i++)
	{
		
		val16 = input.channel[i].usValue;
		
		input.channel[i].usValue = expo(val16,i); 
	}
}

void compute_dr(void)
{
	u8 i;
	s32 drtemp;

	for(i =0 ; i < NUM_INPUT; i++)
	{
		drtemp = input.channel[i].usValue;
		drtemp *= output.dr[i];
		drtemp /= 100;
		input.channel[i].usValue = drtemp;
	}
}

void compute_trim(void) // Applique les trims electronique et dynamiques
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
				if (trim0plus) { output.usNeutralValue[out] += (trimstep * mixer[i].pente[1])/10; }
				if (trim0moins) { output.usNeutralValue[out] -= (trimstep * mixer[i].pente[0])/10; }
				if (out == output.secumoteur) trimdynmanche0 = 0;
			}

			if(in == 1)
			{
				if (trim1plus) { output.usNeutralValue[out] += (trimstep * mixer[i].pente[1])/10; }
				if (trim1moins) { output.usNeutralValue[out] -= (trimstep * mixer[i].pente[0])/10; }
				if (out == output.secumoteur) trimdynmanche1 = 0;
			}

			if(in == 2)
			{
				if (trim2plus) { output.usNeutralValue[out] += (trimstep * mixer[i].pente[1])/10; }
				if (trim2moins) { output.usNeutralValue[out] -= (trimstep * mixer[i].pente[0])/10; }
				if (out == output.secumoteur) trimdynmanche2 = 0;
			}

			if(in == 3)
			{
				if (trim3plus) { output.usNeutralValue[out] += (trimstep * mixer[i].pente[1])/10; }
				if (trim3moins) { output.usNeutralValue[out] -= (trimstep * mixer[i].pente[0])/10; }
				if (out == output.secumoteur) trimdynmanche3 = 0;
			}
		}
	}
	
	trim0plus = trim1plus = trim2plus = trim3plus = trim0moins = trim1moins = trim2moins = trim3moins = 0;
	
	if (trimdynencour)
	{
		if (manche0neutre) trimdynmanche0 = 0;
		if (manche1neutre) trimdynmanche1 = 0;
		if (manche2neutre) trimdynmanche2 = 0;
		if (manche3neutre) trimdynmanche3 = 0;
	}
}

void compute_mixer(void)
{
	u8 i = 0;
	u8 in;
	u8 out;
	static _Bool sens = 1;
	static s16 wave = 0;
	s32 delta32;
	
	// voie test
	if (sens) wave+=10; else wave-=10;
	if (wave < (-999)) sens = 1;
	if (wave > 999) sens = 0;
	
	for(i = 0; i < NUM_OUTPUT ; i++)
	{
		output.sValue[i] = 0;
	}
	
	for(i = 0; i < NUM_MIXER ; i++)
	{
		in = mixer[i].in;
		out = mixer[i].out;
		
		if (out < NUM_OUTPUT)
		{
			if(in < 4) // que les manches ...
			{
				delta32 = input.channel[in].usValue;

				if(input.channel[in].usValue < 0)
				{
					delta32 *= mixer[i].pente[0];
				}
				else
				{
					delta32 *= mixer[i].pente[1];
				}
				
				delta32 /= 100;
				
				if ((trimdyn) && (out != output.secumoteur)) delta32 /= ratiotrimdyn;
				
				output.sValue[out] += delta32; 

				
				if (trimdynencour)
				{
					if ((in == 0) && (trimdynmanche0)) output.sValue[out] = 0;
					if ((in == 1) && (trimdynmanche1)) output.sValue[out] = 0;
					if ((in == 2) && (trimdynmanche2)) output.sValue[out] = 0;
					if ((in == 3) && (trimdynmanche3)) output.sValue[out] = 0;
				}
			}
		}
	}
	
	if (trimdyn)
	{
		for(i = 0; i < NUM_OUTPUT; i++)
		{
			trimmem[i] = output.sValue[i] + output.usNeutralValue[i]; // Memorise les actions des manches uniquement
		}
	}
	
	for(i = 0; i < NUM_MIXER ; i++)
	{
		in = mixer[i].in;
		out = mixer[i].out;
		
		if (out < NUM_OUTPUT)
		{
			if((in > 3) && (in < NUM_INPUT)) // Les autres voies proportionnelles
			{
				delta32 = input.channel[in].usValue;

				if(input.channel[in].usValue < 0)
				{
					delta32 *= mixer[i].pente[0];
				}
				else
				{
					delta32 *= mixer[i].pente[1];
				}
				
				delta32 /= 100;
				
				output.sValue[out] += delta32; 
				
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
				} 
				else
				{
					delta32 *= mixer[i].pente[1];
				}
				
				delta32 /= 100;
				
				output.sValue[out] += delta32;
			}
			
		}
	}
	
}

void scale_output(void)
{ 
	s16 val;
	u8 i = 0;
	
	output.usValueOut[NUM_OUTPUT] = LONGUEUR_TRAME;
	
	for(i = 0; i < NUM_OUTPUT ; i++)
	{
		
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
	GPIO_Init(GPIOD, (GPIO_PIN_6 ), GPIO_MODE_IN_FL_NO_IT); // Trim manche 0

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
	// SECUMOTEUR+PHASE DUALRATE+EXPO DROITE  et trim manches 3 et 2
	GPIO_Init(GPIOE,GPIO_PIN_0|GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7,GPIO_MODE_IN_FL_NO_IT);
	// I2C SCL ET I2C SDA
	GPIO_Init(GPIOE,GPIO_PIN_1|GPIO_PIN_2,GPIO_MODE_OUT_OD_HIZ_FAST);
	//GAUCHE (0) ET HAUT (1)
	GPIO_Init(GPIOG,(GPIO_PIN_0 |GPIO_PIN_1),GPIO_MODE_IN_FL_NO_IT);
	// TOR1 ET TOR2 (PLUS ET MOINS)
	GPIO_Init(GPIOA,GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6,GPIO_MODE_IN_FL_NO_IT);
	
	
	/*  Init GPIO pour ADC1 */
	GPIO_DeInit(GPIOB);
	GPIO_Init(GPIOB,GPIO_PIN_ALL,GPIO_MODE_IN_FL_NO_IT);
	
	//Bip off
	GPIO_WriteHigh(GPIOD,GPIO_PIN_4);


	/* adc 6 voies + batterie */
	ADC1_DeInit();
	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE,
	ADC1_CHANNEL_6,
	ADC1_PRESSEL_FCPU_D2,
	ADC1_EXTTRIG_TIM,
	DISABLE,
	ADC1_ALIGN_RIGHT,
	ADC1_SCHMITTTRIG_CHANNEL0|ADC1_SCHMITTTRIG_CHANNEL1|ADC1_SCHMITTTRIG_CHANNEL2|ADC1_SCHMITTTRIG_CHANNEL3|
	ADC1_SCHMITTTRIG_CHANNEL4|ADC1_SCHMITTTRIG_CHANNEL5|ADC1_SCHMITTTRIG_CHANNEL6 ,	DISABLE);
	ADC1_ScanModeCmd(ENABLE);
	ADC1_DataBufferCmd(ENABLE);
	
	//Horloge clavier affichage
	TIM3_DeInit();
	TIM3_TimeBaseInit(TIM3_PRESCALER_512,6249); // 0.2 Seconde
	TIM3_ITConfig(TIM3_IT_UPDATE, ENABLE);

	//Compteur fonction Delayms
	TIM4_DeInit();
	TIM4_TimeBaseInit(TIM4_PRESCALER_128,124); // 0.001 Seconde
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);


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
	static u8 compteur = 0;

	channel = 0xff;
	captureADC();
	lectureswitch();
	if (compteur >= 3)
	{
		lectureswitchmultiplex();
		compteur = 0;
	}
	compteur++;
	if (expon) compute_expo();
	if (switchdr) compute_dr();
	compute_trim();
	compute_mixer();
	if (!flashencour) scale_output();
	if (trimchange)
	{
		save_neutre(phase_actuelle);
		trimchange = 0;
	}
	if (phase_change)
	{
		load_phase(phase_actuelle);
	}
	channel = 0;
}

void main(void)
{
	initialise();
	enableInterrupts();
	TIM3_Cmd(ENABLE); // 0.2 seconde
	TIM4_Cmd(ENABLE); // 0.001 seconde
	
	modele_actuel = FLASH_ReadByte(BASE_EEPROM);
	load_input();
	// Lecture des switchs multiplexes
	GPIO_WriteLow(GPIOD, GPIO_PIN_0); // led on trim+ off
	GPIO_WriteHigh(GPIOD, GPIO_PIN_2); // trim- on
	trimflag = 0;
	lectureswitchmultiplex();
	Delayms(20);
	lectureswitchmultiplex();	
	
	lectureswitch();
	load_phase(phase_actuelle);
	
	/* LCD chargement table de caracteres*/
	LCD_INIT();
	LCD_CMD(CGRAM_address_start);
	LCD_LOAD_CGRAM(cur,8);

	
	LCD_printtruc(1,3,"Modele : %d",modele_actuel);
	LCD_printtruc(2,4,"Phase : %d",phase_actuelle);

	Delayms(1000);
	LCD_CLEAR_DISPLAY();
	
	synchro = 0;
	channel = 0;
	calcultrame();
	TIM2_SetAutoreload(output.usValueOut[0]);
	TIM2_Cmd(ENABLE);	
	

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
				
				
				Menu_on = 0;
				
				if ((((bas || gauche || droite || menudyn) || phase_changemenu) && Menu_actif && !popup) || haut)
				{				
					if (menudyn) menudyn = 0;
					Menu_actif = Menu_raz = 1;
					Menu();
					switchinfo = 1;
					phase_changemenu = 0;
				}	
			}

			// baragraphe, etc
			if ((sec) && (Menu_actif == 0) && (channel == 0))	
			{
				chronobat();
				if (switchinfo)
				{
					switchinfo = 0;
					LCD_CLEAR_DISPLAY();
				}
				info();
				sec = 0;
				if (bas) changeratiotrimdyn();
				if (gauche) razchrono();
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
	LCD_printtruc(1,1,"line %d\r\n",line);

	/* Infinite loop */
	while (1)
	{

	}
}
#endif



/******************* fin *****END OF FILE****/