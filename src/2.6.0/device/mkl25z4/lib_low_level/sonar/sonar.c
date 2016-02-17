#include "sonar.h"

#define SONAR_TRIGGER	(29)		/*PTE29, active low*/

#define SONAR_INPUT_0	(10)
#define SONAR_INPUT_1	(9)
#define SONAR_INPUT_2	(8)
#define SONAR_INPUT_3	(3)

#define SONAR_COUNT		4

#define SONAR_TIME_MAX		200
#define SONAR_PING_PERIOD	3000

#define SONAR_TIMER_FREQ	30000

struct sSonar
{
	u16 time_result[SONAR_COUNT];
	u16 time_ping[SONAR_COUNT];
	u16 time;
};

volatile struct sSonar __sonar__;

void sonar_init()
{
	u32 i;
	__sonar__.time = 0;

	for (i = 0; i < SONAR_COUNT; i++)
	{
		__sonar__.time_result[i] = 0;
		__sonar__.time_ping[i] = 0;
	}

	/*enable port E clock*/
	SIM_BASE_PTR->SCGC5 |= SIM_SCGC5_PORTE_MASK;

	/*sonar trigger*/
	PORTE_BASE_PTR->PCR[SONAR_TRIGGER] = PORT_PCR_MUX(1);
    PTE_BASE_PTR->PDDR |= 1 << SONAR_TRIGGER;
    PTE_BASE_PTR->PSOR = 1 << SONAR_TRIGGER;						/*SONAR_TRIGGER = 1 - ping disabled*/


	/*enable port B clock*/
	SIM_BASE_PTR->SCGC5 |= SIM_SCGC5_PORTB_MASK;

    /*4 sonar inputs*/
	PORTB_BASE_PTR->PCR[SONAR_INPUT_0] = PORT_PCR_MUX(1);
	PORTB_BASE_PTR->PCR[SONAR_INPUT_1] = PORT_PCR_MUX(1);
	PORTB_BASE_PTR->PCR[SONAR_INPUT_2] = PORT_PCR_MUX(1);
	PORTB_BASE_PTR->PCR[SONAR_INPUT_3] = PORT_PCR_MUX(1);

    PTB_BASE_PTR->PDDR&=~((1 << SONAR_INPUT_0)|(1 << SONAR_INPUT_1)|(1 << SONAR_INPUT_2)|(1 << SONAR_INPUT_3));


    /*setup ftm2 to SONAR_TIMER_FREQ periodic interrupt*/
    
	MCG_BASE_PTR->C1 = MCG_C1_IREFS_MASK | MCG_C1_IRCLKEN_MASK;
	MCG_BASE_PTR->C2 = MCG_C2_IRCS_MASK; 							//Select fast internal clock
	SIM_BASE_PTR->SCGC6 |= SIM_SCGC6_TPM2_MASK; 					//Enable TPM2 clock
	SIM_BASE_PTR->SOPT2 |= SIM_SOPT2_TPMSRC(3);

	TPM2_BASE_PTR->SC = TPM_SC_CMOD(1) | TPM_SC_PS(7);
	TPM2_BASE_PTR->MOD = 16383;


	TPM2_BASE_PTR->SC |= TPM_SC_TOIE_MASK;
	NVIC_BASE_PTR->ISER = 1 << 19;
}


void FTM2_IRQHandler()
{
	// PTB_BASE_PTR->PTOR = 1 << LED_3; 

	u32 i;

	if (__sonar__.time == 0)
	{
		PTE_BASE_PTR->PCOR = 1 << SONAR_TRIGGER;				/*SONAR_TRIGGER = 0 - ping enabled*/

		/*clear ping time*/
		for (i = 0; i < SONAR_COUNT; i++)
			__sonar__.time_ping[i] = 0;
	}
	else
		PTE_BASE_PTR->PSOR = 1 << SONAR_TRIGGER;				/*SONAR_TRIGGER = 1 - ping disabled*/

	if ((__sonar__.time > 1) && (__sonar__.time < SONAR_TIME_MAX))
	{
		/*add one until pin in high*/
		if (PTB_BASE_PTR->PDIR&(1<<SONAR_INPUT_0))
			__sonar__.time_ping[0]++;

		/*add one until pin in high*/
		if (PTB_BASE_PTR->PDIR&(1<<SONAR_INPUT_1))
			__sonar__.time_ping[1]++;

		/*add one until pin in high*/
		if (PTB_BASE_PTR->PDIR&(1<<SONAR_INPUT_2))
			__sonar__.time_ping[2]++;

		/*add one until pin in high*/
		if (PTB_BASE_PTR->PDIR&(1<<SONAR_INPUT_3))
			__sonar__.time_ping[3]++;
	}
		
	/*update distance value*/
	if (__sonar__.time == SONAR_TIME_MAX)
	{ 
		for (i = 0; i < SONAR_COUNT; i++)
			__sonar__.time_result[i] = __sonar__.time_ping[i];
	}

	if (__sonar__.time > SONAR_PING_PERIOD)
		__sonar__.time = 0;
	else
		__sonar__.time++;

	/*clear interrupt flag*/
    TPM2_BASE_PTR->SC |= TPM_SC_TOF_MASK;
}
 

u16 sonat_get_distance(u16 sonar_id)
{
	u32 tmp = __sonar__.time_result[sonar_id];
	return ((tmp*34000)/(u32)SONAR_TIMER_FREQ)/2;
}