#ifndef _MATH_H_
#define _MATH_H_

#define mint	float

#define PI_		(mint)3.141592654

#include "cos_table.h"


mint m_abs(mint value);
signed int mint_abs(signed int value);
mint m_sgn(mint value);
mint m_saturate(mint value, mint min, mint max);
mint m_min(mint value_a, mint value_b);
mint m_max(mint value_a, mint value_b);

float m_atan(float value);
float m_atan2(float y, float x);
float m_sqrt(float x);

void m_srand(unsigned int seed);
unsigned int  m_rnd();


#endif
