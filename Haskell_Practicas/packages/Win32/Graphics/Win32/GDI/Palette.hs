{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DUNICODE #-}
{-# INCLUDE <windows.h> #-}
{-# LINE 1 "Graphics\Win32\GDI\Palette.hsc" #-}
-----------------------------------------------------------------------------
{-# LINE 2 "Graphics\Win32\GDI\Palette.hsc" #-}
-- |
-- Module      :  Graphics.Win32.GDI.Palette
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

module Graphics.Win32.GDI.Palette where

import System.Win32.Types
import Graphics.Win32.GDI.Types


{-# LINE 21 "Graphics\Win32\GDI\Palette.hsc" #-}

----------------------------------------------------------------
-- Palettes
----------------------------------------------------------------

type StockPalette   = WORD

dEFAULT_PALETTE  :: StockPalette
dEFAULT_PALETTE  =  15

{-# LINE 31 "Graphics\Win32\GDI\Palette.hsc" #-}

getStockPalette :: StockPalette -> IO HPALETTE
getStockPalette sp =
  failIfNull "GetStockPalette" $ c_GetStockPalette sp
foreign import stdcall unsafe "windows.h GetStockObject"
  c_GetStockPalette :: StockPalette -> IO HPALETTE

deletePalette :: HPALETTE -> IO ()
deletePalette p =
  failIfFalse_ "DeletePalette" $ c_DeletePalette p
foreign import stdcall unsafe "windows.h DeleteObject"
  c_DeletePalette :: HPALETTE -> IO Bool

----------------------------------------------------------------
-- End
----------------------------------------------------------------
