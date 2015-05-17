#include "pwm.h"


#define FTM1_CLOCK                                   	      (CORE_CLOCK/2)
#define FTM1_CLK_PRESCALE                                 	   0  // Prescale Selector value - see comments in Status Control (SC) section for more details
#define FTM1_OVERFLOW_FREQUENCY 5000							  //

void pwm_init()
{
	/*enable port E clock*/
	SIM_BASE_PTR->SCGC5 |= SIM_SCGC5_PORTE_MASK;

	//Enable the Clock to the FTM1 Module
	//See Page 207 of f the KL25 Sub-Family Reference Manual, Rev. 3, September 2012
	SIM_SCGC6 |= SIM_SCGC6_TPM1_MASK;
    
    //The TPM Module has Clock.  Now set up the peripheral
    
    //Blow away the control registers to ensure that the counter is not running
    TPM1_SC = 0;
    TPM1_CONF = 0;
    
    //While the counter is disabled we can setup the prescaler
    TPM1_SC = TPM_SC_PS(FTM1_CLK_PRESCALE);
    
    //Setup the mod register to get the correct PWM Period
    TPM1_MOD = FTM1_CLOCK/(1<<FTM1_CLK_PRESCALE)/FTM1_OVERFLOW_FREQUENCY;
    
    //Setup Channels 0,1
    TPM1_C0SC = TPM_CnSC_MSB_MASK | TPM_CnSC_ELSB_MASK;
    TPM1_C1SC = TPM_CnSC_MSB_MASK | TPM_CnSC_ELSB_MASK;
       
	pwm_set(0, 0);
    
    //Enable the TPM COunter
    TPM1_SC |= TPM_SC_CMOD(1);
    
    //Enable the FTM functions on the the port
    PORTE_PCR20 = PORT_PCR_MUX(3);
    PORTE_PCR21 = PORT_PCR_MUX(3);   
}

void pwm_set(u32 ch0, u32 ch1)
{
	TPM1_C0V = ch0;
	TPM1_C1V = ch1;
}