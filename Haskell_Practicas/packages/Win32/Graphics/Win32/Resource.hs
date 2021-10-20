{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DUNICODE #-}
{-# INCLUDE <windows.h> #-}
{-# LINE 1 "Graphics\Win32\Resource.hsc" #-}
-----------------------------------------------------------------------------
{-# LINE 2 "Graphics\Win32\Resource.hsc" #-}
-- |
-- Module      :  Graphics.Win32.Resource
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

module Graphics.Win32.Resource where

import System.Win32.Types

import Foreign


{-# LINE 22 "Graphics\Win32\Resource.hsc" #-}

beginUpdateResource :: String -> Bool -> IO HANDLE
beginUpdateResource name del =
  withTString name $ \ c_name ->
  failIfNull "BeginUpdateResource" $ c_BeginUpdateResource c_name del
foreign import stdcall unsafe "windows.h BeginUpdateResourceW"
  c_BeginUpdateResource :: LPCTSTR -> Bool -> IO HANDLE

type ResourceImageType = UINT

type   HRSRC      = Ptr ()

type   HGLOBAL    = Ptr ()

iMAGE_BITMAP  :: ResourceImageType
iMAGE_BITMAP  =  0
iMAGE_ICON    :: ResourceImageType
iMAGE_ICON    =  1
iMAGE_CURSOR  :: ResourceImageType
iMAGE_CURSOR  =  2

{-# LINE 41 "Graphics\Win32\Resource.hsc" #-}

copyImage :: HANDLE -> ResourceImageType -> Int -> Int -> UINT -> IO HANDLE
copyImage h ty x y flags =
  failIfNull "CopyImage" $ c_CopyImage h ty x y flags
foreign import stdcall unsafe "windows.h CopyImage"
  c_CopyImage :: HANDLE -> ResourceImageType -> Int -> Int -> UINT -> IO HANDLE

endUpdateResource :: HANDLE -> BOOL -> IO ()
endUpdateResource h discard =
  failIfFalse_ "EndUpdateResource" $ c_EndUpdateResource h discard
foreign import stdcall unsafe "windows.h EndUpdateResourceW"
  c_EndUpdateResource :: HANDLE -> BOOL -> IO Bool

type ResourceType = LPCTSTR

rT_ACCELERATOR   :: ResourceType
rT_ACCELERATOR   = castUINTToPtr 9
rT_ANICURSOR     :: ResourceType
rT_ANICURSOR     = castUINTToPtr 21
rT_ANIICON       :: ResourceType
rT_ANIICON       = castUINTToPtr 22
rT_BITMAP        :: ResourceType
rT_BITMAP        = castUINTToPtr 2
rT_CURSOR        :: ResourceType
rT_CURSOR        = castUINTToPtr 1
rT_DIALOG        :: ResourceType
rT_DIALOG        = castUINTToPtr 5
rT_FONT          :: ResourceType
rT_FONT          = castUINTToPtr 8
rT_FONTDIR       :: ResourceType
rT_FONTDIR       = castUINTToPtr 7
rT_GROUP_CURSOR  :: ResourceType
rT_GROUP_CURSOR  = castUINTToPtr 12
rT_GROUP_ICON    :: ResourceType
rT_GROUP_ICON    = castUINTToPtr 14
rT_HTML          :: ResourceType
rT_HTML          = castUINTToPtr 23
rT_ICON          :: ResourceType
rT_ICON          = castUINTToPtr 3
rT_MENU          :: ResourceType
rT_MENU          = castUINTToPtr 4
rT_MESSAGETABLE  :: ResourceType
rT_MESSAGETABLE  = castUINTToPtr 11
rT_RCDATA        :: ResourceType
rT_RCDATA        = castUINTToPtr 10
rT_STRING        :: ResourceType
rT_STRING        = castUINTToPtr 6
rT_VERSION       :: ResourceType
rT_VERSION       = castUINTToPtr 16

{-# LINE 75 "Graphics\Win32\Resource.hsc" #-}

findResource :: HMODULE -> String -> ResourceType -> IO HRSRC
findResource hmod name ty =
  withTString name $ \ c_name ->
  failIfNull "FindResource" $ c_FindResource hmod c_name ty
foreign import stdcall unsafe "windows.h FindResourceW"
  c_FindResource :: HMODULE -> LPCTSTR -> LPCTSTR -> IO HRSRC

-- was: LPCTSTR_
findResourceEx :: HMODULE -> String -> ResourceType -> WORD -> IO HRSRC
findResourceEx hmod name ty lang =
  withTString name $ \ c_name ->
  failIfNull "FindResourceEx" $ c_FindResourceEx hmod c_name ty lang
foreign import stdcall unsafe "windows.h FindResourceExW"
  c_FindResourceEx :: HMODULE -> LPCTSTR -> LPCTSTR -> WORD -> IO HRSRC

type ResourceSize = Int

lR_DEFAULTSIZE :: ResourceSize
lR_DEFAULTSIZE = 64
{-# LINE 95 "Graphics\Win32\Resource.hsc" #-}

type LoadImageFlags = UINT

lR_DEFAULTCOLOR       :: LoadImageFlags
lR_DEFAULTCOLOR       =  0
lR_CREATEDIBSECTION   :: LoadImageFlags
lR_CREATEDIBSECTION   =  8192
lR_LOADFROMFILE       :: LoadImageFlags
lR_LOADFROMFILE       =  16
lR_LOADMAP3DCOLORS    :: LoadImageFlags
lR_LOADMAP3DCOLORS    =  4096
lR_LOADTRANSPARENT    :: LoadImageFlags
lR_LOADTRANSPARENT    =  32
lR_MONOCHROME         :: LoadImageFlags
lR_MONOCHROME         =  1
lR_SHARED             :: LoadImageFlags
lR_SHARED             =  32768

{-# LINE 107 "Graphics\Win32\Resource.hsc" #-}

-- , LR_VGACOLOR (Not in mingw-20001111 headers)

-- was: LPCTSTR_
loadImage :: HINSTANCE -> String -> ResourceImageType -> ResourceSize -> ResourceSize -> LoadImageFlags -> IO HANDLE
loadImage inst name ty x y load =
  withTString name $ \ c_name ->
  failIfNull "LoadImage" $ c_LoadImage inst c_name ty x y load
foreign import stdcall unsafe "windows.h LoadImageW"
  c_LoadImage :: HINSTANCE -> LPCTSTR -> ResourceImageType -> ResourceSize -> ResourceSize -> LoadImageFlags -> IO HANDLE

loadResource :: HMODULE -> HRSRC -> IO HGLOBAL
loadResource hmod res =
  failIfNull "LoadResource" $ c_LoadResource hmod res
foreign import stdcall unsafe "windows.h LoadResource"
  c_LoadResource :: HMODULE -> HRSRC -> IO HGLOBAL

lockResource :: HGLOBAL -> IO Addr
lockResource res =
  failIfNull "LockResource" $ c_LockResource res
foreign import stdcall unsafe "windows.h LockResource"
  c_LockResource :: HGLOBAL -> IO Addr

sizeofResource :: HMODULE -> HRSRC -> IO DWORD
sizeofResource hmod res =
  failIfZero "SizeofResource" $ c_SizeofResource hmod res
foreign import stdcall unsafe "windows.h SizeofResource"
  c_SizeofResource :: HMODULE -> HRSRC -> IO DWORD

-- was: LPCTSTR_
updateResource :: HANDLE -> ResourceType -> String -> WORD -> Addr -> DWORD -> IO ()
updateResource h ty name lang p_data data_len =
  withTString name $ \ c_name ->
  failIfFalse_ "UpdateResource" $
    c_UpdateResource h ty c_name lang p_data data_len
foreign import stdcall unsafe "windows.h UpdateResourceW"
  c_UpdateResource :: HANDLE -> LPCTSTR -> LPCTSTR -> WORD -> Addr -> DWORD -> IO Bool
