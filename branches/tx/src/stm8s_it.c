/**
******************************************************************************
* @file stm8s_it.c
* @brief This file contains all the interrupt routines, for Cosmic compiler.
* @author STMicroelectronics - MCD Application Team
* @version V1.1.1
* @date 06/05/2009
******************************************************************************
*
* THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
* WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
* TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
* DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
* FROM THE CONTENT O²	F SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
* CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
*
* <h2><center>&copy; COPYRIGHT 2009 STMicroelectronics</center></h2>
* @image html logo.bmp
******************************************************************************
*/

/* Includes ------------------------------------------------------------------*/
#include "stm8s_it.h"
#include "tx.h"
#include "hd44780.h"
#include "main.h"
/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
_Bool sec = 0;
_Bool Menu_on = 0;
_Bool Menu_actif = 0;
_Bool popup = 0;
_Bool Menu_raz = 0;
_Bool synchro = 0;

u8 channel = 0;
u8 Tempo_menu;
extern _Bool trimdyn;
extern _Bool trimdynencour;
extern u8 temptrimdyn;
extern u8 secondesurcinq;
extern u8 secondes;
extern u8 minutes;
extern u8 tempsbip1;
extern u8 tempsbip2;
extern u8 tempsbip3;
extern u8 tempsbip4;
extern u8 tempsbip5;
extern u8 tempotrimdyn;
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/* Public functions ----------------------------------------------------------*/

/** @addtogroup IT_Functions
* @{
*/
#ifdef _COSMIC_
/**
* @brief Dummy interrupt routine
* @par Parameters:
* None
* @retval
* None
*/
@far @interrupt void NonHandledInterrupt(void)
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}

/**
* @brief TRAP interrupt routine
* @par Parameters:
* None
* @retval
* None
*/
@far @interrupt void TRAP_IRQHandler(void)
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}
#else /*_RAISONANCE_*/

/**
* @brief TRAP interrupt routine
* @par Parameters:
* None
* @retval
* None
*/
void TRAP_IRQHandler(void) trap
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}
#endif /*_COSMIC_*/

/**
* @brief Top Level Interrupt Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void TLI_IRQHandler(void)
#else /* _RAISONANCE_ */
void TLI_IRQHandler(void) interrupt 0
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}

/**
* @brief Auto Wake Up Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void AWU_IRQHandler(void)
#else /* _RAISONANCE_ */
void AWU_IRQHandler(void) interrupt 1
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}

/**
* @brief Clock Controller Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void CLK_IRQHandler(void)
#else /* _RAISONANCE_ */
void CLK_IRQHandler(void) interrupt 2
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}

/**
* @brief External Interrupt PORTA Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void EXTI_PORTA_IRQHandler(void)
#else /* _RAISONANCE_ */
void EXTI_PORTA_IRQHandler(void) interrupt 3
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}

/**
* @brief External Interrupt PORTB Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void EXTI_PORTB_IRQHandler(void)
#else /* _RAISONANCE_ */
void EXTI_PORTB_IRQHandler(void) interrupt 4
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}

/**
* @brief External Interrupt PORTC Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void EXTI_PORTC_IRQHandler(void)
#else /* _RAISONANCE_ */
void EXTI_PORTC_IRQHandler(void) interrupt 5
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}

/**
* @brief External Interrupt PORTD Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void EXTI_PORTD_IRQHandler(void)
#else /* _RAISONANCE_ */
void EXTI_PORTD_IRQHandler(void) interrupt 6
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}

/**
* @brief External Interrupt PORTE Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void EXTI_PORTE_IRQHandler(void)
#else /* _RAISONANCE_ */
void EXTI_PORTE_IRQHandler(void) interrupt 7
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}
#ifdef STM8S903
/**
* @brief External Interrupt PORTF Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void EXTI_PORTF_IRQHandler(void)
#else /* _RAISONANCE_ */
void EXTI_PORTF_IRQHandler(void) interrupt 8
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}
#endif /*STM8S903*/

#ifdef STM8S208
/**
* @brief CAN RX Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void CAN_RX_IRQHandler(void)
#else /* _RAISONANCE_ */
void CAN_RX_IRQHandler(void) interrupt 8
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}

/**
* @brief CAN TX Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void CAN_TX_IRQHandler(void)
#else /* _RAISONANCE_ */
void CAN_TX_IRQHandler(void) interrupt 9
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}
#endif /*STM8S208*/

/**
* @brief SPI Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void SPI_IRQHandler(void)
#else /* _RAISONANCE_ */
void SPI_IRQHandler(void) interrupt 10
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}

/**
* @brief Timer1 Update/Overflow/Trigger/Break Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void TIM1_UPD_OVF_TRG_BRK_IRQHandler(void)
#else /* _RAISONANCE_ */
void TIM1_UPD_OVF_TRG_BRK_IRQHandler(void) interrupt 11
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}

/**
* @brief Timer1 Capture/Compare Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void TIM1_CAP_COM_IRQHandler(void)
#else /* _RAISONANCE_ */
void TIM1_CAP_COM_IRQHandler(void) interrupt 12
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}

#ifdef STM8S903
/**
* @brief Timer5 Update/Overflow/Break/Trigger Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void TIM5_UPD_OVF_BRK_TRG_IRQHandler(void)
#else /* _RAISONANCE_ */
void TIM5_UPD_OVF_BRK_TRG_IRQHandler(void) interrupt 13
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}
/**
* @brief Timer5 Capture/Compare Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void TIM5_CAP_COM_IRQHandler(void)
#else /* _RAISONANCE_ */
void TIM5_CAP_COM_IRQHandler(void) interrupt 14
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}

#else /*STM8S208, STM8S207, STM8S105 or STM8S103*/
/**
* @brief Timer2 Update/Overflow/Break Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void TIM2_UPD_OVF_BRK_IRQHandler(void)
#else /* _RAISONANCE_ */
void TIM2_UPD_OVF_BRK_IRQHandler(void) interrupt 13
#endif /* _COSMIC_ */
{
	/* Timer2 Update/Overflow/Break Interrupt routine
*/

	if(channel == 0)
	{	
		synchro = 1;
	}	
	
	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
}

/**
* @brief Timer2 Capture/Compare Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void TIM2_CAP_COM_IRQHandler(void)
#else /* _RAISONANCE_ */
void TIM2_CAP_COM_IRQHandler(void) interrupt 14
#endif /* _COSMIC_ */
{
	/* Timer2 Capture/Compare Interrupt routine. 
*/
	
	TIM2_SetAutoreload(output.usValueOut[channel]);
	
	if(channel != NUM_OUTPUT)
	{
		channel++;
	}
	else
	{
		// Boucle principale
		calcultrame();
	}
	TIM2_ClearITPendingBit(TIM2_IT_CC2);
}
#endif /*STM8S903*/

#if defined (STM8S208) || defined(STM8S207) || defined(STM8S105)
/**
* @brief Timer3 Update/Overflow/Break Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void TIM3_UPD_OVF_BRK_IRQHandler(void)
#else /* _RAISONANCE_ */
void TIM3_UPD_OVF_BRK_IRQHandler(void) interrupt 15
#endif /* _COSMIC_ */
{  
	Menu_on = 1;
	secondesurcinq++;
	sec = 1;

	if (tempotrimdyn != 0) 
	{
	
		tempotrimdyn--;
		
		if (tempotrimdyn == 1)
		{
			trimdynencour = 0;
			bip(1,0,0,0,0);

			
		}
	}
	
	if (tempsbip5 != 0)
	{
		if (tempsbip1 == 1) GPIO_WriteHigh(GPIOD,GPIO_PIN_4); //off
		if (tempsbip2 == 1) GPIO_WriteLow(GPIOD,GPIO_PIN_4); //on .. etc
		if (tempsbip3 == 1) GPIO_WriteHigh(GPIOD,GPIO_PIN_4);
		if (tempsbip4 == 1) GPIO_WriteLow(GPIOD,GPIO_PIN_4);
		if (tempsbip5 == 1) GPIO_WriteHigh(GPIOD,GPIO_PIN_4);

		tempsbip1--;
		tempsbip2--;
		tempsbip3--;
		tempsbip4--;
		tempsbip5--;
	}

	if (secondesurcinq == 5)
	{
		secondesurcinq = 0;
		secondes++;


		if (Menu_actif) Tempo_menu++;

		if (Menu_raz)
		{
			Tempo_menu = 0;
			Menu_raz = 0;
		}
		
		if (Tempo_menu == 10)
		{
			LCD_CLEAR_DISPLAY();
			Menu_actif = 0;
			popup = 0;
			Tempo_menu = 0;
		}
	}
	
	if (secondes == 60)
	{
		secondes = 0;
		minutes++;
	}
	
	if (minutes == 60)
	{
		minutes = 0;
	}
	
	TIM3_ClearITPendingBit(TIM3_IT_UPDATE);



}

/**
* @brief Timer3 Capture/Compare Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void TIM3_CAP_COM_IRQHandler(void)
#else /* _RAISONANCE_ */
void TIM3_CAP_COM_IRQHandler(void) interrupt 16
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}
#endif /*STM8S208, STM8S207 or STM8S105*/

#ifndef STM8S105
/**
* @brief UART1 TX Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void UART1_TX_IRQHandler(void)
#else /* _RAISONANCE_ */
void UART1_TX_IRQHandler(void) interrupt 17
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}

/**
* @brief UART1 RX Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void UART1_RX_IRQHandler(void)
#else /* _RAISONANCE_ */
void UART1_RX_IRQHandler(void) interrupt 18
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}
#endif /*STM8S105*/

/**
* @brief I2C Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void I2C_IRQHandler(void)
#else /* _RAISONANCE_ */
void I2C_IRQHandler(void) interrupt 19
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}

#ifdef STM8S105
/**
* @brief UART2 TX interrupt routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void UART2_TX_IRQHandler(void)
#else /* _RAISONANCE_ */
void UART2_TX_IRQHandler(void) interrupt 20
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
	*/
}

/**
* @brief UART2 RX interrupt routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void UART2_RX_IRQHandler(void)
#else /* _RAISONANCE_ */
void UART2_RX_IRQHandler(void) interrupt 21
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
	*/
}
#endif /* STM8S105*/

#if defined(STM8S207) || defined(STM8S208)
/**
* @brief UART3 TX interrupt routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void UART3_TX_IRQHandler(void)
#else /* _RAISONANCE_ */
void UART3_TX_IRQHandler(void) interrupt 20
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
	*/
}

/**
* @brief UART3 RX interrupt routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void UART3_RX_IRQHandler(void)
#else /* _RAISONANCE_ */
void UART3_RX_IRQHandler(void) interrupt 21
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
	*/
}
#endif /*STM8S208 or STM8S207*/

#if defined(STM8S207) || defined(STM8S208)
/**
* @brief ADC2 interrupt routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void ADC2_IRQHandler(void)
#else /* _RAISONANCE_ */
void ADC2_IRQHandler(void) interrupt 22
#endif /* _COSMIC_ */
{

	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
	*/
	return;

}
#else /*STM8S105, STM8S103 or STM8S903*/
/**
* @brief ADC1 interrupt routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void ADC1_IRQHandler(void)
#else /* _RAISONANCE_ */
void ADC1_IRQHandler(void) interrupt 22
#endif /* _COSMIC_ */
{

	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
	*/
	return;

}
#endif /*STM8S208 or STM8S207*/

#ifdef STM8S903
/**
* @brief Timer6 Update/Overflow/Trigger Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void TIM6_UPD_OVF_TRG_IRQHandler(void)
#else /* _RAISONANCE_ */
void TIM6_UPD_OVF_TRG_IRQHandler(void) interrupt 23
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}
#else /*STM8S208, STM8S207, STM8S105 or STM8S103*/
/**
* @brief Timer4 Update/Overflow Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void TIM4_UPD_OVF_IRQHandler(void)
#else /* _RAISONANCE_ */
void TIM4_UPD_OVF_IRQHandler(void) interrupt 23
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}
#endif /*STM8S903*/

/**
* @brief Eeprom EEC Interruption routine.
* @par Parameters:
* None
* @retval
* None
*/
#ifdef _COSMIC_
@far @interrupt void EEPROM_EEC_IRQHandler(void)
#else /* _RAISONANCE_ */
void EEPROM_EEC_IRQHandler(void) interrupt 24
#endif /* _COSMIC_ */
{
	/* In order to detect unexpected events during development,
	it is recommended to set a breakpoint on the following instruction.
*/
}

/**
* @}
*/

/******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/
