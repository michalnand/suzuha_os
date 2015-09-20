#include "aeris_robot.h"


u32 aeris_init()
{
  u32 i;

  g_aeris_robot.state.state = 0;

  g_aeris_robot.motors.left = 0;
  g_aeris_robot.motors.right = 0;

  g_aeris_robot.rgbw.r = 1;
  g_aeris_robot.rgbw.g = 0;
  g_aeris_robot.rgbw.b = 0;
  g_aeris_robot.rgbw.w = 0;

  g_aeris_robot.imu.roll = 0;
  g_aeris_robot.imu.pitch = 0;
  g_aeris_robot.imu.yaw = 0;

  g_aeris_robot.imu.ax = 0;
  g_aeris_robot.imu.ay = 0;
  g_aeris_robot.imu.az = 0;

  g_aeris_robot.imu.mx = 0;
  g_aeris_robot.imu.my = 0;
  g_aeris_robot.imu.mz = 0;

  g_aeris_robot.imu.gx = 0;
  g_aeris_robot.imu.gy = 0;
  g_aeris_robot.imu.gz = 0;

  g_aeris_robot.imu.temp = 0;


  g_aeris_robot.obstacle_sensors.left = 0;
  g_aeris_robot.obstacle_sensors.front = 0;
  g_aeris_robot.obstacle_sensors.right = 0;


  for (i = 0; i < AERIS_SURFACE_SENSORS_COUNT; i++)
  {
    g_aeris_robot.surface_sensors.r[i] = 0;
    g_aeris_robot.surface_sensors.g[i] = 0;
    g_aeris_robot.surface_sensors.b[i] = 0;
    g_aeris_robot.surface_sensors.w[i] = 0;
  }

  g_aeris_robot.key.key = 0;


  /* motors init */

  RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM5, ENABLE);

  GPIO_InitTypeDef  GPIO_InitStructure;

  /* init M1 PIN */
  GPIO_InitStructure.GPIO_Pin = AERIS_MOTORS_M1;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

  GPIO_Init(AERIS_MOTORS_M1_GPIO_BASE, &GPIO_InitStructure);
  GPIO_SetBits(AERIS_MOTORS_M1_GPIO_BASE, AERIS_MOTORS_M1);

  /* init A phase pin */
  GPIO_InitStructure.GPIO_Pin = AERIS_MOTORS_APHASE;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

  GPIO_Init(AERIS_MOTORS_APHASE_GPIO_BASE, &GPIO_InitStructure);
  GPIO_ResetBits(AERIS_MOTORS_APHASE_GPIO_BASE, AERIS_MOTORS_APHASE);

  /* init B phase pin */
  GPIO_InitStructure.GPIO_Pin = AERIS_MOTORS_BPHASE;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

  GPIO_Init(AERIS_MOTORS_BPHASE_GPIO_BASE, &GPIO_InitStructure);
  GPIO_ResetBits(AERIS_MOTORS_BPHASE_GPIO_BASE, AERIS_MOTORS_BPHASE);


  /* init PWS pins */
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0|GPIO_Pin_1;

  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;

  GPIO_Init(GPIOA, &GPIO_InitStructure);


  GPIO_PinAFConfig(GPIOA, GPIO_PinSource0, GPIO_AF_TIM5);
  GPIO_PinAFConfig(GPIOA, GPIO_PinSource1, GPIO_AF_TIM5);


  TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;


  /* Time Base configuration */
  TIM_TimeBaseStructure.TIM_Prescaler = 0;
  TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;
  TIM_TimeBaseStructure.TIM_Period = AERIS_MOTORS_PWM_PERIOD;
  TIM_TimeBaseStructure.TIM_ClockDivision = 0;
  TIM_TimeBaseStructure.TIM_RepetitionCounter = 0;

  TIM_TimeBaseInit(TIM5, &TIM_TimeBaseStructure);


  aeris_set_motors();
  TIM_Cmd(TIM5, ENABLE);
  TIM_CtrlPWMOutputs(TIM5, ENABLE);

  aeris_set_motors();



  /* leds + key init */


  GPIO_InitStructure.GPIO_Pin = AERIS_RGB_LED_1 | AERIS_RGB_LED_2 | AERIS_RGB_LED_3;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

  GPIO_Init(AERIS_RGB_GPIO_BASE, &GPIO_InitStructure);


  GPIO_InitStructure.GPIO_Pin = AERIS_RGB_LED_W;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

  GPIO_Init(AERIS_RGB_LED_W_BASE, &GPIO_InitStructure);

  GPIO_InitStructure.GPIO_Pin = AERIS_KEY_1;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
  GPIO_Init(AERIS_KEY_GPIO_BASE, &GPIO_InitStructure);

  aeris_set_rgbw();

  /* init imu */
  u32 res;
  res = lsm9ds0_init();

  if (res != 0)
    return res;


  /*init surface sensors*/


  aeris_init_surface_sensor(AERIS_RGB_SENSOR_SURFACE_FRONT_LEFT);
  aeris_init_surface_sensor(AERIS_RGB_SENSOR_SURFACE_FRONT_LEFT_CENTER);
  aeris_init_surface_sensor(AERIS_RGB_SENSOR_SURFACE_FRONT_RIGHT_CENTER);
  aeris_init_surface_sensor(AERIS_RGB_SENSOR_SURFACE_FRONT_RIGHT);

  aeris_init_surface_sensor(AERIS_RGB_SENSOR_SURFACE_REAR_LEFT);
  aeris_init_surface_sensor(AERIS_RGB_SENSOR_SURFACE_REAR_LEFT_CENTER);
  aeris_init_surface_sensor(AERIS_RGB_SENSOR_SURFACE_REAR_RIGHT_CENTER);
  aeris_init_surface_sensor(AERIS_RGB_SENSOR_SURFACE_REAR_RIGHT);


  /* init done, turn on green led */
  g_aeris_robot.rgbw.r = 0;
  g_aeris_robot.rgbw.g = 1;
  g_aeris_robot.rgbw.b = 0;
  aeris_set_rgbw();

  return 0;
}

void aeris_sleep()
{
    //TODO
}

void aeris_wake_up()
{
    //TODO
}

void aeris_set_motors()
{
  i32 ch1 = 0;
  i32 ch2 = 0;

  if (g_aeris_robot.motors.left < -AERIS_MOTORS_MAX_SPEED)
    g_aeris_robot.motors.left = -AERIS_MOTORS_MAX_SPEED;

  if (g_aeris_robot.motors.right < -AERIS_MOTORS_MAX_SPEED)
    g_aeris_robot.motors.right = -AERIS_MOTORS_MAX_SPEED;

  if (g_aeris_robot.motors.left > AERIS_MOTORS_MAX_SPEED)
    g_aeris_robot.motors.left =  AERIS_MOTORS_MAX_SPEED;

  if (g_aeris_robot.motors.right > AERIS_MOTORS_MAX_SPEED)
    g_aeris_robot.motors.right = AERIS_MOTORS_MAX_SPEED;

  ch1 = g_aeris_robot.motors.left;
  ch2 = g_aeris_robot.motors.right;

  if (ch1 < 0)
    ch1 = -ch1;

  if (ch2 < 0)
    ch2 = -ch2;

  if (g_aeris_robot.motors.left > 0)
    GPIO_SetBits(AERIS_MOTORS_APHASE_GPIO_BASE, AERIS_MOTORS_APHASE);
  else
    GPIO_ResetBits(AERIS_MOTORS_APHASE_GPIO_BASE, AERIS_MOTORS_APHASE);

  if (g_aeris_robot.motors.right > 0)
    GPIO_SetBits(AERIS_MOTORS_BPHASE_GPIO_BASE, AERIS_MOTORS_BPHASE);
  else
    GPIO_ResetBits(AERIS_MOTORS_BPHASE_GPIO_BASE, AERIS_MOTORS_BPHASE);



  TIM_OCInitTypeDef  TIM_OCInitStructure;


  TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_PWM2;
  TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
  TIM_OCInitStructure.TIM_OutputNState = TIM_OutputNState_Enable;
  TIM_OCInitStructure.TIM_Pulse = 0;
  TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_Low;
  TIM_OCInitStructure.TIM_OCNPolarity = TIM_OCNPolarity_High;
  TIM_OCInitStructure.TIM_OCIdleState = TIM_OCIdleState_Set;
  TIM_OCInitStructure.TIM_OCNIdleState = TIM_OCIdleState_Reset;


  TIM_OCInitStructure.TIM_Pulse = (ch1*(AERIS_MOTORS_PWM_PERIOD-1))/100;
  TIM_OC1Init(TIM5, &TIM_OCInitStructure);

  TIM_OCInitStructure.TIM_Pulse = (ch2*(AERIS_MOTORS_PWM_PERIOD-1))/100;
  TIM_OC2Init(TIM5, &TIM_OCInitStructure);
}


void aeris_set_rgbw()
{
  if (g_aeris_robot.rgbw.r != 0)
    GPIO_ResetBits(AERIS_RGB_GPIO_BASE, AERIS_RGB_LED_R);
  else
    GPIO_SetBits(AERIS_RGB_GPIO_BASE, AERIS_RGB_LED_R);

  if (g_aeris_robot.rgbw.g != 0)
    GPIO_ResetBits(AERIS_RGB_GPIO_BASE, AERIS_RGB_LED_G);
  else
    GPIO_SetBits(AERIS_RGB_GPIO_BASE, AERIS_RGB_LED_G);

  if (g_aeris_robot.rgbw.b != 0)
    GPIO_ResetBits(AERIS_RGB_GPIO_BASE, AERIS_RGB_LED_B);
  else
    GPIO_SetBits(AERIS_RGB_GPIO_BASE, AERIS_RGB_LED_B);

  if (g_aeris_robot.rgbw.w != 0)
    GPIO_SetBits(AERIS_RGB_LED_W_BASE, AERIS_RGB_LED_W);
  else
    GPIO_ResetBits(AERIS_RGB_LED_W_BASE, AERIS_RGB_LED_W);
}


void aeris_read_imu()
{
  lsm9ds0_read();

  g_aeris_robot.imu.ax = g_lsm9ds0_imu.ax;
  g_aeris_robot.imu.ay = g_lsm9ds0_imu.ay;
  g_aeris_robot.imu.az = g_lsm9ds0_imu.az;

  g_aeris_robot.imu.mx = g_lsm9ds0_imu.mx;
  g_aeris_robot.imu.my = g_lsm9ds0_imu.my;
  g_aeris_robot.imu.mz = g_lsm9ds0_imu.mz;

  g_aeris_robot.imu.gx = g_lsm9ds0_imu.gx;
  g_aeris_robot.imu.gy = g_lsm9ds0_imu.gy;
  g_aeris_robot.imu.gz = g_lsm9ds0_imu.gz;

  g_aeris_robot.imu.temp = g_lsm9ds0_imu.temp;

  g_aeris_robot.imu.roll = 0;
  g_aeris_robot.imu.pitch = 0;
  g_aeris_robot.imu.yaw = 0;
}


void aeris_read_obstacle_sensors()
{
  //TODO
}

void aeris_read_surface_sensors()
{
  aeris_read_surface_sensors(AERIS_RGB_SENSOR_SURFACE_FRONT_LEFT);
  aeris_read_surface_sensors(AERIS_RGB_SENSOR_SURFACE_FRONT_LEFT_CENTER);
  aeris_read_surface_sensors(AERIS_RGB_SENSOR_SURFACE_FRONT_RIGHT_CENTER);
  aeris_read_surface_sensors(AERIS_RGB_SENSOR_SURFACE_FRONT_RIGHT);

  aeris_read_surface_sensors(AERIS_RGB_SENSOR_SURFACE_REAR_LEFT);
  aeris_read_surface_sensors(AERIS_RGB_SENSOR_SURFACE_REAR_LEFT_CENTER);
  aeris_read_surface_sensors(AERIS_RGB_SENSOR_SURFACE_REAR_RIGHT_CENTER);
  aeris_read_surface_sensors(AERIS_RGB_SENSOR_SURFACE_REAR_RIGHT);
}

u32 aeris_read_key()
{
  if ( GPIO_ReadInputDataBit(AERIS_KEY_GPIO_BASE, AERIS_KEY_1) == 0)
    return AERIS_KEY_1;
  else
    return 0;
}

void aeris_init_surface_sensor(u32 sensor_id)
{
  /* select channel via i2c switch */
  i2cStart();
  i2cWrite(AERIS_PCA9548_ADDRESS);
  i2cWrite((1<<sensor_id));
  i2cStop();

  i2c_write_reg(AERIS_RGB_SENSOR_ADDRESS, AERIS_RGB_SENSOR_COMMAND|AERIS_RGB_SENSOR_ATIME, 0xFF); 			/*2.4ms time*/
	i2c_write_reg(AERIS_RGB_SENSOR_ADDRESS, AERIS_RGB_SENSOR_COMMAND|AERIS_RGB_SENSOR_WTIME, 0xFF); 			/*2.4ms time*/

	i2c_write_reg(AERIS_RGB_SENSOR_ADDRESS, AERIS_RGB_SENSOR_COMMAND|AERIS_RGB_SENSOR_CONFIG, 0); 				/*dont wait long*/
  i2c_write_reg(AERIS_RGB_SENSOR_ADDRESS, AERIS_RGB_SENSOR_COMMAND|AERIS_RGB_SENSOR_ENABLE, (1<<1)|(1<<0));  /*power on, RGBC enable*/
}

void aeris_read_surface_sensor(u32 sensor_id)
{
  /* select channel via i2c switch */
  i2cStart();
  i2cWrite(AERIS_PCA9548_ADDRESS);
  i2cWrite((1<<sensor_id));
  i2cStop();

  i2cStart();
  i2cWrite(AERIS_RGB_SENSOR_ADDRESS);
  i2cWrite(AERIS_RGB_SENSOR_COMMAND|AERIS_RGB_SENSOR_CDATAL|(1<<5));

  i2cStart();
  i2cWrite(AERIS_RGB_SENSOR_ADDRESS|0x01);

  g_aeris_robot.surface_sensors.w[sensor_id] = i2cRead(1);
  g_aeris_robot.surface_sensors.w[sensor_id]|= ((u16)i2cRead(1))<<8;

  g_aeris_robot.surface_sensors.r[sensor_id] = i2cRead(1);
  g_aeris_robot.surface_sensors.r[sensor_id]|= ((u16)i2cRead(1))<<8;

  g_aeris_robot.surface_sensors.g[sensor_id] = i2cRead(1);
  g_aeris_robot.surface_sensors.g[sensor_id]|= ((u16)i2cRead(1))<<8;

  g_aeris_robot.surface_sensors.b[sensor_id] = i2cRead(1);
  g_aeris_robot.surface_sensors.b[sensor_id]|= ((u16)i2cRead(0))<<8;

  i2cStop();
}
