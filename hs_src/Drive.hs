module Drive (driveRun, threadDrive) where

import ChibiOS

import Foreign.C.Types
import Control.Monad

foreign import capi "c_extern.h driveRun"
  c_driveRun :: IO ()
driveRun = c_driveRun

threadDrive :: IO ()
threadDrive = forever $ driveRun >> sleep 20
