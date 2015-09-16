#include "pwm.h"


void pwm_init()
{
	/* enable the clock to the TM0 module */
	SIM->SCGC6 |= SIM_SCGC6_TPM1_MASK;
    SIM->SOPT2 |= SIM_SOPT2_TPMSRC(1);

    /* blow away the control registers to ensure that the counter is not running */
    TPM1->SC = 0;
    TPM1->CONF = 0;
    
    /* while the counter is disabled we can setup the prescaler x32 */  
    TPM1->SC = TPM_SC_PS(5); // (1<<0)|(1<<2);
    
    
    /* setup the mod register to get the correct PWM period */
    TPM1->MOD = 255; //FTM0_CLOCK/(1<<FTM0_CLK_PRESCALE)/FTM0_OVERFLOW_FREQUENCY;
    
    /* setup Channels 0,1 */
    TPM1->CONTROLS[0].CnSC = TPM_CnSC_MSB_MASK | TPM_CnSC_ELSB_MASK; // TPM_CnSC_ELSB_MASK
    TPM1->CONTROLS[1].CnSC = TPM_CnSC_MSB_MASK | TPM_CnSC_ELSB_MASK;
    
    /* set the default duty cycle to 0% duty cycle */
    pwm_set(0, 0); 
    
    /* enable the TPM Counter */
    TPM1->SC |= TPM_SC_CMOD(1);
    
    
    /* ch0 on port B pin 7*/
    PORTB->PCR[7] = PORT_PCR_MUX(2);

    /* ch1 on port B pin 6*/
    PORTB->PCR[6] = PORT_PCR_MUX(2); 
}

void pwm_set(u32 ch0, u32 ch1)
{
	TPM1->CONTROLS[0].CnV = ch0;
	TPM1->CONTROLS[1].CnV = ch1;	
}