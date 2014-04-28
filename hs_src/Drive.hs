module Drive (driveRun, threadDrive) where

import ConfigMap

import Vexell
import ChibiOS

import Foreign.C.Types
import Control.Monad

driveSet :: CInt -> CInt -> IO ()
driveSet l r = do
  motorSet leftDrive l
  motorSet rightDrive r

driveRun :: IO ()
driveRun = do
  x <- axisGet chX
  y <- axisGet chY
  driveSet (y + x) (y - x)

threadDrive :: IO ()
threadDrive = forever $ driveRun >> sleep 20
