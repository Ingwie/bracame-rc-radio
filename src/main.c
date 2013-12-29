/* Bracame RC TX */
/* */
/* Ajout de trims electroniques pour fonctionnement avec nouveaux manches (hitec aurora 9)*/
/* */
/* Ajout dans utilitaire : visualisation des entrées sorties et potars */
/* */
/* Ajout de la gestion du retour au neutre pour trimdyn */
/* */
/* Un seul etalonnage des manches pour tous les modeles : 5 possibles maintenant (petite modif), ajout réglage tempo du menu*/
/* */
/* Multiplexage des switchs secumoteur, phase, expo et dr liberation des entrées i2c pour ise en place d'une 24C256*/
/* */
/* Ecriture de routines perso i2c : le stm8 rev Y est buggé sur l'i2c. 24C256 fonctionnelle*/
/* (15 modèles 3 phases et 18 mixeurs maintenant. Reste a ajouter un switch 3 positions pour les phases*/
/* */
/* Amelioration de secumoteur */
/* */
/* */


#include "stm8s.h"
#include "tx.h"
#include "delay.h"
#include "hd44780.h"
#include "menu.h"
#include "iic.h"

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
u8 phase_a_charger = 0;
_Bool phase_change = 0;
_Bool phase_changemenu = 0;
u8 nom_modele[12] = "           \n";



_Bool trimdyn = 0; // Lié a PD7
_Bool switchdr = 0; // PE2
_Bool expon = 0; // PE3
_Bool secumot = 1; // PE0
_Bool tor1plus = 0; // PA3
_Bool tor1moins = 0; // PA4
_Bool tor2plus = 0; // PA5
_Bool tor2moins = 0; // PA6
_Bool gazazero = 0; // Detection manche des gaz au mini pour fonction secumoteur

struct_input NEAR input;
struct_output NEAR output;
struct_param_phase NEAR param_phase[NUM_PHASE];
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
_Bool trimflag = 0;
_Bool trimchange = 0;
u8 trimstep = 2;

u16 temps_restant;
u8 secondesurcinq;
u8 secondes;
u8 minutes;
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


/////////////////////////////////////////////////////////////////////////////

/*void duree(void) // pour debugger optimiser
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
}*/

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

void lcd_charge_spcaracteres(void)
{
	const char cur[64] =
	{
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	};
	
	LCD_CMD(CGRAM_address_start);
	LCD_LOAD_CGRAM(cur,8);
}

void erreur_ee(u16 adresse) // Affiche un message en cas d'erreur avec la eeprom
{
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	Menu_actif = 1;
	popup = 1;
	Tempo_menu = 6;
	LCD_printtruc(1,4,"Erreur EE",0);
	LCD_printtruc(2,4,"adresse %i\n",adresse);
	LCD_DISP_ON();
	bip(3,0,0,0,0);
	Delayms(500);
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

u8 nivbar(u16 sortie) // Pour baragraphe info
{	
	sortie -= (MIN_COURSE - MIN_COURSE/8);
	sortie /= 166;
	return sortie;
}

void info(void) // Affichage pendant le vol ...
{
	u8 i;
	u16 volt;
	u8 barout;
	char lhaut[NUM_OUTPUT + 1];
	char lbas[NUM_OUTPUT + 1];
	const char esp = 32;
	
	for(i = 0; i < NUM_OUTPUT ; i++)
	{
		barout = nivbar(output.usValueOut[i]); //calcul pour affichage pendant le vol
		
		switch (barout)
		{
		case 0:
			lbas[i] = '\0';
			lhaut[i] = esp;
			break;
		case 1:
			lbas[i] = '\1';
			lhaut[i] = esp;
			break;
		case 2:
			lbas[i] = '\2';
			lhaut[i] = esp;
			break;
		case 3:
			lbas[i] = '\3';
			lhaut[i] = esp;
			break;
		case 4:
			lbas[i] = '\4';
			lhaut[i] = esp;
			break;
		case 5:
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
	LCD_printtruc(1,9,"%u\n",channel);

	// Temps restant aprés la boucle de calcul de la trame
	barout = (u8)((output.usValueOut[NUM_OUTPUT] - temps_restant) / 1000);
	// 1 = 0.5 mS
	if (barout < 1) barout = '!';
	else if (barout < 3) barout = '?';
	else barout = '*';
	LCD_LOCATE(1,10);
	LCD_printchar(barout);
	
	// Batterie
	volt = ADC1_GetBufferValue(6); //3.42 (697) 2.2 (452) ->  200.81 / VOLT + 0.05V *2 + diode
	volt += 68;
	LCD_printtruc(2,12,"%i\n",volt/100);
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

	if (param_phase[phase_actuelle].secumoteur != 255)
	{
		temp = output.usValueOut[param_phase[phase_actuelle].secumoteur];
		temp -= MIN_COURSE;
		temp /= 20;
		temp *= param_phase[phase_actuelle].ratiobat;
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
	s16 a;
	a= (sortie - NEUTRE_COURSE);
	a=a/10;
	return a;
}

u16 pourcentsortie(s8 pourcent) // % en temps
{ 
	return (u16)((pourcent * 10) + NEUTRE_COURSE);
}

void reset_modele(void)
{
	u8 i;
	u8 j;
	
	for(i = 0; i < 12; i++)
	{
		nom_modele[i] = 32;
	}
	//input
	for(i = 0; i < NUM_INPUT; i++)
	{
		param_phase[phase_actuelle].expo[i][0] = 0;
		param_phase[phase_actuelle].expo[i][1] = 0;
	}
	
	//mixer 
	for(i = 0; i < NUM_MIXER; i++)
	{
		param_phase[phase_actuelle].mixer[i].in = 255;
		param_phase[phase_actuelle].mixer[i].out = 255;
		param_phase[phase_actuelle].mixer[i].pente[0] = 0;
		param_phase[phase_actuelle].mixer[i].pente[1] = 0;
	}

	//output
	
	output.usValueOut[NUM_OUTPUT] =  LONGUEUR_TRAME; //22.5 ms
	
	for(i = 0; i < (NUM_INPUT + NUM_INPUT_SWITCH) ; i++)
	{
		param_phase[phase_actuelle].dr[i] = 100;
	}
	
	
	for(i = 0; i < NUM_OUTPUT ; i++)
	{
		output.sValue[i] = 0;
		output.usValueOut[i] = NEUTRE_COURSE;
		param_phase[phase_actuelle].usMinValue[i] = MIN_COURSE;
		param_phase[phase_actuelle].usNeutralValue[i] = NEUTRE_COURSE;
		param_phase[phase_actuelle].usMaxValue[i] = MAX_COURSE;
		output.usValueOut[NUM_OUTPUT] = output.usValueOut[NUM_OUTPUT] - output.usValueOut[i];
	}
	
	param_phase[phase_actuelle].secumoteur = 255;
	param_phase[phase_actuelle].ratiobat = 0;
	
	for(i = 0; i < NUM_COURBES; i++)
	{
		for(j = 0; j < NUM_POINTS_COURBE; j++)
		{
			param_phase[phase_actuelle].courbe[i][j] = 0;
		}
	}
}

void reset_neutre(void)
{
	u8 i;
	
	for(i = 0; i < NUM_OUTPUT ; i++)
	{
		param_phase[phase_actuelle].usNeutralValue[i] = NEUTRE_COURSE;
	}
	
}

void eeprom_ecrire(u16 adresse,u8* pdonnee,u8 taille) // Affiche un message en cas d'erreur d'ecriture eeprom
{
	if (!iic_ecrire(adresse,pdonnee,taille)) erreur_ee(adresse);
}

void eeprom_lire(u16 adresse,u8* pdat,u8 taille) // Affiche un message en cas d'erreur de lecture eeprom
{
	if (!iic_lire(adresse,pdat,taille)) erreur_ee(adresse);
}

void load_input(void) // taille : (6 x NUM_INPUT) (36) INPUT_LENGTH
{
	u8 i;
	u16 delta2;
	
	u16 addr = 20;
	
	flashencour = 1;
	
	for(i = 0; i < NUM_INPUT; i++)
	{	
		eeprom_lire(addr,(u8*)&input.channel[i].usMinValue,2);
		addr +=2;	
		
		eeprom_lire(addr,(u8*)&input.channel[i].usNeutralValue,2);
		addr +=2;	
		
		eeprom_lire(addr,(u8*)&input.channel[i].usMaxValue,2);
		addr +=2;	
		
		delta2 = (input.channel[i].usNeutralValue - input.channel[i].usMinValue);
		if (delta2 > 4) input.channel[i].pente[0] = 256000 / delta2;
		else input.channel[i].pente[0] = 65535;
		
		delta2 = (input.channel[i].usMaxValue - input.channel[i].usNeutralValue);
		if (delta2 > 4) input.channel[i].pente[1] = 256000 / delta2;
		else input.channel[i].pente[1] = 65535;
	}
	
	flashencour = 0;
}

void charge_nom_modele_ee(u8 modele)
{
	u16 addr = 64 + (NUM_PHASE * NUM_PAGE_MODELE * 64 * modele) ;
	
	eeprom_lire(addr,(u8*)&nom_modele,12);
	
	nom_modele[11] = '\n';
}

void charge_phase_ee(u8 phase) // Charge dans 3 pages de 64 octets
{
	u8 i;
	u8 j;
	u8 utemp;
	s8 stemp;
	u16 addr = 64 + (NUM_PHASE * NUM_PAGE_MODELE * 64 * modele_actuel) + ( NUM_PAGE_MODELE * 64 * phase);
	
	//nom du modele
	if (phase ==0) {eeprom_lire(addr,(u8*)&nom_modele,12);}
	addr+=12;
	nom_modele[11] = '\n';
	
	//secu moteur
	eeprom_lire(addr,(u8*)&utemp,1);
	param_phase[phase].secumoteur = utemp;
	addr++;
	// ratiobat
	eeprom_lire(addr,(u8*)&utemp,1);
	param_phase[phase].ratiobat = utemp;
	

	
	addr+=PLACE_1; //de la place pour autre chose ...
	
	//input
	for(i = 0; i < NUM_INPUT; i++)
	{
		//expo
		for(j = 0; j < 2;j++)
		{
			eeprom_lire(addr,(u8*)&stemp,1);
			param_phase[phase].expo[i][j] = stemp;
			addr++;
		}
	}
	
	//mixer
	for(i = 0; i < NUM_MIXER; i++)
	{
		eeprom_lire(addr,(u8*)&utemp,1);
		param_phase[phase].mixer[i].in = utemp;
		addr++;
		eeprom_lire(addr,(u8*)&utemp,1);
		if (param_phase[phase].mixer[i].in <= (NUM_INPUT + NUM_INPUT_SWITCH))
		param_phase[phase].mixer[i].out = utemp;
		else param_phase[phase].mixer[i].out = 255;
		addr++;
		eeprom_lire(addr,(u8*)&stemp,1);
		param_phase[phase].mixer[i].pente[0] = stemp;
		addr++;
		eeprom_lire(addr,(u8*)&stemp,1);
		param_phase[phase].mixer[i].pente[1] = stemp;
		addr++;
	}
	
	addr+=PLACE_2; //encore de la place !
	
	//output
	
	for(i = 0; i < (NUM_INPUT + NUM_INPUT_SWITCH) ; i++)
	{
		eeprom_lire(addr,(u8*)&utemp,1);		
		param_phase[phase].dr[i] = utemp;
		addr++;
	}

	
	for(i = 0; i < NUM_OUTPUT; i++) // Min et Max
	{
		eeprom_lire(addr,(u8*)&stemp,1);
		param_phase[phase].usMinValue[i] = pourcentsortie(stemp);
		addr++;
		eeprom_lire(addr,(u8*)&stemp,1);
		param_phase[phase].usMaxValue[i] = pourcentsortie(stemp);
		addr++;
	}
	for(i = 0; i < NUM_OUTPUT; i++) // Les neutres
	{
		eeprom_lire(addr,(u8*)&stemp,1);
		param_phase[phase].usNeutralValue[i] = pourcentsortie(stemp);
		addr++;
	}
	addr+=PLACE_3; //encore de la place !
	
	for(i = 0; i < NUM_COURBES; i++)
	{
		for(j = 0; j < NUM_POINTS_COURBE; j++)
		{
			eeprom_lire(addr,(u8*)&stemp,1);
			param_phase[phase].courbe[i][j] = stemp;
			addr++;
		}
	}

}

void charge_param_phase(void)
{
	u8 i;
	secumot = 1;
	for(i = 0; i < NUM_PHASE; i++)
	{
		charge_phase_ee(i);
	}
}

void sauve_numero_modele_actuel_ee(u8 num) // Memorise le modele chargé
{
	eeprom_ecrire(0,(u8*)&num,1);
}

void save_phase_ee(u8 modele,u8 phase) // Sauve dans 3 pages de 64 octets
{
	u8 i = 0;
	u8 j = 0;
	u8 utemp;
	s8 stemp;
	u16 addr = 64 + (NUM_PHASE * NUM_PAGE_MODELE * 64 * modele) + ( NUM_PAGE_MODELE * 64 * phase);
	
	//nom du modele
	nom_modele[11] = '\n';
	if (phase == 0) eeprom_ecrire(addr,(u8*)&nom_modele,12);
	addr+=12;
	
	//secu moteur
	utemp = param_phase[phase_actuelle].secumoteur;
	eeprom_ecrire(addr,(u8*)&utemp,1);
	addr++;
	utemp = param_phase[phase_actuelle].ratiobat;
	eeprom_ecrire(addr,(u8*)&utemp,1);

	
	addr+=PLACE_1; //de la place pour autre chose ...
	
	//input 
	for(i = 0; i < NUM_INPUT; i++)
	{
		//expo
		for(j = 0; j < 2;j++)
		{
			stemp = param_phase[phase_actuelle].expo[i][j];
			eeprom_ecrire(addr,(u8*)&stemp,1);
			addr ++;
		}
	}
	

	//mixer 
	for(i = 0; i < NUM_MIXER; i++)
	{
		utemp = param_phase[phase_actuelle].mixer[i].in;
		eeprom_ecrire(addr,(u8*)&utemp,1);
		addr++;
		utemp = param_phase[phase_actuelle].mixer[i].out;
		eeprom_ecrire(addr,(u8*)&utemp,1);
		addr++;
		stemp = param_phase[phase_actuelle].mixer[i].pente[0];
		eeprom_ecrire(addr,(u8*)&stemp,1);
		addr++;
		stemp = param_phase[phase_actuelle].mixer[i].pente[1];
		eeprom_ecrire(addr,(u8*)&stemp,1);
		addr++;
	}
	
	addr+=PLACE_2; //encore de la place !
	
	//output
	
	for(i = 0; i < (NUM_INPUT + NUM_INPUT_SWITCH) ; i++)
	{
		utemp = param_phase[phase_actuelle].dr[i];
		eeprom_ecrire(addr,(u8*)&utemp,1);		
		addr++;
	}

	
	for(i = 0; i < NUM_OUTPUT; i++) //Min et Max
	{		
		stemp = sortiepourcent(param_phase[phase_actuelle].usMinValue[i]);
		eeprom_ecrire(addr,(u8*)&stemp,1);
		addr ++;
		stemp = sortiepourcent(param_phase[phase_actuelle].usMaxValue[i]);
		eeprom_ecrire(addr,(u8*)&stemp,1);
		addr ++;
	}
	for(i = 0; i < NUM_OUTPUT; i++) // Les neutres ensemble
	{
		stemp = sortiepourcent(param_phase[phase_actuelle].usNeutralValue[i]);
		eeprom_ecrire(addr,(u8*)&stemp,1);
		addr ++;
	}
	
	addr+=PLACE_3; //encore de la place ! // 216
	
	for(i = 0; i < NUM_COURBES; i++)
	{
		for(j = 0; j < NUM_POINTS_COURBE; j++)
		{
			stemp = param_phase[phase_actuelle].courbe[i][j];
			eeprom_ecrire(addr,(u8*)&stemp,1);
		addr ++;
		}
	}
}

void save_neutre_ee(void) // Sauve les neutre
{
	u8 i;
	s8 stemp[NUM_OUTPUT];
	u16 addr = 64 + (NUM_PHASE * NUM_PAGE_MODELE * 64 * modele_actuel) + ( NUM_PAGE_MODELE * 64 * phase_actuelle);
	addr += 144;
	
	flashencour = 1;
	
	for(i = 0; i < NUM_OUTPUT; i++)
	{
		stemp[i] = sortiepourcent(param_phase[phase_actuelle].usNeutralValue[i]);
	}
	eeprom_ecrire(addr,(u8*)&stemp,NUM_OUTPUT);
	
	flashencour = 0;
}

void changeratiotrimdyn(void) // Divise les courses lors du trimdyn
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
		u8 in = param_phase[phase_actuelle].mixer[i].in;
		u8 out = param_phase[phase_actuelle].mixer[i].out;
		
		if ((out < NUM_OUTPUT) && (in < 4)) // trim dynamique que sur les sorties pilotées par les manches
		{
			if (out != param_phase[phase_actuelle].secumoteur) param_phase[phase_actuelle].usNeutralValue[out] = trimmem[out]; // et pas la voie moteur
		}
	}
	trimdynencour = trimdynmanche0 = trimdynmanche1 = trimdynmanche2 = trimdynmanche3 = 1; // recherches des neutres
	trimdyn = 0;
	trimchange = 1; // Sauvegarde des nouveaux neutres
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
	u16 count;
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
	
	while(!bas) bas = GPIO_ReadInputPin(GPIOC,GPIO_PIN_1);

	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,1,"Mesures zero\n",0);
	LCD_printtruc(2,1,"en cours\n",0);
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
			--count;
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
	while(!bas) bas = GPIO_ReadInputPin(GPIOC,GPIO_PIN_1);
	bas = 0;
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,1,"Mesures max/min\n",0);
	LCD_printtruc(2,1,"en cours\n",0);
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
			u16 val[NUM_INPUT];
			--count;
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
	
	{
		u16 addr = 20;
		
		
		for(i = 0; i < NUM_INPUT; i++)
		{
			eeprom_ecrire(addr,(u8*)&min[i],2);
			addr+=2;
			eeprom_ecrire(addr,(u8*)&neutral[i],2);
			addr+=2;
			eeprom_ecrire(addr,(u8*)&max[i],2);
			addr+=2;
		}
	}

	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,1,"Enregistre\n",0);
	LCD_printtruc(2,1,"Appuyer haut\n",0);
	LCD_DISP_ON();
	
	Menu_raz = 1;
	
	while(!haut) haut = GPIO_ReadInputPin(GPIOG,GPIO_PIN_1);
	Tempo_menu = 14;
	Delayms(500);
	load_input();
}

s16 expou(u16 x, u8 exp) // expo only for plus values: x: 0..1000, exp: 1..99
{
	// (x*x/1000*x*exp/1000+x*(100-exp)+50)/100
	return (s16)(((u32)x * x / 1000 * x * exp / 1000
	+ (u32)x * (u8)(100 - exp) + 50) / 100);
}

s16 expo(s16 inval, u8 i) // apply expo: inval: -1000..1000, exp: -99..99
{
	u8  neg;
	s16 val;
	s8 exp;
	
	if ((param_phase[phase_actuelle].expo[i][0] == 0) && (param_phase[phase_actuelle].expo[i][1] == 0))
	return inval;	// no expo
	if (inval == 0)  return inval;	// 0 don't change

	neg = (u8)(inval < 0 ? 1 : 0);
	
	if (neg)
	{
		inval = -inval;
		exp = param_phase[phase_actuelle].expo[i][0];
	}
	else 
	{
		exp = param_phase[phase_actuelle].expo[i][1];
	}
	if (exp > 0)  val = expou(inval,exp);
	else val = 1000 - expou(1000 - inval,-exp);

	return  neg ? -val : val;
}

s16 entreswitch(u8 i,u8 in)
{ 
	s16 val = 0;
	s32 drtemp;
	
	
	if (in == NUM_INPUT)
	{
		if (tor1moins) val = param_phase[phase_actuelle].mixer[i].pente[0] * (-10);
		if (tor1plus) val = param_phase[phase_actuelle].mixer[i].pente[1] * 10;
	}

	if (in == (NUM_INPUT + 1))
	{
		if (tor2moins) val = param_phase[phase_actuelle].mixer[i].pente[0] * (-10);
		if (tor2plus) val = param_phase[phase_actuelle].mixer[i].pente[1] * 10;
	}
	
	if (switchdr) 
	{
		drtemp = val;
		drtemp *= param_phase[phase_actuelle].dr[in];
		drtemp /= 100;
		val = drtemp;
	}
	
	return val;
}

void lectureswitchmultiplex(void) // 2 switchs par entree
{
	if (trimflag)
	{
		// TRIM PLUS
		trim0plus = GPIO_ReadInputPin(GPIOD,GPIO_PIN_6);
		trim1plus = GPIO_ReadInputPin(GPIOD,GPIO_PIN_5);
		trim2plus = GPIO_ReadInputPin(GPIOE,GPIO_PIN_7);
		trim3plus = GPIO_ReadInputPin(GPIOE,GPIO_PIN_6);
		// SECUMOTEUR
		if ((GPIO_ReadInputPin(GPIOE,GPIO_PIN_0) && ((secumot && gazazero) || !secumot))) secumot = 0;
		else secumot = 1;
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
		// PHASE bientot GPIO_ReadInputPin(GPIOB,GPIO_PIN_7) pour phase 3;
		if (GPIO_ReadInputPin(GPIOE,GPIO_PIN_0))
		{
			if (phase_a_charger == 0) phase_change = 1;
			phase_a_charger = 1;
		}
		else 
		{
			if (phase_a_charger == 1) phase_change = 1;
			phase_a_charger = 0;
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
		drtemp *= param_phase[phase_actuelle].dr[i];
		drtemp /= 100;
		input.channel[i].usValue = drtemp;
	}
}

void compute_trim(void) // Applique les trims electronique et dynamiques
{
	u8 i;

	for(i = 0; i < NUM_MIXER ; i++)
	{
		u8 in = param_phase[phase_actuelle].mixer[i].in;
		u8 out = param_phase[phase_actuelle].mixer[i].out;
		
		if (out < NUM_OUTPUT)
		{
			if(in == 0)
			{
				if (trim0plus) { param_phase[phase_actuelle].usNeutralValue[out] += (trimstep * param_phase[phase_actuelle].mixer[i].pente[1])/10; }
				if (trim0moins) { param_phase[phase_actuelle].usNeutralValue[out] -= (trimstep * param_phase[phase_actuelle].mixer[i].pente[0])/10; }
				if (out == param_phase[phase_actuelle].secumoteur) trimdynmanche0 = 0;
			}

			if(in == 1)
			{
				if (trim1plus) { param_phase[phase_actuelle].usNeutralValue[out] += (trimstep * param_phase[phase_actuelle].mixer[i].pente[1])/10; }
				if (trim1moins) { param_phase[phase_actuelle].usNeutralValue[out] -= (trimstep * param_phase[phase_actuelle].mixer[i].pente[0])/10; }
				if (out == param_phase[phase_actuelle].secumoteur) trimdynmanche1 = 0;
			}

			if(in == 2)
			{
				if (trim2plus) { param_phase[phase_actuelle].usNeutralValue[out] += (trimstep * param_phase[phase_actuelle].mixer[i].pente[1])/10; }
				if (trim2moins) { param_phase[phase_actuelle].usNeutralValue[out] -= (trimstep * param_phase[phase_actuelle].mixer[i].pente[0])/10; }
				if (out == param_phase[phase_actuelle].secumoteur) trimdynmanche2 = 0;
			}

			if(in == 3)
			{
				if (trim3plus) { param_phase[phase_actuelle].usNeutralValue[out] += (trimstep * param_phase[phase_actuelle].mixer[i].pente[1])/10; }
				if (trim3moins) { param_phase[phase_actuelle].usNeutralValue[out] -= (trimstep * param_phase[phase_actuelle].mixer[i].pente[0])/10; }
				if (out == param_phase[phase_actuelle].secumoteur) trimdynmanche3 = 0;
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

s32 calcule_valeur(s16 val, s8 pente) // Renvoi la valeur pour calcul sorties
{
	s32 sortie;

	if (pente > -124)
	{
		sortie = val;
		sortie *= pente;
		return sortie;
	}	
	else
	{
		u8 i;
		u8 courbe;
		s32 y1;
		const u16 interval = (1000 / (NUM_POINTS_COURBE - 1)) + 1;

		courbe = 128 + pente; // determine le numero de courbe
		
		if (val < 0) val = -val;

		for(i = 0; i < (NUM_POINTS_COURBE - 1) ; i++)
		{
			if (val < interval)
			{
				y1 = param_phase[phase_actuelle].courbe[courbe][i];
				sortie = param_phase[phase_actuelle].courbe[courbe][i+1];
				sortie -= y1;
				sortie *= val;
				sortie *= (NUM_POINTS_COURBE - 1);
				y1 *= 1000;
				sortie += y1;
				return sortie;
			}
			val -= interval;
		}
	}
}

s32 calcule_sorties(s16 val, u8 mixeur) // Renvoi la valeur de sortie pour fonction mixeur
{
	if(val < 0)
	{
		return calcule_valeur(val,param_phase[phase_actuelle].mixer[mixeur].pente[0]);
	}
	else
	{
		return calcule_valeur(val,param_phase[phase_actuelle].mixer[mixeur].pente[1]);
	}
}

void compute_mixer(void) // Calcule les valeurs de sorties fct des mixeurs
{
	u8 i;
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
		in = param_phase[phase_actuelle].mixer[i].in;
		out = param_phase[phase_actuelle].mixer[i].out;
		
		if (out < NUM_OUTPUT)
		{
			if(in < 4) // que les manches ...
			{
				delta32 = calcule_sorties(input.channel[in].usValue,i);
				
				delta32 /= 100;
				
				if ((trimdyn) && (out != param_phase[phase_actuelle].secumoteur)) delta32 /= ratiotrimdyn;
				
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
			trimmem[i] = output.sValue[i] + param_phase[phase_actuelle].usNeutralValue[i]; // Memorise les actions des manches uniquement
		}
	}
	
	for(i = 0; i < NUM_MIXER ; i++)
	{
		in = param_phase[phase_actuelle].mixer[i].in;
		out = param_phase[phase_actuelle].mixer[i].out;
		
		if (out < NUM_OUTPUT)
		{
			if((in > 3) && (in < NUM_INPUT)) // Les autres voies proportionnelles
			{
				delta32 = calcule_sorties(input.channel[in].usValue,i);
				
				delta32 /= 100;
				
				output.sValue[out] += delta32; 
			}
			
			if((in > (NUM_INPUT - 1)) && (in < (NUM_INPUT + NUM_INPUT_SWITCH))) // Switchs
			{
				output.sValue[out] += entreswitch(i,in);
			}

			if(in == (NUM_INPUT + NUM_INPUT_SWITCH)) // Voie test
			{
				delta32 = calcule_sorties(wave,i);
				
				delta32 /= 100;
				
				output.sValue[out] += delta32;
			}
		}
	}
}

void scale_output(void) // Mise à l'echelle des sorties
{ 
	s16 val;
	u8 i;
	
	output.usValueOut[NUM_OUTPUT] = LONGUEUR_TRAME;
	
	for(i = 0; i < NUM_OUTPUT ; i++)
	{
		
		val = output.sValue[i] + param_phase[phase_actuelle].usNeutralValue[i];
		
		if(val < param_phase[phase_actuelle].usMinValue[i])
		{
			val = param_phase[phase_actuelle].usMinValue[i];
		}
		
		if(val > param_phase[phase_actuelle].usMaxValue[i])
		{
			val = param_phase[phase_actuelle].usMaxValue[i];
		}
		
		output.usValueOut[i] = val;
		
		if (i == param_phase[phase_actuelle].secumoteur)
		{
			gazazero = (output.usValueOut[i] <= (param_phase[phase_actuelle].usMinValue[i] + 10));
			if (secumot) output.usValueOut[i] = param_phase[phase_actuelle].usMinValue[i];
		}

		output.usValueOut[NUM_OUTPUT] = output.usValueOut[NUM_OUTPUT] - output.usValueOut[i];
	}
}

void initialise(void) // Initialise les parametres materiels au démarage
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
	
	//  Init GPIO pour les touches et switchs
	GPIO_DeInit(GPIOE);
	GPIO_DeInit(GPIOG);
	GPIO_DeInit(GPIOA);
	//BAS
	GPIO_Init(GPIOC,GPIO_PIN_1,GPIO_MODE_IN_FL_NO_IT);
	// SECUMOTEUR+PHASE DUALRATE+EXPO DROITE  et trim manches 3 et 2
	GPIO_Init(GPIOE,GPIO_PIN_0|GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7,GPIO_MODE_IN_FL_NO_IT);
	// I2C SCL ET I2C SDA
	GPIO_Init(GPIOE,GPIO_PIN_1|GPIO_PIN_2,GPIO_MODE_OUT_OD_HIZ_FAST); // Open drain pour l'i2c
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
	ADC1_DataBufferCmd(DISABLE);
	
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
	++compteur;
	if (expon) compute_expo();
	if (switchdr) compute_dr();
	compute_trim();
	compute_mixer();
	if (!flashencour) scale_output();
	if (phase_change)
	{
		phase_actuelle = phase_a_charger;
		phase_change = 0;
	}
	temps_restant = TIM2_GetCounter();
	channel = 0;
}

void main(void)
{
	initialise();
	enableInterrupts();
	TIM3_Cmd(ENABLE); // 0.2 seconde
	TIM4_Cmd(ENABLE); // 0.001 seconde
	
	/* LCD chargement table de caracteres*/
	LCD_INIT();
	lcd_charge_spcaracteres();


	eeprom_lire(0,(u8*)&modele_actuel,1); // Dernier modele chargé
	load_input();
	charge_param_phase();
	
	// Lecture des switchs multiplexes
	GPIO_WriteLow(GPIOD, GPIO_PIN_0); // led on trim+ off
	GPIO_WriteHigh(GPIOD, GPIO_PIN_2); // trim- on
	lectureswitchmultiplex();
	Delayms(1);
	lectureswitchmultiplex();
	phase_change = 0;
	phase_actuelle = phase_a_charger;
	lectureswitch();
	
	
	LCD_CLEAR_DISPLAY();
	LCD_LOCATE(1,1);
	LCD_printstring(nom_modele);
	LCD_printtruc(1,13,"%2.2u.\n",modele_actuel+1);
	LCD_printtruc(1,16,"%u\n",phase_actuelle);
	LCD_printtruc(2,4,"Chargement\n",0);

	//LCD_printtruc(1,3,"Modele : %d",modele_actuel);
	//LCD_printtruc(2,4,"Phase : %d",phase_actuelle);

	Delayms(1000);
	LCD_CLEAR_DISPLAY();
	
	synchro = 0;
	channel = 0;
	calcultrame();
	TIM2_SetAutoreload(output.usValueOut[0]);
	TIM2_Cmd(ENABLE);	
	

	while (1)
	{

		if (channel != 256)
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

			if (channel == 0)
			{
				if (trimchange)
				{
					save_neutre_ee();
					trimchange = 0;
				}
				// baragraphe, etc
				if ((sec) && (!Menu_actif))	
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
