/**
  ******************************************************************************
  * File Name          : main.c
  * Description        : Main program body
  ******************************************************************************
  *
  * COPYRIGHT(c) 2017 STMicroelectronics
  *
  * Redistribution and use in source and binary forms, with or without modification,
  * are permitted provided that the following conditions are met:
  *   1. Redistributions of source code must retain the above copyright notice,
  *      this list of conditions and the following disclaimer.
  *   2. Redistributions in binary form must reproduce the above copyright notice,
  *      this list of conditions and the following disclaimer in the documentation
  *      and/or other materials provided with the distribution.
  *   3. Neither the name of STMicroelectronics nor the names of its contributors
  *      may be used to endorse or promote products derived from this software
  *      without specific prior written permission.
  *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "stm32f4xx_hal.h"

/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private variables ---------------------------------------------------------*/
ADC_HandleTypeDef hadc1;
DMA_HandleTypeDef hdma_adc1;

TIM_HandleTypeDef htim10;

/* USER CODE BEGIN PV */
/* Private variables ---------------------------------------------------------*/
uint8_t ALARM=0;  	// przekroczenie 30*C
uint8_t BUTTON=0; 	// przycisk na plytce
uint8_t BUTTON2=0;	// przyciska Joystick
uint16_t PomiarADC[3];
float Temperature;
float Vsense;

const float V25 = 0.76; // [Volts]
const float Avg_slope = 0.0025; //[Volts/degree]
const float SupplyVoltage = 3.0; // [Volts]
const float ADCResolution = 4096.0;
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
void Error_Handler(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_ADC1_Init(void);
static void MX_TIM10_Init(void);

/* USER CODE BEGIN PFP */
/* Private function prototypes -----------------------------------------------*/
void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc);
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim);
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin);
/* USER CODE END PFP */

/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

int main(void)
{

  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration----------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* Configure the system clock */
  SystemClock_Config();

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  MX_ADC1_Init();
  MX_TIM10_Init();

  /* USER CODE BEGIN 2 */
  HAL_TIM_Base_Start_IT(&htim10);
  HAL_ADC_Start_DMA(&hadc1, PomiarADC, 3);
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
  /* USER CODE END WHILE */

  /* USER CODE BEGIN 3 */

  }
  /* USER CODE END 3 */

}

/** System Clock Configuration
*/
void SystemClock_Config(void)
{

  RCC_OscInitTypeDef RCC_OscInitStruct;
  RCC_ClkInitTypeDef RCC_ClkInitStruct;

    /**Configure the main internal regulator output voltage 
    */
  __HAL_RCC_PWR_CLK_ENABLE();

  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

    /**Initializes the CPU, AHB and APB busses clocks 
    */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = 16;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = 8;
  RCC_OscInitStruct.PLL.PLLN = 90;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 4;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

    /**Initializes the CPU, AHB and APB busses clocks 
    */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }

    /**Configure the Systick interrupt time 
    */
  HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq()/1000);

    /**Configure the Systick 
    */
  HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);

  /* SysTick_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);
}

/* ADC1 init function */
static void MX_ADC1_Init(void)
{

  ADC_ChannelConfTypeDef sConfig;

    /**Configure the global features of the ADC (Clock, Resolution, Data Alignment and number of conversion) 
    */
  hadc1.Instance = ADC1;
  hadc1.Init.ClockPrescaler = ADC_CLOCK_SYNC_PCLK_DIV8;
  hadc1.Init.Resolution = ADC_RESOLUTION_12B;
  hadc1.Init.ScanConvMode = ENABLE;
  hadc1.Init.ContinuousConvMode = ENABLE;
  hadc1.Init.DiscontinuousConvMode = DISABLE;
  hadc1.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_NONE;
  hadc1.Init.ExternalTrigConv = ADC_SOFTWARE_START;
  hadc1.Init.DataAlign = ADC_DATAALIGN_RIGHT;
  hadc1.Init.NbrOfConversion = 3;
  hadc1.Init.DMAContinuousRequests = ENABLE;
  hadc1.Init.EOCSelection = ADC_EOC_SINGLE_CONV;
  if (HAL_ADC_Init(&hadc1) != HAL_OK)
  {
    Error_Handler();
  }

    /**Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time. 
    */
  sConfig.Channel = ADC_CHANNEL_TEMPSENSOR;
  sConfig.Rank = 1;
  sConfig.SamplingTime = ADC_SAMPLETIME_480CYCLES;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }

    /**Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time. 
    */
  sConfig.Channel = ADC_CHANNEL_1;
  sConfig.Rank = 2;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }

    /**Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time. 
    */
  sConfig.Channel = ADC_CHANNEL_2;
  sConfig.Rank = 3;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }

}

/* TIM10 init function */
static void MX_TIM10_Init(void)
{

  htim10.Instance = TIM10;
  htim10.Init.Prescaler = 2999;
  htim10.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim10.Init.Period = 9999;
  htim10.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  if (HAL_TIM_Base_Init(&htim10) != HAL_OK)
  {
    Error_Handler();
  }

}

/** 
  * Enable DMA controller clock
  */
static void MX_DMA_Init(void) 
{
  /* DMA controller clock enable */
  __HAL_RCC_DMA2_CLK_ENABLE();

  /* DMA interrupt init */
  /* DMA2_Stream0_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA2_Stream0_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA2_Stream0_IRQn);

}

/** Configure pins as 
        * Analog 
        * Input 
        * Output
        * EVENT_OUT
        * EXTI
*/
static void MX_GPIO_Init(void)
{

  GPIO_InitTypeDef GPIO_InitStruct;

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOD_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOD, LED_Green_Pin|LED_Orange_Pin|LED_Red_Pin|LED_Blue_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pins : Button_Pin Button_2_Pin */
  GPIO_InitStruct.Pin = Button_Pin|Button_2_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pins : LED_Green_Pin LED_Orange_Pin LED_Red_Pin LED_Blue_Pin */
  GPIO_InitStruct.Pin = LED_Green_Pin|LED_Orange_Pin|LED_Red_Pin|LED_Blue_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);

  /* EXTI interrupt init*/
  HAL_NVIC_SetPriority(EXTI0_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(EXTI0_IRQn);

  HAL_NVIC_SetPriority(EXTI3_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(EXTI3_IRQn);

}

/* USER CODE BEGIN 4 */
void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)
	{
	 Vsense = (SupplyVoltage*PomiarADC[0])/(ADCResolution-1); // Przeliczenie wartosci zmierzonej na napiecie
	 Temperature = ((Vsense-V25)/Avg_slope)+25; // Obliczenie temperatury
	 if(Temperature>30)
		 {HAL_GPIO_WritePin(GPIOD, LED_Green_Pin|LED_Orange_Pin|LED_Red_Pin|LED_Blue_Pin, GPIO_PIN_RESET);
		 ALARM=1;}
	 else
 	 	 {
		 ALARM=0;
		 if(BUTTON2==0)
			 {
			 //________ Prawo-lewo
			 if(PomiarADC[1]<1000)
				 {HAL_GPIO_WritePin(LED_Red_GPIO_Port,LED_Red_Pin,SET);}

			 else if(PomiarADC[1]>=1000)
				 {HAL_GPIO_WritePin(LED_Red_GPIO_Port,LED_Red_Pin,RESET);}

			 if(PomiarADC[1]>3000)
				 {HAL_GPIO_WritePin(LED_Green_GPIO_Port,LED_Green_Pin,SET);}

			 else if(PomiarADC[1]<=3000)
				 {HAL_GPIO_WritePin(LED_Green_GPIO_Port,LED_Green_Pin,RESET);}
			 //_________Gora-dol
			 if(PomiarADC[2]<1000)
				 {HAL_GPIO_WritePin(LED_Blue_GPIO_Port,LED_Blue_Pin,SET);}

			 else if(PomiarADC[2]>=1000)
				 {HAL_GPIO_WritePin(LED_Blue_GPIO_Port,LED_Blue_Pin,RESET);}

			 if(PomiarADC[2]>3000)
				 {HAL_GPIO_WritePin(LED_Orange_GPIO_Port,LED_Orange_Pin,SET);}

			 else if(PomiarADC[2]<=3000)
				 {HAL_GPIO_WritePin(LED_Orange_GPIO_Port,LED_Orange_Pin,RESET);}
			 }
		 if(BUTTON2==1)
		 	 {
			 //________ Prawo-lewo
			 if(PomiarADC[1]>3000)
				 {HAL_GPIO_WritePin(LED_Red_GPIO_Port,LED_Red_Pin,SET);}

			 else if(PomiarADC[1]<=3000)
				 {HAL_GPIO_WritePin(LED_Red_GPIO_Port,LED_Red_Pin,RESET);}

			 if(PomiarADC[1]<=1000)
				 {HAL_GPIO_WritePin(LED_Green_GPIO_Port,LED_Green_Pin,SET);}

			 else if(PomiarADC[1]>=1000)
				 {HAL_GPIO_WritePin(LED_Green_GPIO_Port,LED_Green_Pin,RESET);}
			 //_________Gora-dol
			 if(PomiarADC[2]>3000)
				 {HAL_GPIO_WritePin(LED_Blue_GPIO_Port,LED_Blue_Pin,SET);}

			 else if(PomiarADC[2]<=3000)
				 {HAL_GPIO_WritePin(LED_Blue_GPIO_Port,LED_Blue_Pin,RESET);}

			 if(PomiarADC[2]<1000)
				 {HAL_GPIO_WritePin(LED_Orange_GPIO_Port,LED_Orange_Pin,SET);}

			 else if(PomiarADC[2]>=1000)
				 {HAL_GPIO_WritePin(LED_Orange_GPIO_Port,LED_Orange_Pin,RESET);}
		 	 }
 	 	 }

	}

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
	{
	 if(htim->Instance == TIM10)// Je¿eli przerwanie pochodzi od timera 10
		 {
		 if( (ALARM==1) && (BUTTON==0) )
			 {
			 HAL_GPIO_TogglePin(LED_Blue_GPIO_Port, LED_Blue_Pin);
			 HAL_GPIO_TogglePin(LED_Orange_GPIO_Port, LED_Orange_Pin);
			 HAL_GPIO_TogglePin(LED_Red_GPIO_Port, LED_Red_Pin);
			 HAL_GPIO_TogglePin(LED_Green_GPIO_Port, LED_Green_Pin);
			 }
		 else if( (ALARM==0) || (BUTTON==1) )
		 	 {
			 if(BUTTON==1)
			 	 {HAL_GPIO_WritePin(GPIOD, LED_Green_Pin|LED_Orange_Pin|LED_Red_Pin|LED_Blue_Pin, GPIO_PIN_RESET);}
			 if(ALARM==0)
			 	 {BUTTON=0;}

		 	 }
		 }
	}
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin) //obsluga przyciskow
	{
	if(GPIO_Pin == Button_Pin)
		{BUTTON=1;}
	else if(GPIO_Pin == Button_2_Pin)
			{
			if(BUTTON2==0)
				{BUTTON2=1;}
			else if(BUTTON2==1)
				{BUTTON2=0;}
			}
	}
/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @param  None
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler */
  /* User can add his own implementation to report the HAL error return state */
  while(1) 
  {
  }
  /* USER CODE END Error_Handler */ 
}

#ifdef USE_FULL_ASSERT

/**
   * @brief Reports the name of the source file and the source line number
   * where the assert_param error has occurred.
   * @param file: pointer to the source file name
   * @param line: assert_param error line source number
   * @retval None
   */
void assert_failed(uint8_t* file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
    ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */

}

#endif

/**
  * @}
  */ 

/**
  * @}
*/ 

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
