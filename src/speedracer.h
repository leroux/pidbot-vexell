// pidbot.h

#ifndef _PIDBOT_H_
#define _PIDBOT_H_

#include <stdlib.h>

#include "ch.h"  // needs for all ChibiOS programs
#include "hal.h" // hardware abstraction layer header
#include "vex.h" // vex library header

#include "apollo.h"
#include "smartmotor.h"
#include "robotc_glue.h" // for ROBOTC-like tasks
#include "pidlib.h"

// ---------------------------------
// Port Constants

#define LOW 0
#define HIGH 1

// sign function. returns -1 or 1.
#define sgn(x) ((x > 0) - (x < 0))

// ----------------------------------

#ifdef __cplusplus
extern "C" {
#endif

#ifdef __cplusplus
}
#endif

#endif // _PIDBOT_H_
