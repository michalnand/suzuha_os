#ifndef _MATH_H_
#define _MATH_H_

#define mint	signed int


#define MEDIAN_FILTER_FIFO_SIZE 5

struct sMedianFilter
{
	mint fifo[MEDIAN_FILTER_FIFO_SIZE];
	mint ptr;
};

mint m_abs(mint value);
mint m_sgn(mint value);
mint m_saturate(mint value, mint min, mint max);
mint m_min(mint value_a, mint value_b);
mint m_max(mint value_a, mint value_b);

void m_srand(unsigned int seed);
mint m_rnd();


void m_median_init(struct sMedianFilter *filter);
mint m_median(struct sMedianFilter *filter, mint input);

#endif