-----------------------------------------------------------------------------
-- |
-- Module      :  Graphics.Win32.GDI.Region
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

module Graphics.Win32.GDI.Region where

import System.Win32.Types
import Graphics.Win32.GDI.Types

import Foreign

----------------------------------------------------------------
-- Regions
----------------------------------------------------------------

badRegion :: RegionType -> Bool
badRegion n = n == 0 || n == gDI_ERROR

combineRgn :: HRGN -> HRGN -> HRGN -> ClippingMode -> IO RegionType
combineRgn dest src1 src2 mode =
  withForeignPtr dest $ \ p_dest ->
  withForeignPtr src1 $ \ p_src1 ->
  withForeignPtr src2 $ \ p_src2 ->
  failIf badRegion "CombineRgn" $ c_CombineRgn p_dest p_src1 p_src2 mode
foreign import stdcall unsafe "windows.h CombineRgn"
  c_CombineRgn :: PRGN -> PRGN -> PRGN -> ClippingMode -> IO RegionType

offsetRgn :: HRGN -> INT -> INT -> IO RegionType
offsetRgn rgn xoff yoff =
  withForeignPtr rgn $ \ p_rgn ->
  failIf badRegion "OffsetRgn" $ c_OffsetRgn p_rgn xoff yoff
foreign import stdcall unsafe "windows.h OffsetRgn"
  c_OffsetRgn :: PRGN -> INT -> INT -> IO RegionType

getRgnBox :: HRGN -> LPRECT -> IO RegionType
getRgnBox rgn p_rect =
  withForeignPtr rgn $ \ p_rgn ->
  failIf badRegion "GetRgnBox" $ c_GetRgnBox p_rgn p_rect
foreign import stdcall unsafe "windows.h GetRgnBox"
  c_GetRgnBox :: PRGN -> LPRECT -> IO RegionType

createEllipticRgn :: INT -> INT -> INT -> INT -> IO HRGN
createEllipticRgn x0 y0 x1 y1 = do
  ptr <- failIfNull "CreateEllipticRgn" $ c_CreateEllipticRgn x0 y0 x1 y1
  newForeignHANDLE ptr
foreign import stdcall unsafe "windows.h CreateEllipticRgn"
  c_CreateEllipticRgn :: INT -> INT -> INT -> INT -> IO PRGN

createEllipticRgnIndirect :: LPRECT -> IO HRGN
createEllipticRgnIndirect rp = do
  ptr <- failIfNull "CreateEllipticRgnIndirect" $ c_CreateEllipticRgnIndirect rp
  newForeignHANDLE ptr
foreign import stdcall unsafe "windows.h CreateEllipticRgnIndirect"
  c_CreateEllipticRgnIndirect :: LPRECT -> IO PRGN

createRectRgn :: INT -> INT -> INT -> INT -> IO HRGN
createRectRgn x0 y0 x1 y1 = do
  ptr <- failIfNull "CreateRectRgn" $ c_CreateRectRgn x0 y0 x1 y1
  newForeignHANDLE ptr
foreign import stdcall unsafe "windows.h CreateRectRgn"
  c_CreateRectRgn :: INT -> INT -> INT -> INT -> IO PRGN

createRectRgnIndirect :: LPRECT -> IO HRGN
createRectRgnIndirect rp = do
  ptr <- failIfNull "CreateRectRgnIndirect" $ c_CreateRectRgnIndirect rp
  newForeignHANDLE ptr
foreign import stdcall unsafe "windows.h CreateRectRgnIndirect"
  c_CreateRectRgnIndirect :: LPRECT -> IO PRGN

createRoundRectRgn :: INT -> INT -> INT -> INT -> INT -> INT -> IO HRGN
createRoundRectRgn x0 y0 x1 y1 h w = do
  ptr <- failIfNull "CreateRoundRectRgn" $ c_CreateRoundRectRgn x0 y0 x1 y1 h w
  newForeignHANDLE ptr
foreign import stdcall unsafe "windows.h CreateRoundRectRgn"
  c_CreateRoundRectRgn :: INT -> INT -> INT -> INT -> INT -> INT -> IO PRGN

createPolygonRgn :: [POINT] -> PolyFillMode -> IO HRGN
createPolygonRgn ps mode =
  withPOINTArray ps $ \ point_array npoints -> do
  ptr <- failIfNull "CreatePolygonRgn" $
    c_CreatePolygonRgn point_array npoints mode
  newForeignHANDLE ptr
foreign import stdcall unsafe "windows.h CreatePolygonRgn"
  c_CreatePolygonRgn :: Ptr POINT -> Int -> PolyFillMode -> IO PRGN

-- Needs to do proper error test for EqualRgn; GSL ???

foreign import stdcall unsafe "windows.h EqualRgn"
  equalRgn :: PRGN -> PRGN -> IO Bool

fillRgn :: HDC -> HRGN -> HBRUSH -> IO ()
fillRgn dc rgn brush =
  withForeignPtr rgn $ \ p_rgn ->
  failIfFalse_ "FillRgn" $ c_FillRgn dc p_rgn brush
foreign import stdcall unsafe "windows.h FillRgn"
  c_FillRgn :: HDC -> PRGN -> HBRUSH -> IO Bool

invertRgn :: HDC -> HRGN -> IO ()
invertRgn dc rgn =
  withForeignPtr rgn $ \ p_rgn ->
  failIfFalse_ "InvertRgn" $ c_InvertRgn dc p_rgn
foreign import stdcall unsafe "windows.h InvertRgn"
  c_InvertRgn :: HDC -> PRGN -> IO Bool

paintRgn :: HDC -> HRGN -> IO ()
paintRgn dc rgn =
  withForeignPtr rgn $ \ p_rgn ->
  failIfFalse_ "PaintRgn" $ c_PaintRgn dc p_rgn
foreign import stdcall unsafe "windows.h PaintRgn"
  c_PaintRgn :: HDC -> PRGN -> IO Bool

frameRgn :: HDC -> HRGN -> HBRUSH -> Int -> Int -> IO ()
frameRgn dc rgn brush w h =
  withForeignPtr rgn $ \ p_rgn ->
  failIfFalse_ "FrameRgn" $ c_FrameRgn dc p_rgn brush w h
foreign import stdcall unsafe "windows.h FrameRgn"
  c_FrameRgn :: HDC -> PRGN -> HBRUSH -> Int -> Int -> IO Bool

ptInRegion :: HRGN -> Int -> Int -> IO Bool
ptInRegion rgn x y =
  withForeignPtr rgn $ \ p_rgn ->
  c_PtInRegion p_rgn x y
foreign import stdcall unsafe "windows.h PtInRegion"
  c_PtInRegion :: PRGN -> Int -> Int -> IO Bool

rectInRegion :: HRGN -> RECT -> IO Bool
rectInRegion rgn rect =
  withForeignPtr rgn $ \ p_rgn ->
  withRECT rect $ c_RectInRegion p_rgn
foreign import stdcall unsafe "windows.h RectInRegion"
  c_RectInRegion :: PRGN -> Ptr RECT -> IO Bool

----------------------------------------------------------------
-- End
----------------------------------------------------------------
