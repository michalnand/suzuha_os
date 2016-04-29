#include "int_def.h"

#include "driverlib/fpu.h"

// Memory locations defined by the linker
extern uint32_t __heap_start[];
extern uint32_t __StackTop[];
extern uint32_t __data_start__[], __data_end__[];
extern uint32_t __bss_start__[], __bss_end__[];
extern uint32_t __etext[];                // End of code/flash

void _reset_init(void)    __attribute__((naked, aligned(8)));
extern int main(void);

void __attribute__((interrupt("IRQ"))) Default_Handler()
{
    while (1)
    {
        __asm("nop");
    }
}

static void __attribute__((naked)) HardFault_Handler(void)
{
    while (1)
    {
        __asm("nop");
    }
}


void NMI_Handler() __attribute__ ((weak, alias("Default_Handler")));
//  void HardFault_Handler() __attribute__ ((weak, alias("Default_Handler")));
void MemManage_Handler() __attribute__ ((weak, alias("Default_Handler")));
void BusFault_Handler() __attribute__ ((weak, alias("Default_Handler")));
void UsageFault_Handler() __attribute__ ((weak, alias("Default_Handler")));
void SVCall_Handler() __attribute__ ((weak, alias("Default_Handler")));
void DebugMonitor_Handler() __attribute__ ((weak, alias("Default_Handler")));
void Reserved_Handler() __attribute__ ((weak, alias("Default_Handler")));
void PendSV_Handler() __attribute__ ((weak, alias("Default_Handler")));
void SysTick_Handler() __attribute__ ((weak, alias("Default_Handler")));

    /* Interrupts */
void GPIOPortA_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortB_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortC_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortD_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortE_Handler() __attribute__ ((weak, alias("Default_Handler")));
void UART0RXTX_Handler() __attribute__ ((weak, alias("Default_Handler")));
void UART1RXTX_Handler() __attribute__ ((weak, alias("Default_Handler")));
void SSIORXTX_Handler() __attribute__ ((weak, alias("Default_Handler")));
void I2C0_Handler() __attribute__ ((weak, alias("Default_Handler")));
void PWMFault_Handler() __attribute__ ((weak, alias("Default_Handler")));
void PWMGen0_Handler() __attribute__ ((weak, alias("Default_Handler")));
void PWMGen1_Handler() __attribute__ ((weak, alias("Default_Handler")));
void PWMGen2_Handler() __attribute__ ((weak, alias("Default_Handler")));
void QuadratureEncoder0_Handler() __attribute__ ((weak, alias("Default_Handler")));
void ADCSeq0_Handler() __attribute__ ((weak, alias("Default_Handler")));
void ADCSeq1_Handler() __attribute__ ((weak, alias("Default_Handler")));
void ADCSeq2_Handler() __attribute__ ((weak, alias("Default_Handler")));
void ADCSeq3_Handler() __attribute__ ((weak, alias("Default_Handler")));
void Watchdog_Handler() __attribute__ ((weak, alias("Default_Handler")));
void Timer0A_Handler() __attribute__ ((weak, alias("Default_Handler")));
void Timer0B_Handler() __attribute__ ((weak, alias("Default_Handler")));
void Timer1A_Handler() __attribute__ ((weak, alias("Default_Handler")));
void Timer1B_Handler() __attribute__ ((weak, alias("Default_Handler")));
void Timer2A_Handler() __attribute__ ((weak, alias("Default_Handler")));
void Timer2B_Handler() __attribute__ ((weak, alias("Default_Handler")));
void AnalogComparator0_Handler() __attribute__ ((weak, alias("Default_Handler")));
void AnalogComparator1_Handler() __attribute__ ((weak, alias("Default_Handler")));
void AnalogComparator2_Handler() __attribute__ ((weak, alias("Default_Handler")));
void SystemControl_Handler() __attribute__ ((weak, alias("Default_Handler")));
void FlashControl_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortF_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortG_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortH_Handler() __attribute__ ((weak, alias("Default_Handler")));
void UART2RXTX_Handler() __attribute__ ((weak, alias("Default_Handler")));
void SSI1RXTX_Handler() __attribute__ ((weak, alias("Default_Handler")));
void Timer3A_Handler() __attribute__ ((weak, alias("Default_Handler")));
void Timer3B_Handler() __attribute__ ((weak, alias("Default_Handler")));
void I2C1_Handler() __attribute__ ((weak, alias("Default_Handler")));
void QuadratureEncoder1_Handler() __attribute__ ((weak, alias("Default_Handler")));
void CAN0_Handler() __attribute__ ((weak, alias("Default_Handler")));
void CAN1_Handler() __attribute__ ((weak, alias("Default_Handler")));
void CAN2_Handler() __attribute__ ((weak, alias("Default_Handler")));
void Ethernet_Handler() __attribute__ ((weak, alias("Default_Handler")));
void Hibernate_Handler() __attribute__ ((weak, alias("Default_Handler")));
void USB0_Handler() __attribute__ ((weak, alias("Default_Handler")));
void PWMGen3_Handler() __attribute__ ((weak, alias("Default_Handler")));
void uDMASoftwareTransfer_Handler() __attribute__ ((weak, alias("Default_Handler")));
void uDMAError() __attribute__ ((weak, alias("Default_Handler")));
void ADC1Sequence0_Handler() __attribute__ ((weak, alias("Default_Handler")));
void ADC1Sequence1_Handler() __attribute__ ((weak, alias("Default_Handler")));
void ADC1Sequence2_Handler() __attribute__ ((weak, alias("Default_Handler")));
void ADC1Sequence3_Handler() __attribute__ ((weak, alias("Default_Handler")));
void I2S0_Handler() __attribute__ ((weak, alias("Default_Handler")));
void ExternalBusInterface0_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortJ() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortK() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortL() __attribute__ ((weak, alias("Default_Handler")));
void SSI2_Handler() __attribute__ ((weak, alias("Default_Handler")));
void SSI3_Handler() __attribute__ ((weak, alias("Default_Handler")));
void UART3RXTX_Handler() __attribute__ ((weak, alias("Default_Handler")));
void UART4RXTX_Handler() __attribute__ ((weak, alias("Default_Handler")));
void UART5RXTX_Handler() __attribute__ ((weak, alias("Default_Handler")));
void UART6RXTX_Handler() __attribute__ ((weak, alias("Default_Handler")));
void UART7RXTX_Handler() __attribute__ ((weak, alias("Default_Handler")));
void I2C2_Handler() __attribute__ ((weak, alias("Default_Handler")));
void I2C3_Handler() __attribute__ ((weak, alias("Default_Handler")));
void Timer4A_Handler() __attribute__ ((weak, alias("Default_Handler")));
void Timer4B_Handler() __attribute__ ((weak, alias("Default_Handler")));
void Timer5A_Handler() __attribute__ ((weak, alias("Default_Handler")));
void Timer5B_Handler() __attribute__ ((weak, alias("Default_Handler")));
void WideTimer0A_Handler() __attribute__ ((weak, alias("Default_Handler")));
void WideTimer0B_Handler() __attribute__ ((weak, alias("Default_Handler")));
void WideTimer1A_Handler() __attribute__ ((weak, alias("Default_Handler")));
void WideTimer1B_Handler() __attribute__ ((weak, alias("Default_Handler")));
void WideTimer2A_Handler() __attribute__ ((weak, alias("Default_Handler")));
void WideTimer2B_Handler() __attribute__ ((weak, alias("Default_Handler")));
void WideTimer3A_Handler() __attribute__ ((weak, alias("Default_Handler")));
void WideTimer3B_Handler() __attribute__ ((weak, alias("Default_Handler")));
void WideTimer4A_Handler() __attribute__ ((weak, alias("Default_Handler")));
void WideTimer4B_Handler() __attribute__ ((weak, alias("Default_Handler")));
void WideTimer5A_Handler() __attribute__ ((weak, alias("Default_Handler")));
void WideTimer5B_Handler() __attribute__ ((weak, alias("Default_Handler")));
void FPU_Handler() __attribute__ ((weak, alias("Default_Handler")));
void PECI0_Handler() __attribute__ ((weak, alias("Default_Handler")));
void LPC0_Handler() __attribute__ ((weak, alias("Default_Handler")));
void I2C4_Handler() __attribute__ ((weak, alias("Default_Handler")));
void I2C5_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortM_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortN_Handler() __attribute__ ((weak, alias("Default_Handler")));
void QuadratureEncoder2_Handler() __attribute__ ((weak, alias("Default_Handler")));
void Fan0_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortP_P0_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortP1_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortP2_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortP3_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortP4_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortP5_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortP6_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortP7_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortQ_Q0_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortQ1_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortQ2_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortQ3_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortQ4_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortQ5_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortQ6_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortQ7_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortR_Handler() __attribute__ ((weak, alias("Default_Handler")));
void GPIOPortS_Handler() __attribute__ ((weak, alias("Default_Handler")));
void PWM1Gen0_Handler() __attribute__ ((weak, alias("Default_Handler")));
void PWM1Gen1_Handler() __attribute__ ((weak, alias("Default_Handler")));
void PWM1Gen2_Handler() __attribute__ ((weak, alias("Default_Handler")));
void PWM1Gen3_Handler() __attribute__ ((weak, alias("Default_Handler")));
void PWM1Fault_Handler() __attribute__ ((weak, alias("Default_Handler")));




void (* const InterruptVector[])() __attribute__ ((section(".isr_vector"))) =
{
    (void(*)(void)) (int)__StackTop,
    _reset_init,
    NMI_Handler,
    HardFault_Handler,
    MemManage_Handler,
    BusFault_Handler,
    UsageFault_Handler,
    0,
    0,
    0,
    0,
    SVCall_Handler,
    DebugMonitor_Handler,
    Reserved_Handler,
    PendSV_Handler,
    SysTick_Handler,

    /* Interrupts */
    GPIOPortA_Handler,
    GPIOPortB_Handler,
    GPIOPortC_Handler,
    GPIOPortD_Handler,
    GPIOPortE_Handler,
    UART0RXTX_Handler,
    UART1RXTX_Handler,
    SSIORXTX_Handler,
    I2C0_Handler,
    PWMFault_Handler,
    PWMGen0_Handler,
    PWMGen1_Handler,
    PWMGen2_Handler,
    QuadratureEncoder0_Handler,
    ADCSeq0_Handler,
    ADCSeq1_Handler,
    ADCSeq2_Handler,
    ADCSeq3_Handler,
    Watchdog_Handler,
    Timer0A_Handler,
    Timer0B_Handler,
    Timer1A_Handler,
    Timer1B_Handler,
    Timer2A_Handler,
    Timer2B_Handler,
    AnalogComparator0_Handler,
    AnalogComparator1_Handler,
    AnalogComparator2_Handler,
    SystemControl_Handler,
    FlashControl_Handler,
    GPIOPortF_Handler,
    GPIOPortG_Handler,
    GPIOPortH_Handler,
    UART2RXTX_Handler,
    SSI1RXTX_Handler,
    Timer3A_Handler,
    Timer3B_Handler,
    I2C1_Handler,
    QuadratureEncoder1_Handler,
    CAN0_Handler,
    CAN1_Handler,
    CAN2_Handler,
    Ethernet_Handler,
    Hibernate_Handler,
    USB0_Handler,
    PWMGen3_Handler,
    uDMASoftwareTransfer_Handler,
    uDMAError,
    ADC1Sequence0_Handler,
    ADC1Sequence1_Handler,
    ADC1Sequence2_Handler,
    ADC1Sequence3_Handler,
    I2S0_Handler,
    ExternalBusInterface0_Handler,
    GPIOPortJ,
    GPIOPortK,
    GPIOPortL,
    SSI2_Handler,
    SSI3_Handler,
    UART3RXTX_Handler,
    UART4RXTX_Handler,
    UART5RXTX_Handler,
    UART6RXTX_Handler,
    UART7RXTX_Handler,
    0,
    0,
    0,
    0,
    I2C2_Handler,
    I2C3_Handler,
    Timer4A_Handler,
    Timer4B_Handler,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    Timer5A_Handler,
    Timer5B_Handler,
    WideTimer0A_Handler,
    WideTimer0B_Handler,
    WideTimer1A_Handler,
    WideTimer1B_Handler,
    WideTimer2A_Handler,
    WideTimer2B_Handler,
    WideTimer3A_Handler,
    WideTimer3B_Handler,
    WideTimer4A_Handler,
    WideTimer4B_Handler,
    WideTimer5A_Handler,
    WideTimer5B_Handler,
    FPU_Handler,
    PECI0_Handler,
    LPC0_Handler,
    I2C4_Handler,
    I2C5_Handler,
    GPIOPortM_Handler,
    GPIOPortN_Handler,
    QuadratureEncoder2_Handler,
    Fan0_Handler,
    0,
    GPIOPortP_P0_Handler,
    GPIOPortP1_Handler,
    GPIOPortP2_Handler,
    GPIOPortP3_Handler,
    GPIOPortP4_Handler,
    GPIOPortP5_Handler,
    GPIOPortP6_Handler,
    GPIOPortP7_Handler,
    GPIOPortQ_Q0_Handler,
    GPIOPortQ1_Handler,
    GPIOPortQ2_Handler,
    GPIOPortQ3_Handler,
    GPIOPortQ4_Handler,
    GPIOPortQ5_Handler,
    GPIOPortQ6_Handler,
    GPIOPortQ7_Handler,
    GPIOPortR_Handler,
    GPIOPortS_Handler,
    PWM1Gen0_Handler,
    PWM1Gen1_Handler,
    PWM1Gen2_Handler,
    PWM1Gen3_Handler,
    PWM1Fault_Handler
};

// ----------------------------------------------------------------------------------
//
// _reset_init() -- Reset entry point.
//
//      The CPU reset vector points here.  Initialize the CPU, and jump
//      to the C runtime start, which will eventually invoke main()
//
void _reset_init(void)
{
    // Copy values to initialize data segment
    uint32_t *fr = __etext;
    uint32_t *to = __data_start__;
    unsigned int len = __data_end__ - __data_start__;
    while(len--)
        *to++ = *fr++;

    FPUEnable();
    FPUStackingDisable();

    main();
}
