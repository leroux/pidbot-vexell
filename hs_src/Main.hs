{-# LANGUAGE ForeignFunctionInterface #-}
module Main where

import Vexell
import Autonomous
import Arm
import ArmLock
import Drive
import HangerLock
import Intake

import ChibiOS

import Control.Concurrent
import Control.Monad

foreign export ccall "hs_vexUserSetup" vexUserSetup :: IO ()
foreign export ccall "hs_vexUserInit" vexUserInit :: IO ()
foreign export ccall "vexOperator" vexOperator :: IO ()
foreign export ccall "vexAutonomous" vexAutonomous :: IO ()

foreign import capi "c_extern.h vexUserSetup" c_vexUserSetup :: IO ()
foreign import capi "c_extern.h c_vexOperator" c_vexOperator :: IO ()
foreign import capi "c_extern.h vexUserInit" c_vexUserInit :: IO ()
foreign import capi "c_extern.h c_vexAutonomous" c_vexAutonomous :: IO ()

---------------------------------------
-- Convex Functions                  --
---------------------------------------
vexUserSetup :: IO ()
vexUserSetup = c_vexUserSetup

-- Pre-autonomous
vexUserInit :: IO ()
vexUserInit = c_vexUserInit

vexOperator :: IO ()
vexOperator = vexOperator_singleThread

vexAutonomous :: IO ()
vexAutonomous = do
  mapM_ (void . forkOS) [threadArm]
  void autonomous
---------------------------------------

vexOperator_multiThread :: IO ()
vexOperator_multiThread = do
  armInit >> armLockInit >> hangerLockInit
  mapM_ (void . forkOS)
    [threadArm, threadDrive, threadIntake]

-- throw all subsystem threads into one (use until threading works again)
vexOperator_singleThread :: IO ()
vexOperator_singleThread = do
  -- initializations
  armInit >> armLockInit >> hangerLockInit
  -- run subsystems forever
  forever $ do
    armRun >> driveRun >> intakeRun >> armLockRun >> hangerLockRun
    sleep 20

-- hs main is called from c main().
-- vexUserSetup, vexUserInit, vexOperator, and vexAutonomous are called from the
-- c vexCortexInit() function.
main :: IO ()
main = return ()
