module Intake (intakeSet, intakeRun, threadIntake) where

import ConfigMap

import Vexell
import ChibiOS

import Foreign.C.Types
import Control.Monad

intakeSet :: CInt -> IO ()
intakeSet v = mapM_ (flip motorSet $ v) [leftIntake, rightIntake]

intakeRun :: IO ()
intakeRun = do
  intakeIn  <- buttonGet btnIntakeIn
  intakeOut <- buttonGet btnIntakeOut
  intakeSet $ nextState intakeIn intakeOut
  where nextState b1 b2
          | b1 = 127
          | b2 = (-127)
          | otherwise = 0

threadIntake :: IO ()
threadIntake = forever $ intakeRun >> sleep 20
