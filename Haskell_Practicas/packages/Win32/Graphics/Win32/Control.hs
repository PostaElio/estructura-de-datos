{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DUNICODE #-}
{-# INCLUDE <windows.h> #-}
{-# INCLUDE <commctrl.h> #-}
{-# LINE 1 "Graphics\Win32\Control.hsc" #-}
-----------------------------------------------------------------------------
{-# LINE 2 "Graphics\Win32\Control.hsc" #-}
-- |
-- Module      :  Graphics.Win32.Control
-- Copyright   :  (c) Alastair Reid, 1997-2003
-- License     :  BSD-style (see the file libraries/base/LICENSE)
--
-- Maintainer  :  libraries@haskell.org
-- Stability   :  provisional
-- Portability :  portable
--
-- FFI bindings to the various standard Win32 controls.
--
-----------------------------------------------------------------------------

module Graphics.Win32.Control where

import Graphics.Win32.GDI.Types
import Graphics.Win32.Window
import System.Win32.Types
import Graphics.Win32.Message

import Foreign


{-# LINE 25 "Graphics\Win32\Control.hsc" #-}

{-# LINE 26 "Graphics\Win32\Control.hsc" #-}

-- == Command buttons

type ButtonStyle   = WindowStyle

bS_PUSHBUTTON         :: ButtonStyle
bS_PUSHBUTTON         =  0
bS_DEFPUSHBUTTON      :: ButtonStyle
bS_DEFPUSHBUTTON      =  1
bS_CHECKBOX           :: ButtonStyle
bS_CHECKBOX           =  2
bS_AUTOCHECKBOX       :: ButtonStyle
bS_AUTOCHECKBOX       =  3
bS_RADIOBUTTON        :: ButtonStyle
bS_RADIOBUTTON        =  4
bS_3STATE             :: ButtonStyle
bS_3STATE             =  5
bS_AUTO3STATE         :: ButtonStyle
bS_AUTO3STATE         =  6
bS_GROUPBOX           :: ButtonStyle
bS_GROUPBOX           =  7
bS_AUTORADIOBUTTON    :: ButtonStyle
bS_AUTORADIOBUTTON    =  9
bS_OWNERDRAW          :: ButtonStyle
bS_OWNERDRAW          =  11
bS_LEFTTEXT           :: ButtonStyle
bS_LEFTTEXT           =  32
bS_USERBUTTON         :: ButtonStyle
bS_USERBUTTON         =  8

{-# LINE 45 "Graphics\Win32\Control.hsc" #-}

createButton
  :: String -> WindowStyle -> ButtonStyle
  -> Maybe Pos -> Maybe Pos -> Maybe Pos -> Maybe Pos
  -> Maybe HWND -> Maybe HMENU -> HANDLE
  -> IO HWND
createButton nm wstyle bstyle mb_x mb_y mb_w mb_h mb_parent mb_menu h =
  withTString nm $ \ c_nm ->
  failIfNull "CreateButton" $
    c_CreateWindowEx 0 buttonStyle c_nm (wstyle .|. bstyle)
      (maybePos mb_x) (maybePos mb_y) (maybePos mb_w) (maybePos mb_h)
      (maybePtr mb_parent) (maybePtr mb_menu) h nullPtr

buttonStyle :: ClassName
buttonStyle = unsafePerformIO (newTString "BUTTON")

type ButtonState = UINT

bST_CHECKED           :: ButtonState
bST_CHECKED           =  1
bST_INDETERMINATE     :: ButtonState
bST_INDETERMINATE     =  2
bST_UNCHECKED         :: ButtonState
bST_UNCHECKED         =  0

{-# LINE 68 "Graphics\Win32\Control.hsc" #-}

checkDlgButton :: HWND -> Int -> ButtonState -> IO ()
checkDlgButton dialog button check =
  failIfFalse_ "CheckDlgButton" $ c_CheckDlgButton dialog button check
foreign import stdcall unsafe "windows.h CheckDlgButton"
  c_CheckDlgButton :: HWND -> Int -> ButtonState -> IO Bool

checkRadioButton :: HWND -> Int -> Int -> Int -> IO ()
checkRadioButton dialog first_button last_button check =
  failIfFalse_ "CheckRadioButton" $
    c_CheckRadioButton dialog first_button last_button check
foreign import stdcall unsafe "windows.h CheckRadioButton"
  c_CheckRadioButton :: HWND -> Int -> Int -> Int -> IO Bool

isDlgButtonChecked :: HWND -> Int -> IO ButtonState
isDlgButtonChecked wnd button =
  failIfZero "IsDlgButtonChecked" $ c_IsDlgButtonChecked wnd button
foreign import stdcall unsafe "windows.h IsDlgButtonChecked"
  c_IsDlgButtonChecked :: HWND -> Int -> IO ButtonState


-- == ComboBoxes aka. pop up list boxes/selectors.

type ComboBoxStyle = WindowStyle

cBS_SIMPLE            :: ComboBoxStyle
cBS_SIMPLE            =  1
cBS_DROPDOWN          :: ComboBoxStyle
cBS_DROPDOWN          =  2
cBS_DROPDOWNLIST      :: ComboBoxStyle
cBS_DROPDOWNLIST      =  3
cBS_OWNERDRAWFIXED    :: ComboBoxStyle
cBS_OWNERDRAWFIXED    =  16
cBS_OWNERDRAWVARIABLE  :: ComboBoxStyle
cBS_OWNERDRAWVARIABLE  =  32
cBS_AUTOHSCROLL       :: ComboBoxStyle
cBS_AUTOHSCROLL       =  64
cBS_OEMCONVERT        :: ComboBoxStyle
cBS_OEMCONVERT        =  128
cBS_SORT              :: ComboBoxStyle
cBS_SORT              =  256
cBS_HASSTRINGS        :: ComboBoxStyle
cBS_HASSTRINGS        =  512
cBS_NOINTEGRALHEIGHT  :: ComboBoxStyle
cBS_NOINTEGRALHEIGHT  =  1024
cBS_DISABLENOSCROLL   :: ComboBoxStyle
cBS_DISABLENOSCROLL   =  2048

{-# LINE 106 "Graphics\Win32\Control.hsc" #-}

createComboBox
  :: String -> WindowStyle -> ComboBoxStyle
  -> Maybe Pos -> Maybe Pos -> Maybe Pos -> Maybe Pos
  -> HWND -> Maybe HMENU -> HANDLE
  -> IO HWND
createComboBox nm wstyle cstyle mb_x mb_y mb_w mb_h parent mb_menu h =
  withTString nm $ \ c_nm ->
  failIfNull "CreateComboBox" $
    c_CreateWindowEx 0 comboBoxStyle c_nm (wstyle .|. cstyle)
      (maybePos mb_x) (maybePos mb_y) (maybePos mb_w) (maybePos mb_h)
      parent (maybePtr mb_menu) h nullPtr

comboBoxStyle :: ClassName
comboBoxStyle = unsafePerformIO (newTString "COMBOBOX")

-- see comment about freeing windowNames in System.Win32.Window.createWindow
-- %end free(nm)


--- == Edit controls

----------------------------------------------------------------

type EditStyle = WindowStyle

eS_LEFT               :: EditStyle
eS_LEFT               =  0
eS_CENTER             :: EditStyle
eS_CENTER             =  1
eS_RIGHT              :: EditStyle
eS_RIGHT              =  2
eS_MULTILINE          :: EditStyle
eS_MULTILINE          =  4
eS_UPPERCASE          :: EditStyle
eS_UPPERCASE          =  8
eS_LOWERCASE          :: EditStyle
eS_LOWERCASE          =  16
eS_PASSWORD           :: EditStyle
eS_PASSWORD           =  32
eS_AUTOVSCROLL        :: EditStyle
eS_AUTOVSCROLL        =  64
eS_AUTOHSCROLL        :: EditStyle
eS_AUTOHSCROLL        =  128
eS_NOHIDESEL          :: EditStyle
eS_NOHIDESEL          =  256
eS_OEMCONVERT         :: EditStyle
eS_OEMCONVERT         =  1024
eS_READONLY           :: EditStyle
eS_READONLY           =  2048
eS_WANTRETURN         :: EditStyle
eS_WANTRETURN         =  4096

{-# LINE 147 "Graphics\Win32\Control.hsc" #-}

createEditWindow
  :: String -> WindowStyle -> EditStyle
  -> Maybe Pos -> Maybe Pos -> Maybe Pos -> Maybe Pos
  -> HWND -> Maybe HMENU -> HANDLE
  -> IO HWND
createEditWindow nm wstyle estyle mb_x mb_y mb_w mb_h parent mb_menu h =
  withTString nm $ \ c_nm ->
  failIfNull "CreateEditWindow" $
    c_CreateWindowEx 0 editStyle c_nm (wstyle .|. estyle)
      (maybePos mb_x) (maybePos mb_y) (maybePos mb_w) (maybePos mb_h)
      parent (maybePtr mb_menu) h nullPtr

editStyle :: ClassName
editStyle = unsafePerformIO (newTString "EDIT")

-- see comment about freeing windowNames in System.Win32.Window.createWindow
-- %end free(nm)

-- == List boxes


----------------------------------------------------------------

type ListBoxStyle   = WindowStyle

lBS_NOTIFY            :: ListBoxStyle
lBS_NOTIFY            =  1
lBS_SORT              :: ListBoxStyle
lBS_SORT              =  2
lBS_NOREDRAW          :: ListBoxStyle
lBS_NOREDRAW          =  4
lBS_MULTIPLESEL       :: ListBoxStyle
lBS_MULTIPLESEL       =  8
lBS_OWNERDRAWFIXED    :: ListBoxStyle
lBS_OWNERDRAWFIXED    =  16
lBS_OWNERDRAWVARIABLE  :: ListBoxStyle
lBS_OWNERDRAWVARIABLE  =  32
lBS_HASSTRINGS        :: ListBoxStyle
lBS_HASSTRINGS        =  64
lBS_USETABSTOPS       :: ListBoxStyle
lBS_USETABSTOPS       =  128
lBS_NOINTEGRALHEIGHT  :: ListBoxStyle
lBS_NOINTEGRALHEIGHT  =  256
lBS_MULTICOLUMN       :: ListBoxStyle
lBS_MULTICOLUMN       =  512
lBS_WANTKEYBOARDINPUT  :: ListBoxStyle
lBS_WANTKEYBOARDINPUT  =  1024
lBS_DISABLENOSCROLL   :: ListBoxStyle
lBS_DISABLENOSCROLL   =  4096
lBS_STANDARD          :: ListBoxStyle
lBS_STANDARD          =  10485763

{-# LINE 188 "Graphics\Win32\Control.hsc" #-}

createListBox
  :: String -> WindowStyle -> ListBoxStyle
  -> Maybe Pos -> Maybe Pos -> Maybe Pos -> Maybe Pos
  -> HWND -> Maybe HMENU -> HANDLE
  -> IO HWND
createListBox nm wstyle lstyle mb_x mb_y mb_w mb_h parent mb_menu h =
  withTString nm $ \ c_nm ->
  failIfNull "CreateListBox" $
    c_CreateWindowEx 0 listBoxStyle c_nm (wstyle .|. lstyle)
      (maybePos mb_x) (maybePos mb_y) (maybePos mb_w) (maybePos mb_h)
      parent (maybePtr mb_menu) h nullPtr

listBoxStyle :: ClassName
listBoxStyle = unsafePerformIO (newTString "LISTBOX")

-- see comment about freeing windowNames in System.Win32.Window.createWindow
-- %end free(nm)

-- == Scrollbars


----------------------------------------------------------------

type ScrollbarStyle = WindowStyle

sBS_HORZ                      :: ScrollbarStyle
sBS_HORZ                      =  0
sBS_TOPALIGN                  :: ScrollbarStyle
sBS_TOPALIGN                  =  2
sBS_BOTTOMALIGN               :: ScrollbarStyle
sBS_BOTTOMALIGN               =  4
sBS_VERT                      :: ScrollbarStyle
sBS_VERT                      =  1
sBS_LEFTALIGN                 :: ScrollbarStyle
sBS_LEFTALIGN                 =  2
sBS_RIGHTALIGN                :: ScrollbarStyle
sBS_RIGHTALIGN                =  4
sBS_SIZEBOX                   :: ScrollbarStyle
sBS_SIZEBOX                   =  8
sBS_SIZEBOXTOPLEFTALIGN       :: ScrollbarStyle
sBS_SIZEBOXTOPLEFTALIGN       =  2
sBS_SIZEBOXBOTTOMRIGHTALIGN   :: ScrollbarStyle
sBS_SIZEBOXBOTTOMRIGHTALIGN   =  4

{-# LINE 225 "Graphics\Win32\Control.hsc" #-}

createScrollbar
  :: String -> WindowStyle -> ScrollbarStyle
  -> Maybe Pos -> Maybe Pos -> Maybe Pos -> Maybe Pos
  -> HWND -> Maybe HMENU -> HANDLE
  -> IO HWND
createScrollbar nm wstyle sstyle mb_x mb_y mb_w mb_h parent mb_menu h =
  withTString nm $ \ c_nm ->
  failIfNull "CreateScrollbar" $
    c_CreateWindowEx 0 scrollBarStyle c_nm (wstyle .|. sstyle)
      (maybePos mb_x) (maybePos mb_y) (maybePos mb_w) (maybePos mb_h)
      parent (maybePtr mb_menu) h nullPtr

scrollBarStyle :: ClassName
scrollBarStyle = unsafePerformIO (newTString "SCROLLBAR")

-- see comment about freeing windowNames in System.Win32.Window.createWindow
-- %end free(nm)

-- == Static controls aka. labels


----------------------------------------------------------------

type StaticControlStyle = WindowStyle

sS_LEFT               :: StaticControlStyle
sS_LEFT               =  0
sS_CENTER             :: StaticControlStyle
sS_CENTER             =  1
sS_RIGHT              :: StaticControlStyle
sS_RIGHT              =  2
sS_ICON               :: StaticControlStyle
sS_ICON               =  3
sS_BLACKRECT          :: StaticControlStyle
sS_BLACKRECT          =  4
sS_GRAYRECT           :: StaticControlStyle
sS_GRAYRECT           =  5
sS_WHITERECT          :: StaticControlStyle
sS_WHITERECT          =  6
sS_BLACKFRAME         :: StaticControlStyle
sS_BLACKFRAME         =  7
sS_GRAYFRAME          :: StaticControlStyle
sS_GRAYFRAME          =  8
sS_WHITEFRAME         :: StaticControlStyle
sS_WHITEFRAME         =  9
sS_SIMPLE             :: StaticControlStyle
sS_SIMPLE             =  11
sS_LEFTNOWORDWRAP     :: StaticControlStyle
sS_LEFTNOWORDWRAP     =  12
sS_NOPREFIX           :: StaticControlStyle
sS_NOPREFIX           =  128

{-# LINE 266 "Graphics\Win32\Control.hsc" #-}

createStaticWindow
  :: String -> WindowStyle -> StaticControlStyle
  -> Maybe Pos -> Maybe Pos -> Maybe Pos -> Maybe Pos
  -> HWND -> Maybe HMENU -> HANDLE
  -> IO HWND
createStaticWindow nm wstyle sstyle mb_x mb_y mb_w mb_h parent mb_menu h =
  withTString nm $ \ c_nm ->
  failIfNull "CreateStaticWindow" $
    c_CreateWindowEx 0 staticStyle c_nm (wstyle .|. sstyle)
      (maybePos mb_x) (maybePos mb_y) (maybePos mb_w) (maybePos mb_h)
      parent (maybePtr mb_menu) h nullPtr

staticStyle :: ClassName
staticStyle = unsafePerformIO (newTString "STATIC")

-- see comment about freeing windowNames in System.Win32.Window.createWindow
-- %end free(nm)


{-# LINE 327 "Graphics\Win32\Control.hsc" #-}

pBM_DELTAPOS  :: WindowMessage
pBM_DELTAPOS  =  1027
pBM_SETPOS    :: WindowMessage
pBM_SETPOS    =  1026
pBM_SETRANGE  :: WindowMessage
pBM_SETRANGE  =  1025
pBM_SETSTEP   :: WindowMessage
pBM_SETSTEP   =  1028
pBM_STEPIT    :: WindowMessage
pBM_STEPIT    =  1029

{-# LINE 335 "Graphics\Win32\Control.hsc" #-}

-- % , PBM_GETRANGE
-- % , PBM_GETPOS
-- % , PBM_SETBARCOLOR
-- % , PBM_SETBKCOLOR
-- % , PBM_SETRANGE32
