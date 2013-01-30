#include "stm8s.h"

volatile u16 milisec = 0;

void Delay(u16 nCount)
{
	/* Decrement nCount value */
	nCount = nCount * 3;
	while (nCount != 0)
	{
		nCount--;
	}
}

void Delayms(u16 nCount)
{
	milisec = nCount;
	while (milisec != 0);
}

void decmilisec(void)
{
	if (milisec != 0) milisec--;
}