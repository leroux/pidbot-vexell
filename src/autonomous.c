// autonomous.c

#include "pidbot.h"

void autonomous(void) {
  // jiggle intake and move forward
  driveSetVector(SMAX, 0);
  vexSleep(300);
  driveSetVector(SMIN, 0);
  vexSleep(200);
  driveSetVector(0, 0);

  // intake spin
  intakeSet(INTAKE_IN * SMAX);

  // move forward
  driveSetVector(SMAX, 0);
  vexSleep(600);

  // turn back and left or back and right
  intakeSet(0);
  driveSetVector(0, 0);
  vexSleep(150);
  driveSetVector(0, -100); // TURNING LINE, BLUE IS RIGHT, RED IS LEFT.
  vexSleep(240);
  driveSetVector(0, 0);

  // lift all the way
  armPID->target_value = LIFT_HANG_HEIGHT;
  vexSleep(1500);

  // move all the way back
  driveSetVector(-70, 0);
  vexSleep(2100);
  driveSetVector(0, 0);

  // set PID floor
  armPID->target_value = LIFT_FLOOR_HEIGHT;
  vexSleep(1000);
  armSet(LIFT_UP * SMAX);
  vexSleep(3000);

  // lock pneumatics
  //vexDigitalSet(kVexDigitalHigh);
  armSet(0);
}