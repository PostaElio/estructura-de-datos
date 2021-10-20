{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DUNICODE #-}
{-# INCLUDE <windows.h> #-}
{-# LINE 1 "Graphics\Win32\Message.hsc" #-}
-----------------------------------------------------------------------------
{-# LINE 2 "Graphics\Win32\Message.hsc" #-}
-- |
-- Module      :  Graphics.Win32.Message
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

module Graphics.Win32.Message where

import System.Win32.Types


{-# LINE 20 "Graphics\Win32\Message.hsc" #-}

type WindowMessage   = DWORD

wM_COMPACTING         :: WindowMessage
wM_COMPACTING         =  65
wM_WININICHANGE       :: WindowMessage
wM_WININICHANGE       =  26
wM_SYSCOLORCHANGE     :: WindowMessage
wM_SYSCOLORCHANGE     =  21
wM_QUERYNEWPALETTE    :: WindowMessage
wM_QUERYNEWPALETTE    =  783
wM_PALETTEISCHANGING  :: WindowMessage
wM_PALETTEISCHANGING  =  784
wM_PALETTECHANGED     :: WindowMessage
wM_PALETTECHANGED     =  785
wM_FONTCHANGE         :: WindowMessage
wM_FONTCHANGE         =  29
wM_SPOOLERSTATUS      :: WindowMessage
wM_SPOOLERSTATUS      =  42
wM_DEVMODECHANGE      :: WindowMessage
wM_DEVMODECHANGE      =  27
wM_TIMECHANGE         :: WindowMessage
wM_TIMECHANGE         =  30
wM_POWER              :: WindowMessage
wM_POWER              =  72
wM_QUERYENDSESSION    :: WindowMessage
wM_QUERYENDSESSION    =  17
wM_ENDSESSION         :: WindowMessage
wM_ENDSESSION         =  22
wM_QUIT               :: WindowMessage
wM_QUIT               =  18
wM_CREATE             :: WindowMessage
wM_CREATE             =  1
wM_NCCREATE           :: WindowMessage
wM_NCCREATE           =  129
wM_DESTROY            :: WindowMessage
wM_DESTROY            =  2
wM_NCDESTROY          :: WindowMessage
wM_NCDESTROY          =  130
wM_SHOWWINDOW         :: WindowMessage
wM_SHOWWINDOW         =  24
wM_SETREDRAW          :: WindowMessage
wM_SETREDRAW          =  11
wM_ENABLE             :: WindowMessage
wM_ENABLE             =  10
wM_SETTEXT            :: WindowMessage
wM_SETTEXT            =  12
wM_GETTEXT            :: WindowMessage
wM_GETTEXT            =  13
wM_GETTEXTLENGTH      :: WindowMessage
wM_GETTEXTLENGTH      =  14
wM_WINDOWPOSCHANGING  :: WindowMessage
wM_WINDOWPOSCHANGING  =  70
wM_WINDOWPOSCHANGED   :: WindowMessage
wM_WINDOWPOSCHANGED   =  71
wM_MOVE               :: WindowMessage
wM_MOVE               =  3
wM_SIZE               :: WindowMessage
wM_SIZE               =  5
wM_QUERYOPEN          :: WindowMessage
wM_QUERYOPEN          =  19
wM_CLOSE              :: WindowMessage
wM_CLOSE              =  16
wM_GETMINMAXINFO      :: WindowMessage
wM_GETMINMAXINFO      =  36
wM_PAINT              :: WindowMessage
wM_PAINT              =  15
wM_ERASEBKGND         :: WindowMessage
wM_ERASEBKGND         =  20
wM_ICONERASEBKGND     :: WindowMessage
wM_ICONERASEBKGND     =  39
wM_NCPAINT            :: WindowMessage
wM_NCPAINT            =  133
wM_NCCALCSIZE         :: WindowMessage
wM_NCCALCSIZE         =  131
wM_QUERYDRAGICON      :: WindowMessage
wM_QUERYDRAGICON      =  55
wM_DROPFILES          :: WindowMessage
wM_DROPFILES          =  563
wM_ACTIVATE           :: WindowMessage
wM_ACTIVATE           =  6
wM_ACTIVATEAPP        :: WindowMessage
wM_ACTIVATEAPP        =  28
wM_NCACTIVATE         :: WindowMessage
wM_NCACTIVATE         =  134
wM_SETFOCUS           :: WindowMessage
wM_SETFOCUS           =  7
wM_KILLFOCUS          :: WindowMessage
wM_KILLFOCUS          =  8
wM_KEYDOWN            :: WindowMessage
wM_KEYDOWN            =  256
wM_KEYUP              :: WindowMessage
wM_KEYUP              =  257
wM_CHAR               :: WindowMessage
wM_CHAR               =  258
wM_DEADCHAR           :: WindowMessage
wM_DEADCHAR           =  259
wM_SYSKEYDOWN         :: WindowMessage
wM_SYSKEYDOWN         =  260
wM_SYSKEYUP           :: WindowMessage
wM_SYSKEYUP           =  261
wM_SYSCHAR            :: WindowMessage
wM_SYSCHAR            =  262
wM_SYSDEADCHAR        :: WindowMessage
wM_SYSDEADCHAR        =  263
wM_KEYFIRST           :: WindowMessage
wM_KEYFIRST           =  256
wM_KEYLAST            :: WindowMessage
wM_KEYLAST            =  264
wM_MOUSEMOVE          :: WindowMessage
wM_MOUSEMOVE          =  512
wM_LBUTTONDOWN        :: WindowMessage
wM_LBUTTONDOWN        =  513
wM_LBUTTONUP          :: WindowMessage
wM_LBUTTONUP          =  514
wM_LBUTTONDBLCLK      :: WindowMessage
wM_LBUTTONDBLCLK      =  515
wM_RBUTTONDOWN        :: WindowMessage
wM_RBUTTONDOWN        =  516
wM_RBUTTONUP          :: WindowMessage
wM_RBUTTONUP          =  517
wM_RBUTTONDBLCLK      :: WindowMessage
wM_RBUTTONDBLCLK      =  518
wM_MBUTTONDOWN        :: WindowMessage
wM_MBUTTONDOWN        =  519
wM_MBUTTONUP          :: WindowMessage
wM_MBUTTONUP          =  520
wM_MBUTTONDBLCLK      :: WindowMessage
wM_MBUTTONDBLCLK      =  521
wM_MOUSEFIRST         :: WindowMessage
wM_MOUSEFIRST         =  512
wM_MOUSELAST          :: WindowMessage
wM_MOUSELAST          =  522
wM_NCMOUSEMOVE        :: WindowMessage
wM_NCMOUSEMOVE        =  160
wM_NCLBUTTONDOWN      :: WindowMessage
wM_NCLBUTTONDOWN      =  161
wM_NCLBUTTONUP        :: WindowMessage
wM_NCLBUTTONUP        =  162
wM_NCLBUTTONDBLCLK    :: WindowMessage
wM_NCLBUTTONDBLCLK    =  163
wM_NCRBUTTONDOWN      :: WindowMessage
wM_NCRBUTTONDOWN      =  164
wM_NCRBUTTONUP        :: WindowMessage
wM_NCRBUTTONUP        =  165
wM_NCRBUTTONDBLCLK    :: WindowMessage
wM_NCRBUTTONDBLCLK    =  166
wM_NCMBUTTONDOWN      :: WindowMessage
wM_NCMBUTTONDOWN      =  167
wM_NCMBUTTONUP        :: WindowMessage
wM_NCMBUTTONUP        =  168
wM_NCMBUTTONDBLCLK    :: WindowMessage
wM_NCMBUTTONDBLCLK    =  169
wM_MOUSEACTIVATE      :: WindowMessage
wM_MOUSEACTIVATE      =  33
wM_CANCELMODE         :: WindowMessage
wM_CANCELMODE         =  31
wM_TIMER              :: WindowMessage
wM_TIMER              =  275
wM_INITMENU           :: WindowMessage
wM_INITMENU           =  278
wM_INITMENUPOPUP      :: WindowMessage
wM_INITMENUPOPUP      =  279
wM_MENUSELECT         :: WindowMessage
wM_MENUSELECT         =  287
wM_MENUCHAR           :: WindowMessage
wM_MENUCHAR           =  288
wM_COMMAND            :: WindowMessage
wM_COMMAND            =  273
wM_HSCROLL            :: WindowMessage
wM_HSCROLL            =  276
wM_VSCROLL            :: WindowMessage
wM_VSCROLL            =  277
wM_CUT                :: WindowMessage
wM_CUT                =  768
wM_COPY               :: WindowMessage
wM_COPY               =  769
wM_PASTE              :: WindowMessage
wM_PASTE              =  770
wM_CLEAR              :: WindowMessage
wM_CLEAR              =  771
wM_UNDO               :: WindowMessage
wM_UNDO               =  772
wM_RENDERFORMAT       :: WindowMessage
wM_RENDERFORMAT       =  773
wM_RENDERALLFORMATS   :: WindowMessage
wM_RENDERALLFORMATS   =  774
wM_DESTROYCLIPBOARD   :: WindowMessage
wM_DESTROYCLIPBOARD   =  775
wM_DRAWCLIPBOARD      :: WindowMessage
wM_DRAWCLIPBOARD      =  776
wM_PAINTCLIPBOARD     :: WindowMessage
wM_PAINTCLIPBOARD     =  777
wM_SIZECLIPBOARD      :: WindowMessage
wM_SIZECLIPBOARD      =  779
wM_VSCROLLCLIPBOARD   :: WindowMessage
wM_VSCROLLCLIPBOARD   =  778
wM_HSCROLLCLIPBOARD   :: WindowMessage
wM_HSCROLLCLIPBOARD   =  782
wM_ASKCBFORMATNAME    :: WindowMessage
wM_ASKCBFORMATNAME    =  780
wM_CHANGECBCHAIN      :: WindowMessage
wM_CHANGECBCHAIN      =  781
wM_SETCURSOR          :: WindowMessage
wM_SETCURSOR          =  32
wM_SYSCOMMAND         :: WindowMessage
wM_SYSCOMMAND         =  274
wM_MDICREATE          :: WindowMessage
wM_MDICREATE          =  544
wM_MDIDESTROY         :: WindowMessage
wM_MDIDESTROY         =  545
wM_MDIACTIVATE        :: WindowMessage
wM_MDIACTIVATE        =  546
wM_MDIRESTORE         :: WindowMessage
wM_MDIRESTORE         =  547
wM_MDINEXT            :: WindowMessage
wM_MDINEXT            =  548
wM_MDIMAXIMIZE        :: WindowMessage
wM_MDIMAXIMIZE        =  549
wM_MDITILE            :: WindowMessage
wM_MDITILE            =  550
wM_MDICASCADE         :: WindowMessage
wM_MDICASCADE         =  551
wM_MDIICONARRANGE     :: WindowMessage
wM_MDIICONARRANGE     =  552
wM_MDIGETACTIVE       :: WindowMessage
wM_MDIGETACTIVE       =  553
wM_MDISETMENU         :: WindowMessage
wM_MDISETMENU         =  560
wM_CHILDACTIVATE      :: WindowMessage
wM_CHILDACTIVATE      =  34
wM_INITDIALOG         :: WindowMessage
wM_INITDIALOG         =  272
wM_NEXTDLGCTL         :: WindowMessage
wM_NEXTDLGCTL         =  40
wM_PARENTNOTIFY       :: WindowMessage
wM_PARENTNOTIFY       =  528
wM_ENTERIDLE          :: WindowMessage
wM_ENTERIDLE          =  289
wM_GETDLGCODE         :: WindowMessage
wM_GETDLGCODE         =  135
wM_SETFONT            :: WindowMessage
wM_SETFONT            =  48
wM_GETFONT            :: WindowMessage
wM_GETFONT            =  49
wM_DRAWITEM           :: WindowMessage
wM_DRAWITEM           =  43
wM_MEASUREITEM        :: WindowMessage
wM_MEASUREITEM        =  44
wM_DELETEITEM         :: WindowMessage
wM_DELETEITEM         =  45
wM_COMPAREITEM        :: WindowMessage
wM_COMPAREITEM        =  57
wM_VKEYTOITEM         :: WindowMessage
wM_VKEYTOITEM         =  46
wM_CHARTOITEM         :: WindowMessage
wM_CHARTOITEM         =  47
wM_QUEUESYNC          :: WindowMessage
wM_QUEUESYNC          =  35
wM_USER               :: WindowMessage
wM_USER               =  1024
wM_APP                :: WindowMessage
wM_APP                =  32768

{-# LINE 155 "Graphics\Win32\Message.hsc" #-}

registerWindowMessage :: String -> IO WindowMessage
registerWindowMessage msg =
  withTString msg c_RegisterWindowMessage
foreign import stdcall unsafe "windows.h RegisterWindowMessageW"
  c_RegisterWindowMessage :: LPCTSTR -> IO WindowMessage

-- These are WM_SIZE specific
sIZE_RESTORED         :: WPARAM
sIZE_RESTORED         =  0
sIZE_MINIMIZED        :: WPARAM
sIZE_MINIMIZED        =  1
sIZE_MAXIMIZED        :: WPARAM
sIZE_MAXIMIZED        =  2
sIZE_MAXSHOW          :: WPARAM
sIZE_MAXSHOW          =  3
sIZE_MAXHIDE          :: WPARAM
sIZE_MAXHIDE          =  4

{-# LINE 170 "Graphics\Win32\Message.hsc" #-}

----------------------------------------------------------------
-- Phew!
----------------------------------------------------------------
