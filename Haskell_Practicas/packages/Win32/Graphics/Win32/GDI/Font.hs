{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DUNICODE #-}
{-# INCLUDE <windows.h> #-}
{-# LINE 1 "Graphics\Win32\GDI\Font.hsc" #-}
-----------------------------------------------------------------------------
{-# LINE 2 "Graphics\Win32\GDI\Font.hsc" #-}
-- |
-- Module      :  Graphics.Win32.GDI.Font
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

module Graphics.Win32.GDI.Font
{-
	( CharSet
	, PitchAndFamily
	, OutPrecision
	, ClipPrecision
	, FontQuality
	, FontWeight

	, createFont, deleteFont

	, StockFont, getStockFont
	, oEM_FIXED_FONT, aNSI_FIXED_FONT, aNSI_VAR_FONT, sYSTEM_FONT
	, dEVICE_DEFAULT_FONT, sYSTEM_FIXED_FONT
	) where
-}
	where

import System.Win32.Types
import Graphics.Win32.GDI.Types

import Foreign


{-# LINE 39 "Graphics\Win32\GDI\Font.hsc" #-}

----------------------------------------------------------------
-- Types
----------------------------------------------------------------

type CharSet        = UINT
type PitchAndFamily = UINT
type OutPrecision   = UINT
type ClipPrecision  = UINT
type FontQuality    = UINT
type FontWeight     = Word32
type FaceName       = String

-- A FaceName is a string no more that LF_FACESIZE in length
-- (including null terminator).
-- %const Int LF_FACESIZE         # == 32
-- %sentinel_array : FaceName : CHAR : char : $0 = '\0' : ('\0' == $0) : LF_FACESIZE

----------------------------------------------------------------
-- Constants
----------------------------------------------------------------

aNSI_CHARSET         :: CharSet
aNSI_CHARSET         =  0
dEFAULT_CHARSET      :: CharSet
dEFAULT_CHARSET      =  1
sYMBOL_CHARSET       :: CharSet
sYMBOL_CHARSET       =  2
sHIFTJIS_CHARSET     :: CharSet
sHIFTJIS_CHARSET     =  128
hANGEUL_CHARSET      :: CharSet
hANGEUL_CHARSET      =  129
cHINESEBIG5_CHARSET  :: CharSet
cHINESEBIG5_CHARSET  =  136
oEM_CHARSET          :: CharSet
oEM_CHARSET          =  255

{-# LINE 70 "Graphics\Win32\GDI\Font.hsc" #-}

dEFAULT_PITCH   :: PitchAndFamily
dEFAULT_PITCH   =  0
fIXED_PITCH     :: PitchAndFamily
fIXED_PITCH     =  1
vARIABLE_PITCH  :: PitchAndFamily
vARIABLE_PITCH  =  2
fF_DONTCARE     :: PitchAndFamily
fF_DONTCARE     =  0
fF_ROMAN        :: PitchAndFamily
fF_ROMAN        =  16
fF_SWISS        :: PitchAndFamily
fF_SWISS        =  32
fF_MODERN       :: PitchAndFamily
fF_MODERN       =  48
fF_SCRIPT       :: PitchAndFamily
fF_SCRIPT       =  64
fF_DECORATIVE   :: PitchAndFamily
fF_DECORATIVE   =  80

{-# LINE 82 "Graphics\Win32\GDI\Font.hsc" #-}

familyMask, pitchMask :: PitchAndFamily
familyMask = 0xF0
pitchMask  = 0x0F

oUT_DEFAULT_PRECIS    :: OutPrecision
oUT_DEFAULT_PRECIS    =  0
oUT_STRING_PRECIS     :: OutPrecision
oUT_STRING_PRECIS     =  1
oUT_CHARACTER_PRECIS  :: OutPrecision
oUT_CHARACTER_PRECIS  =  2
oUT_STROKE_PRECIS     :: OutPrecision
oUT_STROKE_PRECIS     =  3
oUT_TT_PRECIS         :: OutPrecision
oUT_TT_PRECIS         =  4
oUT_DEVICE_PRECIS     :: OutPrecision
oUT_DEVICE_PRECIS     =  5
oUT_RASTER_PRECIS     :: OutPrecision
oUT_RASTER_PRECIS     =  6
oUT_TT_ONLY_PRECIS    :: OutPrecision
oUT_TT_ONLY_PRECIS    =  7

{-# LINE 97 "Graphics\Win32\GDI\Font.hsc" #-}

cLIP_DEFAULT_PRECIS    :: ClipPrecision
cLIP_DEFAULT_PRECIS    =  0
cLIP_CHARACTER_PRECIS  :: ClipPrecision
cLIP_CHARACTER_PRECIS  =  1
cLIP_STROKE_PRECIS     :: ClipPrecision
cLIP_STROKE_PRECIS     =  2
cLIP_MASK              :: ClipPrecision
cLIP_MASK              =  15
cLIP_LH_ANGLES         :: ClipPrecision
cLIP_LH_ANGLES         =  16
cLIP_TT_ALWAYS         :: ClipPrecision
cLIP_TT_ALWAYS         =  32
cLIP_EMBEDDED          :: ClipPrecision
cLIP_EMBEDDED          =  128

{-# LINE 107 "Graphics\Win32\GDI\Font.hsc" #-}

dEFAULT_QUALITY  :: FontQuality
dEFAULT_QUALITY  =  0
dRAFT_QUALITY    :: FontQuality
dRAFT_QUALITY    =  1
pROOF_QUALITY    :: FontQuality
pROOF_QUALITY    =  2

{-# LINE 113 "Graphics\Win32\GDI\Font.hsc" #-}

fW_DONTCARE    :: FontWeight
fW_DONTCARE    =  0
fW_THIN        :: FontWeight
fW_THIN        =  100
fW_EXTRALIGHT  :: FontWeight
fW_EXTRALIGHT  =  200
fW_LIGHT       :: FontWeight
fW_LIGHT       =  300
fW_NORMAL      :: FontWeight
fW_NORMAL      =  400
fW_MEDIUM      :: FontWeight
fW_MEDIUM      =  500
fW_SEMIBOLD    :: FontWeight
fW_SEMIBOLD    =  600
fW_BOLD        :: FontWeight
fW_BOLD        =  700
fW_EXTRABOLD   :: FontWeight
fW_EXTRABOLD   =  800
fW_HEAVY       :: FontWeight
fW_HEAVY       =  900
fW_REGULAR     :: FontWeight
fW_REGULAR     =  400
fW_ULTRALIGHT  :: FontWeight
fW_ULTRALIGHT  =  200
fW_DEMIBOLD    :: FontWeight
fW_DEMIBOLD    =  600
fW_ULTRABOLD   :: FontWeight
fW_ULTRABOLD   =  800
fW_BLACK       :: FontWeight
fW_BLACK       =  900

{-# LINE 131 "Graphics\Win32\GDI\Font.hsc" #-}

----------------------------------------------------------------
-- Functions
----------------------------------------------------------------

-- was: ErrorMsg("CreateFont","NullHandle")

createFont
     :: INT -> INT -> INT -> INT
     -> FontWeight -> Bool -> Bool -> Bool
     -> CharSet -> OutPrecision -> ClipPrecision
     -> FontQuality -> PitchAndFamily -> FaceName
     -> IO HFONT
createFont h w esc orient wt ital under strike cset out clip q pf face =
  withTString face $ \ c_face ->
  failIfNull "CreateFont" $
    c_CreateFont h w esc orient wt ital under strike cset out clip q pf c_face
foreign import stdcall unsafe "windows.h CreateFontW"
  c_CreateFont
     :: INT -> INT -> INT -> INT
     -> FontWeight -> Bool -> Bool -> Bool
     -> CharSet -> OutPrecision -> ClipPrecision
     -> FontQuality -> PitchAndFamily -> LPCTSTR
     -> IO HFONT

-- test :: IO ()
-- test = do
--   f <- createFont_adr (100,100) 0 False False "Arial"
--   putStrLn "Created first font"
--   f <- createFont_adr (100,100) (-90) False False "Bogus"
--   putStrLn "Created second font"
--
-- createFont_adr (width, height) escapement bold italic family =
--  createFont height width
-- 		     (round (escapement * 1800/pi))
-- 		     0                     -- orientation
-- 		     weight
-- 		     italic False False    -- italic, underline, strikeout
-- 		     aNSI_CHARSET
-- 		     oUT_DEFAULT_PRECIS
-- 		     cLIP_DEFAULT_PRECIS
-- 		     dEFAULT_QUALITY
-- 		     dEFAULT_PITCH
-- 		     family
--  where
--   weight | bold      = fW_BOLD
-- 	    | otherwise = fW_NORMAL


-- missing CreateFontIndirect from WinFonts.ss; GSL ???

foreign import stdcall unsafe "windows.h DeleteObject"
  deleteFont :: HFONT -> IO ()

----------------------------------------------------------------

type StockFont      = WORD

oEM_FIXED_FONT       :: StockFont
oEM_FIXED_FONT       =  10
aNSI_FIXED_FONT      :: StockFont
aNSI_FIXED_FONT      =  11
aNSI_VAR_FONT        :: StockFont
aNSI_VAR_FONT        =  12
sYSTEM_FONT          :: StockFont
sYSTEM_FONT          =  13
dEVICE_DEFAULT_FONT  :: StockFont
dEVICE_DEFAULT_FONT  =  14
sYSTEM_FIXED_FONT    :: StockFont
sYSTEM_FIXED_FONT    =  16

{-# LINE 197 "Graphics\Win32\GDI\Font.hsc" #-}

foreign import stdcall unsafe "windows.h GetStockObject"
  getStockFont :: StockFont -> IO HFONT

----------------------------------------------------------------
-- End
----------------------------------------------------------------
