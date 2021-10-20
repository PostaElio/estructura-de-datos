{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DUNICODE #-}
{-# INCLUDE <windows.h> #-}
{-# LINE 1 "Graphics\Win32\GDI\Clip.hsc" #-}
-----------------------------------------------------------------------------
{-# LINE 2 "Graphics\Win32\GDI\Clip.hsc" #-}
-- |
-- Module      :  Graphics.Win32.GDI.Clip
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

module Graphics.Win32.GDI.Clip where

import Graphics.Win32.GDI.Types
import System.Win32.Types

import Foreign


{-# LINE 23 "Graphics\Win32\GDI\Clip.hsc" #-}

type ClipboardFormat = UINT

cF_BITMAP             :: ClipboardFormat
cF_BITMAP             =  2
cF_DIB                :: ClipboardFormat
cF_DIB                =  8
cF_DIF                :: ClipboardFormat
cF_DIF                =  5
cF_DSPBITMAP          :: ClipboardFormat
cF_DSPBITMAP          =  130
cF_DSPENHMETAFILE     :: ClipboardFormat
cF_DSPENHMETAFILE     =  142
cF_DSPMETAFILEPICT    :: ClipboardFormat
cF_DSPMETAFILEPICT    =  131
cF_DSPTEXT            :: ClipboardFormat
cF_DSPTEXT            =  129
cF_ENHMETAFILE        :: ClipboardFormat
cF_ENHMETAFILE        =  14
cF_GDIOBJFIRST        :: ClipboardFormat
cF_GDIOBJFIRST        =  768
cF_HDROP              :: ClipboardFormat
cF_HDROP              =  15
cF_LOCALE             :: ClipboardFormat
cF_LOCALE             =  16
cF_METAFILEPICT       :: ClipboardFormat
cF_METAFILEPICT       =  3
cF_OEMTEXT            :: ClipboardFormat
cF_OEMTEXT            =  7
cF_OWNERDISPLAY       :: ClipboardFormat
cF_OWNERDISPLAY       =  128
cF_PALETTE            :: ClipboardFormat
cF_PALETTE            =  9
cF_PENDATA            :: ClipboardFormat
cF_PENDATA            =  10
cF_PRIVATEFIRST       :: ClipboardFormat
cF_PRIVATEFIRST       =  512
cF_PRIVATELAST        :: ClipboardFormat
cF_PRIVATELAST        =  767
cF_RIFF               :: ClipboardFormat
cF_RIFF               =  11
cF_SYLK               :: ClipboardFormat
cF_SYLK               =  4
cF_TEXT               :: ClipboardFormat
cF_TEXT               =  1
cF_WAVE               :: ClipboardFormat
cF_WAVE               =  12
cF_TIFF               :: ClipboardFormat
cF_TIFF               =  6

{-# LINE 51 "Graphics\Win32\GDI\Clip.hsc" #-}

-- % , CF_UNICODETEXT  -- WinNT only

foreign import stdcall unsafe "windows.h ChangeClipboardChain"
  changeClipboardChain :: HWND -> HWND -> IO Bool

closeClipboard :: IO ()
closeClipboard =
  failIfFalse_ "CloseClipboard" c_CloseClipboard
foreign import stdcall unsafe "windows.h CloseClipboard"
  c_CloseClipboard :: IO BOOL

foreign import stdcall unsafe "windows.h CountClipboardFormats"
  countClipboardFormats :: IO Int

emptyClipboard :: IO ()
emptyClipboard =
  failIfFalse_ "EmptyClipboard" c_EmptyClipboard
foreign import stdcall unsafe "windows.h EmptyClipboard"
  c_EmptyClipboard :: IO BOOL

-- original also tested GetLastError() != NO_ERROR

enumClipboardFormats :: ClipboardFormat -> IO ClipboardFormat
enumClipboardFormats format =
  failIfZero "EnumClipboardFormats" $ c_EnumClipboardFormats format
foreign import stdcall unsafe "windows.h EnumClipboardFormats"
  c_EnumClipboardFormats :: ClipboardFormat -> IO ClipboardFormat

getClipboardData :: ClipboardFormat -> IO HANDLE
getClipboardData format =
  failIfNull "GetClipboardData" $ c_GetClipboardData format
foreign import stdcall unsafe "windows.h GetClipboardData"
  c_GetClipboardData :: ClipboardFormat -> IO HANDLE

getClipboardFormatName :: ClipboardFormat -> IO String
getClipboardFormatName format =
  allocaArray 256 $ \ c_name -> do
  len <- failIfZero "GetClipboardFormatName" $
    c_GetClipboardFormatName format c_name 256
  peekTStringLen (c_name, len)
foreign import stdcall unsafe "windows.h GetClipboardFormatNameW"
  c_GetClipboardFormatName :: ClipboardFormat -> LPTSTR -> Int -> IO Int

getClipboardOwner :: IO HWND
getClipboardOwner =
  failIfNull "GetClipboardOwner" c_GetClipboardOwner
foreign import stdcall unsafe "windows.h GetClipboardOwner"
  c_GetClipboardOwner :: IO HWND

getClipboardViewer :: IO HWND
getClipboardViewer =
  failIfNull "GetClipboardViewer" c_GetClipboardViewer
foreign import stdcall unsafe "windows.h GetClipboardViewer"
  c_GetClipboardViewer :: IO HWND

getOpenClipboardWindow :: IO HWND
getOpenClipboardWindow =
  failIfNull "GetClipboardWindow" c_GetOpenClipboardWindow
foreign import stdcall unsafe "windows.h GetOpenClipboardWindow"
  c_GetOpenClipboardWindow :: IO HWND

getPriorityClipboardFormat :: [ClipboardFormat] -> IO Int
getPriorityClipboardFormat formats =
  withArray formats $ \ format_array ->
  failIf (== -1) "GetPriorityClipboardFormat" $
    c_GetPriorityClipboardFormat format_array (length formats)
foreign import stdcall unsafe "windows.h GetPriorityClipboardFormat"
  c_GetPriorityClipboardFormat :: Ptr UINT -> Int -> IO Int

foreign import stdcall unsafe "windows.h IsClipboardFormatAvailable"
  isClipboardFormatAvailable :: ClipboardFormat -> IO BOOL

openClipboard :: HWND -> IO ()
openClipboard wnd =
  failIfFalse_ "OpenClipboard" $ c_OpenClipboard wnd
foreign import stdcall unsafe "windows.h OpenClipboard"
  c_OpenClipboard :: HWND -> IO BOOL

registerClipboardFormat :: String -> IO ClipboardFormat
registerClipboardFormat name =
  withTString name $ \ c_name ->
  failIfZero "RegisterClipboardFormat" $
    c_RegisterClipboardFormat c_name
foreign import stdcall unsafe "windows.h RegisterClipboardFormatW"
  c_RegisterClipboardFormat :: LPCTSTR -> IO ClipboardFormat

setClipboardData :: ClipboardFormat -> HANDLE -> IO HANDLE
setClipboardData format mem =
  failIfNull "SetClipboardData" $ c_SetClipboardData format mem
foreign import stdcall unsafe "windows.h SetClipboardData"
  c_SetClipboardData :: ClipboardFormat -> HANDLE -> IO HANDLE

setClipboardViewer :: HWND -> IO HWND
setClipboardViewer wnd =
  failIfNull "SetClipboardViewer" $ c_SetClipboardViewer wnd
foreign import stdcall unsafe "windows.h SetClipboardViewer"
  c_SetClipboardViewer :: HWND -> IO HWND
