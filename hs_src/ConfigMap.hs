module ConfigMap where

import Vexell

-------------------------------
-- Controller
-------------------------------
btnLiftUp = Btn6U
btnLiftDOwn = Btn6D
btnLiftFloor = Btn8D
btnLiftBump = Btn8R
btnLiftStash = Btn8L
btnLiftHang = Btn8U
btnIntakeIn = Btn5U
btnIntakeOut = Btn5D
btnArmLockToggle = Btn7D
btnHangerLockToggle = Btn7U
chY = Ch3
chX = Ch1
-------------------------------
-- Controller
-------------------------------

-------------------------------
-- Motors
-------------------------------
-- Intake
rightIntake = motorPort 1
leftIntake = motorPort 10

-- Drive
rightFront = motorPort 2
rightBack = motorPort 3
leftFront = motorPort 8
leftBack = motorPort 9

-- Arm/Lift
rightTopLift = motorPort 4
rightBottomLift = motorPort 5
leftTopLift = motorPort 6
leftBottomLift = motorPort 7
-------------------------------
-- Motors
-------------------------------

-------------------------------
-- Digital
-------------------------------
armLock = digitalPin 1
hangerLock = digitalPin 2
sonarInput = digitalPin 11
sonarOutput = digitalPin 12
-------------------------------
-- Digital
-------------------------------