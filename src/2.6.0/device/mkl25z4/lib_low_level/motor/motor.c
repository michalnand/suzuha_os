#include "motor.h"


#define DRV8834_M1		(3)			/* PTE3 */
#define DRV8834_AENBL	(21)		/* PTE21, PWM, left motor */
#define DRV8834_BENBL	(20)		/* PTE20, PWM, right motor */
#define DRV8834_APHASE	(4)			/* PTE4 */
#define DRV8834_BPHASE	(5)			/* PTE5	*/

void motor_init()
{
	/*enable port E clock*/
	SIM_BASE_PTR->SCGC5 |= SIM_SCGC5_PORTE_MASK;

	/*controll pins for DRV8834*/
 	PORTE_BASE_PTR->PCR[DRV8834_M1] = PORT_PCR_MUX(1);
    PTE_BASE_PTR->PDDR |= 1 << DRV8834_M1;
    PTE_BASE_PTR->PCOR = 1 << DRV8834_M1;					/*M1 = 0*/

    PORTE_BASE_PTR->PCR[DRV8834_APHASE] = PORT_PCR_MUX(1);
    PTE_BASE_PTR->PDDR |= 1 << DRV8834_APHASE;
    PTE_BASE_PTR->PCOR = 1 << DRV8834_APHASE;				/*DRV8834_APHASE = 0*/

    PORTE_BASE_PTR->PCR[DRV8834_BPHASE] = PORT_PCR_MUX(1);
    PTE_BASE_PTR->PDDR |= 1 << DRV8834_BPHASE;
    PTE_BASE_PTR->PCOR = 1 << DRV8834_BPHASE;				/*DRV8834_BPHASE = 0*/  
}



void motor_run(i16 speed_l, i16 speed_r)
{
	u32 tmp_l, tmp_r;

	/*saturate values*/
	if (speed_l > (i16)SPEED_MAX)
		speed_l = (i16)SPEED_MAX;

	if (speed_l < (i16)SPEED_MIN)
		speed_l = (i16)SPEED_MIN;

	if (speed_r > (i16)SPEED_MAX)
		speed_r = (i16)SPEED_MAX;
	
	if (speed_r < (i16)SPEED_MIN)
		speed_r = (i16)SPEED_MIN;

	/*set left motor direction*/
	if (speed_l < 0)
		PTE_BASE_PTR->PSOR = 1 << DRV8834_APHASE;
	else
		PTE_BASE_PTR->PCOR = 1 << DRV8834_APHASE;

	/*set right motor direction*/
	if (speed_r < 0)
		PTE_BASE_PTR->PSOR = 1 << DRV8834_BPHASE;
	else
		PTE_BASE_PTR->PCOR = 1 << DRV8834_BPHASE;


	if (speed_l < 0)
		speed_l = -speed_l;

	if (speed_r < 0)
		speed_r = -speed_r;

	
	tmp_l = (speed_l*TPM1_MOD)/PWM_MAX_VALUE;
	tmp_r = (speed_r*TPM1_MOD)/PWM_MAX_VALUE;

	pwm_set(tmp_r, tmp_l);
}