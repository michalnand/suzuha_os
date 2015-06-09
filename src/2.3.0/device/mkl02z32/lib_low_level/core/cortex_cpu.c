#include "cortex_cpu.h"


void sys_tick_init() 
{
  #if CLOCK_SETUP == 2
  SysTick->LOAD  = 1000; 
  #else
  SysTick->LOAD  = 50000;                       /* set reload register */
  #endif
  NVIC_SetPriority (SysTick_IRQn, (1<<__NVIC_PRIO_BITS) - 1);  /* set Priority for Systick Interrupt */
  SysTick->VAL   = 0;                                          /* Load the SysTick Counter Value */
  
  #if CLOCK_SETUP == 2
  SysTick->CTRL  = SysTick_CTRL_TICKINT_Msk   |
                   SysTick_CTRL_ENABLE_Msk;                    /* Enable SysTick IRQ and SysTi */
  #else
  SysTick->CTRL  = SysTick_CTRL_CLKSOURCE_Msk |
                   SysTick_CTRL_TICKINT_Msk   |
                   SysTick_CTRL_ENABLE_Msk;                    /* Enable SysTick IRQ and SysTi */
  #endif
}

/* sleep cpu */
void sleep()
{
  volatile u32 dummyread = 0;
  #if CLOCK_SETUP == 2
  SMC->PMPROT = SMC_PMPROT_AVLP_MASK;

  /* Set the STOPM field to 0b010 for VLPS mode */
  SMC->PMCTRL &= ~SMC_PMCTRL_STOPM_MASK;
  SMC->PMCTRL |= SMC_PMCTRL_STOPM(0x2);
  /*wait for write to complete to SMC before stopping core */
  dummyread = SMC->PMCTRL;

  SCB->SCR |= SCB_SCR_SLEEPDEEP_Msk;

  #endif 


  if (dummyread)
    dummyread = 0;

  __asm volatile("dsb");
  __asm volatile("wfi"); 
  __asm volatile("isb"); 
}


/* ----------------------------------------------------------------------------
   -- Core clock
   ---------------------------------------------------------------------------- */

uint32_t SystemCoreClock = DEFAULT_SYSTEM_CLOCK;

/* ----------------------------------------------------------------------------
   -- SystemInit()
   ---------------------------------------------------------------------------- */

void sytem_clock_init(void) 
{
#if (DISABLE_WDOG)
  /* Disable the WDOG module */
  /* SIM_COPC: COPT=0,COPCLKS=0,COPW=0 */
  SIM->COPC = (uint32_t)0x00u;
#endif /* (DISABLE_WDOG) */

  u32 loops = 10000;
  while (loops--)
    __asm("nop");

#if (CLOCK_SETUP == 0)
  /* SIM->CLKDIV1: OUTDIV1=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,OUTDIV4=1,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0 */
  SIM->CLKDIV1 = (SIM_CLKDIV1_OUTDIV1(0x00) | SIM_CLKDIV1_OUTDIV4(0x01)); /* Update system prescalers */
  /* Switch to FEI Mode */
  /* MCG->C1: CLKS=0,FRDIV=0,IREFS=1,IRCLKEN=1,IREFSTEN=0 */
  MCG->C1 = MCG_C1_CLKS(0x00) |
           MCG_C1_FRDIV(0x00) |
           MCG_C1_IREFS_MASK |
           MCG_C1_IRCLKEN_MASK;
  /* MCG_C2: LOCRE0=0,RANGE0=0,HGO0=0,EREFS0=0,LP=0,IRCS=0 */
  MCG->C2 &= (uint8_t)~(uint8_t)(
             MCG_C2_LOCRE0_MASK |
             MCG_C2_RANGE0(0x03) |
             MCG_C2_HGO0_MASK |
             MCG_C2_EREFS0_MASK |
             MCG_C2_LP_MASK |
             MCG_C2_IRCS_MASK
            );
  /* MCG->C4: DMX32=0,DRST_DRS=1 */
  MCG->C4 = (uint8_t)((MCG->C4 & (uint8_t)~(uint8_t)(
            MCG_C4_DMX32_MASK |
            MCG_C4_DRST_DRS(0x02)
           )) | (uint8_t)(
            MCG_C4_DRST_DRS(0x01)
           ));
  /* OSC0->CR: ERCLKEN=1,??=0,EREFSTEN=0,??=0,SC2P=0,SC4P=0,SC8P=0,SC16P=0 */
  OSC0->CR = OSC_CR_ERCLKEN_MASK;
  while((MCG->S & MCG_S_IREFST_MASK) == 0x00U) { /* Check that the source of the FLL reference clock is the internal reference clock. */
  }
  while((MCG->S & 0x0CU) != 0x00U) {    /* Wait until output of the FLL is selected */
  }
#elif (CLOCK_SETUP == 1)
  /* SIM->SCGC5: PORTA=1 */
  SIM->SCGC5 |= SIM_SCGC5_PORTA_MASK; /* Enable clock gate for ports to enable pin routing */
  /* SIM->CLKDIV1: OUTDIV1=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,OUTDIV4=1,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0 */
  SIM->CLKDIV1 = (SIM_CLKDIV1_OUTDIV1(0x00) | SIM_CLKDIV1_OUTDIV4(0x01)); /* Update system prescalers */
  /* PORTA->PCR3: ISF=0,MUX=0 */
  PORTA->PCR[3] &= (uint32_t)~(uint32_t)((PORT_PCR_ISF_MASK | PORT_PCR_MUX(0x07)));
  /* PORTA->PCR4: ISF=0,MUX=0 */
  PORTA->PCR[4] &= (uint32_t)~(uint32_t)((PORT_PCR_ISF_MASK | PORT_PCR_MUX(0x07)));
  /* Switch to FEE Mode */
  /* MCG->C2: LOCRE0=0,RANGE0=0,HGO0=0,EREFS0=1,LP=0,IRCS=0 */
  MCG->C2 = (uint8_t)((MCG->C2 & (uint8_t)~(uint8_t)(
            MCG_C2_LOCRE0_MASK |
            MCG_C2_RANGE0(0x03) |
            MCG_C2_HGO0_MASK |
            MCG_C2_LP_MASK |
            MCG_C2_IRCS_MASK
           )) | (uint8_t)(
            MCG_C2_EREFS0_MASK
           ));
  /* OSC0->CR: ERCLKEN=1,??=0,EREFSTEN=0,??=0,SC2P=0,SC4P=0,SC8P=0,SC16P=0 */
  OSC0->CR = OSC_CR_ERCLKEN_MASK;
  /* MCG->C1: CLKS=0,FRDIV=0,IREFS=0,IRCLKEN=1,IREFSTEN=0 */
  MCG->C1 = (MCG_C1_CLKS(0x00) | MCG_C1_FRDIV(0x00) | MCG_C1_IRCLKEN_MASK);
  /* MCG->C4: DMX32=1,DRST_DRS=1 */
  MCG->C4 = (uint8_t)((MCG->C4 & (uint8_t)~(uint8_t)(
            MCG_C4_DRST_DRS(0x02)
           )) | (uint8_t)(
            MCG_C4_DMX32_MASK |
            MCG_C4_DRST_DRS(0x01)
           ));
  while((MCG->S & MCG_S_IREFST_MASK) != 0x00U) { /* Check that the source of the FLL reference clock is the external reference clock. */
  }
  while((MCG->S & 0x0CU) != 0x00U) {    /* Wait until output of the FLL is selected */
  }
#elif (CLOCK_SETUP == 2)
  /* SIM->CLKDIV1: OUTDIV1=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,OUTDIV4=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0 */
  SIM->CLKDIV1 = (SIM_CLKDIV1_OUTDIV1(0x00) | SIM_CLKDIV1_OUTDIV4(0x00)); /* Update system prescalers */
  /* MCG->SC: FCRDIV=0 */
  MCG->SC &= (uint8_t)~(uint8_t)(MCG_SC_FCRDIV(0x07));
  /* Switch to FBI Mode */
  /* MCG->C1: CLKS=1,FRDIV=0,IREFS=1,IRCLKEN=1,IREFSTEN=0 */
  MCG->C1 = MCG_C1_CLKS(0x01) |
           MCG_C1_FRDIV(0x00) |
           MCG_C1_IREFS_MASK |
           MCG_C1_IRCLKEN_MASK;
  /* MCG_C2: LOCRE0=0,RANGE0=0,HGO0=0,EREFS0=0,LP=0,IRCS=1 */
  MCG->C2 = (uint8_t)((MCG->C2 & (uint8_t)~(uint8_t)(
            MCG_C2_LOCRE0_MASK |
            MCG_C2_RANGE0(0x03) |
            MCG_C2_HGO0_MASK |
            MCG_C2_EREFS0_MASK |
            MCG_C2_LP_MASK
           )) | (uint8_t)(
            MCG_C2_IRCS_MASK
           ));
  /* MCG->C4: DMX32=0,DRST_DRS=0 */
  MCG->C4 &= (uint8_t)~(uint8_t)((MCG_C4_DMX32_MASK | MCG_C4_DRST_DRS(0x03)));
  /* OSC0->CR: ERCLKEN=1,??=0,EREFSTEN=0,??=0,SC2P=0,SC4P=0,SC8P=0,SC16P=0 */
  OSC0->CR = OSC_CR_ERCLKEN_MASK;
  while((MCG->S & MCG_S_IREFST_MASK) == 0x00U) { /* Check that the source of the FLL reference clock is the internal reference clock. */
  }
  while((MCG->S & 0x0CU) != 0x04U) {    /* Wait until internal reference clock is selected as MCG output */
  }
  /* Switch to BLPI Mode */
  /* MCG->C2: LOCRE0=0,RANGE0=0,HGO0=0,EREFS0=0,LP=1,IRCS=1 */
  MCG->C2 = (uint8_t)((MCG->C2 & (uint8_t)~(uint8_t)(
            MCG_C2_LOCRE0_MASK |
            MCG_C2_RANGE0(0x03) |
            MCG_C2_HGO0_MASK |
            MCG_C2_EREFS0_MASK
           )) | (uint8_t)(
            MCG_C2_LP_MASK |
            MCG_C2_IRCS_MASK
           ));
  while((MCG->S & MCG_S_IREFST_MASK) == 0x00U) { /* Check that the source of the FLL reference clock is the internal reference clock. */
  }
  while((MCG->S & MCG_S_IRCST_MASK) == 0x00U) { /* Check that the fast external reference clock is selected. */
  }
#endif /* (CLOCK_SETUP == 2) */

  SystemCoreClockUpdate();
  loops = 50000;
  while (loops--)
    __asm("nop");
}

/* ----------------------------------------------------------------------------
   -- SystemCoreClockUpdate()
   ---------------------------------------------------------------------------- */

void SystemCoreClockUpdate (void) 
{
  uint32_t MCGOUTClock;                                                        /* Variable to store output clock frequency of the MCG module */
  uint8_t Divider;

  if ((MCG->C1 & MCG_C1_CLKS_MASK) == 0x0u) {
    /* Output of FLL is selected */
    if ((MCG->C1 & MCG_C1_IREFS_MASK) == 0x0u) {
      /* External reference clock is selected */
      MCGOUTClock = CPU_XTAL_CLK_HZ;                                       /* System oscillator drives MCG clock */
      Divider = (uint8_t)(1u << ((MCG->C1 & MCG_C1_FRDIV_MASK) >> MCG_C1_FRDIV_SHIFT));
      MCGOUTClock = (MCGOUTClock / Divider);  /* Calculate the divided FLL reference clock */
    } else { /* (!((MCG->C1 & MCG_C1_IREFS_MASK) == 0x0u)) */
      MCGOUTClock = CPU_INT_SLOW_CLK_HZ;                                     /* The slow internal reference clock is selected */
    } /* (!((MCG->C1 & MCG_C1_IREFS_MASK) == 0x0u)) */
    /* Select correct multiplier to calculate the MCG output clock  */
    switch (MCG->C4 & (MCG_C4_DMX32_MASK | MCG_C4_DRST_DRS_MASK)) {
      case 0x0u:
        MCGOUTClock *= 640u;
        break;
      case 0x20u:
        MCGOUTClock *= 1280u;
        break;
      case 0x40u:
        MCGOUTClock *= 1920u;
        break;
      case 0x60u:
        MCGOUTClock *= 2560u;
        break;
      case 0x80u:
        MCGOUTClock *= 732u;
        break;
      case 0xA0u:
        MCGOUTClock *= 1464u;
        break;
      case 0xC0u:
        MCGOUTClock *= 2197u;
        break;
      case 0xE0u:
        MCGOUTClock *= 2929u;
        break;
      default:
        break;
    }
  } else if ((MCG->C1 & MCG_C1_CLKS_MASK) == 0x40u) {
    /* Internal reference clock is selected */
    if ((MCG->C2 & MCG_C2_IRCS_MASK) == 0x0u) {
      MCGOUTClock = CPU_INT_SLOW_CLK_HZ;                                       /* Slow internal reference clock selected */
    } else { /* (!((MCG->C2 & MCG_C2_IRCS_MASK) == 0x0u)) */
      MCGOUTClock = CPU_INT_FAST_CLK_HZ / (1 << ((MCG->SC & MCG_SC_FCRDIV_MASK) >> MCG_SC_FCRDIV_SHIFT));  /* Fast internal reference clock selected */
    } /* (!((MCG->C2 & MCG_C2_IRCS_MASK) == 0x0u)) */
  } else if ((MCG->C1 & MCG_C1_CLKS_MASK) == 0x80u) {
    /* External reference clock is selected */
    MCGOUTClock = CPU_XTAL_CLK_HZ;                                           /* System oscillator drives MCG clock */
  } else { /* (!((MCG->C1 & MCG_C1_CLKS_MASK) == 0x80u)) */
    /* Reserved value */
    return;
  } /* (!((MCG->C1 & MCG_C1_CLKS_MASK) == 0x80u)) */
  SystemCoreClock = (MCGOUTClock / (1u + ((SIM->CLKDIV1 & SIM_CLKDIV1_OUTDIV1_MASK) >> SIM_CLKDIV1_OUTDIV1_SHIFT)));
}