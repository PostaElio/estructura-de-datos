{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DUNICODE #-}
{-# INCLUDE <windows.h> #-}
{-# LINE 1 "Graphics\Win32\Menu.hsc" #-}
-----------------------------------------------------------------------------
{-# LINE 2 "Graphics\Win32\Menu.hsc" #-}
-- |
-- Module      :  Graphics.Win32.Menu
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

module Graphics.Win32.Menu
{-
       (
         MenuName
       , checkMenuItem
       , checkMenuRadioItem
       , createMenu
       , createPopupMenu
       , deleteMenu
       , destroyMenu
       , drawMenuBar
       , enableMenuItem
       , getMenu
       , getMenuDefaultItem
       , getMenuItemCount
       , getMenuItemID
       , getMenuItemInfo
       , getMenuItemRect
       , getMenuState
       , getSubMenu
       , getSystemMenu
       , hiliteMenuItem
       , insertMenuItem
       , isMenu
       , loadMenu
       , menuItemFromPoint
       , setMenu
       , setMenuDefaultItem
       , setMenuItemBitmaps
       , setMenuItemInfo
       , trackPopupMenu
       , trackPopupMenuEx

       , GMDIFlag
       , MenuItem
       , MenuFlag
       , MenuState
       , TrackMenuFlag
       , SystemMenuCommand

         -- Obsolete:
       , appendMenu
       , insertMenu
       , modifyMenu
       , removeMenu

       ) -} where

import Graphics.Win32.GDI.Types
import System.Win32.Types

import Foreign
import Control.Monad (liftM)


{-# LINE 70 "Graphics\Win32\Menu.hsc" #-}

type MenuName = LPCTSTR

checkMenuItem :: HMENU -> MenuItem -> MenuFlag -> IO Bool
checkMenuItem menu item check = do
  rv <- failIf (== -1) "CheckMenuItem" $ c_CheckMenuItem menu item check
  return (rv == mF_CHECKED)
foreign import stdcall unsafe "windows.h CheckMenuItem"
  c_CheckMenuItem :: HMENU -> UINT -> UINT -> IO DWORD

checkMenuRadioItem :: HMENU -> MenuItem -> MenuItem -> MenuItem -> MenuFlag -> IO ()
checkMenuRadioItem menu first_id last_id check flags =
  failIfFalse_ "CheckMenuRadioItem" $
    c_CheckMenuRadioItem menu first_id last_id check flags
foreign import stdcall unsafe "windows.h CheckMenuRadioItem"
  c_CheckMenuRadioItem :: HMENU -> UINT -> UINT -> UINT -> UINT -> IO Bool

createMenu :: IO HMENU
createMenu =
  failIfNull "CreateMenu" $ c_CreateMenu
foreign import stdcall unsafe "windows.h CreateMenu"
  c_CreateMenu :: IO HMENU

createPopupMenu :: IO HMENU
createPopupMenu =
  failIfNull "CreatePopupMenu" $ c_CreatePopupMenu
foreign import stdcall unsafe "windows.h CreatePopupMenu"
  c_CreatePopupMenu :: IO HMENU

drawMenuBar :: HWND -> IO ()
drawMenuBar wnd =
  failIfFalse_ "DrawMenuBar" $ c_DrawMenuBar wnd
foreign import stdcall unsafe "windows.h DrawMenuBar"
  c_DrawMenuBar :: HWND -> IO Bool

type MenuState = MenuFlag

enableMenuItem :: HMENU -> MenuItem -> MenuFlag -> IO MenuState
enableMenuItem menu item flag =
  failIf (== 0xffffffff) "EnableMenuItem" $ c_EnableMenuItem menu item flag
foreign import stdcall unsafe "windows.h EnableMenuItem"
  c_EnableMenuItem :: HMENU -> UINT -> UINT -> IO MenuState

type GMDIFlag = UINT

type MenuFlag = UINT

gMDI_USEDISABLED      :: GMDIFlag
gMDI_USEDISABLED      =  1
gMDI_GOINTOPOPUPS     :: GMDIFlag
gMDI_GOINTOPOPUPS     =  2

{-# LINE 121 "Graphics\Win32\Menu.hsc" #-}

mF_BYCOMMAND          :: MenuFlag
mF_BYCOMMAND          =  0
mF_BYPOSITION         :: MenuFlag
mF_BYPOSITION         =  1024
mF_CHECKED            :: MenuFlag
mF_CHECKED            =  8

{-# LINE 127 "Graphics\Win32\Menu.hsc" #-}

type MenuItem = UINT

mF_INSERT             :: MenuItem
mF_INSERT             =  0
mF_CHANGE             :: MenuItem
mF_CHANGE             =  128
mF_APPEND             :: MenuItem
mF_APPEND             =  256
mF_DELETE             :: MenuItem
mF_DELETE             =  512
mF_REMOVE             :: MenuItem
mF_REMOVE             =  4096
mF_USECHECKBITMAPS    :: MenuItem
mF_USECHECKBITMAPS    =  512
mF_POPUP              :: MenuItem
mF_POPUP              =  16
mF_SYSMENU            :: MenuItem
mF_SYSMENU            =  8192
mF_HELP               :: MenuItem
mF_HELP               =  16384
mF_MOUSESELECT        :: MenuItem
mF_MOUSESELECT        =  32768
mF_END                :: MenuItem
mF_END                =  128

{-# LINE 143 "Graphics\Win32\Menu.hsc" #-}

mFT_STRING            :: MenuFlag
mFT_STRING            =  0
mFT_BITMAP            :: MenuFlag
mFT_BITMAP            =  4
mFT_MENUBARBREAK      :: MenuFlag
mFT_MENUBARBREAK      =  32
mFT_MENUBREAK         :: MenuFlag
mFT_MENUBREAK         =  64
mFT_OWNERDRAW         :: MenuFlag
mFT_OWNERDRAW         =  256
mFT_RADIOCHECK        :: MenuFlag
mFT_RADIOCHECK        =  512
mFT_SEPARATOR         :: MenuFlag
mFT_SEPARATOR         =  2048
mFT_RIGHTORDER        :: MenuFlag
mFT_RIGHTORDER        =  8192
mFT_RIGHTJUSTIFY      :: MenuFlag
mFT_RIGHTJUSTIFY      =  16384

{-# LINE 155 "Graphics\Win32\Menu.hsc" #-}


mFS_GRAYED            :: MenuState
mFS_GRAYED            =  3
mFS_DISABLED          :: MenuState
mFS_DISABLED          =  3
mFS_CHECKED           :: MenuState
mFS_CHECKED           =  8
mFS_HILITE            :: MenuState
mFS_HILITE            =  128
mFS_ENABLED           :: MenuState
mFS_ENABLED           =  0
mFS_UNCHECKED         :: MenuState
mFS_UNCHECKED         =  0
mFS_UNHILITE          :: MenuState
mFS_UNHILITE          =  0
mFS_DEFAULT           :: MenuState
mFS_DEFAULT           =  4096

{-# LINE 167 "Graphics\Win32\Menu.hsc" #-}

type TrackMenuFlag = UINT

tPM_LEFTBUTTON        :: TrackMenuFlag
tPM_LEFTBUTTON        =  0
tPM_RIGHTBUTTON       :: TrackMenuFlag
tPM_RIGHTBUTTON       =  2
tPM_LEFTALIGN         :: TrackMenuFlag
tPM_LEFTALIGN         =  0
tPM_CENTERALIGN       :: TrackMenuFlag
tPM_CENTERALIGN       =  4
tPM_RIGHTALIGN        :: TrackMenuFlag
tPM_RIGHTALIGN        =  8
tPM_TOPALIGN          :: TrackMenuFlag
tPM_TOPALIGN          =  0
tPM_VCENTERALIGN      :: TrackMenuFlag
tPM_VCENTERALIGN      =  16
tPM_BOTTOMALIGN       :: TrackMenuFlag
tPM_BOTTOMALIGN       =  32
tPM_HORIZONTAL        :: TrackMenuFlag
tPM_HORIZONTAL        =  0
tPM_VERTICAL          :: TrackMenuFlag
tPM_VERTICAL          =  64
tPM_NONOTIFY          :: TrackMenuFlag
tPM_NONOTIFY          =  128
tPM_RETURNCMD         :: TrackMenuFlag
tPM_RETURNCMD         =  256

{-# LINE 184 "Graphics\Win32\Menu.hsc" #-}

type SystemMenuCommand = UINT

sC_SIZE               :: SystemMenuCommand
sC_SIZE               =  61440
sC_MOVE               :: SystemMenuCommand
sC_MOVE               =  61456
sC_MINIMIZE           :: SystemMenuCommand
sC_MINIMIZE           =  61472
sC_MAXIMIZE           :: SystemMenuCommand
sC_MAXIMIZE           =  61488
sC_NEXTWINDOW         :: SystemMenuCommand
sC_NEXTWINDOW         =  61504
sC_PREVWINDOW         :: SystemMenuCommand
sC_PREVWINDOW         =  61520
sC_CLOSE              :: SystemMenuCommand
sC_CLOSE              =  61536
sC_VSCROLL            :: SystemMenuCommand
sC_VSCROLL            =  61552
sC_HSCROLL            :: SystemMenuCommand
sC_HSCROLL            =  61568
sC_MOUSEMENU          :: SystemMenuCommand
sC_MOUSEMENU          =  61584
sC_KEYMENU            :: SystemMenuCommand
sC_KEYMENU            =  61696
sC_ARRANGE            :: SystemMenuCommand
sC_ARRANGE            =  61712
sC_RESTORE            :: SystemMenuCommand
sC_RESTORE            =  61728
sC_TASKLIST           :: SystemMenuCommand
sC_TASKLIST           =  61744
sC_SCREENSAVE         :: SystemMenuCommand
sC_SCREENSAVE         =  61760
sC_HOTKEY             :: SystemMenuCommand
sC_HOTKEY             =  61776
sC_DEFAULT            :: SystemMenuCommand
sC_DEFAULT            =  61792
sC_MONITORPOWER       :: SystemMenuCommand
sC_MONITORPOWER       =  61808
sC_CONTEXTHELP        :: SystemMenuCommand
sC_CONTEXTHELP        =  61824
sC_SEPARATOR          :: SystemMenuCommand
sC_SEPARATOR          =  61455

{-# LINE 209 "Graphics\Win32\Menu.hsc" #-}

foreign import stdcall unsafe "windows.h IsMenu" isMenu :: HMENU -> IO Bool

getSystemMenu :: HWND  -> Bool ->     IO (Maybe HMENU)
getSystemMenu wnd revert =
  liftM ptrToMaybe $ c_GetSystemMenu wnd revert
foreign import stdcall unsafe "windows.h GetSystemMenu"
  c_GetSystemMenu :: HWND  -> Bool ->     IO HMENU

getMenu :: HWND  ->             IO (Maybe HMENU)
getMenu wnd =
  liftM ptrToMaybe $ c_GetMenu wnd
foreign import stdcall unsafe "windows.h GetMenu"
  c_GetMenu :: HWND  ->             IO HMENU

getMenuDefaultItem :: HMENU -> Bool -> GMDIFlag -> IO MenuItem
getMenuDefaultItem menu bypos flags =
  failIf (== -1) "GetMenuDefaultItem" $ c_GetMenuDefaultItem menu bypos flags
foreign import stdcall unsafe "windows.h GetMenuDefaultItem"
  c_GetMenuDefaultItem :: HMENU -> Bool -> UINT -> IO UINT

getMenuState :: HMENU -> MenuItem -> MenuFlag -> IO MenuState
getMenuState menu item flags =
  failIf (== -1) "GetMenuState" $ c_GetMenuState menu item flags
foreign import stdcall unsafe "windows.h GetMenuState"
  c_GetMenuState :: HMENU -> UINT -> UINT -> IO MenuState

getSubMenu :: HMENU -> MenuItem -> IO (Maybe HMENU)
getSubMenu menu pos =
  liftM ptrToMaybe $ c_GetSubMenu menu pos
foreign import stdcall unsafe "windows.h GetSubMenu"
  c_GetSubMenu :: HMENU -> UINT -> IO HMENU

setMenu :: HWND -> HMENU -> IO ()
setMenu wnd menu =
  failIfFalse_ "SetMenu" $ c_SetMenu wnd menu
foreign import stdcall unsafe "windows.h SetMenu"
  c_SetMenu :: HWND -> HMENU -> IO Bool

getMenuItemCount :: HMENU -> IO Int
getMenuItemCount menu =
  failIf (== -1) "GetMenuItemCount" $ c_GetMenuItemCount menu
foreign import stdcall unsafe "windows.h GetMenuItemCount"
  c_GetMenuItemCount :: HMENU -> IO Int

type MenuID = UINT

getMenuItemID :: HMENU -> MenuItem -> IO MenuID
getMenuItemID menu item =
  failIf (== -1) "GetMenuItemID" $ c_GetMenuItemID menu item
foreign import stdcall unsafe "windows.h GetMenuItemID"
  c_GetMenuItemID :: HMENU -> UINT -> IO MenuID

data MenuItemInfo
 = MenuItemInfo  {
      menuItemType    :: MenuFlag,
      menuItemState   :: MenuState,
      menuItemID      :: UINT,
      menuItemSubMenu :: HMENU,
      menuItemBitmapChecked :: HBITMAP,
      menuItemBitmapUnchecked :: HBITMAP,
      menuItemData    :: DWORD,
      menuItemTypeData :: String
   }

-- Don't make this an instance of Storable, because poke isn't what we want.

peekMenuItemInfo :: Ptr MenuItemInfo -> IO MenuItemInfo
peekMenuItemInfo p = do
  itemType <- (\hsc_ptr -> peekByteOff hsc_ptr 8) p
{-# LINE 279 "Graphics\Win32\Menu.hsc" #-}
  itemState <- (\hsc_ptr -> peekByteOff hsc_ptr 12) p
{-# LINE 280 "Graphics\Win32\Menu.hsc" #-}
  itemID <- (\hsc_ptr -> peekByteOff hsc_ptr 16) p
{-# LINE 281 "Graphics\Win32\Menu.hsc" #-}
  itemSubMenu <- (\hsc_ptr -> peekByteOff hsc_ptr 20) p
{-# LINE 282 "Graphics\Win32\Menu.hsc" #-}
  itemBitmapChecked <- (\hsc_ptr -> peekByteOff hsc_ptr 24) p
{-# LINE 283 "Graphics\Win32\Menu.hsc" #-}
  itemBitmapUnchecked <- (\hsc_ptr -> peekByteOff hsc_ptr 28) p
{-# LINE 284 "Graphics\Win32\Menu.hsc" #-}
  itemData <- (\hsc_ptr -> peekByteOff hsc_ptr 32) p
{-# LINE 285 "Graphics\Win32\Menu.hsc" #-}
  nchars <- (\hsc_ptr -> peekByteOff hsc_ptr 40) p
{-# LINE 286 "Graphics\Win32\Menu.hsc" #-}
  c_str <- (\hsc_ptr -> peekByteOff hsc_ptr 36) p
{-# LINE 287 "Graphics\Win32\Menu.hsc" #-}
  itemTypeData <- peekTStringLen (c_str, fromIntegral (nchars::UINT))
  return MenuItemInfo
    { menuItemType = itemType
    , menuItemState = itemState
    , menuItemID = itemID
    , menuItemSubMenu = itemSubMenu
    , menuItemBitmapChecked = itemBitmapChecked
    , menuItemBitmapUnchecked = itemBitmapUnchecked
    , menuItemData = itemData
    , menuItemTypeData = itemTypeData
    }

allocaMenuItemInfo :: (Ptr MenuItemInfo -> IO a) -> IO a
allocaMenuItemInfo f =
  let size = (44) in
{-# LINE 302 "Graphics\Win32\Menu.hsc" #-}
  allocaBytes size $ \ p -> do
  (\hsc_ptr -> pokeByteOff hsc_ptr 0) p (fromIntegral size::DWORD)
{-# LINE 304 "Graphics\Win32\Menu.hsc" #-}
  f p

withMenuItemInfo :: MenuItemInfo -> (Ptr MenuItemInfo -> IO a) -> IO a
withMenuItemInfo info f =
  allocaMenuItemInfo $ \ p ->
  withTStringLen (menuItemTypeData info) $ \ (c_str, nchars) -> do
  (\hsc_ptr -> pokeByteOff hsc_ptr 8) p (menuItemType info)
{-# LINE 311 "Graphics\Win32\Menu.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 12) p (menuItemState info)
{-# LINE 312 "Graphics\Win32\Menu.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 16) p (menuItemID info)
{-# LINE 313 "Graphics\Win32\Menu.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 20) p (menuItemSubMenu info)
{-# LINE 314 "Graphics\Win32\Menu.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 24) p (menuItemBitmapChecked info)
{-# LINE 315 "Graphics\Win32\Menu.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 28) p (menuItemBitmapUnchecked info)
{-# LINE 316 "Graphics\Win32\Menu.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 32) p c_str
{-# LINE 317 "Graphics\Win32\Menu.hsc" #-}
  (\hsc_ptr -> pokeByteOff hsc_ptr 40) p (fromIntegral nchars::UINT)
{-# LINE 318 "Graphics\Win32\Menu.hsc" #-}
  f p

type MenuItemMask = UINT

mIIM_CHECKMARKS       :: MenuItemMask
mIIM_CHECKMARKS       =  8
mIIM_DATA             :: MenuItemMask
mIIM_DATA             =  32
mIIM_ID               :: MenuItemMask
mIIM_ID               =  2
mIIM_STATE            :: MenuItemMask
mIIM_STATE            =  1
mIIM_SUBMENU          :: MenuItemMask
mIIM_SUBMENU          =  4
mIIM_TYPE             :: MenuItemMask
mIIM_TYPE             =  16

{-# LINE 330 "Graphics\Win32\Menu.hsc" #-}

pokeFMask :: Ptr MenuItemInfo -> MenuItemMask -> IO ()
pokeFMask p_info mask =
  (\hsc_ptr -> pokeByteOff hsc_ptr 4) p_info mask
{-# LINE 334 "Graphics\Win32\Menu.hsc" #-}

getMenuItemInfo :: HMENU -> MenuItem -> Bool -> MenuItemMask -> IO MenuItemInfo
getMenuItemInfo menu item bypos mask =
  allocaMenuItemInfo $ \ p_info -> do
  pokeFMask p_info mask
  failIfFalse_ "GetMenuItemInfo" $ c_GetMenuItemInfo menu item bypos p_info
  peekMenuItemInfo p_info
foreign import stdcall unsafe "windows.h GetMenuItemInfoW"
  c_GetMenuItemInfo :: HMENU -> UINT -> Bool -> Ptr MenuItemInfo -> IO Bool

getMenuItemRect :: HWND -> HMENU -> MenuItem -> IO RECT
getMenuItemRect wnd menu item =
  allocaRECT $ \ p_rect -> do
  failIfFalse_ "GetMenuItemRect" $ c_GetMenuItemRect wnd menu item p_rect
  peekRECT p_rect
foreign import stdcall unsafe "windows.h GetMenuItemRect"
  c_GetMenuItemRect :: HWND -> HMENU -> UINT -> LPRECT -> IO Bool

foreign import stdcall unsafe "windows.h HiliteMenuItem"
  hiliteMenuItem :: HWND  -> HMENU -> MenuItem -> MenuFlag -> IO Bool

insertMenuItem :: HMENU -> MenuItem -> Bool -> MenuItemInfo -> IO ()
insertMenuItem menu item bypos info =
  withMenuItemInfo info $ \ p_info ->
  failIfFalse_ "InsertMenuItem" $ c_InsertMenuItem menu item bypos p_info
foreign import stdcall unsafe "windows.h InsertMenuItemW"
  c_InsertMenuItem :: HMENU -> UINT -> Bool -> Ptr MenuItemInfo -> IO Bool

type Menu = LPCTSTR
-- intToMenu :: Int -> Menu
-- intToMenu i = makeIntResource (toWord i)

loadMenu :: Maybe HINSTANCE -> Menu -> IO HMENU
loadMenu mb_inst menu =
  failIfNull "LoadMenu" $ c_LoadMenu (maybePtr mb_inst) menu
foreign import stdcall unsafe "windows.h LoadMenuW"
  c_LoadMenu :: HINSTANCE -> Menu -> IO HMENU

-- Dealing with mappings to/from structs is a pain in GC,
-- so we'll leave this one out for now.
-- %fun LoadMenuIndirect :: MenuTemplate -> IO HMENU

-- Can't pass structs with current FFI, so use a C wrapper (from Types)
menuItemFromPoint :: HWND -> HMENU -> POINT -> IO UINT
menuItemFromPoint wnd menu pt =
  withPOINT pt $ \ p_pt ->
  prim_MenuItemFromPoint wnd menu p_pt

setMenuDefaultItem :: HMENU -> MenuItem -> Bool -> IO ()
setMenuDefaultItem menu item bypos =
  failIfFalse_ "SetMenuDefaultItem" $ c_SetMenuDefaultItem menu item bypos
foreign import stdcall unsafe "windows.h SetMenuDefaultItem"
  c_SetMenuDefaultItem :: HMENU -> MenuItem -> Bool -> IO Bool

setMenuItemBitmaps :: HMENU -> MenuItem -> MenuFlag -> HBITMAP -> HBITMAP -> IO ()
setMenuItemBitmaps menu pos flags bm_unchecked bm_checked =
  failIfFalse_ "SetMenuItemBitmaps" $
    c_SetMenuItemBitmaps menu pos flags bm_unchecked bm_checked
foreign import stdcall unsafe "windows.h SetMenuItemBitmaps"
  c_SetMenuItemBitmaps :: HMENU -> UINT -> UINT -> HBITMAP -> HBITMAP -> IO Bool

destroyMenu :: HMENU -> IO ()
destroyMenu menu =
  failIfFalse_ "DestroyMenu" $ c_DestroyMenu menu
foreign import stdcall unsafe "windows.h DestroyMenu"
  c_DestroyMenu :: HMENU -> IO Bool

deleteMenu :: HMENU -> MenuItem -> MenuFlag -> IO ()
deleteMenu menu item flag =
  failIfFalse_ "DeleteMenu" $ c_DeleteMenu menu item flag
foreign import stdcall unsafe "windows.h DeleteMenu"
  c_DeleteMenu :: HMENU -> UINT -> UINT -> IO Bool

setMenuItemInfo :: HMENU -> MenuItem -> Bool -> MenuItemMask -> MenuItemInfo -> IO ()
setMenuItemInfo menu item bypos mask info =
  withMenuItemInfo info $ \ p_info -> do
  pokeFMask p_info mask
  failIfFalse_ "SetMenuItemInfo" $ c_SetMenuItemInfo menu item bypos p_info
foreign import stdcall unsafe "windows.h SetMenuItemInfoW"
  c_SetMenuItemInfo :: HMENU -> UINT -> Bool -> Ptr MenuItemInfo -> IO Bool

trackPopupMenu :: HMENU -> TrackMenuFlag -> Int -> Int -> HWND -> RECT -> IO ()
trackPopupMenu menu flags x y wnd rect =
  withRECT rect $ \ p_rect ->
  failIfFalse_ "TrackPopupMenu" $ c_TrackPopupMenu menu flags x y 0 wnd p_rect
foreign import stdcall unsafe "windows.h TrackPopupMenu"
  c_TrackPopupMenu :: HMENU -> TrackMenuFlag -> Int -> Int -> Int -> HWND -> LPRECT -> IO Bool

type TPMPARAMS = ()

withTPMPARAMS :: Ptr RECT -> (Ptr TPMPARAMS -> IO a) -> IO a
withTPMPARAMS p_rect f =
  let size = (20) in
{-# LINE 427 "Graphics\Win32\Menu.hsc" #-}
  allocaBytes size $ \ p -> do
  (\hsc_ptr -> pokeByteOff hsc_ptr 0) p (fromIntegral size::UINT)
{-# LINE 429 "Graphics\Win32\Menu.hsc" #-}
  copyBytes ((\hsc_ptr -> hsc_ptr `plusPtr` 4) p) p_rect size
{-# LINE 430 "Graphics\Win32\Menu.hsc" #-}
  f p

trackPopupMenuEx :: HMENU -> TrackMenuFlag -> Int -> Int -> HWND -> Maybe (Ptr RECT) -> IO ()
trackPopupMenuEx menu flags x y wnd mb_p_rect =
  maybeWith withTPMPARAMS mb_p_rect $ \ p_ptmp ->
  failIfFalse_ "TrackPopupMenuEx" $ c_TrackPopupMenuEx menu flags x y wnd p_ptmp
foreign import stdcall unsafe "windows.h TrackPopupMenuEx"
  c_TrackPopupMenuEx :: HMENU -> TrackMenuFlag -> Int -> Int -> HWND -> Ptr TPMPARAMS -> IO Bool

-- Note: these 3 assume the flags don't include MF_BITMAP or MF_OWNERDRAW
-- (which are hidden by this interface)

appendMenu :: HMENU -> MenuFlag -> MenuID -> String -> IO ()
appendMenu menu flags id_item name =
  withTString name $ \ c_name ->
  failIfFalse_ "AppendMenu" $ c_AppendMenu menu flags id_item c_name
foreign import stdcall unsafe "windows.h AppendMenuW"
  c_AppendMenu :: HMENU -> UINT -> MenuID -> LPCTSTR -> IO Bool

insertMenu :: HMENU -> MenuItem -> MenuFlag -> MenuID -> String -> IO ()
insertMenu menu item flags id_item name =
  withTString name $ \ c_name ->
  failIfFalse_ "InsertMenu" $ c_InsertMenu menu item flags id_item c_name
foreign import stdcall unsafe "windows.h InsertMenuW"
  c_InsertMenu :: HMENU -> UINT -> UINT -> MenuID -> LPCTSTR -> IO Bool

modifyMenu :: HMENU -> MenuItem -> MenuFlag -> MenuID -> String -> IO ()
modifyMenu menu item flags id_item name =
  withTString name $ \ c_name ->
  failIfFalse_ "ModifyMenu" $ c_ModifyMenu menu item flags id_item c_name
foreign import stdcall unsafe "windows.h ModifyMenuW"
  c_ModifyMenu :: HMENU -> UINT -> UINT -> MenuID -> LPCTSTR -> IO Bool

removeMenu :: HMENU -> MenuItem -> MenuFlag -> IO ()
removeMenu menu pos flags =
  failIfFalse_ "RemoveMenu" $ c_RemoveMenu menu pos flags
foreign import stdcall unsafe "windows.h RemoveMenu"
  c_RemoveMenu :: HMENU -> UINT -> UINT -> IO Bool

----------------------------------------------------------------
-- End
----------------------------------------------------------------
