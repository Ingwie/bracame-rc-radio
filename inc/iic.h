#ifndef IIC_H
#define IIC_H
#include "stm8s.h"



#define SDA1			GPIO_WriteHigh(GPIOE, GPIO_PIN_2);
#define SCL1			GPIO_WriteHigh(GPIOE, GPIO_PIN_1);
#define SDA0			GPIO_WriteLow(GPIOE, GPIO_PIN_2);
#define SCL0			GPIO_WriteLow(GPIOE, GPIO_PIN_1);
#define sda				GPIO_ReadInputPin(GPIOE,GPIO_PIN_2);
//#define scl				GPIO_ReadInputPin(GPIOE,GPIO_PIN_1);
#define taille_page		32


void iic_stop(void);
void iic_start(void);
void iic_ack(void);
void iic_nack(void);
void iic_attend_ack(void);
void iic_envoi_byte(u8 octet);
u8 iic_recoi_byte(void);
_Bool iic_ecrire(u16 adresse,u8* pdonnee,u8 taille); // renvoi TRUE si acquité par la prom
_Bool iic_lire(u16 adresse,u8* pdat,u8 taille);
void iic_envoi_16bit(u16 adresse);











#endif
