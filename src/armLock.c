// armLock.c

#include "pidbot.h"

int armLockPressed = 0;

void armLockInit(void) {
  vexDigitalPinSet(armLock, kVexDigitalLow);
}

void armLockRun(void) {
  if(!armLockPressed && vexControllerGet(BTN_ARM_LOCK_TOGGLE))
    vexDigitalPinSet(armLock, 1 - vexDigitalPinGet(armLock));
  armLockPressed = vexControllerGet(BTN_ARM_LOCK_TOGGLE);
}

task armLockTask(void *arg) {
  (void)arg;
  vexTaskRegister("arm lock");

  while (!chThdShouldTerminate()) {
    armLockRun();
    vexSleep(25);
  }

  return (task)0;
}