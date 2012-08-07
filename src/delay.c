#include "stm8s.h"


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
    /* Decrement nCount value */
		while (nCount != 0)
    {
        Delay(1000);
		nCount--;
    }
}