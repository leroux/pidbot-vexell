module HangerLock where

import ConfigMap

import Vexell
import ChibiOS

import Foreign.C.Types
import Control.Monad

hangerLockSet :: DigitalState -> IO ()
hangerLockSet = digitalPinSet hangerLock

foreign import capi "c_extern.h hangerLockInit"
  c_hangerLockInit :: IO ()
hangerLockInit :: IO ()
hangerLockInit = c_hangerLockInit

foreign import capi "c_extern.h hangerLockRun"
  c_hangerLockRun :: IO ()
hangerLockRun = c_hangerLockRun

threadHangerLock :: IO ()
threadHangerLock = hangerLockInit >> (forever $ hangerLockRun >> sleep 20)
