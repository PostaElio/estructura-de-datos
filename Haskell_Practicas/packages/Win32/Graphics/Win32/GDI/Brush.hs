{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DUNICODE #-}
{-# INCLUDE <windows.h> #-}
{-# LINE 1 "Graphics\Win32\GDI\Brush.hsc" #-}
-----------------------------------------------------------------------------
{-# LINE 2 "Graphics\Win32\GDI\Brush.hsc" #-}
-- |
-- Module      :  Graphics.Win32.GDI.Brush
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

module Graphics.Win32.GDI.Brush where

import System.Win32.Types
import Graphics.Win32.GDI.Types


{-# LINE 21 "Graphics\Win32\GDI\Brush.hsc" #-}

----------------------------------------------------------------
-- Brush
----------------------------------------------------------------

createSolidBrush :: COLORREF -> IO HBRUSH
createSolidBrush color =
  failIfNull "CreateSolidBrush" $ c_CreateSolidBrush color
foreign import stdcall unsafe "windows.h CreateSolidBrush"
  c_CreateSolidBrush :: COLORREF -> IO HBRUSH

createHatchBrush :: HatchStyle -> COLORREF -> IO HBRUSH
createHatchBrush style color =
  failIfNull "CreateHatchBrush" $ c_CreateHatchBrush style color
foreign import stdcall unsafe "windows.h CreateHatchBrush"
  c_CreateHatchBrush :: HatchStyle -> COLORREF -> IO HBRUSH

createPatternBrush :: HBITMAP -> IO HBRUSH
createPatternBrush bitmap =
  failIfNull "CreatePatternBrush" $ c_CreatePatternBrush bitmap
foreign import stdcall unsafe "windows.h CreatePatternBrush"
  c_CreatePatternBrush :: HBITMAP -> IO HBRUSH

deleteBrush :: HBRUSH -> IO ()
deleteBrush brush =
  failIfFalse_ "DeleteBrush" $ c_DeleteBrush brush
foreign import stdcall unsafe "windows.h DeleteObject"
  c_DeleteBrush :: HBRUSH -> IO Bool

----------------------------------------------------------------

type StockBrush   = INT

wHITE_BRUSH   :: StockBrush
wHITE_BRUSH   =  0
lTGRAY_BRUSH  :: StockBrush
lTGRAY_BRUSH  =  1
gRAY_BRUSH    :: StockBrush
gRAY_BRUSH    =  2
dKGRAY_BRUSH  :: StockBrush
dKGRAY_BRUSH  =  3
bLACK_BRUSH   :: StockBrush
bLACK_BRUSH   =  4
nULL_BRUSH    :: StockBrush
nULL_BRUSH    =  5
hOLLOW_BRUSH  :: StockBrush
hOLLOW_BRUSH  =  5

{-# LINE 63 "Graphics\Win32\GDI\Brush.hsc" #-}

getStockBrush :: StockBrush -> IO HBRUSH
getStockBrush sb =
  failIfNull "GetStockBrush" $ c_GetStockBrush sb
foreign import stdcall unsafe "windows.h GetStockObject"
  c_GetStockBrush :: StockBrush -> IO HBRUSH

----------------------------------------------------------------
-- End
----------------------------------------------------------------
