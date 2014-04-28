{-# LANGUAGE ForeignFunctionInterface #-}
module Main where

import Vexell
import Drive

import ChibiOS

import Control.Concurrent
import Control.Monad

foreign export ccall "hs_vexUserSetup" vexUserSetup :: IO ()
foreign export ccall "hs_vexUserInit" vexUserInit :: IO ()
foreign export ccall "vexOperator" vexOperator :: IO ()
foreign export ccall "hs_vexAutonomous" vexAutonomous :: IO ()

foreign import capi "c_extern.h vexUserSetup" c_vexUserSetup :: IO ()
foreign import capi "c_extern.h vexUserInit" c_vexUserInit :: IO ()
foreign import capi "c_extern.h c_vexOperator" c_vexOperator :: IO ()
foreign import capi "c_extern.h vexAutonomous" c_vexAutonomous :: IO ()

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
  mapM_ (void . forkOS) []
  -- autonomous
---------------------------------------

vexOperator_multiThread :: IO ()
vexOperator_multiThread = mapM_ (void . forkOS) [threadDrive]

-- throw all subsystem threads into one (use until threading works again)
vexOperator_singleThread :: IO ()
vexOperator_singleThread = forever $ do
  driveRun
  sleep 20

-- hs main is called from c main().
-- vexUserSetup, vexUserInit, vexOperator, and vexAutonomous are called from the
-- c vexCortexInit() function, so there is no need to make calls to them from hs main.
main :: IO ()
main = return ()
