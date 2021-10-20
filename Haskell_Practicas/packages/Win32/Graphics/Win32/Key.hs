{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DUNICODE #-}
{-# INCLUDE <windows.h> #-}
{-# LINE 1 "Graphics\Win32\Key.hsc" #-}
-----------------------------------------------------------------------------
{-# LINE 2 "Graphics\Win32\Key.hsc" #-}
-- |
-- Module      :  Graphics.Win32.Key
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

module Graphics.Win32.Key where

import Graphics.Win32.GDI.Types
import System.Win32.Types

import Control.Monad (liftM)


{-# LINE 23 "Graphics\Win32\Key.hsc" #-}

type VKey   = DWORD

vK_LBUTTON    :: VKey
vK_LBUTTON    =  1
vK_RBUTTON    :: VKey
vK_RBUTTON    =  2
vK_CANCEL     :: VKey
vK_CANCEL     =  3
vK_MBUTTON    :: VKey
vK_MBUTTON    =  4
vK_BACK       :: VKey
vK_BACK       =  8
vK_TAB        :: VKey
vK_TAB        =  9
vK_CLEAR      :: VKey
vK_CLEAR      =  12
vK_RETURN     :: VKey
vK_RETURN     =  13
vK_SHIFT      :: VKey
vK_SHIFT      =  16
vK_CONTROL    :: VKey
vK_CONTROL    =  17
vK_MENU       :: VKey
vK_MENU       =  18
vK_PAUSE      :: VKey
vK_PAUSE      =  19
vK_CAPITAL    :: VKey
vK_CAPITAL    =  20
vK_ESCAPE     :: VKey
vK_ESCAPE     =  27
vK_SPACE      :: VKey
vK_SPACE      =  32
vK_PRIOR      :: VKey
vK_PRIOR      =  33
vK_NEXT       :: VKey
vK_NEXT       =  34
vK_END        :: VKey
vK_END        =  35
vK_HOME       :: VKey
vK_HOME       =  36
vK_LEFT       :: VKey
vK_LEFT       =  37
vK_UP         :: VKey
vK_UP         =  38
vK_RIGHT      :: VKey
vK_RIGHT      =  39
vK_DOWN       :: VKey
vK_DOWN       =  40
vK_SELECT     :: VKey
vK_SELECT     =  41
vK_EXECUTE    :: VKey
vK_EXECUTE    =  43
vK_SNAPSHOT   :: VKey
vK_SNAPSHOT   =  44
vK_INSERT     :: VKey
vK_INSERT     =  45
vK_DELETE     :: VKey
vK_DELETE     =  46
vK_HELP       :: VKey
vK_HELP       =  47
vK_NUMPAD0    :: VKey
vK_NUMPAD0    =  96
vK_NUMPAD1    :: VKey
vK_NUMPAD1    =  97
vK_NUMPAD2    :: VKey
vK_NUMPAD2    =  98
vK_NUMPAD3    :: VKey
vK_NUMPAD3    =  99
vK_NUMPAD4    :: VKey
vK_NUMPAD4    =  100
vK_NUMPAD5    :: VKey
vK_NUMPAD5    =  101
vK_NUMPAD6    :: VKey
vK_NUMPAD6    =  102
vK_NUMPAD7    :: VKey
vK_NUMPAD7    =  103
vK_NUMPAD8    :: VKey
vK_NUMPAD8    =  104
vK_NUMPAD9    :: VKey
vK_NUMPAD9    =  105
vK_MULTIPLY   :: VKey
vK_MULTIPLY   =  106
vK_ADD        :: VKey
vK_ADD        =  107
vK_SEPARATOR  :: VKey
vK_SEPARATOR  =  108
vK_SUBTRACT   :: VKey
vK_SUBTRACT   =  109
vK_DECIMAL    :: VKey
vK_DECIMAL    =  110
vK_DIVIDE     :: VKey
vK_DIVIDE     =  111
vK_F1         :: VKey
vK_F1         =  112
vK_F2         :: VKey
vK_F2         =  113
vK_F3         :: VKey
vK_F3         =  114
vK_F4         :: VKey
vK_F4         =  115
vK_F5         :: VKey
vK_F5         =  116
vK_F6         :: VKey
vK_F6         =  117
vK_F7         :: VKey
vK_F7         =  118
vK_F8         :: VKey
vK_F8         =  119
vK_F9         :: VKey
vK_F9         =  120
vK_F10        :: VKey
vK_F10        =  121
vK_F11        :: VKey
vK_F11        =  122
vK_F12        :: VKey
vK_F12        =  123
vK_F13        :: VKey
vK_F13        =  124
vK_F14        :: VKey
vK_F14        =  125
vK_F15        :: VKey
vK_F15        =  126
vK_F16        :: VKey
vK_F16        =  127
vK_F17        :: VKey
vK_F17        =  128
vK_F18        :: VKey
vK_F18        =  129
vK_F19        :: VKey
vK_F19        =  130
vK_F20        :: VKey
vK_F20        =  131
vK_F21        :: VKey
vK_F21        =  132
vK_F22        :: VKey
vK_F22        =  133
vK_F23        :: VKey
vK_F23        =  134
vK_F24        :: VKey
vK_F24        =  135
vK_NUMLOCK    :: VKey
vK_NUMLOCK    =  144
vK_SCROLL     :: VKey
vK_SCROLL     =  145

{-# LINE 99 "Graphics\Win32\Key.hsc" #-}

foreign import stdcall unsafe "windows.h EnableWindow"
  enableWindow :: HWND -> Bool -> IO Bool

getActiveWindow :: IO (Maybe HWND)
getActiveWindow = liftM ptrToMaybe c_GetActiveWindow
foreign import stdcall unsafe "windows.h GetActiveWindow"
  c_GetActiveWindow :: IO HWND

foreign import stdcall unsafe "windows.h GetAsyncKeyState"
  getAsyncKeyState :: Int -> IO WORD

getFocus :: IO (Maybe HWND)
getFocus = liftM ptrToMaybe c_GetFocus
foreign import stdcall unsafe "windows.h GetFocus"
  c_GetFocus :: IO HWND

foreign import stdcall unsafe "windows.h GetKBCodePage"
  getKBCodePage :: IO UINT

foreign import stdcall unsafe "windows.h IsWindowEnabled"
  isWindowEnabled :: HWND -> IO Bool
