-----------------------------------------------------------------------------
-- |
-- Module      :  Graphics.Win32.Icon
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

module Graphics.Win32.Icon where

import Graphics.Win32.GDI.Types
import System.Win32.Types

----------------------------------------------------------------
-- Icons
----------------------------------------------------------------

copyIcon :: HICON -> IO HICON
copyIcon icon =
  failIfNull "CopyIcon" $ c_CopyIcon icon
foreign import stdcall unsafe "windows.h CopyIcon"
  c_CopyIcon :: HICON -> IO HICON

drawIcon :: HDC -> Int -> Int -> HICON -> IO ()
drawIcon dc x y icon =
  failIfFalse_ "DrawIcon" $ c_DrawIcon dc x y icon
foreign import stdcall unsafe "windows.h DrawIcon"
  c_DrawIcon :: HDC -> Int -> Int -> HICON -> IO Bool

destroyIcon :: HICON -> IO ()
destroyIcon icon =
  failIfFalse_ "DestroyIcon" $ c_DestroyIcon icon
foreign import stdcall unsafe "windows.h DestroyIcon"
  c_DestroyIcon :: HICON -> IO Bool

----------------------------------------------------------------
-- End
----------------------------------------------------------------
