module Arm (armInit, armRun, threadArm) where

import ChibiOS

import Foreign.C.Types
import Control.Monad

foreign import capi "c_extern.h armInit"
  c_armInit :: IO ()
armInit = c_armInit

foreign import capi "c_extern.h armRun"
  c_armRun :: IO ()
armRun :: IO ()
armRun = c_armRun

threadArm :: IO ()
threadArm = armInit >> (forever $ armRun >> sleep 20)
