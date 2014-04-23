// intake.c

#include "pidbot.h"

void intakeSet(short s) {
  vexMotorSet(leftIntake, s);
  vexMotorSet(rightIntake, s);
}

void intakeRun(void) {
  if (vexControllerGet(BTN_INTAKE_IN)) {
    intakeSet(INTAKE_IN * SMAX);
  } else if (vexControllerGet(BTN_INTAKE_OUT)) {
    intakeSet(INTAKE_OUT * SMAX);
  } else {
    intakeSet(0);
  }
}

task intakeTask(void *arg) {
  (void)arg;
  vexTaskRegister("intake");

  while (!chThdShouldTerminate()) {
    intakeRun();
    vexSleep(25);
  }

  return (task)0;
}