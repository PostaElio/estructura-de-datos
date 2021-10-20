{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DUNICODE #-}
{-# INCLUDE <windows.h> #-}
{-# LINE 1 "Graphics\Win32\Window.hsc" #-}
-----------------------------------------------------------------------------
{-# LINE 2 "Graphics\Win32\Window.hsc" #-}
-- |
-- Module      :  Graphics.Win32.Window
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

module Graphics.Win32.Window where

import System.Win32.Types
import Graphics.Win32.GDI.Types
import Graphics.Win32.Message

import Control.Monad
import Data.Maybe
import Foreign


{-# LINE 26 "Graphics\Win32\Window.hsc" #-}

----------------------------------------------------------------
-- Window Class
----------------------------------------------------------------

-- The classname must not be deallocated until the corresponding class
-- is deallocated.  For this reason, we represent classnames by pointers
-- and explicitly allocate the className.

type ClassName   = LPCTSTR

-- Note: this is one of those rare functions which doesnt free all
-- its String arguments.

mkClassName :: String -> ClassName
mkClassName name = unsafePerformIO (newTString name)

type ClassStyle   = UINT

cS_VREDRAW            :: ClassStyle
cS_VREDRAW            =  1
cS_HREDRAW            :: ClassStyle
cS_HREDRAW            =  2
cS_OWNDC              :: ClassStyle
cS_OWNDC              =  32
cS_CLASSDC            :: ClassStyle
cS_CLASSDC            =  64
cS_PARENTDC           :: ClassStyle
cS_PARENTDC           =  128
cS_SAVEBITS           :: ClassStyle
cS_SAVEBITS           =  2048
cS_DBLCLKS            :: ClassStyle
cS_DBLCLKS            =  8
cS_BYTEALIGNCLIENT    :: ClassStyle
cS_BYTEALIGNCLIENT    =  4096
cS_BYTEALIGNWINDOW    :: ClassStyle
cS_BYTEALIGNWINDOW    =  8192
cS_NOCLOSE            :: ClassStyle
cS_NOCLOSE            =  512
cS_GLOBALCLASS        :: ClassStyle
cS_GLOBALCLASS        =  16384

{-# LINE 58 "Graphics\Win32\Window.hsc" #-}

type WNDCLASS =
 (ClassStyle,    -- style
  HINSTANCE,     -- hInstance
  Maybe HICON,   -- hIcon
  Maybe HCURSOR, -- hCursor
  Maybe HBRUSH,  -- hbrBackground
  Maybe LPCTSTR, -- lpszMenuName
  ClassName)     -- lpszClassName

--ToDo!
--To avoid confusion with NULL, WNDCLASS requires you to add 1 to a SystemColor
--(which can be NULL)
-- %fun mkMbHBRUSH :: SystemColor -> MbHBRUSH
-- %code
-- %result ((HBRUSH)($0+1));

withWNDCLASS :: WNDCLASS -> (Ptr WNDCLASS -> IO a) -> IO a
withWNDCLASS (style, inst, mb_icon, mb_cursor, mb_bg, mb_menu, cls) f =
  allocaBytes (40) $ \ p -> do
{-# LINE 78 "Graphics\Win32\Window.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 0) p style
{-# LINE 79 "Graphics\Win32\Window.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 4) p genericWndProc_p
{-# LINE 80 "Graphics\Win32\Window.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 8) p (0::INT)
{-# LINE 81 "Graphics\Win32\Window.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 12) p (0::INT)
{-# LINE 82 "Graphics\Win32\Window.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 16) p inst
{-# LINE 83 "Graphics\Win32\Window.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 20) p (maybePtr mb_icon)
{-# LINE 84 "Graphics\Win32\Window.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 24) p (maybePtr mb_cursor)
{-# LINE 85 "Graphics\Win32\Window.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 28) p (maybePtr mb_bg)
{-# LINE 86 "Graphics\Win32\Window.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 32) p (maybePtr mb_menu)
{-# LINE 87 "Graphics\Win32\Window.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 36) p cls
{-# LINE 88 "Graphics\Win32\Window.hsc" #-}
  f p

foreign import ccall unsafe "WndProc.h &genericWndProc"
  genericWndProc_p :: FunPtr WindowClosure

{-# CFILES cbits/WndProc.c #-}

registerClass :: WNDCLASS -> IO (Maybe ATOM)
registerClass cls =
  withWNDCLASS cls $ \ p ->
  liftM numToMaybe $ c_RegisterClass p
foreign import stdcall unsafe "windows.h RegisterClassW"
  c_RegisterClass :: Ptr WNDCLASS -> IO ATOM

foreign import stdcall unsafe "windows.h UnregisterClassW"
  unregisterClass :: ClassName -> HINSTANCE -> IO ()

----------------------------------------------------------------
-- Window Style
----------------------------------------------------------------

type WindowStyle   = DWORD

wS_OVERLAPPED         :: WindowStyle
wS_OVERLAPPED         =  0
wS_POPUP              :: WindowStyle
wS_POPUP              =  2147483648
wS_CHILD              :: WindowStyle
wS_CHILD              =  1073741824
wS_CLIPSIBLINGS       :: WindowStyle
wS_CLIPSIBLINGS       =  67108864
wS_CLIPCHILDREN       :: WindowStyle
wS_CLIPCHILDREN       =  33554432
wS_VISIBLE            :: WindowStyle
wS_VISIBLE            =  268435456
wS_DISABLED           :: WindowStyle
wS_DISABLED           =  134217728
wS_MINIMIZE           :: WindowStyle
wS_MINIMIZE           =  536870912
wS_MAXIMIZE           :: WindowStyle
wS_MAXIMIZE           =  16777216
wS_CAPTION            :: WindowStyle
wS_CAPTION            =  12582912
wS_BORDER             :: WindowStyle
wS_BORDER             =  8388608
wS_DLGFRAME           :: WindowStyle
wS_DLGFRAME           =  4194304
wS_VSCROLL            :: WindowStyle
wS_VSCROLL            =  2097152
wS_HSCROLL            :: WindowStyle
wS_HSCROLL            =  1048576
wS_SYSMENU            :: WindowStyle
wS_SYSMENU            =  524288
wS_THICKFRAME         :: WindowStyle
wS_THICKFRAME         =  262144
wS_MINIMIZEBOX        :: WindowStyle
wS_MINIMIZEBOX        =  131072
wS_MAXIMIZEBOX        :: WindowStyle
wS_MAXIMIZEBOX        =  65536
wS_GROUP              :: WindowStyle
wS_GROUP              =  131072
wS_TABSTOP            :: WindowStyle
wS_TABSTOP            =  65536
wS_OVERLAPPEDWINDOW   :: WindowStyle
wS_OVERLAPPEDWINDOW   =  13565952
wS_POPUPWINDOW        :: WindowStyle
wS_POPUPWINDOW        =  2156396544
wS_CHILDWINDOW        :: WindowStyle
wS_CHILDWINDOW        =  1073741824
wS_TILED              :: WindowStyle
wS_TILED              =  0
wS_ICONIC             :: WindowStyle
wS_ICONIC             =  536870912
wS_SIZEBOX            :: WindowStyle
wS_SIZEBOX            =  262144
wS_TILEDWINDOW        :: WindowStyle
wS_TILEDWINDOW        =  13565952

{-# LINE 140 "Graphics\Win32\Window.hsc" #-}

type WindowStyleEx   = DWORD

wS_EX_DLGMODALFRAME   :: WindowStyleEx
wS_EX_DLGMODALFRAME   =  1
wS_EX_NOPARENTNOTIFY  :: WindowStyleEx
wS_EX_NOPARENTNOTIFY  =  4
wS_EX_TOPMOST         :: WindowStyleEx
wS_EX_TOPMOST         =  8
wS_EX_ACCEPTFILES     :: WindowStyleEx
wS_EX_ACCEPTFILES     =  16
wS_EX_TRANSPARENT     :: WindowStyleEx
wS_EX_TRANSPARENT     =  32
wS_EX_MDICHILD        :: WindowStyleEx
wS_EX_MDICHILD        =  64
wS_EX_TOOLWINDOW      :: WindowStyleEx
wS_EX_TOOLWINDOW      =  128
wS_EX_WINDOWEDGE      :: WindowStyleEx
wS_EX_WINDOWEDGE      =  256
wS_EX_CLIENTEDGE      :: WindowStyleEx
wS_EX_CLIENTEDGE      =  512
wS_EX_CONTEXTHELP     :: WindowStyleEx
wS_EX_CONTEXTHELP     =  1024
wS_EX_RIGHT           :: WindowStyleEx
wS_EX_RIGHT           =  4096
wS_EX_LEFT            :: WindowStyleEx
wS_EX_LEFT            =  0
wS_EX_RTLREADING      :: WindowStyleEx
wS_EX_RTLREADING      =  8192
wS_EX_LTRREADING      :: WindowStyleEx
wS_EX_LTRREADING      =  0
wS_EX_LEFTSCROLLBAR   :: WindowStyleEx
wS_EX_LEFTSCROLLBAR   =  16384
wS_EX_RIGHTSCROLLBAR  :: WindowStyleEx
wS_EX_RIGHTSCROLLBAR  =  0
wS_EX_CONTROLPARENT   :: WindowStyleEx
wS_EX_CONTROLPARENT   =  65536
wS_EX_STATICEDGE      :: WindowStyleEx
wS_EX_STATICEDGE      =  131072
wS_EX_APPWINDOW       :: WindowStyleEx
wS_EX_APPWINDOW       =  262144
wS_EX_OVERLAPPEDWINDOW  :: WindowStyleEx
wS_EX_OVERLAPPEDWINDOW  =  768
wS_EX_PALETTEWINDOW   :: WindowStyleEx
wS_EX_PALETTEWINDOW   =  392

{-# LINE 166 "Graphics\Win32\Window.hsc" #-}

cW_USEDEFAULT :: Pos
cW_USEDEFAULT = 2147483648
{-# LINE 169 "Graphics\Win32\Window.hsc" #-}

type Pos = Int

type MbPos = Maybe Pos

maybePos :: Maybe Pos -> Pos
maybePos = fromMaybe cW_USEDEFAULT

type WindowClosure = HWND -> WindowMessage -> WPARAM -> LPARAM -> IO LRESULT

foreign import ccall "wrapper"
  mkWindowClosure :: WindowClosure -> IO (FunPtr WindowClosure)

setWindowClosure :: HWND -> WindowClosure -> IO ()
setWindowClosure wnd closure = do
  fp <- mkWindowClosure closure
  c_SetWindowLong wnd (-21) (castFunPtrToLONG fp)
{-# LINE 186 "Graphics\Win32\Window.hsc" #-}
  return ()
foreign import stdcall unsafe "windows.h SetWindowLongW"
  c_SetWindowLong :: HWND -> INT -> LONG -> IO LONG

createWindow
  :: ClassName -> String -> WindowStyle ->
     Maybe Pos -> Maybe Pos -> Maybe Pos -> Maybe Pos ->
     Maybe HWND -> Maybe HMENU -> HINSTANCE -> WindowClosure ->
     IO HWND
createWindow = createWindowEx 0
-- apparently CreateWindowA/W are just macros for CreateWindowExA/W

createWindowEx
  :: WindowStyle -> ClassName -> String -> WindowStyle
  -> Maybe Pos -> Maybe Pos -> Maybe Pos -> Maybe Pos
  -> Maybe HWND -> Maybe HMENU -> HINSTANCE -> WindowClosure
  -> IO HWND
createWindowEx estyle cname wname wstyle mb_x mb_y mb_w mb_h mb_parent mb_menu inst closure = do
  -- Freeing the title/window name has been reported
  -- to cause a crash, so let's not do it.
  -- withTString wname $ \ c_wname -> do
  c_wname <- newTString wname
  wnd <- failIfNull "CreateWindowEx" $
    c_CreateWindowEx estyle cname c_wname wstyle
      (maybePos mb_x) (maybePos mb_y) (maybePos mb_w) (maybePos mb_h)
      (maybePtr mb_parent) (maybePtr mb_menu) inst nullPtr
  setWindowClosure wnd closure
  return wnd
foreign import stdcall "windows.h CreateWindowExW"
  c_CreateWindowEx
    :: WindowStyle -> ClassName -> LPCTSTR -> WindowStyle
    -> Pos -> Pos -> Pos -> Pos
    -> HWND -> HMENU -> HINSTANCE -> LPVOID
    -> IO HWND

----------------------------------------------------------------

defWindowProc :: Maybe HWND -> WindowMessage -> WPARAM -> LPARAM -> IO LRESULT
defWindowProc mb_wnd msg w l =
  c_DefWindowProc (maybePtr mb_wnd) msg w l
foreign import stdcall "windows.h DefWindowProcW"
  c_DefWindowProc :: HWND -> WindowMessage -> WPARAM -> LPARAM -> IO LRESULT

----------------------------------------------------------------

getClientRect :: HWND -> IO RECT
getClientRect wnd =
  allocaRECT $ \ p_rect -> do
  failIfFalse_ "GetClientRect" $ c_GetClientRect wnd p_rect
  peekRECT p_rect
foreign import stdcall unsafe "windows.h GetClientRect"
  c_GetClientRect :: HWND -> Ptr RECT -> IO Bool

getWindowRect :: HWND -> IO RECT
getWindowRect wnd =
  allocaRECT $ \ p_rect -> do
  failIfFalse_ "GetWindowRect" $ c_GetWindowRect wnd p_rect
  peekRECT p_rect
foreign import stdcall unsafe "windows.h GetWindowRect"
  c_GetWindowRect :: HWND -> Ptr RECT -> IO Bool

-- Should it be Maybe RECT instead?

invalidateRect :: Maybe HWND -> Maybe LPRECT -> Bool -> IO ()
invalidateRect wnd p_mb_rect erase =
  failIfFalse_ "InvalidateRect" $
    c_InvalidateRect (maybePtr wnd) (maybePtr p_mb_rect) erase
foreign import stdcall "windows.h InvalidateRect"
  c_InvalidateRect :: HWND -> LPRECT -> Bool -> IO Bool

screenToClient :: HWND -> POINT -> IO POINT
screenToClient wnd pt =
  withPOINT pt $ \ p_pt -> do
  failIfFalse_ "ScreenToClient" $ c_ScreenToClient wnd p_pt
  peekPOINT p_pt
foreign import stdcall unsafe "windows.h ScreenToClient"
  c_ScreenToClient :: HWND -> Ptr POINT -> IO Bool

clientToScreen :: HWND -> POINT -> IO POINT
clientToScreen wnd pt =
  withPOINT pt $ \ p_pt -> do
  failIfFalse_ "ClientToScreen" $ c_ClientToScreen wnd p_pt
  peekPOINT p_pt
foreign import stdcall unsafe "windows.h ClientToScreen"
  c_ClientToScreen :: HWND -> Ptr POINT -> IO Bool

----------------------------------------------------------------
-- Setting window text/label
----------------------------------------------------------------
-- For setting the title bar text.  But inconvenient to make the LPCTSTR

setWindowText :: HWND -> String -> IO ()
setWindowText wnd text =
  withTString text $ \ c_text ->
  failIfFalse_ "SetWindowText" $ c_SetWindowText wnd c_text
foreign import stdcall "windows.h SetWindowTextW"
  c_SetWindowText :: HWND -> LPCTSTR -> IO Bool

----------------------------------------------------------------
-- Paint struct
----------------------------------------------------------------

type PAINTSTRUCT =
 ( HDC   -- hdc
 , Bool  -- fErase
 , RECT  -- rcPaint
 )

type LPPAINTSTRUCT   = Addr

sizeofPAINTSTRUCT :: DWORD
sizeofPAINTSTRUCT = (64)
{-# LINE 298 "Graphics\Win32\Window.hsc" #-}

allocaPAINTSTRUCT :: (LPPAINTSTRUCT -> IO a) -> IO a
allocaPAINTSTRUCT = allocaBytes (64)
{-# LINE 301 "Graphics\Win32\Window.hsc" #-}

beginPaint :: HWND -> LPPAINTSTRUCT -> IO HDC
beginPaint wnd paint =
  failIfNull "BeginPaint" $ c_BeginPaint wnd paint
foreign import stdcall "windows.h BeginPaint"
  c_BeginPaint :: HWND -> LPPAINTSTRUCT -> IO HDC

foreign import stdcall "windows.h EndPaint"
  endPaint :: HWND -> LPPAINTSTRUCT -> IO ()
-- Apparently always succeeds (return non-zero)

----------------------------------------------------------------
-- ShowWindow
----------------------------------------------------------------

type ShowWindowControl   = DWORD

sW_HIDE               :: ShowWindowControl
sW_HIDE               =  0
sW_SHOWNORMAL         :: ShowWindowControl
sW_SHOWNORMAL         =  1
sW_SHOWMINIMIZED      :: ShowWindowControl
sW_SHOWMINIMIZED      =  2
sW_SHOWMAXIMIZED      :: ShowWindowControl
sW_SHOWMAXIMIZED      =  3
sW_MAXIMIZE           :: ShowWindowControl
sW_MAXIMIZE           =  3
sW_SHOWNOACTIVATE     :: ShowWindowControl
sW_SHOWNOACTIVATE     =  4
sW_SHOW               :: ShowWindowControl
sW_SHOW               =  5
sW_MINIMIZE           :: ShowWindowControl
sW_MINIMIZE           =  6
sW_SHOWMINNOACTIVE    :: ShowWindowControl
sW_SHOWMINNOACTIVE    =  7
sW_SHOWNA             :: ShowWindowControl
sW_SHOWNA             =  8
sW_RESTORE            :: ShowWindowControl
sW_RESTORE            =  9

{-# LINE 331 "Graphics\Win32\Window.hsc" #-}

foreign import stdcall "windows.h ShowWindow"
  showWindow :: HWND  -> ShowWindowControl  -> IO Bool

----------------------------------------------------------------
-- Misc
----------------------------------------------------------------

adjustWindowRect :: RECT -> WindowStyle -> Bool -> IO RECT
adjustWindowRect rect style menu =
  withRECT rect $ \ p_rect -> do
  failIfFalse_ "AdjustWindowRect" $ c_AdjustWindowRect p_rect style menu
  peekRECT p_rect
foreign import stdcall unsafe "windows.h AdjustWindowRect"
  c_AdjustWindowRect :: Ptr RECT -> WindowStyle -> Bool -> IO Bool

adjustWindowRectEx :: RECT -> WindowStyle -> Bool -> WindowStyleEx -> IO RECT
adjustWindowRectEx rect style menu exstyle =
  withRECT rect $ \ p_rect -> do
  failIfFalse_ "AdjustWindowRectEx" $
    c_AdjustWindowRectEx p_rect style menu exstyle
  peekRECT p_rect
foreign import stdcall unsafe "windows.h AdjustWindowRectEx"
  c_AdjustWindowRectEx :: Ptr RECT -> WindowStyle -> Bool -> WindowStyleEx -> IO Bool

-- Win2K and later:
-- %fun AllowSetForegroundWindow :: DWORD -> IO ()

-- %
-- %dis animateWindowType x = dWORD x
-- type AnimateWindowType   = DWORD

-- %const AnimateWindowType
--        [ AW_SLIDE
--        , AW_ACTIVATE
--        , AW_BLEND
--        , AW_HIDE
--        , AW_CENTER
--        , AW_HOR_POSITIVE
--        , AW_HOR_NEGATIVE
--        , AW_VER_POSITIVE
--        , AW_VER_NEGATIVE
--        ]

-- Win98 or Win2K:
-- %fun AnimateWindow :: HWND -> DWORD -> AnimateWindowType -> IO ()
-- %code BOOL success = AnimateWindow(arg1,arg2,arg3)
-- %fail { !success } { ErrorWin("AnimateWindow") }

foreign import stdcall unsafe "windows.h AnyPopup"
  anyPopup :: IO Bool

arrangeIconicWindows :: HWND -> IO ()
arrangeIconicWindows wnd =
  failIfFalse_ "ArrangeIconicWindows" $ c_ArrangeIconicWindows wnd
foreign import stdcall unsafe "windows.h ArrangeIconicWindows"
  c_ArrangeIconicWindows :: HWND -> IO Bool

beginDeferWindowPos :: Int -> IO HDWP
beginDeferWindowPos n =
  failIfNull "BeginDeferWindowPos" $ c_BeginDeferWindowPos n
foreign import stdcall unsafe "windows.h BeginDeferWindowPos"
  c_BeginDeferWindowPos :: Int -> IO HDWP

bringWindowToTop :: HWND -> IO ()
bringWindowToTop wnd =
  failIfFalse_ "BringWindowToTop" $ c_BringWindowToTop wnd
foreign import stdcall "windows.h BringWindowToTop"
  c_BringWindowToTop :: HWND -> IO Bool

-- Can't pass structs with current FFI, so use a C wrapper (in Types)
childWindowFromPoint :: HWND -> POINT -> IO (Maybe HWND)
childWindowFromPoint wnd pt =
  withPOINT pt $ \ p_pt ->
  liftM ptrToMaybe $ prim_ChildWindowFromPoint wnd p_pt

-- Can't pass structs with current FFI, so use a C wrapper (in Types)
childWindowFromPointEx :: HWND -> POINT -> DWORD -> IO (Maybe HWND)
childWindowFromPointEx parent pt flags =
  withPOINT pt $ \ p_pt ->
  liftM ptrToMaybe $ prim_ChildWindowFromPointEx parent p_pt flags

closeWindow :: HWND -> IO ()
closeWindow wnd =
  failIfFalse_ "CloseWindow" $ c_DestroyWindow wnd

deferWindowPos :: HDWP -> HWND -> HWND -> Int -> Int -> Int -> Int -> SetWindowPosFlags -> IO HDWP
deferWindowPos wp wnd after x y cx cy flags =
  failIfNull "DeferWindowPos" $ c_DeferWindowPos wp wnd after x y cx cy flags
foreign import stdcall unsafe "windows.h DeferWindowPos"
  c_DeferWindowPos :: HDWP -> HWND -> HWND -> Int -> Int -> Int -> Int -> SetWindowPosFlags -> IO HDWP

destroyWindow :: HWND -> IO ()
destroyWindow wnd =
  failIfFalse_ "DestroyWindow" $ c_DestroyWindow wnd
foreign import stdcall "windows.h DestroyWindow"
  c_DestroyWindow :: HWND -> IO Bool

endDeferWindowPos :: HDWP -> IO ()
endDeferWindowPos pos =
  failIfFalse_ "EndDeferWindowPos" $ c_EndDeferWindowPos pos
foreign import stdcall unsafe "windows.h EndDeferWindowPos"
  c_EndDeferWindowPos :: HDWP -> IO Bool

findWindow :: String -> String -> IO (Maybe HWND)
findWindow cname wname =
  withTString cname $ \ c_cname ->
  withTString wname $ \ c_wname ->
  liftM ptrToMaybe $ c_FindWindow c_cname c_wname
foreign import stdcall unsafe "windows.h FindWindowW"
  c_FindWindow :: LPCTSTR -> LPCTSTR -> IO HWND

findWindowEx :: HWND -> HWND -> String -> String -> IO (Maybe HWND)
findWindowEx parent after cname wname =
  withTString cname $ \ c_cname ->
  withTString wname $ \ c_wname ->
  liftM ptrToMaybe $ c_FindWindowEx parent after c_cname c_wname
foreign import stdcall unsafe "windows.h FindWindowExW"
  c_FindWindowEx :: HWND -> HWND -> LPCTSTR -> LPCTSTR -> IO HWND

foreign import stdcall unsafe "windows.h FlashWindow"
  flashWindow :: HWND -> Bool -> IO Bool
-- No error code

moveWindow :: HWND -> Int -> Int -> Int -> Int -> Bool -> IO ()
moveWindow wnd x y w h repaint =
  failIfFalse_ "MoveWindow" $ c_MoveWindow wnd x y w h repaint
foreign import stdcall "windows.h MoveWindow"
  c_MoveWindow :: HWND -> Int -> Int -> Int -> Int -> Bool -> IO Bool

foreign import stdcall unsafe "windows.h GetDesktopWindow"
  getDesktopWindow :: IO HWND

foreign import stdcall unsafe "windows.h GetForegroundWindow"
  getForegroundWindow :: IO HWND

getParent :: HWND -> IO HWND
getParent wnd =
  failIfNull "GetParent" $ c_GetParent wnd
foreign import stdcall unsafe "windows.h GetParent"
  c_GetParent :: HWND -> IO HWND

getTopWindow :: HWND -> IO HWND
getTopWindow wnd =
  failIfNull "GetTopWindow" $ c_GetTopWindow wnd
foreign import stdcall unsafe "windows.h GetTopWindow"
  c_GetTopWindow :: HWND -> IO HWND


type SetWindowPosFlags = UINT

sWP_NOSIZE            :: SetWindowPosFlags
sWP_NOSIZE            =  1
sWP_NOMOVE            :: SetWindowPosFlags
sWP_NOMOVE            =  2
sWP_NOZORDER          :: SetWindowPosFlags
sWP_NOZORDER          =  4
sWP_NOREDRAW          :: SetWindowPosFlags
sWP_NOREDRAW          =  8
sWP_NOACTIVATE        :: SetWindowPosFlags
sWP_NOACTIVATE        =  16
sWP_FRAMECHANGED      :: SetWindowPosFlags
sWP_FRAMECHANGED      =  32
sWP_SHOWWINDOW        :: SetWindowPosFlags
sWP_SHOWWINDOW        =  64
sWP_HIDEWINDOW        :: SetWindowPosFlags
sWP_HIDEWINDOW        =  128
sWP_NOCOPYBITS        :: SetWindowPosFlags
sWP_NOCOPYBITS        =  256
sWP_NOOWNERZORDER     :: SetWindowPosFlags
sWP_NOOWNERZORDER     =  512
sWP_NOSENDCHANGING    :: SetWindowPosFlags
sWP_NOSENDCHANGING    =  1024
sWP_DRAWFRAME         :: SetWindowPosFlags
sWP_DRAWFRAME         =  32
sWP_NOREPOSITION      :: SetWindowPosFlags
sWP_NOREPOSITION      =  512

{-# LINE 497 "Graphics\Win32\Window.hsc" #-}

----------------------------------------------------------------
-- HDCs
----------------------------------------------------------------

type GetDCExFlags   = DWORD

dCX_WINDOW            :: GetDCExFlags
dCX_WINDOW            =  1
dCX_CACHE             :: GetDCExFlags
dCX_CACHE             =  2
dCX_CLIPCHILDREN      :: GetDCExFlags
dCX_CLIPCHILDREN      =  8
dCX_CLIPSIBLINGS      :: GetDCExFlags
dCX_CLIPSIBLINGS      =  16
dCX_PARENTCLIP        :: GetDCExFlags
dCX_PARENTCLIP        =  32
dCX_EXCLUDERGN        :: GetDCExFlags
dCX_EXCLUDERGN        =  64
dCX_INTERSECTRGN      :: GetDCExFlags
dCX_INTERSECTRGN      =  128
dCX_LOCKWINDOWUPDATE  :: GetDCExFlags
dCX_LOCKWINDOWUPDATE  =  1024

{-# LINE 514 "Graphics\Win32\Window.hsc" #-}

-- apparently mostly fails if you use invalid hwnds

getDCEx :: HWND -> HRGN -> GetDCExFlags -> IO HDC
getDCEx wnd rgn flags =
  withForeignPtr rgn $ \ p_rgn ->
  failIfNull "GetDCEx" $ c_GetDCEx wnd p_rgn flags
foreign import stdcall unsafe "windows.h GetDCEx"
  c_GetDCEx :: HWND -> PRGN -> GetDCExFlags -> IO HDC

getDC :: Maybe HWND -> IO HDC
getDC mb_wnd =
  failIfNull "GetDC" $ c_GetDC (maybePtr mb_wnd)
foreign import stdcall unsafe "windows.h GetDC"
  c_GetDC :: HWND -> IO HDC

getWindowDC :: Maybe HWND -> IO HDC
getWindowDC mb_wnd =
  failIfNull "GetWindowDC" $ c_GetWindowDC (maybePtr mb_wnd)
foreign import stdcall unsafe "windows.h GetWindowDC"
  c_GetWindowDC :: HWND -> IO HDC

releaseDC :: Maybe HWND -> HDC -> IO ()
releaseDC mb_wnd dc =
  failIfFalse_ "ReleaseDC" $ c_ReleaseDC (maybePtr mb_wnd) dc
foreign import stdcall unsafe "windows.h ReleaseDC"
  c_ReleaseDC :: HWND -> HDC -> IO Bool

getDCOrgEx :: HDC -> IO POINT
getDCOrgEx dc =
  allocaPOINT $ \ p_pt -> do
  failIfFalse_ "GetDCOrgEx" $ c_GetDCOrgEx dc p_pt
  peekPOINT p_pt
foreign import stdcall unsafe "windows.h GetDCOrgEx"
  c_GetDCOrgEx :: HDC -> Ptr POINT -> IO Bool

----------------------------------------------------------------
-- Caret
----------------------------------------------------------------

hideCaret :: HWND -> IO ()
hideCaret wnd =
  failIfFalse_ "HideCaret" $ c_HideCaret wnd
foreign import stdcall unsafe "windows.h HideCaret"
  c_HideCaret :: HWND -> IO Bool

showCaret :: HWND -> IO ()
showCaret wnd =
  failIfFalse_ "ShowCaret" $ c_ShowCaret wnd
foreign import stdcall unsafe "windows.h ShowCaret"
  c_ShowCaret :: HWND -> IO Bool

-- ToDo: allow arg2 to be NULL or {(HBITMAP)1}

createCaret :: HWND -> HBITMAP -> Maybe INT -> Maybe INT -> IO ()
createCaret wnd bm mb_w mb_h =
  failIfFalse_ "CreateCaret" $
    c_CreateCaret wnd bm (maybeNum mb_w) (maybeNum mb_h)
foreign import stdcall unsafe "windows.h CreateCaret"
  c_CreateCaret :: HWND -> HBITMAP -> INT -> INT -> IO Bool

destroyCaret :: IO ()
destroyCaret =
  failIfFalse_ "DestroyCaret" $ c_DestroyCaret
foreign import stdcall unsafe "windows.h DestroyCaret"
  c_DestroyCaret :: IO Bool

getCaretPos :: IO POINT
getCaretPos =
  allocaPOINT $ \ p_pt -> do
  failIfFalse_ "GetCaretPos" $ c_GetCaretPos p_pt
  peekPOINT p_pt
foreign import stdcall unsafe "windows.h GetCaretPos"
  c_GetCaretPos :: Ptr POINT -> IO Bool

setCaretPos :: POINT -> IO ()
setCaretPos (x,y) =
  failIfFalse_ "SetCaretPos" $ c_SetCaretPos x y
foreign import stdcall unsafe "windows.h SetCaretPos"
  c_SetCaretPos :: LONG -> LONG -> IO Bool

-- The remarks on SetCaretBlinkTime are either highly risible or very sad -
-- depending on whether you plan to use this function.

----------------------------------------------------------------
-- MSGs and event loops
--
-- Note that the following functions have to be reentrant:
--
--   DispatchMessage
--   SendMessage
--   UpdateWindow   (I think)
--   RedrawWindow   (I think)
--
-- The following dont have to be reentrant (according to documentation)
--
--   GetMessage
--   PeekMessage
--   TranslateMessage
--
-- For Hugs (and possibly NHC too?) this is no big deal.
-- For GHC, you have to use casm_GC instead of casm.
-- (It might be simpler to just put all this code in another
-- file and build it with the appropriate command line option...)
----------------------------------------------------------------

-- type MSG =
--   ( HWND   -- hwnd;
--   , UINT   -- message;
--   , WPARAM -- wParam;
--   , LPARAM -- lParam;
--   , DWORD  -- time;
--   , POINT  -- pt;
--   )

type LPMSG   = Addr

allocaMessage :: (LPMSG -> IO a) -> IO a
allocaMessage = allocaBytes (28)
{-# LINE 633 "Graphics\Win32\Window.hsc" #-}

-- A NULL window requests messages for any window belonging to this thread.
-- a "success" value of 0 indicates that WM_QUIT was received

getMessage :: LPMSG -> Maybe HWND -> IO Bool
getMessage msg mb_wnd = do
  res <- failIf (== -1) "GetMessage" $
    c_GetMessage msg (maybePtr mb_wnd) 0 0
  return (res /= 0)
foreign import stdcall "windows.h GetMessageW"
  c_GetMessage :: LPMSG -> HWND -> UINT -> UINT -> IO LONG

-- A NULL window requests messages for any window belonging to this thread.
-- Arguably the code block shouldn't be a 'safe' one, but it shouldn't really
-- hurt.

peekMessage :: LPMSG -> Maybe HWND -> UINT -> UINT -> UINT -> IO ()
peekMessage msg mb_wnd filterMin filterMax remove = do
  failIf (== -1) "PeekMessage" $
    c_PeekMessage msg (maybePtr mb_wnd) filterMin filterMax remove
  return ()
foreign import stdcall "windows.h PeekMessageW"
  c_PeekMessage :: LPMSG -> HWND -> UINT -> UINT -> UINT -> IO LONG

-- Note: you're not supposed to call this if you're using accelerators

foreign import stdcall "windows.h TranslateMessage"
  translateMessage :: LPMSG -> IO BOOL

updateWindow :: HWND -> IO ()
updateWindow wnd =
  failIfFalse_ "UpdateWindow" $ c_UpdateWindow wnd
foreign import stdcall "windows.h UpdateWindow"
  c_UpdateWindow :: HWND -> IO Bool

-- Return value of DispatchMessage is usually ignored

foreign import stdcall "windows.h DispatchMessageW"
  dispatchMessage :: LPMSG -> IO LONG

foreign import stdcall "windows.h SendMessageW"
  sendMessage :: HWND -> WindowMessage -> WPARAM -> LPARAM -> IO LRESULT

----------------------------------------------------------------

-- ToDo: figure out reentrancy stuff
-- ToDo: catch error codes
--
-- ToDo: how to send HWND_BROADCAST to PostMessage
-- %fun PostMessage       :: MbHWND -> WindowMessage -> WPARAM -> LPARAM -> IO ()
-- %fun PostQuitMessage   :: Int -> IO ()
-- %fun PostThreadMessage :: DWORD -> WindowMessage -> WPARAM -> LPARAM -> IO ()
-- %fun InSendMessage     :: IO Bool

----------------------------------------------------------------
-- End
----------------------------------------------------------------
