#ifndef POCL_TIMING_H
#define POCL_TIMING_H

#include "config.h"

#ifdef __cplusplus
extern "C" {
#endif

extern const unsigned pocl_timer_resolution;

uint64_t pocl_gettimemono_ns();

int pocl_gettimereal(int *year, int *mon, int *day, int *hour, int *min, int *sec, int* nanosec);

#ifdef __cplusplus
}
#endif

#endif
