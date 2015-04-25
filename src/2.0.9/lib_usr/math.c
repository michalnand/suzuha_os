#include "math.h"

mint m_abs(mint value)
{
	if (value < 0)
		value = -value;

	return value;
}

mint m_sgn(mint value)
{
	if (value < 0)
		return -1;

	if (value > 0)
		return 1;
 
	return 0;
}

mint m_saturate(mint value, mint min, mint max)
{
	if (value < min)
		value = min;

	if (value > max)
		value = max;

	return value;
}





mint m_min(mint value_a, mint value_b)
{
	if (value_a < value_b)
		return value_a;

	return value_b;
}

mint m_max(mint value_a, mint value_b)
{
	if (value_a > value_b)
		return value_a;

	return value_b;
}


unsigned int __rnda__ = 1;
unsigned int __rndb__ = 123;

void m_srand(unsigned int seed)
{
	__rnda__ = (unsigned int)seed + 1;
	__rndb__ = (unsigned int)123;
}

mint m_rnd()
{
	__rnda__ = __rnda__ *(unsigned int)1103515245 + (unsigned int)12345;
	__rndb__ = (__rndb__ >> 1) ^ (-(__rndb__ & 1u) & 0xD0000001u);
	
	return (__rnda__ ^ __rndb__);
}



void m_median_init(struct sMedianFilter *filter)
{
	filter->ptr = 0;

	mint i;
	for (i = 0; i < MEDIAN_FILTER_FIFO_SIZE; i++)
		filter->fifo[i] = 0;
}

mint m_median(struct sMedianFilter *filter, mint input)
{
	filter->fifo[filter->ptr] = input;
	filter->ptr++;
	if (filter->ptr >= MEDIAN_FILTER_FIFO_SIZE)
		filter->ptr = 0;

	mint res_value = MEDIAN_FILTER_FIFO_SIZE;
	mint res_idx = filter->ptr;

	mint i, j;

	for (j = 0; j < MEDIAN_FILTER_FIFO_SIZE; j++)
	{
		mint tmp = 0;
		for (i = 0; i < MEDIAN_FILTER_FIFO_SIZE; i++)
		{
			if (filter->fifo[i] < filter->fifo[j])
				tmp--;

			if (filter->fifo[i] > filter->fifo[j])
				tmp++;
		}

		tmp = m_abs(tmp);

		if (tmp < res_value)
		{
			res_value = tmp;
			res_idx = j;
		}
	}

	return filter->fifo[res_idx];
}