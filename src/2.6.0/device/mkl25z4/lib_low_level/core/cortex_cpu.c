#include "cortex_cpu.h"



/**
 @brief return main stack pointer value

 @return stack pointer value
*/
uint32_t __get_MSP(void)
{
  uint32_t result = 0;

  __asm volatile ("MRS %0, msp\n\t" 
                  "MOV r0, %0 \n\t"
                  "BX  lr     \n\t"  : "=r" (result) );
  return(result);
}

/*set main stack pointer value*/

/**
 @brief set main stack pointer value

 @param topOfMainStack stack pointer value
*/
void __set_MSP_(u32 topOfMainStack)   
{   
  __asm volatile ("MSR msp, %0\n\t"   
                  "BX  lr     \n\t" : : "r" (topOfMainStack) );   
} 


void sys_tick_init()
{
  #ifdef LOW_POWER_MODE
  SYST_RVR = 800000;
  #else
  SYST_RVR = 200000;
  #endif

  SYST_CVR = 0;
  SYST_CSR = SysTick_CSR_ENABLE_MASK | SysTick_CSR_TICKINT_MASK | SysTick_CSR_CLKSOURCE_MASK;
}

/* sleep cpu */
void sleep()
{
  #ifdef LOW_POWER_MODE
  //Check if PLL/FLL is enabled:
  uint32_t PLL_FLL_en = (MCG_C1 & MCG_C1_CLKS_MASK) == MCG_C1_CLKS(0);

  SMC_PMPROT = SMC_PMPROT_AVLLS_MASK | SMC_PMPROT_ALLS_MASK | SMC_PMPROT_AVLP_MASK;
  SMC_PMCTRL = SMC_PMCTRL_STOPM(2);

  //Deep sleep for ARM core:
  SCB_SCR = 1<<2;
  
  __asm volatile("wfi");

  //Switch back to PLL as clock source if needed
  //The interrupt that woke up the device will run at reduced speed

  if (PLL_FLL_en) 
  {
    if ((MCG_C6 & (1<<MCG_C6_PLLS_SHIFT)) != 0) /* If PLL */
      while((MCG_S & MCG_S_LOCK0_MASK) == 0x00U); /* Wait until locked */
        MCG_C1 &= ~MCG_C1_CLKS_MASK;
  }


  #else

	__asm volatile("dsb");
  __asm volatile("wfi");
	__asm volatile("isb");

  #endif
}



void sytem_clock_init()
{
  SIM_COPC = 0x00U;                                                   
  SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;   /* Enable clock gate for ports to enable pin routing */
  /* SIM_CLKDIV1: OUTDIV1=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,OUTDIV4=1,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0 */
  SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV4(0x01); /* Update system prescalers */
  /* SIM_SOPT2: PLLFLLSEL=0 */
  SIM_SOPT2 &= (uint32_t)~(uint32_t)(SIM_SOPT2_PLLFLLSEL_MASK); /* Select FLL as a clock source for various peripherals */
  /* SIM_SOPT1: OSC32KSEL=3 */
  SIM_SOPT1 |= SIM_SOPT1_OSC32KSEL(0x03); /* LPO 1kHz oscillator drives 32 kHz clock for various peripherals */
  /* SIM_SOPT2: TPMSRC=1 */
  SIM_SOPT2 = (uint32_t)((SIM_SOPT2 & (uint32_t)~(uint32_t)(
               SIM_SOPT2_TPMSRC(0x02)
              )) | (uint32_t)(
               SIM_SOPT2_TPMSRC(0x01)
              ));                      /* Set the TPM clock */

  /* Switch to FEI Mode */
  /* MCG_C1: CLKS=0,FRDIV=0,IREFS=1,IRCLKEN=1,IREFSTEN=0 */
  MCG_C1 = (MCG_C1_IREFS_MASK | MCG_C1_IRCLKEN_MASK);                                                   
  /* MCG_C2: LOCRE0=0,??=0,RANGE0=0,HGO0=0,EREFS0=0,LP=0,IRCS=0 */
  MCG_C2 = 0x00U;                                                   
  /* MCG_C4: DMX32=1,DRST_DRS=1 */
  MCG_C4 = (uint8_t)((MCG_C4 & (uint8_t)~(uint8_t)(
            MCG_C4_DRST_DRS(0x02)
           )) | (uint8_t)(
            MCG_C4_DMX32_MASK |
            MCG_C4_DRST_DRS(0x01)
           ));                                                  
  /* OSC0_CR: ERCLKEN=1,??=0,EREFSTEN=0,??=0,SC2P=0,SC4P=0,SC8P=0,SC16P=0 */
  OSC0_CR = OSC_CR_ERCLKEN_MASK;                                                   
  /* MCG_C5: ??=0,PLLCLKEN0=0,PLLSTEN0=0,PRDIV0=0 */
  MCG_C5 = 0x00U;                                                   
  /* MCG_C6: LOLIE0=0,PLLS=0,CME0=0,VDIV0=0 */
  MCG_C6 = 0x00U;                                                   
  while((MCG_S & MCG_S_IREFST_MASK) == 0x00U) { /* Check that the source of the FLL reference clock is the internal reference clock. */
  }
  while((MCG_S & 0x0CU) != 0x00U) {    /* Wait until output of the FLL is selected */
  }
}