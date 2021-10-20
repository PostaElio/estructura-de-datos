{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DUNICODE #-}
{-# INCLUDE <windows.h> #-}
{-# LINE 1 "System\Win32\Process.hsc" #-}
-----------------------------------------------------------------------------
{-# LINE 2 "System\Win32\Process.hsc" #-}
-- |
-- Module      :  System.Win32.Process
-- Copyright   :  (c) Alastair Reid, 1997-2003
-- License     :  BSD-style (see the file libraries/base/LICENSE)
--
-- Maintainer  :  libraries@haskell.org
-- Stability   :  provisional
-- Portability :  portable
--
-- A collection of FFI declarations for interfacing with Win32.
--
-----------------------------------------------------------------------------

module System.Win32.Process
  ( sleep       -- :: DWORD -> IO ()
  , iNFINITE    -- :: DWORD
  ) where

import System.Win32.Types


{-# LINE 23 "System\Win32\Process.hsc" #-}

-- constant to wait for a very long time.
iNFINITE :: DWORD
iNFINITE = 4294967295
{-# LINE 27 "System\Win32\Process.hsc" #-}

foreign import stdcall unsafe "windows.h Sleep"
  sleep :: DWORD -> IO ()
