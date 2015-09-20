#ifndef _AERIS_ROBOT_H_
#define _AERIS_ROBOT_H_

#include "../../device/device.h"

#include "../lsm9ds0.h"


#define AERIS_SURFACE_SENSORS_COUNT   (u32)6

#define AERIS_MOTORS_MAX_SPEED        (i32)100


#define AERIS_MOTORS_M1_GPIO_BASE         GPIOC
#define AERIS_MOTORS_M1                   (1<<1)

#define AERIS_MOTORS_APHASE_GPIO_BASE     GPIOC
#define AERIS_MOTORS_APHASE               (1<<2)

#define AERIS_MOTORS_BPHASE_GPIO_BASE     GPIOC
#define AERIS_MOTORS_BPHASE               (1<<3)

#define AERIS_MOTORS_PWM_BASE_CLOCK  SystemCoreClock
#define AERIS_MOTORS_PWM_FREQUENCY   10000
#define AERIS_MOTORS_PWM_PERIOD      ((SystemCoreClock/AERIS_MOTORS_PWM_FREQUENCY) - 1)



#define AERIS_RGB_GPIO_BASE	GPIOB

#define AERIS_RGB_LED_1	(1<<4)
#define AERIS_RGB_LED_2	(1<<5)
#define AERIS_RGB_LED_3	(1<<6)

#define AERIS_RGB_LED_R	    LED_1
#define AERIS_RGB_LED_G	    LED_2
#define AERIS_RGB_LED_B	    LED_3

#define AERIS_RGB_LED_W_BASE	    GPIOC
#define AERIS_RGB_LED_W	          (1<<5)


#define AERIS_KEY_GPIO_BASE       GPIOB
#define AERIS_KEY_1               (1<<10)

/*I2C switch address*/
#define AERIS_PCA9548_ADDRESS     0xE0

/*APDS-9950 RGB sensor address*/
#define AERIS_RGB_SENSOR_ADDRESS		(0x39<<1)

#define AERIS_RGB_SENSOR_COMMAND			(1<<7)

#define AERIS_RGB_SENSOR_ENABLE			0x00
#define AERIS_RGB_SENSOR_ATIME			0x01
#define AERIS_RGB_SENSOR_WTIME			0x03
#define AERIS_RGB_SENSOR_AILTL			0x04
#define AERIS_RGB_SENSOR_AILTH			0x05

#define AERIS_RGB_SENSOR_AIHTL			0x06
#define AERIS_RGB_SENSOR_AIHTH			0x07

#define AERIS_RGB_SENSOR_PILTL			0x08
#define AERIS_RGB_SENSOR_PILTH			0x09

#define AERIS_RGB_SENSOR_PIHTL			0x0A
#define AERIS_RGB_SENSOR_PIHTH			0x0B

#define AERIS_RGB_SENSOR_PERS			0x0C
#define AERIS_RGB_SENSOR_CONFIG			0x0D
#define AERIS_RGB_SENSOR_PPULSE			0x0E

#define AERIS_RGB_SENSOR_CONTROL			0x0F
#define AERIS_RGB_SENSOR_ID				0x12

#define AERIS_RGB_SENSOR_STATUS 			0x13

#define AERIS_RGB_SENSOR_CDATAL			0x14
#define AERIS_RGB_SENSOR_CDATAH			0x15
#define AERIS_RGB_SENSOR_RDATAL			0x16
#define AERIS_RGB_SENSOR_RDATAH			0x17
#define AERIS_RGB_SENSOR_GDATAL			0x18
#define AERIS_RGB_SENSOR_GDATAH			0x19
#define AERIS_RGB_SENSOR_BDATAL			0x1A
#define AERIS_RGB_SENSOR_BDATAH			0x1B
#define AERIS_RGB_SENSOR_PDATAL 			0x1C
#define AERIS_RGB_SENSOR_PDATAH 			0x1D


#define AERIS_RGB_SENSOR_SURFACE_FRONT_LEFT             (u32)0
#define AERIS_RGB_SENSOR_SURFACE_FRONT_LEFT_CENTER      (u32)1
#define AERIS_RGB_SENSOR_SURFACE_FRONT_RIGHT_CENTER     (u32)2
#define AERIS_RGB_SENSOR_SURFACE_FRONT_RIGHT            (u32)3
#define AERIS_RGB_SENSOR_SURFACE_REAR_LEFT             (u32)4
#define AERIS_RGB_SENSOR_SURFACE_REAR_LEFT_CENTER      (u32)5
#define AERIS_RGB_SENSOR_SURFACE_REAR_RIGHT_CENTER     (u32)6
#define AERIS_RGB_SENSOR_SURFACE_REAR_RIGHT            (u32)7


struct sAerisState
{
  u32 state;
  u32 flags;
  i16 power;
};

struct sAerisMotors
{
  i32 left, right;
};


struct sAerisRGBW
{
  u8 r, g, b, w;
};

struct sAerisIMU
{
    i16 roll, pitch, yaw;

    i16 ax, ay, az;
    i16 mx, my, mz;
    i16 gx, gy, gz;

    i16 temp;
};


struct sAerisObstacleSensors
{
  i16 left, front, right;
};


struct sAerisSurfaceSensors
{
  u16 r[AERIS_SURFACE_SENSORS_COUNT],
      g[AERIS_SURFACE_SENSORS_COUNT],
      b[AERIS_SURFACE_SENSORS_COUNT],
      w[AERIS_SURFACE_SENSORS_COUNT];
};

struct sAerisKey
{
  u8 key;
};

struct sAerisRobot
{
  struct sAerisState state;
  struct sAerisMotors motors;
  struct sAerisRGBW   rgbw;

  struct sAerisIMU                imu;
  struct sAerisObstacleSensors    obstacle_sensors;
  struct sAerisSurfaceSensors     surface_sensors;
  struct sAerisKey                key;
};


struct sAerisRobot g_aeris_robot;

u32 aeris_init();
void aeris_sleep();
void aeris_wake_up();

void aeris_set_motors();
void aeris_set_rgbw();

void aeris_read_imu();
void aeris_read_obstacle_sensors();
void aeris_read_surface_sensors();
u32 aeris_read_key();

void aeris_init_surface_sensor(u32 sensor_id);
void aeris_read_surface_sensor(u32 sensor_id);

#endif
