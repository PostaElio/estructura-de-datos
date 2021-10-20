{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DUNICODE #-}
{-# INCLUDE <windows.h> #-}
{-# LINE 1 "Graphics\Win32\GDI\Types.hsc" #-}
-----------------------------------------------------------------------------
{-# LINE 2 "Graphics\Win32\GDI\Types.hsc" #-}
-- |
-- Module      :  Graphics.Win32.GDI.Types
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

module Graphics.Win32.GDI.Types
{-  -- still incomplete
	( POINT,        marshall_point, unmarshall_point
	, ListPOINT,    marshall_ListPOINT_
	, ListLenPOINT, marshall_ListLenPOINT_
	, RECT,         marshall_rect, unmarshall_rect
	, SIZE,         marshall_size, unmarshall_size
	, nullPtr
	, HBITMAP	, MbHBITMAP
	, HFONT		, MbHFONT
	, HCURSOR	, MbHCURSOR
	, HICON		, MbHICON
	, HRGN		, MbHRGN
	, PRGN
	, HPALETTE	, MbHPALETTE
	, HBRUSH	, MbHBRUSH
	, HPEN		, MbHPEN
	, HACCEL	--, MbHACCEL
	, HDC		, MbHDC
	, HDWP          , MbHDWP
	, HWND		, MbHWND
	, HMENU		, MbHMENU
	, PolyFillMode
	, ArcDirection
	, MbArcDirection
	, GraphicsMode
	, MbGraphicsMode
	, BackgroundMode
	, HatchStyle
	, StretchBltMode
	, COLORREF
	, TextAlignment
	, ClippingMode
	, RegionType
	, gDI_ERROR
	)
-}
	where

import System.Win32.Types

import Control.Monad( zipWithM_ )
import Foreign


{-# LINE 60 "Graphics\Win32\GDI\Types.hsc" #-}

{-# CFILES cbits/HsGDI.c #-}

----------------------------------------------------------------
--
----------------------------------------------------------------

type POINT =
  ( LONG  -- x
  , LONG  -- y
  )

sizeofPOINT :: Int
sizeofPOINT = (8)
{-# LINE 74 "Graphics\Win32\GDI\Types.hsc" #-}

allocaPOINT :: (Ptr POINT -> IO a) -> IO a
allocaPOINT =
  allocaBytes sizeofPOINT

peekPOINT :: Ptr POINT -> IO POINT
peekPOINT p = do
  x <- (\hsc_ptr -> peekByteOff hsc_ptr 0) p
{-# LINE 82 "Graphics\Win32\GDI\Types.hsc" #-}
  y <- (\hsc_ptr -> peekByteOff hsc_ptr 4) p
{-# LINE 83 "Graphics\Win32\GDI\Types.hsc" #-}
  return (x,y)

pokePOINT :: Ptr POINT -> POINT -> IO ()
pokePOINT p (x,y) = do
  (\hsc_ptr -> pokeByteOff hsc_ptr 0) p x
{-# LINE 88 "Graphics\Win32\GDI\Types.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 4) p y
{-# LINE 89 "Graphics\Win32\GDI\Types.hsc" #-}

withPOINT :: POINT -> (Ptr POINT -> IO a) -> IO a
withPOINT p f =
  allocaPOINT $ \ ptr -> do
  pokePOINT ptr p
  f ptr

type RECT =
  ( LONG  -- left
  , LONG  -- top
  , LONG  -- right
  , LONG  -- bottom
  )

allocaRECT :: (Ptr RECT -> IO a) -> IO a
allocaRECT =
  allocaBytes ((16))
{-# LINE 106 "Graphics\Win32\GDI\Types.hsc" #-}

peekRECT :: Ptr RECT -> IO RECT
peekRECT p = do
  left   <- (\hsc_ptr -> peekByteOff hsc_ptr 0) p
{-# LINE 110 "Graphics\Win32\GDI\Types.hsc" #-}
  top    <- (\hsc_ptr -> peekByteOff hsc_ptr 4) p
{-# LINE 111 "Graphics\Win32\GDI\Types.hsc" #-}
  right  <- (\hsc_ptr -> peekByteOff hsc_ptr 8) p
{-# LINE 112 "Graphics\Win32\GDI\Types.hsc" #-}
  bottom <- (\hsc_ptr -> peekByteOff hsc_ptr 12) p
{-# LINE 113 "Graphics\Win32\GDI\Types.hsc" #-}
  return (left, top, right, bottom)

pokeRECT :: Ptr RECT -> RECT -> IO ()
pokeRECT p (left, top, right, bottom) = do
  (\hsc_ptr -> pokeByteOff hsc_ptr 0)   p left
{-# LINE 118 "Graphics\Win32\GDI\Types.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 4)    p top
{-# LINE 119 "Graphics\Win32\GDI\Types.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 8)  p right
{-# LINE 120 "Graphics\Win32\GDI\Types.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 12) p bottom
{-# LINE 121 "Graphics\Win32\GDI\Types.hsc" #-}

type SIZE =
  ( LONG  -- cx
  , LONG  -- cy
  )

allocaSIZE :: (Ptr SIZE -> IO a) -> IO a
allocaSIZE =
  allocaBytes ((8))
{-# LINE 130 "Graphics\Win32\GDI\Types.hsc" #-}

peekSIZE :: Ptr SIZE -> IO SIZE
peekSIZE p = do
  cx <- (\hsc_ptr -> peekByteOff hsc_ptr 0) p
{-# LINE 134 "Graphics\Win32\GDI\Types.hsc" #-}
  cy <- (\hsc_ptr -> peekByteOff hsc_ptr 4) p
{-# LINE 135 "Graphics\Win32\GDI\Types.hsc" #-}
  return (cx,cy)

pokeSIZE :: Ptr SIZE -> SIZE -> IO ()
pokeSIZE p (cx,cy) = do
  (\hsc_ptr -> pokeByteOff hsc_ptr 0) p cx
{-# LINE 140 "Graphics\Win32\GDI\Types.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 4) p cy
{-# LINE 141 "Graphics\Win32\GDI\Types.hsc" #-}

----------------------------------------------------------------

withPOINTArray :: [POINT] -> (Ptr POINT -> Int -> IO a) -> IO a
withPOINTArray xs f = allocaBytes (sizeofPOINT * len) $ \ ptr -> do
  pokePOINTArray ptr xs
  f ptr len
 where
  len = length xs

pokePOINTArray :: Ptr POINT -> [POINT] -> IO ()
pokePOINTArray ptr xs = zipWithM_ (setPOINT ptr) [0..] xs

setPOINT :: Ptr POINT -> Int -> POINT -> IO ()
setPOINT ptr off = pokePOINT (ptr `plusPtr` (off*sizeofPOINT))

type   LPRECT   = Ptr RECT
type MbLPRECT   = Maybe LPRECT

withRECT :: RECT -> (Ptr RECT -> IO a) -> IO a
withRECT r f =
  allocaRECT $ \ ptr -> do
  pokeRECT ptr r
  f ptr

getRECT :: LPRECT -> IO RECT
getRECT = peekRECT

----------------------------------------------------------------
-- (GDI related) Handles
----------------------------------------------------------------

type   HBITMAP    = HANDLE
type MbHBITMAP    = Maybe HBITMAP

type   HFONT      = HANDLE
type MbHFONT      = Maybe HFONT

type   HCURSOR    = HICON
type MbHCURSOR    = Maybe HCURSOR

type   HICON      = HANDLE
type MbHICON      = Maybe HICON


-- This is not the only handle / resource that should be
-- finalised for you, but it's a start.
-- ToDo.

type   HRGN       = ForeignHANDLE
type   PRGN       = HANDLE

type MbHRGN       = Maybe HRGN

type   HPALETTE   = HANDLE
type MbHPALETTE   = Maybe HPALETTE

type   HBRUSH     = HANDLE
type MbHBRUSH     = Maybe HBRUSH

type   HPEN       = HANDLE
type MbHPEN       = Maybe HPEN

type   HACCEL     = HANDLE

type   HDC        = HANDLE
type MbHDC        = Maybe HDC

type   HDWP       = HANDLE
type MbHDWP       = Maybe HDWP

type   HWND       = HANDLE
type MbHWND       = Maybe HWND

hWND_BOTTOM     :: HWND
hWND_BOTTOM     = castUINTToPtr 1
hWND_NOTOPMOST  :: HWND
hWND_NOTOPMOST  = castUINTToPtr 4294967294
hWND_TOP        :: HWND
hWND_TOP        = castUINTToPtr 0
hWND_TOPMOST    :: HWND
hWND_TOPMOST    = castUINTToPtr 4294967295

{-# LINE 221 "Graphics\Win32\GDI\Types.hsc" #-}

type   HMENU      = HANDLE
type MbHMENU      = Maybe HMENU

----------------------------------------------------------------
-- COLORREF
----------------------------------------------------------------

type COLORREF   = Word32
{-# LINE 230 "Graphics\Win32\GDI\Types.hsc" #-}

foreign import ccall unsafe "HsGDI.h"
  rgb :: BYTE -> BYTE -> BYTE -> COLORREF

foreign import ccall unsafe "HsGDI.h"
  getRValue :: COLORREF -> BYTE

foreign import ccall unsafe "HsGDI.h"
  getGValue :: COLORREF -> BYTE

foreign import ccall unsafe "HsGDI.h"
  getBValue :: COLORREF -> BYTE

foreign import ccall unsafe "HsGDI.h"
  pALETTERGB :: BYTE -> BYTE -> BYTE -> COLORREF

foreign import ccall unsafe "HsGDI.h"
  pALETTEINDEX :: WORD -> COLORREF

----------------------------------------------------------------
-- RasterOp macro
----------------------------------------------------------------

type RasterOp3 = Word32
type RasterOp4 = Word32

foreign import ccall unsafe "HsGDI.h"
  mAKEROP4 :: RasterOp3 -> RasterOp3 -> RasterOp4

----------------------------------------------------------------
-- Miscellaneous enumerations
----------------------------------------------------------------

type PolyFillMode   = INT
aLTERNATE         :: PolyFillMode
aLTERNATE         =  1
wINDING           :: PolyFillMode
wINDING           =  2

{-# LINE 268 "Graphics\Win32\GDI\Types.hsc" #-}

----------------------------------------------------------------

type ArcDirection   = INT
type MbArcDirection = Maybe ArcDirection
aD_COUNTERCLOCKWISE  :: ArcDirection
aD_COUNTERCLOCKWISE  =  1
aD_CLOCKWISE         :: ArcDirection
aD_CLOCKWISE         =  2

{-# LINE 277 "Graphics\Win32\GDI\Types.hsc" #-}

----------------------------------------------------------------

type GraphicsMode   = DWORD
type MbGraphicsMode = Maybe GraphicsMode
gM_COMPATIBLE     :: GraphicsMode
gM_COMPATIBLE     =  1
gM_ADVANCED       :: GraphicsMode
gM_ADVANCED       =  2

{-# LINE 286 "Graphics\Win32\GDI\Types.hsc" #-}

----------------------------------------------------------------

type BackgroundMode = INT
tRANSPARENT   :: BackgroundMode
tRANSPARENT   =  1
oPAQUE        :: BackgroundMode
oPAQUE        =  2

{-# LINE 294 "Graphics\Win32\GDI\Types.hsc" #-}

----------------------------------------------------------------

type HatchStyle   = INT
hS_HORIZONTAL   :: HatchStyle
hS_HORIZONTAL   =  0
hS_VERTICAL     :: HatchStyle
hS_VERTICAL     =  1
hS_FDIAGONAL    :: HatchStyle
hS_FDIAGONAL    =  2
hS_BDIAGONAL    :: HatchStyle
hS_BDIAGONAL    =  3
hS_CROSS        :: HatchStyle
hS_CROSS        =  4
hS_DIAGCROSS    :: HatchStyle
hS_DIAGCROSS    =  5

{-# LINE 306 "Graphics\Win32\GDI\Types.hsc" #-}

----------------------------------------------------------------

type StretchBltMode    = INT
bLACKONWHITE         :: StretchBltMode
bLACKONWHITE         =  1
wHITEONBLACK         :: StretchBltMode
wHITEONBLACK         =  2
cOLORONCOLOR         :: StretchBltMode
cOLORONCOLOR         =  3
hALFTONE             :: StretchBltMode
hALFTONE             =  4
sTRETCH_ANDSCANS     :: StretchBltMode
sTRETCH_ANDSCANS     =  1
sTRETCH_ORSCANS      :: StretchBltMode
sTRETCH_ORSCANS      =  2
sTRETCH_DELETESCANS  :: StretchBltMode
sTRETCH_DELETESCANS  =  3

{-# LINE 319 "Graphics\Win32\GDI\Types.hsc" #-}

----------------------------------------------------------------

type TextAlignment = UINT
tA_NOUPDATECP    :: TextAlignment
tA_NOUPDATECP    =  0
tA_UPDATECP      :: TextAlignment
tA_UPDATECP      =  1
tA_LEFT          :: TextAlignment
tA_LEFT          =  0
tA_RIGHT         :: TextAlignment
tA_RIGHT         =  2
tA_CENTER        :: TextAlignment
tA_CENTER        =  6
tA_TOP           :: TextAlignment
tA_TOP           =  0
tA_BOTTOM        :: TextAlignment
tA_BOTTOM        =  8
tA_BASELINE      :: TextAlignment
tA_BASELINE      =  24

{-# LINE 333 "Graphics\Win32\GDI\Types.hsc" #-}

----------------------------------------------------------------

type ClippingMode  = INT
rGN_AND          :: ClippingMode
rGN_AND          =  1
rGN_OR           :: ClippingMode
rGN_OR           =  2
rGN_XOR          :: ClippingMode
rGN_XOR          =  3
rGN_DIFF         :: ClippingMode
rGN_DIFF         =  4
rGN_COPY         :: ClippingMode
rGN_COPY         =  5

{-# LINE 344 "Graphics\Win32\GDI\Types.hsc" #-}

----------------------------------------------------------------

type RegionType    = INT
eRROR            :: RegionType
eRROR            =  0
nULLREGION       :: RegionType
nULLREGION       =  1
sIMPLEREGION     :: RegionType
sIMPLEREGION     =  2
cOMPLEXREGION    :: RegionType
cOMPLEXREGION    =  3

{-# LINE 354 "Graphics\Win32\GDI\Types.hsc" #-}

gDI_ERROR  :: Num a => a
gDI_ERROR   = 4294967295
{-# LINE 357 "Graphics\Win32\GDI\Types.hsc" #-}

cLR_INVALID :: COLORREF
cLR_INVALID = 4294967295
{-# LINE 360 "Graphics\Win32\GDI\Types.hsc" #-}

----------------------------------------------------------------

oBJ_PEN          :: UINT
oBJ_PEN          =  1
oBJ_BRUSH        :: UINT
oBJ_BRUSH        =  2
oBJ_DC           :: UINT
oBJ_DC           =  3
oBJ_METADC       :: UINT
oBJ_METADC       =  4
oBJ_PAL          :: UINT
oBJ_PAL          =  5
oBJ_FONT         :: UINT
oBJ_FONT         =  6
oBJ_BITMAP       :: UINT
oBJ_BITMAP       =  7
oBJ_REGION       :: UINT
oBJ_REGION       =  8
oBJ_METAFILE     :: UINT
oBJ_METAFILE     =  9
oBJ_MEMDC        :: UINT
oBJ_MEMDC        =  10
oBJ_EXTPEN       :: UINT
oBJ_EXTPEN       =  11
oBJ_ENHMETADC    :: UINT
oBJ_ENHMETADC    =  12
oBJ_ENHMETAFILE  :: UINT
oBJ_ENHMETAFILE  =  13

{-# LINE 378 "Graphics\Win32\GDI\Types.hsc" #-}

----------------------------------------------------------------
-- Miscellaneous primitives
----------------------------------------------------------------

-- Can't pass structs with current FFI, so use C wrappers

foreign import ccall unsafe "HsGDI.h"
  prim_ChildWindowFromPoint :: HWND -> Ptr POINT -> IO HWND
foreign import ccall unsafe "HsGDI.h"
  prim_ChildWindowFromPointEx :: HWND -> Ptr POINT -> DWORD -> IO HWND
foreign import ccall unsafe "HsGDI.h"
  prim_MenuItemFromPoint :: HWND -> HMENU -> Ptr POINT -> IO UINT

----------------------------------------------------------------
-- End
----------------------------------------------------------------
