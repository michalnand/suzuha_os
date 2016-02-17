#ifndef _SONAR_H_
#define _SONAR_H_

#include "../lib_low_level.h"

void sonar_init();
u16 sonat_get_distance(u16 sonar_id);

#endif