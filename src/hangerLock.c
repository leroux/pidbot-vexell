// hangerLock.c

#include "pidbot.h"

int hangerLockPressed = 0;

void hangerLockInit(void) {
  vexDigitalPinSet(hangerLock, kVexDigitalLow);
}

void hangerLockRun(void) {
  if(!hangerLockPressed && vexControllerGet(BTN_HANGER_LOCK_TOGGLE)) {
    vexDigitalPinSet(hangerLock, 1 - vexDigitalPinGet(hangerLock));
    vexDigitalPinSet(kVexDigital_4, 1 - vexDigitalPinGet(kVexDigital_4));
  }
  hangerLockPressed = vexControllerGet(BTN_HANGER_LOCK_TOGGLE);
}

task hangerLockTask(void *arg) {
  (void)arg;
  vexTaskRegister("hanger lock");

  while (!chThdShouldTerminate()) {
    hangerLockRun();
    vexSleep(25);
  }

  return (task)0;
}