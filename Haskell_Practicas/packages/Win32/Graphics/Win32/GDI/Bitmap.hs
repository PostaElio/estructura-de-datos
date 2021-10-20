{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DUNICODE #-}
{-# INCLUDE "Win32Aux.h" #-}
{-# INCLUDE <windows.h> #-}
{-# LINE 1 "Graphics\Win32\GDI\Bitmap.hsc" #-}
-----------------------------------------------------------------------------
{-# LINE 2 "Graphics\Win32\GDI\Bitmap.hsc" #-}
-- |
-- Module      :  Graphics.Win32.GDI.Bitmap
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

module Graphics.Win32.GDI.Bitmap(
	RasterOp3,
	RasterOp4,
	sRCCOPY,
	sRCPAINT,
	sRCAND,
	sRCINVERT,
	sRCERASE,
	nOTSRCCOPY,
	nOTSRCERASE,
	mERGECOPY,
	mERGEPAINT,
	pATCOPY,
	pATPAINT,
	pATINVERT,
	dSTINVERT,
	bLACKNESS,
	wHITENESS,

	mAKEROP4,

	BITMAP,
	LPBITMAP,
	setBITMAP,
	deleteBitmap,
	createCompatibleBitmap,
	createBitmap,
	createBitmapIndirect,
	createDIBPatternBrushPt,
	getBitmapDimensionEx,
	setBitmapDimensionEx,
	getBitmapInfo,

	BitmapCompression,
	bI_RGB,
	bI_RLE8,
	bI_RLE4,
	bI_BITFIELDS,

	ColorFormat,
	dIB_PAL_COLORS,
	dIB_RGB_COLORS,

	LPBITMAPINFO,
	BITMAPINFOHEADER,
	LPBITMAPINFOHEADER,
	getBITMAPINFOHEADER_,

	BITMAPFILEHEADER,
	LPBITMAPFILEHEADER,
	getBITMAPFILEHEADER,

	sizeofBITMAP,
	sizeofBITMAPINFO,
	sizeofBITMAPINFOHEADER,
	sizeofBITMAPFILEHEADER,
	sizeofLPBITMAPFILEHEADER,

	createBMPFile,
	cBM_INIT,
	getDIBits,
	setDIBits,
	createDIBitmap

        ) where

import System.Win32.Types
import Graphics.Win32.GDI.Types

import Control.Monad (liftM)
import Foreign
import Foreign.C


{-# LINE 89 "Graphics\Win32\GDI\Bitmap.hsc" #-}

{-# LINE 90 "Graphics\Win32\GDI\Bitmap.hsc" #-}

----------------------------------------------------------------
-- Resources
----------------------------------------------------------------

-- Yoiks - name clash
-- %dis bitmap x = ptr ({LPTSTR} x)
--
-- type Bitmap = LPCTSTR
--
-- intToBitmap :: Int -> Bitmap
-- intToBitmap i = makeIntResource (toWord i)
--
-- %fun LoadBitmap :: MbHINSTANCE -> Bitmap -> IO HBITMAP
-- %fail { res1 == 0 } { ErrorString("LoadBitmap") }
--
-- %const Bitmap
-- % [ OBM_CLOSE        = { MAKEINTRESOURCE(OBM_CLOSE)       }
-- % , OBM_UPARROW      = { MAKEINTRESOURCE(OBM_UPARROW)     }
-- % , OBM_DNARROW      = { MAKEINTRESOURCE(OBM_DNARROW)     }
-- % , OBM_RGARROW      = { MAKEINTRESOURCE(OBM_RGARROW)     }
-- % , OBM_LFARROW      = { MAKEINTRESOURCE(OBM_LFARROW)     }
-- % , OBM_REDUCE       = { MAKEINTRESOURCE(OBM_REDUCE)      }
-- % , OBM_ZOOM         = { MAKEINTRESOURCE(OBM_ZOOM)        }
-- % , OBM_RESTORE      = { MAKEINTRESOURCE(OBM_RESTORE)     }
-- % , OBM_REDUCED      = { MAKEINTRESOURCE(OBM_REDUCED)     }
-- % , OBM_ZOOMD        = { MAKEINTRESOURCE(OBM_ZOOMD)       }
-- % , OBM_RESTORED     = { MAKEINTRESOURCE(OBM_RESTORED)    }
-- % , OBM_UPARROWD     = { MAKEINTRESOURCE(OBM_UPARROWD)    }
-- % , OBM_DNARROWD     = { MAKEINTRESOURCE(OBM_DNARROWD)    }
-- % , OBM_RGARROWD     = { MAKEINTRESOURCE(OBM_RGARROWD)    }
-- % , OBM_LFARROWD     = { MAKEINTRESOURCE(OBM_LFARROWD)    }
-- % , OBM_MNARROW      = { MAKEINTRESOURCE(OBM_MNARROW)     }
-- % , OBM_COMBO        = { MAKEINTRESOURCE(OBM_COMBO)       }
-- % , OBM_UPARROWI     = { MAKEINTRESOURCE(OBM_UPARROWI)    }
-- % , OBM_DNARROWI     = { MAKEINTRESOURCE(OBM_DNARROWI)    }
-- % , OBM_RGARROWI     = { MAKEINTRESOURCE(OBM_RGARROWI)    }
-- % , OBM_LFARROWI     = { MAKEINTRESOURCE(OBM_LFARROWI)    }
-- % , OBM_OLD_CLOSE    = { MAKEINTRESOURCE(OBM_OLD_CLOSE)   }
-- % , OBM_SIZE         = { MAKEINTRESOURCE(OBM_SIZE)        }
-- % , OBM_OLD_UPARROW  = { MAKEINTRESOURCE(OBM_OLD_UPARROW) }
-- % , OBM_OLD_DNARROW  = { MAKEINTRESOURCE(OBM_OLD_DNARROW) }
-- % , OBM_OLD_RGARROW  = { MAKEINTRESOURCE(OBM_OLD_RGARROW) }
-- % , OBM_OLD_LFARROW  = { MAKEINTRESOURCE(OBM_OLD_LFARROW) }
-- % , OBM_BTSIZE       = { MAKEINTRESOURCE(OBM_BTSIZE)      }
-- % , OBM_CHECK        = { MAKEINTRESOURCE(OBM_CHECK)       }
-- % , OBM_CHECKBOXES   = { MAKEINTRESOURCE(OBM_CHECKBOXES)  }
-- % , OBM_BTNCORNERS   = { MAKEINTRESOURCE(OBM_BTNCORNERS)  }
-- % , OBM_OLD_REDUCE   = { MAKEINTRESOURCE(OBM_OLD_REDUCE)  }
-- % , OBM_OLD_ZOOM     = { MAKEINTRESOURCE(OBM_OLD_ZOOM)    }
-- % , OBM_OLD_RESTORE  = { MAKEINTRESOURCE(OBM_OLD_RESTORE) }
-- % ]

----------------------------------------------------------------
-- Raster Ops
----------------------------------------------------------------

sRCCOPY       :: RasterOp3
sRCCOPY       =  13369376
sRCPAINT      :: RasterOp3
sRCPAINT      =  15597702
sRCAND        :: RasterOp3
sRCAND        =  8913094
sRCINVERT     :: RasterOp3
sRCINVERT     =  6684742
sRCERASE      :: RasterOp3
sRCERASE      =  4457256
nOTSRCCOPY    :: RasterOp3
nOTSRCCOPY    =  3342344
nOTSRCERASE   :: RasterOp3
nOTSRCERASE   =  1114278
mERGECOPY     :: RasterOp3
mERGECOPY     =  12583114
mERGEPAINT    :: RasterOp3
mERGEPAINT    =  12255782
pATCOPY       :: RasterOp3
pATCOPY       =  15728673
pATPAINT      :: RasterOp3
pATPAINT      =  16452105
pATINVERT     :: RasterOp3
pATINVERT     =  5898313
dSTINVERT     :: RasterOp3
dSTINVERT     =  5570569
bLACKNESS     :: RasterOp3
bLACKNESS     =  66
wHITENESS     :: RasterOp3
wHITENESS     =  16711778

{-# LINE 164 "Graphics\Win32\GDI\Bitmap.hsc" #-}

----------------------------------------------------------------
-- BITMAP
----------------------------------------------------------------

type BITMAP =
  ( INT     -- bmType
  , INT     -- bmWidth
  , INT     -- bmHeight
  , INT     -- bmWidthBytes
  , WORD    -- bmPlanes
  , WORD    -- bmBitsPixel
  , LPVOID  -- bmBits
  )

peekBITMAP :: Ptr BITMAP -> IO BITMAP
peekBITMAP p = do
  ty     <- (\hsc_ptr -> peekByteOff hsc_ptr 0) p
{-# LINE 182 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  width  <- (\hsc_ptr -> peekByteOff hsc_ptr 4) p
{-# LINE 183 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  height <- (\hsc_ptr -> peekByteOff hsc_ptr 8) p
{-# LINE 184 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  wbytes <- (\hsc_ptr -> peekByteOff hsc_ptr 12) p
{-# LINE 185 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  planes <- (\hsc_ptr -> peekByteOff hsc_ptr 16) p
{-# LINE 186 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  pixel  <- (\hsc_ptr -> peekByteOff hsc_ptr 18) p
{-# LINE 187 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  bits   <- (\hsc_ptr -> peekByteOff hsc_ptr 20) p
{-# LINE 188 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  return (ty, width, height, wbytes, planes, pixel, bits)

pokeBITMAP :: Ptr BITMAP -> BITMAP -> IO ()
pokeBITMAP p (ty, width, height, wbytes, planes, pixel, bits) = do
  (\hsc_ptr -> pokeByteOff hsc_ptr 0)       p ty
{-# LINE 193 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 4)      p width
{-# LINE 194 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 8)     p height
{-# LINE 195 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 12) p wbytes
{-# LINE 196 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 16)     p planes
{-# LINE 197 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 18)  p pixel
{-# LINE 198 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 20)       p bits
{-# LINE 199 "Graphics\Win32\GDI\Bitmap.hsc" #-}

type LPBITMAP = Ptr BITMAP

setBITMAP :: LPBITMAP -> BITMAP -> IO ()
setBITMAP = pokeBITMAP

----------------------------------------------------------------
-- Misc
----------------------------------------------------------------

deleteBitmap :: HBITMAP -> IO ()
deleteBitmap bitmap =
  failIfFalse_ "DeleteBitmap" $ c_DeleteBitmap bitmap
foreign import stdcall unsafe "windows.h DeleteObject"
  c_DeleteBitmap :: HBITMAP -> IO Bool

createBitmap :: INT -> INT -> UINT -> UINT -> Maybe LPVOID -> IO HBITMAP
createBitmap w h planes bits mb_color_data =
  failIfNull "CreateBitmap" $
    c_CreateBitmap w h planes bits (maybePtr mb_color_data)
foreign import stdcall unsafe "windows.h CreateBitmap"
  c_CreateBitmap :: INT -> INT -> UINT -> UINT -> LPVOID -> IO HBITMAP

createBitmapIndirect :: LPBITMAP -> IO HBITMAP
createBitmapIndirect p_bm =
  failIfNull "CreateBitmapIndirect" $ c_CreateBitmapIndirect p_bm
foreign import stdcall unsafe "windows.h CreateBitmapIndirect"
  c_CreateBitmapIndirect :: LPBITMAP -> IO HBITMAP

createCompatibleBitmap :: HDC -> Int32 -> Int32 -> IO HBITMAP
createCompatibleBitmap dc w h =
  failIfNull "CreateCompatibleBitmap" $ c_CreateCompatibleBitmap dc w h
foreign import stdcall unsafe "windows.h CreateCompatibleBitmap"
  c_CreateCompatibleBitmap :: HDC -> Int32 -> Int32 -> IO HBITMAP

createDIBPatternBrushPt :: LPVOID -> ColorFormat -> IO HBRUSH
createDIBPatternBrushPt bm usage =
  failIfNull "CreateDIBPatternBrushPt" $ c_CreateDIBPatternBrushPt bm usage
foreign import stdcall unsafe "windows.h CreateDIBPatternBrushPt"
  c_CreateDIBPatternBrushPt :: LPVOID -> ColorFormat -> IO HBRUSH

----------------------------------------------------------------
-- Querying
----------------------------------------------------------------

getBitmapDimensionEx :: HBITMAP -> IO SIZE
getBitmapDimensionEx bm =
  allocaSIZE $ \ p_size -> do
  failIfFalse_ "GetBitmapDimensionEx" $ c_GetBitmapDimensionEx bm p_size
  peekSIZE p_size
foreign import stdcall unsafe "windows.h GetBitmapDimensionEx"
  c_GetBitmapDimensionEx :: HBITMAP -> Ptr SIZE -> IO Bool

setBitmapDimensionEx :: HBITMAP -> SIZE -> IO SIZE
setBitmapDimensionEx bm (cx,cy) =
  allocaSIZE $ \ p_size -> do
  failIfFalse_ "SetBitmapDimensionEx" $ do
    c_SetBitmapDimensionEx bm cx cy p_size
  peekSIZE p_size
foreign import stdcall unsafe "windows.h SetBitmapDimensionEx"
  c_SetBitmapDimensionEx :: HBITMAP -> LONG -> LONG -> Ptr SIZE -> IO Bool

getBitmapInfo :: HBITMAP -> IO BITMAP
getBitmapInfo bm =
  allocaBytes (fromIntegral sizeofBITMAP) $ \ p_bm -> do
  failIfFalse_ "GetBitmapInfo" $ c_GetBitmapInfo bm sizeofBITMAP p_bm
  peekBITMAP p_bm
foreign import stdcall unsafe "windows.h GetObjectW"
  c_GetBitmapInfo :: HBITMAP -> DWORD -> LPBITMAP -> IO Bool

----------------------------------------------------------------
--
----------------------------------------------------------------

type BitmapCompression = DWORD

bI_RGB        :: BitmapCompression
bI_RGB        =  0
bI_RLE8       :: BitmapCompression
bI_RLE8       =  1
bI_RLE4       :: BitmapCompression
bI_RLE4       =  2
bI_BITFIELDS  :: BitmapCompression
bI_BITFIELDS  =  3

{-# LINE 281 "Graphics\Win32\GDI\Bitmap.hsc" #-}

type ColorFormat = DWORD

dIB_PAL_COLORS  :: ColorFormat
dIB_PAL_COLORS  =  1
dIB_RGB_COLORS  :: ColorFormat
dIB_RGB_COLORS  =  0

{-# LINE 288 "Graphics\Win32\GDI\Bitmap.hsc" #-}

----------------------------------------------------------------
-- BITMAPINFO
----------------------------------------------------------------

type LPBITMAPINFO = Ptr ()

----------------------------------------------------------------
-- BITMAPINFOHEADER
----------------------------------------------------------------

type BITMAPINFOHEADER =
 ( DWORD              -- biSize      -- sizeof(BITMAPINFOHEADER)
 , LONG               -- biWidth
 , LONG               -- biHeight
 , WORD               -- biPlanes
 , WORD               -- biBitCount  -- 1, 4, 8, 16, 24 or 32
 , BitmapCompression  -- biCompression
 , DWORD              -- biSizeImage
 , LONG               -- biXPelsPerMeter
 , LONG               -- biYPelsPerMeter
 , Maybe DWORD        -- biClrUsed
 , Maybe DWORD        -- biClrImportant
 )

peekBITMAPINFOHEADER :: Ptr BITMAPINFOHEADER -> IO BITMAPINFOHEADER
peekBITMAPINFOHEADER p = do
  size     <- (\hsc_ptr -> peekByteOff hsc_ptr 0) p
{-# LINE 316 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  width    <- (\hsc_ptr -> peekByteOff hsc_ptr 4) p
{-# LINE 317 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  height   <- (\hsc_ptr -> peekByteOff hsc_ptr 8) p
{-# LINE 318 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  planes   <- (\hsc_ptr -> peekByteOff hsc_ptr 12) p
{-# LINE 319 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  nbits    <- (\hsc_ptr -> peekByteOff hsc_ptr 14) p
{-# LINE 320 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  comp     <- (\hsc_ptr -> peekByteOff hsc_ptr 16) p
{-# LINE 321 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  imsize   <- (\hsc_ptr -> peekByteOff hsc_ptr 20) p
{-# LINE 322 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  xDensity <- (\hsc_ptr -> peekByteOff hsc_ptr 24) p
{-# LINE 323 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  yDensity <- (\hsc_ptr -> peekByteOff hsc_ptr 28) p
{-# LINE 324 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  clrUsed  <- liftM numToMaybe $ (\hsc_ptr -> peekByteOff hsc_ptr 32) p
{-# LINE 325 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  clrImp   <- liftM numToMaybe $ (\hsc_ptr -> peekByteOff hsc_ptr 36) p
{-# LINE 326 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  return (size, width, height, planes, nbits, comp, imsize,
          xDensity, yDensity, clrUsed, clrImp)

type LPBITMAPINFOHEADER   = Ptr BITMAPINFOHEADER

getBITMAPINFOHEADER_ :: LPBITMAPINFOHEADER -> IO BITMAPINFOHEADER
getBITMAPINFOHEADER_ = peekBITMAPINFOHEADER

----------------------------------------------------------------
-- BITMAPFILEHEADER
----------------------------------------------------------------

type BITMAPFILEHEADER =
 ( WORD   -- bfType      -- "BM" == 0x4d42
 , DWORD  -- bfSize      -- number of bytes in file
 , WORD   -- bfReserved1 -- == 0
 , WORD   -- bfReserved2 -- == 0
 , DWORD  -- bfOffBits   -- == (char*) bits - (char*) filehdr
 )

peekBITMAPFILEHEADER :: Ptr BITMAPFILEHEADER -> IO BITMAPFILEHEADER
peekBITMAPFILEHEADER p = do
  ty     <- (\hsc_ptr -> peekByteOff hsc_ptr 0) p
{-# LINE 349 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  size   <- (\hsc_ptr -> peekByteOff hsc_ptr 2) p
{-# LINE 350 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  res1   <- (\hsc_ptr -> peekByteOff hsc_ptr 6) p
{-# LINE 351 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  res2   <- (\hsc_ptr -> peekByteOff hsc_ptr 8) p
{-# LINE 352 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  offset <- (\hsc_ptr -> peekByteOff hsc_ptr 10) p
{-# LINE 353 "Graphics\Win32\GDI\Bitmap.hsc" #-}
  return (ty, size, res1, res2, offset)

type LPBITMAPFILEHEADER = Ptr BITMAPFILEHEADER

getBITMAPFILEHEADER :: LPBITMAPFILEHEADER -> IO BITMAPFILEHEADER
getBITMAPFILEHEADER = peekBITMAPFILEHEADER

sizeofBITMAP             :: Word32
sizeofBITMAP             = (24)
{-# LINE 362 "Graphics\Win32\GDI\Bitmap.hsc" #-}
sizeofBITMAPINFO         :: Word32
sizeofBITMAPINFO         = (44)
{-# LINE 364 "Graphics\Win32\GDI\Bitmap.hsc" #-}
sizeofBITMAPINFOHEADER   :: Word32
sizeofBITMAPINFOHEADER   = (40)
{-# LINE 366 "Graphics\Win32\GDI\Bitmap.hsc" #-}
sizeofBITMAPFILEHEADER   :: Word32
sizeofBITMAPFILEHEADER   = (14)
{-# LINE 368 "Graphics\Win32\GDI\Bitmap.hsc" #-}
sizeofLPBITMAPFILEHEADER :: Word32
sizeofLPBITMAPFILEHEADER = (14)
{-# LINE 370 "Graphics\Win32\GDI\Bitmap.hsc" #-}

----------------------------------------------------------------
-- CreateBMPFile
----------------------------------------------------------------

-- A (large) helper function - courtesy of Microsoft

createBMPFile :: String -> HBITMAP -> HDC -> IO ()
createBMPFile name bm dc =
  withCString name $ \ c_name ->
  c_CreateBMPFile c_name bm dc
foreign import ccall unsafe "dumpBMP.h CreateBMPFile"
  c_CreateBMPFile :: LPCSTR -> HBITMAP -> HDC -> IO ()

{-# CFILES cbits/dumpBMP.c #-}

----------------------------------------------------------------
-- Device Independent Bitmaps
----------------------------------------------------------------

cBM_INIT  :: DWORD
cBM_INIT  =  4

{-# LINE 393 "Graphics\Win32\GDI\Bitmap.hsc" #-}

getDIBits :: HDC -> HBITMAP -> INT -> INT -> Maybe LPVOID -> LPBITMAPINFO -> ColorFormat -> IO INT
getDIBits dc bm start nlines mb_bits info usage =
  failIfZero "GetDIBits" $
    c_GetDIBits dc bm start nlines (maybePtr mb_bits) info usage
foreign import stdcall unsafe "windows.h GetDIBits"
  c_GetDIBits :: HDC -> HBITMAP -> INT -> INT -> LPVOID -> LPBITMAPINFO -> ColorFormat -> IO INT

setDIBits :: HDC -> HBITMAP -> INT -> INT -> LPVOID -> LPBITMAPINFO -> ColorFormat -> IO INT
setDIBits dc bm start nlines bits info use =
  failIfZero "SetDIBits" $ c_SetDIBits dc bm start nlines bits info use
foreign import stdcall unsafe "windows.h SetDIBits"
  c_SetDIBits :: HDC -> HBITMAP -> INT -> INT -> LPVOID -> LPBITMAPINFO -> ColorFormat -> IO INT

createDIBitmap :: HDC -> LPBITMAPINFOHEADER -> DWORD -> LPVOID -> LPBITMAPINFO -> ColorFormat -> IO HBITMAP
createDIBitmap dc hdr option init_val info usage =
  failIfNull "CreateDIBitmap" $
    c_CreateDIBitmap dc hdr option init_val info usage
foreign import stdcall unsafe "windows.h CreateDIBitmap"
  c_CreateDIBitmap :: HDC -> LPBITMAPINFOHEADER -> DWORD -> LPVOID -> LPBITMAPINFO -> ColorFormat -> IO HBITMAP

----------------------------------------------------------------
-- End
----------------------------------------------------------------
