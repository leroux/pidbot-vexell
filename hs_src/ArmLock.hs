module ArmLock (armLockInit, armLockRun, threadArmLock) where

import ChibiOS

import Foreign.C.Types
import Control.Monad

foreign import capi "c_extern.h armLockInit"
  c_armLockInit :: IO ()
armLockInit = c_armLockInit

foreign import capi "c_extern.h armLockRun"
  c_armLockRun :: IO ()
armLockRun = c_armLockRun

threadArmLock :: IO ()
threadArmLock = armLockInit >> (forever $ armLockRun >> sleep 20)
