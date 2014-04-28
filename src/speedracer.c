// pidbot.c

#include "speedracer.h"

// Digital I/O configuration
static vexDigiCfg digitalConfig[kVexDigital_Num] = {
  { kVexDigital_1,  kVexSensorDigitalInput,  kVexConfigInput, 0 },
  { kVexDigital_2,  kVexSensorDigitalOutput, kVexConfigInput, 0 },
  { kVexDigital_3,  kVexSensorDigitalInput,  kVexConfigInput,  0 },
  { kVexDigital_4,  kVexSensorDigitalInput,  kVexConfigInput,  0 },
  { kVexDigital_5,  kVexSensorDigitalInput,  kVexConfigInput,  0 },
  { kVexDigital_6,  kVexSensorDigitalInput,  kVexConfigInput,  0 },
  { kVexDigital_7,  kVexSensorDigitalInput,  kVexConfigInput,  0 },
  { kVexDigital_8,  kVexSensorDigitalInput,  kVexConfigInput,  0 },
  { kVexDigital_9,  kVexSensorDigitalInput,  kVexConfigInput,  0 },
  { kVexDigital_10, kVexSensorDigitalInput,  kVexConfigInput,  0 },
  { kVexDigital_11, kVexSensorDigitalInput,  kVexConfigInput, 0 },
  { kVexDigital_12, kVexSensorDigitalInput,  kVexConfigInput, 0 }
};

// Motor configuration
// Note: 4 amps per motor group (1-5, 6-10).
static vexMotorCfg motorConfig[kVexMotorNum] = {
  { kVexMotor_1,     kVexMotor393S, kVexMotorNormal, kVexSensorNone, 0 },
  { kVexMotor_2,     kVexMotor393S, kVexMotorNormal,   kVexSensorNone, 0 },
  { kVexMotor_3,     kVexMotor393S, kVexMotorReversed, kVexSensorNone, 0 },
  { kVexMotor_4,     kVexMotor393T, kVexMotorNormal,   kVexSensorNone, 0 },
  { kVexMotor_5,     kVexMotor393T, kVexMotorNormal,   kVexSensorNone, 0 },
  { kVexMotor_6,     kVexMotor393T, kVexMotorReversed, kVexSensorNone, 0 },
  { kVexMotor_7,     kVexMotor393T, kVexMotorReversed, kVexSensorNone, 0 },
  { kVexMotor_8,     kVexMotor393S, kVexMotorReversed, kVexSensorNone, 0 },
  { kVexMotor_9,     kVexMotor393S, kVexMotorNormal,   kVexSensorNone, 0 },
  { kVexMotor_10,    kVexMotor393S, kVexMotorNormal, kVexSensorNone, 0 }
};

void vexUserSetup(void) {
  vexDigitalConfigure(digitalConfig, DIG_CONFIG_SIZE(digitalConfig));
  vexMotorConfigure(motorConfig, MOT_CONFIG_SIZE(motorConfig));
}

// Pre-autonomous
void vexUserInit(void) {
  // ...
}

task c_vexOperator(void *arg) {
  (void)arg;
  vexTaskRegister("operator");

  while (!chThdShouldTerminate()) { // sleep forever
    vexSleep(25);
  }

  return (task)0;
}

task vexAutonomous(void *arg) {
  (void)arg;
  vexTaskRegister("auton");
  //autonomous();

  while (!chThdShouldTerminate()) {
    vexSleep(25);
  }

  return (task)0;
}
