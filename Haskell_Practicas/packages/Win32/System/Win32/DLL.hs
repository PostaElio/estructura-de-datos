{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DUNICODE #-}
{-# INCLUDE <windows.h> #-}
{-# LINE 1 "System\Win32\DLL.hsc" #-}
-----------------------------------------------------------------------------
{-# LINE 2 "System\Win32\DLL.hsc" #-}
-- |
-- Module      :  System.Win32.DLL
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

module System.Win32.DLL where

import System.Win32.Types

import Foreign
import Foreign.C


{-# LINE 23 "System\Win32\DLL.hsc" #-}

disableThreadLibraryCalls :: HMODULE -> IO ()
disableThreadLibraryCalls hmod =
  failIfFalse_ "DisableThreadLibraryCalls" $ c_DisableThreadLibraryCalls hmod
foreign import stdcall unsafe "windows.h DisableThreadLibraryCalls"
  c_DisableThreadLibraryCalls :: HMODULE -> IO Bool

freeLibrary :: HMODULE -> IO ()
freeLibrary hmod =
  failIfFalse_ "FreeLibrary" $ c_FreeLibrary hmod
foreign import stdcall unsafe "windows.h FreeLibrary"
  c_FreeLibrary :: HMODULE -> IO Bool

getModuleFileName :: HMODULE -> IO String
getModuleFileName hmod =
  allocaArray 512 $ \ c_str -> do
  failIfFalse_ "GetModuleFileName" $ c_GetModuleFileName hmod c_str 512
  peekTString c_str
foreign import stdcall unsafe "windows.h GetModuleFileNameW"
  c_GetModuleFileName :: HMODULE -> LPTSTR -> Int -> IO Bool

getModuleHandle :: Maybe String -> IO HMODULE
getModuleHandle mb_name =
  maybeWith withTString mb_name $ \ c_name ->
  failIfNull "GetModuleHandle" $ c_GetModuleHandle c_name
foreign import stdcall unsafe "windows.h GetModuleHandleW"
  c_GetModuleHandle :: LPCTSTR -> IO HMODULE

getProcAddress :: HMODULE -> String -> IO Addr
getProcAddress hmod procname =
  withCString procname $ \ c_procname ->
  failIfNull "GetProcAddress" $ c_GetProcAddress hmod c_procname
foreign import stdcall unsafe "windows.h GetProcAddress"
  c_GetProcAddress :: HMODULE -> LPCSTR -> IO Addr

loadLibrary :: String -> IO HINSTANCE
loadLibrary name =
  withTString name $ \ c_name ->
  failIfNull "LoadLibrary" $ c_LoadLibrary c_name
foreign import stdcall unsafe "windows.h LoadLibraryW"
  c_LoadLibrary :: LPCTSTR -> IO HINSTANCE

type LoadLibraryFlags = DWORD

lOAD_LIBRARY_AS_DATAFILE       :: LoadLibraryFlags
lOAD_LIBRARY_AS_DATAFILE       =  2
lOAD_WITH_ALTERED_SEARCH_PATH  :: LoadLibraryFlags
lOAD_WITH_ALTERED_SEARCH_PATH  =  8

{-# LINE 71 "System\Win32\DLL.hsc" #-}

loadLibraryEx :: String -> HANDLE -> LoadLibraryFlags -> IO HINSTANCE
loadLibraryEx name h flags =
  withTString name $ \ c_name ->
  failIfNull "LoadLibraryEx" $ c_LoadLibraryEx c_name h flags
foreign import stdcall unsafe "windows.h LoadLibraryExW"
  c_LoadLibraryEx :: LPCTSTR -> HANDLE -> LoadLibraryFlags -> IO HINSTANCE
