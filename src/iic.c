#include "iic.h"
#include "delay.h"

_Bool ret;


void tempo(void) // delai de x µs
{
	Delay(4);
}

void demitempo(void) // delai de x/2 µs
{
	Delay(2);
}

void iic_start(void) //- La condition de départ. ( SDA passe à '0' alors que SCL est à '1' )
{
	SDA1      
	SCL1
	tempo();
	SDA0
	demitempo();
	SCL0
	demitempo(); 
}   

void iic_stop(void) //- La condition d'arrèt. ( SDA passe à '1' alors que SCL est à '1' )
{
	SDA0
	demitempo();
	SCL1
	demitempo();
	SDA1
	demitempo();
	SCL0 
	demitempo();
	SDA0
}

void iic_ack(void) // Met SDA a 0
{
	SCL0
	SDA0
	demitempo();
	SCL1
	tempo();
	SCL0
	demitempo();
}

void iic_nack(void) // Met SDA a 1
{
	SCL0
	SDA1
	demitempo();
	SCL1
	tempo();
	SCL0
	SDA0
	demitempo();
}

void iic_attend_ack(void) // Detecte le ack de la eeprom (renvoi 1 si il y a ack)
{
	SDA1
	demitempo();
	SCL1
	tempo();
	ret = !sda
	SCL0
	demitempo;
	SDA0
	if(!ret) iic_stop();
} 

void iic_envoi_16bit(u16 adresse)
{
	iic_envoi_byte((adresse & 0xFF00) >> 8); //MSB
	iic_attend_ack();
	if (!ret) return;
	iic_envoi_byte((adresse & 0x00FF)); //LSB
	iic_attend_ack();
	if (!ret) return;
}

u8 iic_recoi_byte(void) // Recoi un octet
{
	u8 i;
	u8 receive;

	SCL0
	receive=0;
	SDA1
	for(i=0;i<8;i++)
	{
		demitempo();
		SCL1
		receive<<=1;
		tempo();
		ret = sda
		if(ret) receive+=1;   
		SCL0 
		demitempo();
	}
	SDA0
	return receive;
}

_Bool iic_lire(u16 adresse,u8* pdat,u8 taille)
{
	ret = 1;
	iic_start();
	iic_envoi_byte(0xa0); 
	iic_attend_ack();
	if (!ret) return ret;
	iic_envoi_16bit(adresse);
	if (!ret) return ret;
	iic_start();
	iic_envoi_byte(0xa1);
	iic_attend_ack();
	if (!ret) return ret;
	while (taille>1)
	{
		*pdat = iic_recoi_byte();
		iic_ack();
		*pdat++;
		taille--;	
	}
	*pdat = iic_recoi_byte();
	iic_nack();	
	iic_stop();
	return 1;
}

void iic_envoi_byte(u8 octet) // Envoi un octet
{                        
	u8 i;
	u8 temp;
	
	SCL0
	for(i=0;i<8;i++)
	{              
		temp = octet;
		temp>>=7;
		if (temp == 1) SDA1
		else SDA0
		octet<<=1;
		demitempo();
		SCL1
		tempo();
		SCL0
		demitempo();
		SDA0
	}  
}      

_Bool iic_ecrire(u16 adresse,u8* pdonnee,u8 taille) // renvoi 1 si acquité par la prom
{
	u8 donnee;
	
	ret = TRUE;
	iic_start();
	iic_envoi_byte(0xa0); 
	iic_attend_ack();
	if (!ret) return ret;
	iic_envoi_16bit(adresse);
	if (!ret) return ret;
	while (taille>0)
	{
		donnee = *pdonnee;
		iic_envoi_byte(donnee);
		iic_attend_ack();
		*pdonnee++;
		taille--;
		if (!ret) return ret;
	}
	iic_stop();
	Delayms(6);
}

