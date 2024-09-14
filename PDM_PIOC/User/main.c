/********************************** (C) COPYRIGHT *******************************
 * File Name          : main.c
 * Author             : WCH
 * Version            : V1.0.0
 * Date               : 2023/12/26
 * Description        : Main program body.
*********************************************************************************
* Copyright (c) 2021 Nanjing Qinheng Microelectronics Co., Ltd.
* Attention: This software (modified or not) and binary are used for
* microcontroller manufactured by Nanjing Qinheng Microelectronics.
*******************************************************************************/

/************************** (C) COPYRIGHT Update 2024 *****************************
 * Project            : Pulse Density Modulator implemented using PIOC
 * Author             : Mario Javier Burriel Valencia
 * Version            : V1.0.0
 * Date               : 2024/09/14
 * Description        : Core file for demonstration of the capability of the
 *                      PIOC peripheral in a CH32X035G8R6 to implement a PDM
 *                      Digital Analog Converter with a bit resolution of 12 bits.
 *
 *                      A typical PWM modulator using Timer 1 and DMA peripherals
 *                      is also implemented using the same timing parameters for
 *                      the same bit-depth and the same sample data, for comparing
 *                      with the performance of the PDM DAC.
*********************************************************************************/


#include "debug.h"
#include "string.h"
#include "PIOC_SFR.h"

/* CH1CVR register Definition for PWM*/

#define TIM1_CH1CVR_ADDRESS    0x40012C34

/* Private variables */

#define BUFF_SIZE 25

#define DATA_SWITCHER R8_CTRL_RD
#define DATA0_DELTA R32_DATA_REG0_3
#define DATA1_DELTA R32_DATA_REG4_7

/* 12 bits Sine wave table of 25 elements. Sampled at 48000000/35/4096= 334,8Hz */
uint16_t pBuffer[BUFF_SIZE] = {2557, 3035, 3450, 3777, 3996, 4092, 4060, 3901, 3626, 3252, 2802, 2305, 1791, 1294,
                               844, 470, 195, 36, 4, 100, 319, 646, 1061, 1539, 2048};

volatile uint32_t Last_Sample=0, Sample_Index=0;  //These variables will be of use for the PIOC Interrupt Service.


void PIOC_IRQHandler(void) __attribute__((interrupt("WCH-Interrupt-fast")));

/* Source code of the eMCU is in the file "../ASM/PDM_EMCU.asm" */

__attribute__((aligned(16)))  const unsigned char PIOC_CODE[] =
                {0x00,0x00,0x03,0x60,0xFF,0x0F,0x1D,0x01,0x20,0x01,0x21,0x01,0x22,0x01,0x24,0x01,   /* ...`......!.".$. */
                 0x25,0x01,0x26,0x01,0x28,0x01,0x29,0x01,0x2A,0x01,0x30,0x01,0x31,0x01,0x01,0x23,   /* %.&.(.).*.0.1..# */
                 0x1C,0x4F,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,   /* .O.............. */
                 0x20,0x02,0x28,0x1C,0x21,0x02,0x03,0x50,0x21,0x06,0x29,0x1C,0x22,0x02,0x03,0x50,   /* ..(.!..P!.)."..P */
                 0x22,0x06,0x2A,0x1C,0x28,0x02,0x2C,0x1C,0x29,0x02,0x03,0x50,0x29,0x06,0x2D,0x1C,   /* ".*.(.,.)..P).-. */
                 0x2A,0x02,0x03,0x50,0x2A,0x06,0x2E,0x1C,0xE0,0x00,0xB0,0x00,0x30,0x16,0x31,0x15,   /* *..P*.......0.1. */
                 0x31,0x14,0x31,0x5C,0x11,0x60,0x31,0x44,0x20,0x01,0x21,0x01,0x22,0x01,0x1D,0x48,   /* 1.1\.`1D..!."..H */
                 0x1C,0x4F,0x41,0x60,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,   /* .OA`............ */
                 0x00,0x00,0x24,0x02,0x28,0x1C,0x25,0x02,0x03,0x50,0x25,0x06,0x29,0x1C,0x26,0x02,   /* ..$.(.%..P%.).&. */
                 0x03,0x50,0x26,0x06,0x2A,0x1C,0x28,0x02,0x2C,0x1C,0x29,0x02,0x03,0x50,0x29,0x06,   /* .P&.*.(.,.)..P). */
                 0x2D,0x1C,0x2A,0x02,0x03,0x50,0x2A,0x06,0x2E,0x1C,0xE0,0x00,0xB0,0x00,0x30,0x16,   /* -.*..P*.......0. */
                 0x31,0x15,0x31,0x14,0x31,0x5C,0x3A,0x60,0x31,0x44,0x24,0x01,0x25,0x01,0x26,0x01,   /* 1.1.1\:`1D$.%.&. */
                 0x1D,0x40,0x1C,0x4F,0x18,0x60};    /* .@.O.` */

/*********************************************************************
 * @fn      PIOC_INIT
 *
 * @brief   Initializes PIOC,  uses PC18 as OUTPUT
 *
 * @return  none
 */
void PIOC_INIT(void)
{
    GPIO_InitTypeDef GPIO_InitStructure = {0};

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC|RCC_APB2Periph_AFIO, ENABLE);

    GPIO_PinRemapConfig(GPIO_Remap_SWJ_Disable, ENABLE);                // Remap (PC 18)SWDIO pin to PIOC
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_18;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;                   // We are generating a fast bit stream.
    GPIO_Init(GPIOC, &GPIO_InitStructure);                              // hence we need a fast IO.

    NVIC_EnableIRQ( PIOC_IRQn );                                        // enable PIOC interrupt
    NVIC_SetPriority(PIOC_IRQn,0xf0);

    memcpy((uint8_t *)(PIOC_SRAM_BASE),PIOC_CODE,sizeof(PIOC_CODE));    // load code for PIOC
    R8_SYS_CFG |= RB_MST_RESET;                                         // reset PIOC
    R8_SYS_CFG = RB_MST_IO_EN0;                                         // enable IO0
    R8_SYS_CFG |= RB_MST_CLK_GATE;                                      // open PIOC clock

}

/*********************************************************************
 * @fn      GPIO_Toggle_INIT
 *
 * @brief   Initializes GPIOA.0
 *
 * @return  none
 */

void GPIO_Toggle_INIT(void)
{
    GPIO_InitTypeDef GPIO_InitStructure = {0};

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOA, &GPIO_InitStructure);
}

/*********************************************************************
 * @fn      TIM1_PWMOut_Init
 *
 * @brief   Initializes TIM1 PWM output.
 *
 * @param   arr - the period value.
 *          psc - the prescaler value.
 *          ccp - the pulse value.
 *
 * @return  none
 */
void TIM1_PWMOut_Init(u16 arr, u16 psc, u16 ccp)
{
    GPIO_InitTypeDef        GPIO_InitStructure = {0};
    TIM_OCInitTypeDef       TIM_OCInitStructure = {0};
    TIM_TimeBaseInitTypeDef TIM_TimeBaseInitStructure = {0};

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB | RCC_APB2Periph_TIM1, ENABLE);

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure);

    TIM_TimeBaseInitStructure.TIM_Period = arr;
    TIM_TimeBaseInitStructure.TIM_Prescaler = psc;
    TIM_TimeBaseInitStructure.TIM_ClockDivision = TIM_CKD_DIV1;
    TIM_TimeBaseInitStructure.TIM_CounterMode = TIM_CounterMode_Up;
    TIM_TimeBaseInitStructure.TIM_RepetitionCounter = 0;
    TIM_TimeBaseInit(TIM1, &TIM_TimeBaseInitStructure);

    TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_PWM2;
    TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
    TIM_OCInitStructure.TIM_Pulse = ccp;
    TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_High;
    TIM_OC1Init(TIM1, &TIM_OCInitStructure);

    TIM_OC1PreloadConfig(TIM1, TIM_OCPreload_Disable);
    TIM_ARRPreloadConfig(TIM1, ENABLE);
}

/*********************************************************************
 * @fn      TIM1_DMA_Init
 *
 * @brief   Initializes the TIM DMAy Channelx configuration.
 *
 * @param   DMA_CHx -
 *            x can be 1 to 7.
 *          ppadr - Peripheral base address.
 *          memadr - Memory base address.
 *          bufsize - DMA channel buffer size.
 *
 * @return  none
 */
void TIM1_DMA_Init(DMA_Channel_TypeDef *DMA_CHx, u32 ppadr, u32 memadr, u16 bufsize)
{
    DMA_InitTypeDef DMA_InitStructure = {0};

    RCC_AHBPeriphClockCmd(RCC_AHBPeriph_DMA1, ENABLE);

    DMA_DeInit(DMA_CHx);
    DMA_InitStructure.DMA_PeripheralBaseAddr = ppadr;
    DMA_InitStructure.DMA_MemoryBaseAddr = memadr;
    DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralDST;
    DMA_InitStructure.DMA_BufferSize = bufsize;
    DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
    DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
    DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_HalfWord;
    DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_HalfWord;
    DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;
    DMA_InitStructure.DMA_Priority = DMA_Priority_VeryHigh;
    DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;
    DMA_Init(DMA_CHx, &DMA_InitStructure);

    DMA_Cmd(DMA_CHx, ENABLE);
}


/*********************************************************************
 * @fn      main
 *
 * @brief   Main program.
 *
 * @return  none
 */


int main(void)
{
    u8 i = 0;

    NVIC_PriorityGroupConfig(NVIC_PriorityGroup_1);
    SystemCoreClockUpdate();
    Delay_Init();
    USART_Printf_Init(115200);

    /********* Beginning of a safeguard Delay. This avoids having to erase by power down every time
               we have to download new code to the MCU, just connect Vcc right before hitting F8.
    */
    for(short n=0;n<3;n++){
        printf("Safeguard Delay... %d\r\n",3-n);
        Delay_Ms(1000);
    }
    printf("Safeguard passed.\r\n\r\n");
    /********* End of Safeguard delay ********/

    /********* Beginning of Serial printing the debug information *********/
    printf("SystemClk:%d\r\n", SystemCoreClock);
    printf("ChipID:%08x\r\n", DBGMCU_GetCHIPID());
    printf("GPIO Toggle TEST\r\n");
    Delay_Ms(1);           //I forgot to remove this line while debugging and now the code works with it...
    /******** End of printing the debug information ********/

    /******** This code sets up and enables the TIM1 Channel 1 (PB9) for outputting PWM with the sample data
              of pBuffer (25 samples). Timing has been for being the same sample rate of the PDM generated.
     */
    TIM1_PWMOut_Init(4096, 35-1, 2047);
    TIM1_DMA_Init(DMA1_Channel5, (u32)TIM1_CH1CVR_ADDRESS, (u32)pBuffer, BUFF_SIZE);
    TIM_DMACmd(TIM1, TIM_DMA_Update, ENABLE);
    TIM_Cmd(TIM1, ENABLE);
    TIM_CtrlPWMOutputs(TIM1, ENABLE);
    /******** End of PWM code ********/

    GPIO_Toggle_INIT();
    GPIO_WriteBit(GPIOA, GPIO_Pin_0,Bit_SET);       //My code turns on the led at the beginning, just because. (forgot to remove after debug)

    // Here we go with PDM.... From here, PC18 will output a bit stream at a clock rate of 48/35=1.374Mhz.
    PIOC_INIT();

    while(1)
    {
        Delay_Ms(500);
        GPIO_WriteBit(GPIOA, GPIO_Pin_0, (i == 0) ? (i = Bit_SET) : (i = Bit_RESET));
    }
}


/*********************************************************************
 * @fn      PIOC_IRQHandler
 *
 * @brief   This function handles PIOC interrupt, requesting to update
 *          DATA to send to the PDM modulator code every sampling period.
 *
 * @return  none
 */


void PIOC_IRQHandler( void )
{
    int32_t Delta_Value;
    if((R8_SYS_CFG&RB_INT_REQ)!=RESET){                              //If an interrupt was requested from slave core...

        Delta_Value=pBuffer[Sample_Index]-Last_Sample;              //Calculate new Delta value (we interpolate in every output pulse cycle using delta increments)

        Last_Sample=pBuffer[Sample_Index];                           //Update last sample for using in the next cycle.
        Sample_Index++;
        if(Sample_Index==BUFF_SIZE) Sample_Index=0;                   //Update buffer index for pointing to the next sample.
        if(DATA_SWITCHER&0x01) DATA0_DELTA = (uint32_t)Delta_Value;   //If bit 0 of DATA_SWITCHER is set, eMCU is processing DATA 1, then we can update DATA 0.
            else DATA1_DELTA = (uint32_t)Delta_Value;                     //Otherwise, the eMCU is processing DATA 0, so we update DATA 1
        R8_CTRL_RD=11;                                               // False write any value to R8_CTRL_RD, it will clear interrupt flag
    }
}

