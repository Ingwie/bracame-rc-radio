#include "stm8s.h"
#include "hd44780.h"
#include "menu.h"
#include "main.h"
#include "tx.h"
#include "Delay.h"

u8 jeton = 10;

extern _Bool haut;
extern _Bool bas;
extern _Bool gauche;
extern _Bool droite;
extern _Bool flashencour;
extern _Bool menudyn;
extern u8 ratiobat;
extern u8 trimstep;
extern u8 tempsmenu;

/* modele */
void m10(void)
{ 
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,1,"Modele %u\n",modele_actuel);
	LCD_printtruc(1,10,"Phase %u\n",phase_actuelle);
	LCD_printtruc(2,5,"Actions",0);
	LCD_DISP_ON();

	navigue(10,10,11,70,20);
	
}

/* change sauve raz modele */
void m11(void)
{ 
	if (gauche)
	{
		if (modele_actuel != (NUM_MODEL - 1)) modele_actuel++;
		else modele_actuel = 0;
		
		load_phase(phase_actuelle);
		flashencour = 1;
		prepareflash();	
		FLASH_ProgramByte(BASE_EEPROM, modele_actuel);
		FLASH_Lock(FLASH_MEMTYPE_DATA);			
		flashencour = 0;
		Delayms(200);

	}
	
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,1,"Modele %u\n",modele_actuel);
	LCD_printtruc(1,10,"Phase %u\n",phase_actuelle);
	LCD_printtruc(2,1,"Change Sauve Raz \n",0);
	LCD_DISP_ON();
	
	Delayms(100);
	
	navigue(11,10,12,11,13);
	
}

/* Sauve */
void m12(void)
{ 
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,2,"Sauvegarder ?\n",0);
	LCD_printtruc(2,1,"Appuyer gauche\n",0);
	LCD_DISP_ON();
	
	if (gauche)
	{
		save_phase(modele_actuel,phase_actuelle);
		LCD_printtruc(2,1,"   sauvegarde   \n",0);
		Delayms(500);
	}

	navigue(12,11,121,10,12);

}

/* Sauve autre phase */
void m121(void)
{ 
	u8 i;
	
	i = phase_actuelle;
	i++;
	if (i == NUM_PHASE) i = 0;
	
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,1,"Sauve en phase %u\n",i);
	LCD_printtruc(2,1,"Appuyer gauche\n",0);
	LCD_DISP_ON();
	
	if (gauche)
	{
		save_phase(modele_actuel,i);
		LCD_printtruc(2,1,"   sauvegarde   \n",0);
		Delayms(500);
	}

	navigue(121,11,122,10,121);

}

/* Sauve autre modele */
void m122(void)
{ 
	static u8 i = 0;
	static u8 j = 0;
	
	if (droite)
	{
	i++;
	if (i >= NUM_PHASE)
	{
	i = 0;
	j++;
	}
	if (j >= NUM_MODEL) j = 0;
	}
	
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_LOCATE(1,1);
	LCD_printf("Sauve en %u - %u\n",(u16)j,(u16)i);
	LCD_printtruc(2,1,"Appuyer gauche\n",0);
	LCD_DISP_ON();
	
	if (gauche)
	{
		save_phase(j,i);
		LCD_printtruc(2,1,"   sauvegarde   \n",0);
		Delayms(500);
	}

	navigue(122,11,12,10,122);

}

/* Raz modele */
void m13(void)
{ 
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,2,"RAZ et sauve ?\n",0);
	LCD_printtruc(2,1,"Appuyer gauche\n",0);
	LCD_DISP_ON();
	
	if (gauche)
	{
		reset_model();
		LCD_DISP_OFF();
		LCD_CLEAR_DISPLAY();
		LCD_printtruc(1,4,"reset ok\n",0);
		LCD_DISP_ON();

		save_phase(modele_actuel,phase_actuelle);
		LCD_printtruc(2,1,"   sauvegarde   \n",0);
		//load_input(modele_actuel);
		Delayms(500);
		haut = 1;
	}

	navigue(13,11,131,10,13);

}

/* Raz neutres*/
void m131(void)
{ 
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,2,"RAZ des neutres ?\n",0);
	LCD_printtruc(2,1,"Appuyer gauche\n",0);
	LCD_DISP_ON();
	
	if (gauche)
	{
		reset_neutre();
		LCD_DISP_OFF();
		LCD_CLEAR_DISPLAY();
		LCD_printtruc(1,4,"reset ok\n",0);
		LCD_DISP_ON();

		save_neutre(phase_actuelle);
		LCD_printtruc(2,1,"   sauvegarde   \n",0);
		Delayms(500);
		haut = 1;
	}

	navigue(131,11,131,10,131);

}

/* Entrees */
void m20(void)
{ 
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,3,"Reglage des\n",0);
	LCD_printtruc(2,5,"Entrees\n",0);
	LCD_DISP_ON();
	
	navigue(20,0,21,10,30);

}

/* Entrees Expo*/
void m21(void)
{	
	static u8 i = 0;
	static u8 j = 0;
	u8 val;
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,1,"Expo\n",0);
	LCD_printtruc(1,11,"Valeur\n",0);
	LCD_DISP_ON();
	if (bas)
	{
		if (j != 1) j++; 		
		else 
		{ 		
			j = 0;
			if (i != (NUM_INPUT -1)) i++;
			else i = 0;
		}
	}
	if (j	== 0) LCD_printtruc(1,5,"+\n",0); else LCD_printtruc(1,5,"-\n",0);

	val = reglage_variable(i,input.channel[i].expo[j],-99,99,3);
	input.channel[i].expo[j] = val;
	
	navigue(21,20,21,21,21);

}

/* Mixeurs */
void m30(void)
{ 
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,3,"Reglage des\n",0);
	LCD_printtruc(2,5,"Mixeurs\n",0);
	LCD_DISP_ON();
	
	navigue(30,0,31,20,40);

}

/* Mixeurs in out ou gains*/
void m31(void)
{ 
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,6,"Mixeur\n",0);
	LCD_printtruc(2,1,"in/out\n",0);
	LCD_printtruc(2,13,"gain\n",0);
	LCD_DISP_ON();

	navigue(31,30,31,32,33);

}

/* Mixeurs in out*/
void m32(void)
{ 
	static u8 i = 255;
	static u8 j = 255;
	static u8 k = 255;

	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,5,"Mixeur\n",0);
	LCD_printtruc(1,1,"in\n",0);
	LCD_printtruc(1,12,"out\n",0);
	LCD_DISP_ON();
	
	if (bas) 
	{
		if (i != (NUM_MIXER -1)) i++;	else i = 255;
	}
	if (i != 255)
	{
		j = mixer[i].in;
		k = mixer[i].out;

		if (gauche)
		{
			if (j != (NUM_INPUT+ NUM_INPUT_SWITCH)) j++; else j = 255;
		}
		if (droite)
		{
			if (k != (NUM_OUTPUT -1)) k++; else k = 255;
		}
		mixer[i].in = j;
		mixer[i].out = k;
	}
	if (i != 255)
	{	LCD_printtruc(2,8,"%u\n",(i + 1));
		if ((j != 255) || (j == NUM_INPUT)) LCD_printtruc(2,2,"%u\n",(j + 1));
		if (j == (NUM_INPUT+ NUM_INPUT_SWITCH)) LCD_printtruc(2,1,"test\n",0);
		if (k != 255) LCD_printtruc(2,13,"%u\n",(k + 1));
	}
	
	navigue(32,31,32,32,32);

}

/* Mixer gain*/
void m33(void)
{ 
	static u8 i = 0;
	static u8 j = 0;
	s8 val;
	u8 mixin;
	u8 mixout;
	
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,1,"Mixer\n",0);
	LCD_printtruc(1,13,"Gain\n",0);
	LCD_DISP_ON();

	if (bas)
	{
		if (j != 1) j++; 		
		else 
		{ 		
			j = 0;
			if (i != (NUM_MIXER -1))
			{
				i++;
recherche:
				if ((mixer[i].in == 255) || (mixer[i].out == 255) || (i > (NUM_MIXER - 1)))
				{
					i++;
					goto recherche;
				}
			}
			else i = 0;
		}
	}
	if (j != 0) LCD_printtruc(1,6,"+\n",0); else LCD_printtruc(1,6,"-\n",0);
	
	if ((mixer[i].in < (NUM_INPUT + NUM_INPUT_SWITCH + 1)) && (mixer[i].out < NUM_OUTPUT))
	{
		mixin = mixer[i].in + 1;
		mixout = mixer[i].out + 1;
		if (mixer[i].in < (NUM_INPUT + NUM_INPUT_SWITCH)) LCD_printtruc(2,6,"(%u\n",mixin);
		else LCD_printtruc(2,6,"(t",0);
		LCD_printtruc(2,8,"~%u)\n",mixout);
		
		
		val = reglage_variable(i,mixer[i].pente[j],-125,125,5);
		mixer[i].pente[j] = val;
	}
	navigue(33,31,33,33,33);

}

/* Sorties */
void m40(void)
{ 
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,3,"Reglage des\n",0);
	LCD_printtruc(2,5,"Sorties\n",0);
	LCD_DISP_ON();
	
	navigue(40,0,41,30,50);

}

/* Sorties min neutre max */
void m41(void)
{ 	
	static u8 i = 0;
	static u8 j = 0;
	s8 toto;
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,1,"Sortie\n",0);
	LCD_DISP_ON();

	if (bas)
	{
		if (j != 2) j++; 		
		else 
		{ 		
			j = 0;
			if (i != (NUM_OUTPUT -1)) i++;
			else i = 0;
		}
	}
	if (j	== 0)
	{
		LCD_printtruc(1,12,"Mini\n",0);
		
		toto = sortiepourcent(output.usMinValue[i]);
		toto = reglage_variable(i,toto,-125,125,5);	
		output.usMinValue[i] = pourcentsortie(toto);

	}
	else if (j == 1)
	{
		LCD_printtruc(1,11,"Neutre\n",0);

		toto = sortiepourcent(output.usNeutralValue[i]);
		toto = reglage_variable(i,toto,-120,120,2);	
		output.usNeutralValue[i] = pourcentsortie(toto);

	}
	else 
	{
		LCD_printtruc(1,12,"Maxi\n",0);

		toto = sortiepourcent(output.usMaxValue[i]);
		toto = reglage_variable(i,toto,-125,125,5);	
		output.usMaxValue[i] = pourcentsortie(toto);

	}

	navigue(41,40,41,41,41);

}

/* Secu moteur */
void m50(void)
{
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,5,"Securite\n",0);
	LCD_printtruc(2,6,"Moteur\n",0);
	LCD_DISP_ON();
	
	navigue(50,0,51,40,60);

}

/* Secu moteur choix sortie */
void m51(void)
{ 
	u8 i;
	
	i = output.secumoteur;
	if (bas) 
	{
		if (i != (NUM_OUTPUT -1)) i++;	else i = 255;
	}
	
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,2,"Choix du canal\n",0);
	if (i != 255) LCD_printtruc(2,8,"%u\n",(i + 1));
	LCD_DISP_ON();
	
	output.secumoteur = i;
	
	navigue(51,50,51,51,51);
	
}

/* D/R */
void m60(void)
{
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,6,"Double\n",0);
	LCD_printtruc(2,7,"Taux\n",0);
	LCD_DISP_ON();
	
	navigue(60,0,61,50,70);

}

/* DR par sortie */
void m61(void)
{ 
	static u8 i = 0;
	u8 val;		
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,1,"Sortie\n",0);
	LCD_printtruc(1,12,"Taux\n",0);
	LCD_DISP_ON();
	
	if (bas) 
	{
		if (i != (NUM_OUTPUT -1)) i++; else i = 0;
	}
	
	val = reglage_variable(i,output.dr[i],5,100,5);
	output.dr[i] = val;

	navigue(61,60,61,61,61);
	
}

/* utilitaires */
void m70(void)
{
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,3,"Utilitaires\n",0);
	LCD_printtruc(2,5,"Options\n",0);
	LCD_DISP_ON();

	navigue(70,0,71,60,10);
	
}

/* etalonnage */
void m71(void)
{
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,4,"Etalonnage\n",0);
	LCD_printtruc(2,3,"des manches\n",0);
	LCD_DISP_ON();
	
	if (droite) {
		jeton = 10;
		etalonnage();
	}
	else
	{
		navigue(71,70,72,10,71);
	}
}

/* decharge batterie */
void m72(void)
{
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,1,"Ratio moteur/bat\n",0);
	LCD_DISP_ON();
	
	if ((droite) && (ratiobat < 65)) ratiobat++;
	if ((gauche) && (ratiobat > 0)) ratiobat--;
	
	LCD_printtruc(2,4,"%u Heure-1\n",ratiobat);
	
	navigue(72,71,73,72,72);
	
}

/* Pas du trim electronique */
void m73(void)
{
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,1,"Pas du trim elec\n",0);
	LCD_DISP_ON();
	
	if ((droite) && (trimstep < 5)) trimstep += 1;
	if ((gauche) && (trimstep > 1)) trimstep -= 1;
	
	LCD_printtruc(2,5," ~ %u\n",trimstep);
	
	navigue(73,72,74,73,73);
	
}

/* Données brutes */
void m74(void)
{
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,3,"Données brutes\n",0);
	LCD_printtruc(2,7,"~\n",0);
	LCD_DISP_ON();

	navigue(74,73,78,74,75);
	
}

/* Données Entrees */
void m75(void)
{
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,2,"Données Entrees\n",0);
	LCD_DISP_ON();
	
	navigue(75,74,175,74,76);
	
}

/* Affiche Données Entrees */
void m175(void)
{
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_LOCATE(1,1);
	LCD_printf("%4u%4u%4u%4u\n",input.channel[0].usValue,input.channel[1].usValue,input.channel[2].usValue,input.channel[3].usValue);
	LCD_LOCATE(2,1);
	LCD_printf("%4u        %4u\n",input.channel[4].usValue,input.channel[5].usValue);
	LCD_DISP_ON();
	menudyn = 1;

	navigue(175,74,175,175,175);
	
}

/* Données Sorties */
void m76(void)
{
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,2,"Données Sorties\n",0);
	LCD_DISP_ON();

	navigue(76,74,176,75,77);
	
}

/* Affiche Données Sorties */
void m176(void)
{
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_LOCATE(1,1);
	LCD_printf("%4u%4u%4u%4u\n",output.usValueOut[0],output.usValueOut[1],output.usValueOut[2],output.usValueOut[3]);
	LCD_LOCATE(2,1);
	LCD_printf("%4u%4u%4u%4u\n",output.usValueOut[4],output.usValueOut[5],output.usValueOut[6],output.usValueOut[7]);
	LCD_DISP_ON();
	menudyn = 1;

	navigue(176,74,176,176,176);
	
}

/* Données Potars */
void m77(void)
{
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,2,"Données Potars\n",0);
	LCD_DISP_ON();

	navigue(77,74,177,76,74);
	
}

/* Affiche Données Potars */
void m177(void)
{
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_LOCATE(1,1);
	LCD_printf("%4u%4u%4u%4u\n",ADC1_GetBufferValue(0),ADC1_GetBufferValue(1),ADC1_GetBufferValue(2),ADC1_GetBufferValue(3));
	LCD_LOCATE(2,1);
	LCD_printf("%4u        %4u\n",ADC1_GetBufferValue(4),ADC1_GetBufferValue(5));
	LCD_DISP_ON();
	menudyn = 1;

	navigue(177,74,177,177,177);
	
}

/* Temps affichage menu */
void m78(void)
{
	LCD_DISP_OFF();
	LCD_CLEAR_DISPLAY();
	LCD_printtruc(1,1,"Temps aff. menu\n",0);
	LCD_DISP_ON();
	
	if ((droite) && (tempsmenu < 30)) tempsmenu += 2;
	if ((gauche) && (tempsmenu > 2)) tempsmenu -= 2;
	
	LCD_printtruc(2,3," ~ %u Sec.\n",tempsmenu);
	
	navigue(78,74,70,78,78);
	
}

/* Entrée mode menu */
void Menu(void)
{
	/* Calcul DESTINATION */  

	switch (jeton)
	{

	case 10:
		m10();
		break;
		
	case 11:
		m11();
		break;
		
	case 12:
		m12();
		break;
		
	case 121:
		m121();
		break;
		
	case 122:
		m122();
		break;
		
	case 13:
		m13();
		break;

	case 131:
		m131();
		break;
		
	case 20:
		m20();
		break;
		
	case 21:
		m21();
		break;
		
	case 30:
		m30();
		break;
		
	case 31:
		m31();
		break;
		
	case 32:
		m32();
		break;
		
	case 33:
		m33();
		break;
		
	case 40:
		m40();
		break;
		
	case 41:
		m41();
		break;
		
	case 50:
		m50();
		break;

	case 51:
		m51();
		break;

	case 60:
		m60();
		break;

	case 61:
		m61();
		break;

	case 70:
		m70();
		break;
		
	case 71:
		m71();
		break;

	case 72:
		m72();
		break;

	case 73:
		m73();
		break;
		
	case 74:
		m74();
		break;
		
	case 75:
		m75();
		break;
		
	case 175:
		m175();
		break;

	case 76:
		m76();
		break;

	case 77:
		m77();
		break;

	case 176:
		m176();
		break;

	case 177:
		m177();
		break;
		
	case 78:
		m78();
		break;
		
	default:
		jeton = 10;
	}
}

void navigue(u8 dou,u8 jetonh,u8 jetonb,u8 jetong,u8 jetond)(void)
{
	if (haut)
	{
		jeton = jetonh;
	} else if (bas)
	{
		jeton = jetonb;
	} else if (gauche)
	{
		jeton = jetong;
	} else if (droite)
	{
		jeton = jetond;	
	}	
	haut = bas = gauche = droite = 0;
	if (jeton != dou) Menu();
}

s8 reglage_variable(s8 nom,s8 actuel,s8 mini,s8 maxi,s8 pas)
{
	LCD_printtruc(2,3,"%u\n",(nom  + 1));
	if (gauche)
	{	
		if (actuel >= (mini + pas)) actuel -= pas;
		if (actuel < mini) actuel = mini;
	}
	if (droite)
	{
		if (actuel <= (maxi - pas)) actuel += pas;
		if (actuel > maxi) actuel = maxi;
	}
	LCD_printtruc(2,12,"%i%%\n",actuel);
	
	return actuel;

	
}