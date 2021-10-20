{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DUNICODE #-}
{-# INCLUDE <windows.h> #-}
{-# INCLUDE "gettime.h" #-}
{-# LINE 1 "Graphics\Win32\Misc.hsc" #-}
-----------------------------------------------------------------------------
{-# LINE 2 "Graphics\Win32\Misc.hsc" #-}
-- |
-- Module      :  Graphics.Win32.Misc
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

module Graphics.Win32.Misc where

import Graphics.Win32.GDI.Types
import System.Win32.Types

import Data.Maybe
import Foreign


{-# LINE 24 "Graphics\Win32\Misc.hsc" #-}

{-# LINE 25 "Graphics\Win32\Misc.hsc" #-}

----------------------------------------------------------------
-- Resources
-- (should probably be distributed between
--  Graphics.Win32.{Icon,Cursor,Accelerator,Menu,...})
----------------------------------------------------------------

type Accelerator = LPCTSTR
-- intToAccelerator :: Int -> Accelerator
-- intToAccelerator i = makeIntResource (toWord i)

-- cursor and icon should not be const pointer; GSL ???
type Cursor = LPTSTR
-- intToCursor :: Int -> Cursor
-- intToCursor i = makeIntResource (toWord i)

type Icon = LPTSTR
-- intToIcon :: Int -> Icon
-- intToIcon i = makeIntResource (toWord i)

loadAccelerators :: Maybe HINSTANCE -> Accelerator -> IO HACCEL
loadAccelerators mb_inst accel =
  failIfNull "LoadAccelerators" $ c_LoadAccelerators (maybePtr mb_inst) accel
foreign import stdcall unsafe "windows.h LoadAcceleratorsW"
  c_LoadAccelerators :: HINSTANCE -> Accelerator -> IO HACCEL

loadCursor :: Maybe HINSTANCE -> Cursor -> IO HCURSOR
loadCursor mb_inst cursor =
  failIfNull "LoadCursor" $ c_LoadCursor (maybePtr mb_inst) cursor
foreign import stdcall unsafe "windows.h LoadCursorW"
  c_LoadCursor :: HINSTANCE -> Cursor -> IO HCURSOR

loadIcon :: Maybe HINSTANCE -> Icon -> IO HICON
loadIcon mb_inst icon =
  failIfNull "LoadIcon" $ c_LoadIcon (maybePtr mb_inst) icon
foreign import stdcall unsafe "windows.h LoadIconW"
  c_LoadIcon :: HINSTANCE -> Icon -> IO HICON

iDC_ARROW         :: Cursor
iDC_ARROW         = castUINTToPtr 32512
iDC_IBEAM         :: Cursor
iDC_IBEAM         = castUINTToPtr 32513
iDC_WAIT          :: Cursor
iDC_WAIT          = castUINTToPtr 32514
iDC_CROSS         :: Cursor
iDC_CROSS         = castUINTToPtr 32515
iDC_UPARROW       :: Cursor
iDC_UPARROW       = castUINTToPtr 32516
iDC_SIZENWSE      :: Cursor
iDC_SIZENWSE      = castUINTToPtr 32642
iDC_SIZENESW      :: Cursor
iDC_SIZENESW      = castUINTToPtr 32643
iDC_SIZEWE        :: Cursor
iDC_SIZEWE        = castUINTToPtr 32644
iDC_SIZENS        :: Cursor
iDC_SIZENS        = castUINTToPtr 32645

{-# LINE 74 "Graphics\Win32\Misc.hsc" #-}

iDI_APPLICATION   :: Icon
iDI_APPLICATION   = castUINTToPtr 32512
iDI_HAND          :: Icon
iDI_HAND          = castUINTToPtr 32513
iDI_QUESTION      :: Icon
iDI_QUESTION      = castUINTToPtr 32514
iDI_EXCLAMATION   :: Icon
iDI_EXCLAMATION   = castUINTToPtr 32515
iDI_ASTERISK      :: Icon
iDI_ASTERISK      = castUINTToPtr 32516

{-# LINE 82 "Graphics\Win32\Misc.hsc" #-}

----------------------------------------------------------------
-- Message Boxes
----------------------------------------------------------------

type MBStyle = UINT

mB_OK                 :: MBStyle
mB_OK                 =  0
mB_OKCANCEL           :: MBStyle
mB_OKCANCEL           =  1
mB_ABORTRETRYIGNORE   :: MBStyle
mB_ABORTRETRYIGNORE   =  2
mB_YESNOCANCEL        :: MBStyle
mB_YESNOCANCEL        =  3
mB_YESNO              :: MBStyle
mB_YESNO              =  4
mB_RETRYCANCEL        :: MBStyle
mB_RETRYCANCEL        =  5
mB_ICONHAND           :: MBStyle
mB_ICONHAND           =  16
mB_ICONQUESTION       :: MBStyle
mB_ICONQUESTION       =  32
mB_ICONEXCLAMATION    :: MBStyle
mB_ICONEXCLAMATION    =  48
mB_ICONASTERISK       :: MBStyle
mB_ICONASTERISK       =  64
mB_ICONINFORMATION    :: MBStyle
mB_ICONINFORMATION    =  64
mB_ICONSTOP           :: MBStyle
mB_ICONSTOP           =  16
mB_DEFBUTTON1         :: MBStyle
mB_DEFBUTTON1         =  0
mB_DEFBUTTON2         :: MBStyle
mB_DEFBUTTON2         =  256
mB_DEFBUTTON3         :: MBStyle
mB_DEFBUTTON3         =  512
mB_APPLMODAL          :: MBStyle
mB_APPLMODAL          =  0
mB_SYSTEMMODAL        :: MBStyle
mB_SYSTEMMODAL        =  4096
mB_TASKMODAL          :: MBStyle
mB_TASKMODAL          =  8192
mB_SETFOREGROUND      :: MBStyle
mB_SETFOREGROUND      =  65536

{-# LINE 110 "Graphics\Win32\Misc.hsc" #-}

type MBStatus = UINT

iDABORT       :: MBStatus
iDABORT       =  3
iDCANCEL      :: MBStatus
iDCANCEL      =  2
iDIGNORE      :: MBStatus
iDIGNORE      =  5
iDNO          :: MBStatus
iDNO          =  7
iDOK          :: MBStatus
iDOK          =  1
iDRETRY       :: MBStatus
iDRETRY       =  4
iDYES         :: MBStatus
iDYES         =  6

{-# LINE 122 "Graphics\Win32\Misc.hsc" #-}

-- Note: if the error is ever raised, we're in a very sad way!

messageBox :: HWND -> String -> String -> MBStyle -> IO MBStatus
messageBox wnd text caption style =
  withTString text $ \ c_text ->
  withTString caption $ \ c_caption ->
  failIfZero "MessageBox" $ c_MessageBox wnd c_text c_caption style
foreign import stdcall unsafe "windows.h MessageBoxW"
  c_MessageBox :: HWND -> LPCTSTR -> LPCTSTR -> MBStyle -> IO MBStatus

----------------------------------------------------------------
--
----------------------------------------------------------------

type StdHandleId   = DWORD

sTD_INPUT_HANDLE      :: StdHandleId
sTD_INPUT_HANDLE      =  4294967286
sTD_OUTPUT_HANDLE     :: StdHandleId
sTD_OUTPUT_HANDLE     =  4294967285
sTD_ERROR_HANDLE      :: StdHandleId
sTD_ERROR_HANDLE      =  4294967284

{-# LINE 144 "Graphics\Win32\Misc.hsc" #-}

getStdHandle :: StdHandleId -> IO HANDLE
getStdHandle hid =
  failIf (== iNVALID_HANDLE_VALUE) "GetStdHandle" $ c_GetStdHandle hid
foreign import stdcall unsafe "windows.h GetStdHandle"
  c_GetStdHandle :: StdHandleId -> IO HANDLE

----------------------------------------------------------------
-- Rotatable Ellipse hack
--
-- Win95 (Win32?) doesn't support rotating ellipses - so we
-- implement them with polygons.
--
-- We use a fixed number of edges rather than varying the number
-- according to the radius of the ellipse.
-- If anyone feels like improving the code (to vary the number),
-- they should place a fixed upper bound on the number of edges
-- since it takes a relatively long time to draw 1000 edges.
----------------------------------------------------------------

transformedEllipse :: HDC -> POINT -> POINT -> POINT -> IO ()
transformedEllipse dc (x0,y0) (x1,y1) (x2,y2) =
  failIfFalse_ "transformedEllipse" $ c_transformedEllipse dc x0 y0 x1 y1 x2 y2
foreign import ccall unsafe "ellipse.h transformedEllipse"
  c_transformedEllipse :: HDC -> LONG -> LONG -> LONG -> LONG -> LONG -> LONG -> IO Bool

{-# CFILES cbits/ellipse.c #-}

----------------------------------------------------------------
-- Cursor
----------------------------------------------------------------

getCursorPos :: IO POINT
getCursorPos =
  allocaPOINT $ \ p_pt -> do
  failIfFalse_ "GetCursorPos" $ c_GetCursorPos p_pt
  peekPOINT p_pt
foreign import stdcall unsafe "windows.h GetCursorPos"
  c_GetCursorPos :: Ptr POINT -> IO Bool

setCursorPos :: POINT -> IO ()
setCursorPos (x,y) =
  failIfFalse_ "setCursorPos" $ c_SetCursorPos x y
foreign import stdcall unsafe "windows.h SetCursorPos"
  c_SetCursorPos :: LONG -> LONG -> IO Bool

clipCursor :: RECT -> IO ()
clipCursor rect =
  withRECT rect $ \ p_rect ->
  failIfFalse_ "ClipCursor" $ c_ClipCursor p_rect
foreign import stdcall unsafe "windows.h ClipCursor"
  c_ClipCursor :: Ptr RECT -> IO Bool

getClipCursor :: IO RECT
getClipCursor =
  allocaRECT $ \ p_rect -> do
  failIfFalse_ "GetClipCursor" $ c_GetClipCursor p_rect
  peekRECT p_rect
foreign import stdcall unsafe "windows.h GetClipCursor"
  c_GetClipCursor :: Ptr RECT -> IO Bool

----------------------------------------------------------------
-- Exit/shutdown
----------------------------------------------------------------

type ExitOption = UINT

eWX_FORCE     :: ExitOption
eWX_FORCE     =  4
eWX_LOGOFF    :: ExitOption
eWX_LOGOFF    =  0
eWX_POWEROFF  :: ExitOption
eWX_POWEROFF  =  8
eWX_REBOOT    :: ExitOption
eWX_REBOOT    =  2
eWX_SHUTDOWN  :: ExitOption
eWX_SHUTDOWN  =  1

{-# LINE 218 "Graphics\Win32\Misc.hsc" #-}

exitWindowsEx :: ExitOption -> IO ()
exitWindowsEx opt =
  failIfFalse_ "ExitWindowsEx" $ c_ExitWindowsEx opt 0
foreign import stdcall unsafe "windows.h ExitWindowsEx"
  c_ExitWindowsEx :: ExitOption -> DWORD -> IO Bool

exitWindows :: IO ()
exitWindows = exitWindowsEx 0

----------------------------------------------------------------
-- Beeping
----------------------------------------------------------------

type Beep = UINT
type MbBeep = Maybe Beep

maybeBeep :: Maybe Beep -> Beep
maybeBeep = fromMaybe 0xffffffff

type Duration   = Int

type MbDuration   = Maybe Duration

maybeDuration :: Maybe Duration -> Duration
maybeDuration = fromMaybe (-1)

messageBeep :: Maybe Beep -> IO ()
messageBeep mb_beep =
  c_MessageBeep (maybeBeep mb_beep)
foreign import stdcall unsafe "windows.h MessageBeep"
  c_MessageBeep :: Beep -> IO ()

beep :: WORD -> MbDuration -> IO ()
beep freq mb_dur =
  failIfFalse_ "Beep" $ c_Beep freq (maybeDuration mb_dur)
foreign import stdcall unsafe "windows.h Beep"
  c_Beep :: WORD -> Duration -> IO Bool

----------------------------------------------------------------
-- Timers
----------------------------------------------------------------

type TimerId   = UINT

type TIMERPROC = FunPtr (HWND -> UINT -> TimerId -> DWORD -> IO ())

-- ToDo: support the other two forms of timer initialisation

-- Cause WM_TIMER events to be sent to window callback

setWinTimer :: HWND -> TimerId -> UINT -> IO TimerId
setWinTimer wnd timer elapse =
  failIfZero "SetTimer" $ c_SetTimer wnd timer elapse nullFunPtr
foreign import stdcall unsafe "windows.h SetTimer"
  c_SetTimer :: HWND -> TimerId -> UINT -> TIMERPROC -> IO TimerId

killTimer :: Maybe HWND -> TimerId -> IO ()
killTimer mb_wnd timer =
  failIfFalse_ "KillTimer" $ c_KillTimer (maybePtr mb_wnd) timer
foreign import stdcall unsafe "windows.h KillTimer"
  c_KillTimer :: HWND -> TimerId -> IO Bool

-- For documentation purposes:
type MilliSeconds = DWORD

foreign import stdcall unsafe "windows.h timeGetTime"
  timeGetTime :: IO MilliSeconds

----------------------------------------------------------------

-- %fun ezCreateFont :: Unknown
-- %result BITMAP({ getBitmapInfo(x) })

----------------------------------------------------------------
-- End
----------------------------------------------------------------
