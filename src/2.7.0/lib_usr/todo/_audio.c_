#include "audio.h"

/*

#define FS 16000
#define CS43L22_I2C I2C1
#define CS43L22_I2C_ADDR 0x94

void cs43l22_init(void)
{
    GPIO_InitTypeDef gpio;

    NVIC_InitTypeDef nvic;
    nvic.NVIC_IRQChannel = SPI3_IRQn;
    nvic.NVIC_IRQChannelPreemptionPriority = 0;
    nvic.NVIC_IRQChannelSubPriority = 0;
    nvic.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&nvic);

    //CS43L22 /RESET(PD4)
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD, ENABLE);
    gpio.GPIO_Pin=GPIO_Pin_4;
    gpio.GPIO_Mode=GPIO_Mode_OUT;
    gpio.GPIO_OType=GPIO_OType_PP;
    gpio.GPIO_PuPd=GPIO_PuPd_DOWN;
    gpio.GPIO_Speed=GPIO_Speed_50MHz;
    GPIO_Init(GPIOD, &gpio);

    //CS43L22 I2C SDA(PB9) in SCL(PB6)
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
    gpio.GPIO_Pin=GPIO_Pin_6 | GPIO_Pin_9;
    gpio.GPIO_Mode=GPIO_Mode_AF;
    gpio.GPIO_OType=GPIO_OType_OD;
    gpio.GPIO_PuPd=GPIO_PuPd_NOPULL;
    gpio.GPIO_Speed=GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &gpio);
    GPIO_PinAFConfig(GPIOB, GPIO_PinSource6, GPIO_AF_I2C1);
    GPIO_PinAFConfig(GPIOB, GPIO_PinSource9, GPIO_AF_I2C1);

    //CS43L22 I2S3 WS(PA4);
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
    gpio.GPIO_Pin=GPIO_Pin_4;
    gpio.GPIO_Mode=GPIO_Mode_AF;
    gpio.GPIO_OType=GPIO_OType_PP;
    gpio.GPIO_PuPd=GPIO_PuPd_NOPULL;
    gpio.GPIO_Speed=GPIO_Speed_50MHz;
    GPIO_Init(GPIOA, &gpio);
    GPIO_PinAFConfig(GPIOA, GPIO_PinSource4, GPIO_AF_SPI3);

    //CS43L22 I2S3 MCK(PC7), SCK(PC10), SD(PC12)
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);
    gpio.GPIO_Pin=GPIO_Pin_7 | GPIO_Pin_10 | GPIO_Pin_12;
    gpio.GPIO_Mode=GPIO_Mode_AF;
    gpio.GPIO_OType=GPIO_OType_PP;
    gpio.GPIO_PuPd=GPIO_PuPd_NOPULL;
    gpio.GPIO_Speed=GPIO_Speed_50MHz;
    GPIO_Init(GPIOC, &gpio);
    GPIO_PinAFConfig(GPIOC, GPIO_PinSource7, GPIO_AF_SPI3);
    GPIO_PinAFConfig(GPIOC, GPIO_PinSource10, GPIO_AF_SPI3);
    GPIO_PinAFConfig(GPIOC, GPIO_PinSource12, GPIO_AF_SPI3);

    //I2S config
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI3, ENABLE);
//    SPI_DeInit(SPI3);
    I2S_InitTypeDef i2s;
    i2s.I2S_AudioFreq=FS;
    i2s.I2S_MCLKOutput=I2S_MCLKOutput_Enable;
    i2s.I2S_Mode=I2S_Mode_MasterTx;
    i2s.I2S_DataFormat=I2S_DataFormat_16b;
    i2s.I2S_Standard=I2S_Standard_Phillips;
    i2s.I2S_CPOL=I2S_CPOL_Low;
    I2S_Init(SPI3, &i2s);
    I2S_Cmd(SPI3, ENABLE);

    //I2C1 config
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_I2C1, ENABLE);
    I2C_InitTypeDef i2c;
    i2c.I2C_ClockSpeed=100000;
    i2c.I2C_Mode=I2C_Mode_I2C;
    i2c.I2C_Ack=I2C_Ack_Enable;
    i2c.I2C_AcknowledgedAddress=I2C_AcknowledgedAddress_7bit;
    i2c.I2C_DutyCycle=I2C_DutyCycle_2;
    i2c.I2C_OwnAddress1=99;
    I2C_Init(I2C1, &i2c);
    I2C_Cmd(I2C1, ENABLE);

    //CS43L22 config
    //Recommended Power-up sequence (page 31)

    //bring reset high
    GPIO_SetBits(GPIOD, GPIO_Pin_4);

    //wait
    volatile uint32_t j;
    for(j=0; j<20000000; j++);

    //Required initialization settings (page 32)
    uint8_t reg;
    cs43l22_write_reg(0x0, 0x99);
    cs43l22_write_reg(0x47, 0x80);
    reg=cs43l22_read_reg(0x32);
    cs43l22_write_reg(0x32, reg | 0x80);
    reg=cs43l22_read_reg(0x32);
    cs43l22_write_reg(0x32, reg & 0x7F);
    cs43l22_write_reg(0x0, 0x00);

    cs43l22_write_reg(0x02, 0x01);
    cs43l22_write_reg(0x04, 0xAF);
    cs43l22_write_reg(0x05, 0x80);
    cs43l22_write_reg(0x06, 0x07);
    cs43l22_write_reg(0x02, 0x9E);

    cs43l22_write_reg(0x0A, 0x00);
    cs43l22_write_reg(0x0E, 0x04);
    cs43l22_write_reg(0x27, 0x00);
    cs43l22_write_reg(0x1F, 0x0F);

    cs43l22_write_reg(0x1A, 0x7F);
    cs43l22_write_reg(0x1B, 0x7F);
}

void cs43l22_start(void){
    SPI_I2S_ITConfig(SPI3, SPI_I2S_IT_TXE, ENABLE);
}

void cs43l22_write_reg(uint8_t reg, uint8_t data){
    i2c_write(CS43L22_I2C, CS43L22_I2C_ADDR, reg, data);
}

uint8_t cs43l22_read_reg(uint8_t reg){
    return i2c_read(CS43L22_I2C, CS43L22_I2C_ADDR, reg);
}

void cs43l22_write_sound_data(uint16_t data_l, uint16_t data_r){
    while(!SPI_I2S_GetFlagStatus(SPI3, SPI_I2S_FLAG_TXE));
    SPI_I2S_SendData(SPI3, data_l);
    while(!SPI_I2S_GetFlagStatus(SPI3, SPI_I2S_FLAG_TXE));
    SPI_I2S_SendData(SPI3, data_r);
}

static uint8_t lr;
static uint16_t data;

void SPI3_IRQHandler(void){
    if(SPI_GetITStatus(SPI3, SPI_I2S_IT_TXE)){
        if(lr == 0){
            if(queve_empty()){
                SPI_I2S_SendData(SPI3, 0);
            }
            else{
                data=dequeve();
                //left channel
                SPI_I2S_SendData(SPI3, data);
                lr=1;
    }
        }
        else{
            //right channel
            SPI_I2S_SendData(SPI3, data);
            lr=0;
        }
    }
}



*/




/*
//sampling frequency
#define FS 16000

//PDM decimation factor
#define DECIMATION 64

//i2s clock is clock for mic
//clock for mic is calculated as Fs*decimation_factor
//so we have to divide with 32 (frame_length*num_channels)
//to get i2s sampling freq
#define I2S_FS ((FS*DECIMATION)/(16*2))

//uint16_t array length for filter input buffer
#define MIC_IN_BUF_SIZE ((((FS/1000)*DECIMATION)/8)/2)


//uint16_t array length for filter output buffer
#define MIC_OUT_BUF_SIZE (FS/1000)

static PDMFilter_InitStruct pdm_filter;
static uint16_t mic_in_buf[MIC_IN_BUF_SIZE];
static uint16_t mic_out_buf[MIC_OUT_BUF_SIZE];
static uint32_t mic_buf_index;

void mp45dt02_init()
{
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_CRC, ENABLE);
    pdm_filter.LP_HZ=8000;
    pdm_filter.HP_HZ=10;
    pdm_filter.Fs=FS;
    pdm_filter.Out_MicChannels=1;
    pdm_filter.In_MicChannels=1;
    PDM_Filter_Init(&pdm_filter);

    //MP45DT02 CLK-PB10
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
    GPIO_InitTypeDef gpio;
    gpio.GPIO_Pin=GPIO_Pin_10;
    gpio.GPIO_Mode=GPIO_Mode_AF;
    gpio.GPIO_OType=GPIO_OType_PP;
    gpio.GPIO_PuPd=GPIO_PuPd_NOPULL;
    gpio.GPIO_Speed=GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &gpio);
    GPIO_PinAFConfig(GPIOB, GPIO_PinSource10, GPIO_AF_SPI2);

    //MP45DT02 DOUT-PC3
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);
    gpio.GPIO_Pin=GPIO_Pin_3;
    gpio.GPIO_Mode=GPIO_Mode_AF;
    gpio.GPIO_OType=GPIO_OType_PP;
    gpio.GPIO_PuPd=GPIO_PuPd_NOPULL;
    gpio.GPIO_Speed=GPIO_Speed_50MHz;
    GPIO_Init(GPIOC, &gpio);
    GPIO_PinAFConfig(GPIOC, GPIO_PinSource3, GPIO_AF_SPI2);

    NVIC_InitTypeDef nvic;
    nvic.NVIC_IRQChannel = SPI2_IRQn;
    nvic.NVIC_IRQChannelPreemptionPriority = 1;
    nvic.NVIC_IRQChannelSubPriority = 0;
    nvic.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&nvic);

    //I2S2 config
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI2, ENABLE);
    I2S_InitTypeDef i2s;
    i2s.I2S_AudioFreq=I2S_FS;
    i2s.I2S_Standard=I2S_Standard_LSB;
    i2s.I2S_DataFormat=I2S_DataFormat_16b;
    i2s.I2S_CPOL=I2S_CPOL_High;
    i2s.I2S_Mode=I2S_Mode_MasterRx;
    i2s.I2S_MCLKOutput=I2S_MCLKOutput_Disable;
    I2S_Init(SPI2, &i2s);
    I2S_Cmd(SPI2, ENABLE);
}    

void mp45dt02_start(void){
    SPI_I2S_ITConfig(SPI2, SPI_I2S_IT_RXNE, ENABLE);
}

void SPI2_IRQHandler(void){
    if(SPI_GetITStatus(SPI2, SPI_I2S_IT_RXNE)){
        uint16_t sample=SPI_I2S_ReceiveData(SPI2);
        mic_in_buf[mic_buf_index++]=HTONS(sample);
        if(mic_buf_index == MIC_IN_BUF_SIZE){
            mic_buf_index=0;
            PDM_Filter_64_LSB((uint8_t *)mic_in_buf, mic_out_buf, 40, &pdm_filter);
            uint32_t i;
            for(i=0; i<MIC_OUT_BUF_SIZE; i++){
                enqueve(mic_out_buf[i]);
            }
        }
    }
}
*/