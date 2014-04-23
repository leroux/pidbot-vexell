module Autonomous (autonomous) where

foreign import capi "c_extern.h autonomous" c_autonomous :: IO ()
autonomous :: IO ()
autonomous = c_autonomous
