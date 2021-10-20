{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DUNICODE #-}
{-# INCLUDE <windows.h> #-}
{-# LINE 1 "Graphics\Win32\GDI\Pen.hsc" #-}
-----------------------------------------------------------------------------
{-# LINE 2 "Graphics\Win32\GDI\Pen.hsc" #-}
-- |
-- Module      :  Graphics.Win32.GDI.Pen
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

module Graphics.Win32.GDI.Pen where

import System.Win32.Types
import Graphics.Win32.GDI.Types


{-# LINE 21 "Graphics\Win32\GDI\Pen.hsc" #-}

----------------------------------------------------------------
-- Stock Objects
----------------------------------------------------------------

type StockPen   = INT

wHITE_PEN     :: StockPen
wHITE_PEN     =  6
bLACK_PEN     :: StockPen
bLACK_PEN     =  7
nULL_PEN      :: StockPen
nULL_PEN      =  8

{-# LINE 33 "Graphics\Win32\GDI\Pen.hsc" #-}

getStockPen :: StockPen -> IO HPEN
getStockPen stockpen =
  failIfNull "GetStockPen" $ c_GetStockPen stockpen
foreign import stdcall unsafe "windows.h GetStockObject"
  c_GetStockPen :: StockPen -> IO HPEN

deletePen :: HPEN -> IO ()
deletePen pen =
  failIfFalse_ "DeletePen" $ c_DeletePen pen
foreign import stdcall unsafe "windows.h DeleteObject"
  c_DeletePen :: HPEN -> IO Bool

----------------------------------------------------------------
-- Creating pens
----------------------------------------------------------------

type PenStyle   = INT

pS_SOLID              :: PenStyle
pS_SOLID              =  0
pS_DASH               :: PenStyle
pS_DASH               =  1
pS_DOT                :: PenStyle
pS_DOT                =  2
pS_DASHDOT            :: PenStyle
pS_DASHDOT            =  3
pS_DASHDOTDOT         :: PenStyle
pS_DASHDOTDOT         =  4
pS_NULL               :: PenStyle
pS_NULL               =  5
pS_INSIDEFRAME        :: PenStyle
pS_INSIDEFRAME        =  6
pS_USERSTYLE          :: PenStyle
pS_USERSTYLE          =  7
pS_ALTERNATE          :: PenStyle
pS_ALTERNATE          =  8
pS_STYLE_MASK         :: PenStyle
pS_STYLE_MASK         =  15

{-# LINE 64 "Graphics\Win32\GDI\Pen.hsc" #-}

pS_ENDCAP_ROUND       :: PenStyle
pS_ENDCAP_ROUND       =  0
pS_ENDCAP_SQUARE      :: PenStyle
pS_ENDCAP_SQUARE      =  256
pS_ENDCAP_FLAT        :: PenStyle
pS_ENDCAP_FLAT        =  512
pS_ENDCAP_MASK        :: PenStyle
pS_ENDCAP_MASK        =  3840

{-# LINE 71 "Graphics\Win32\GDI\Pen.hsc" #-}

pS_JOIN_ROUND         :: PenStyle
pS_JOIN_ROUND         =  0
pS_JOIN_BEVEL         :: PenStyle
pS_JOIN_BEVEL         =  4096
pS_JOIN_MITER         :: PenStyle
pS_JOIN_MITER         =  8192

{-# LINE 77 "Graphics\Win32\GDI\Pen.hsc" #-}
-- , pS_JOIN_MASK         = PS_JOIN_MASK
{-
If PS_JOIN_MASK is not defined with your GNU Windows32 header files,
you'll have to define it.
-}

pS_COSMETIC           :: PenStyle
pS_COSMETIC           =  0
pS_GEOMETRIC          :: PenStyle
pS_GEOMETRIC          =  65536
pS_TYPE_MASK          :: PenStyle
pS_TYPE_MASK          =  983040

{-# LINE 88 "Graphics\Win32\GDI\Pen.hsc" #-}

createPen :: PenStyle -> INT -> COLORREF -> IO HPEN
createPen style n color =
  failIfNull "CreatePen" $ c_CreatePen style n color
foreign import stdcall unsafe "windows.h CreatePen"
  c_CreatePen :: PenStyle -> INT -> COLORREF -> IO HPEN

-- Not very well supported on Win'95
-- %fun NullHANDLE ExtCreatePen :: PenStyle -> INT -> LOGBRUSH -> [StyleBit] -> IO HPEN

-- ToDo: CreatePenIndirect

----------------------------------------------------------------
-- End
----------------------------------------------------------------
