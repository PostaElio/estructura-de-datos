{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DUNICODE #-}
{-# INCLUDE <windows.h> #-}
{-# LINE 1 "System\Win32\Info.hsc" #-}
-----------------------------------------------------------------------------
{-# LINE 2 "System\Win32\Info.hsc" #-}
-- |
-- Module      :  System.Win32.Info
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

module System.Win32.Info where

import System.Win32.Types

import Foreign      ( Storable(sizeOf, alignment, peekByteOff, pokeByteOff,
                               peek, poke),
                    , Ptr, alloca )


{-# LINE 24 "System\Win32\Info.hsc" #-}

----------------------------------------------------------------
-- Environment Strings
----------------------------------------------------------------

-- %fun ExpandEnvironmentStrings :: String -> IO String

----------------------------------------------------------------
-- Computer Name
----------------------------------------------------------------

-- %fun GetComputerName :: IO String
-- %fun SetComputerName :: String -> IO ()
-- %end free(arg1)

----------------------------------------------------------------
-- Hardware Profiles
----------------------------------------------------------------

-- %fun GetCurrentHwProfile :: IO HW_PROFILE_INFO

----------------------------------------------------------------
-- Keyboard Type
----------------------------------------------------------------

-- %fun GetKeyboardType :: KeyboardTypeKind -> IO KeyboardType

----------------------------------------------------------------
-- System Color
----------------------------------------------------------------

type SystemColor   = UINT

-- ToDo: This list is out of date.

cOLOR_SCROLLBAR       :: SystemColor
cOLOR_SCROLLBAR       =  0
cOLOR_BACKGROUND      :: SystemColor
cOLOR_BACKGROUND      =  1
cOLOR_ACTIVECAPTION   :: SystemColor
cOLOR_ACTIVECAPTION   =  2
cOLOR_INACTIVECAPTION  :: SystemColor
cOLOR_INACTIVECAPTION  =  3
cOLOR_MENU            :: SystemColor
cOLOR_MENU            =  4
cOLOR_WINDOW          :: SystemColor
cOLOR_WINDOW          =  5
cOLOR_WINDOWFRAME     :: SystemColor
cOLOR_WINDOWFRAME     =  6
cOLOR_MENUTEXT        :: SystemColor
cOLOR_MENUTEXT        =  7
cOLOR_WINDOWTEXT      :: SystemColor
cOLOR_WINDOWTEXT      =  8
cOLOR_CAPTIONTEXT     :: SystemColor
cOLOR_CAPTIONTEXT     =  9
cOLOR_ACTIVEBORDER    :: SystemColor
cOLOR_ACTIVEBORDER    =  10
cOLOR_INACTIVEBORDER  :: SystemColor
cOLOR_INACTIVEBORDER  =  11
cOLOR_APPWORKSPACE    :: SystemColor
cOLOR_APPWORKSPACE    =  12
cOLOR_HIGHLIGHT       :: SystemColor
cOLOR_HIGHLIGHT       =  13
cOLOR_HIGHLIGHTTEXT   :: SystemColor
cOLOR_HIGHLIGHTTEXT   =  14
cOLOR_BTNFACE         :: SystemColor
cOLOR_BTNFACE         =  15
cOLOR_BTNSHADOW       :: SystemColor
cOLOR_BTNSHADOW       =  16
cOLOR_GRAYTEXT        :: SystemColor
cOLOR_GRAYTEXT        =  17
cOLOR_BTNTEXT         :: SystemColor
cOLOR_BTNTEXT         =  18
cOLOR_INACTIVECAPTIONTEXT  :: SystemColor
cOLOR_INACTIVECAPTIONTEXT  =  19
cOLOR_BTNHIGHLIGHT    :: SystemColor
cOLOR_BTNHIGHLIGHT    =  20

{-# LINE 82 "System\Win32\Info.hsc" #-}

-- %fun GetSysColor :: SystemColor -> IO COLORREF
-- %fun SetSysColors :: [(SystemColor,COLORREF)] -> IO ()

----------------------------------------------------------------
-- Standard Directories
----------------------------------------------------------------

-- %fun GetSystemDirectory  :: IO String
-- %fun GetWindowsDirectory :: IO String

----------------------------------------------------------------
-- System Info (Info about processor and memory subsystem)
----------------------------------------------------------------

data ProcessorArchitecture = PaUnknown WORD | PaIntel | PaMips | PaAlpha | PaPpc | PaIa64 | PaIa32OnIa64 | PaAmd64
    deriving (Show,Eq)

instance Storable ProcessorArchitecture where
    sizeOf _ = sizeOf (undefined::WORD)
    alignment _ = alignment (undefined::WORD)
    poke buf pa = pokeByteOff buf 0 $ case pa of
        PaUnknown w -> w
        PaIntel     -> 0
{-# LINE 106 "System\Win32\Info.hsc" #-}
        PaMips      -> 1
{-# LINE 107 "System\Win32\Info.hsc" #-}
        PaAlpha     -> 2
{-# LINE 108 "System\Win32\Info.hsc" #-}
        PaPpc       -> 3
{-# LINE 109 "System\Win32\Info.hsc" #-}
        PaIa64      -> 6
{-# LINE 110 "System\Win32\Info.hsc" #-}

{-# LINE 111 "System\Win32\Info.hsc" #-}
        PaIa32OnIa64 -> 10
{-# LINE 112 "System\Win32\Info.hsc" #-}

{-# LINE 113 "System\Win32\Info.hsc" #-}
        PaAmd64     -> 9
{-# LINE 114 "System\Win32\Info.hsc" #-}
    peek buf = do
        v <- (peekByteOff buf 0:: IO WORD)
        return $ case v of
            (0) -> PaIntel
{-# LINE 118 "System\Win32\Info.hsc" #-}
            (1)  -> PaMips
{-# LINE 119 "System\Win32\Info.hsc" #-}
            (2) -> PaAlpha
{-# LINE 120 "System\Win32\Info.hsc" #-}
            (3)   -> PaPpc
{-# LINE 121 "System\Win32\Info.hsc" #-}
            (6)  -> PaIa64
{-# LINE 122 "System\Win32\Info.hsc" #-}

{-# LINE 123 "System\Win32\Info.hsc" #-}
            (10) -> PaIa32OnIa64
{-# LINE 124 "System\Win32\Info.hsc" #-}

{-# LINE 125 "System\Win32\Info.hsc" #-}
            (9) -> PaAmd64
{-# LINE 126 "System\Win32\Info.hsc" #-}
            w                                   -> PaUnknown w

data SYSTEM_INFO = SYSTEM_INFO
    { siProcessorArchitecture :: ProcessorArchitecture
    , siPageSize :: DWORD
    , siMinimumApplicationAddress, siMaximumApplicationAddress :: LPVOID
    , siActiveProcessorMask :: DWORD
    , siNumberOfProcessors :: DWORD
    , siProcessorType :: DWORD
    , siAllocationGranularity :: DWORD
    , siProcessorLevel :: WORD
    , siProcessorRevision :: WORD
    } deriving (Show)

instance Storable SYSTEM_INFO where
    sizeOf = const (36)
{-# LINE 142 "System\Win32\Info.hsc" #-}
    alignment = sizeOf
    poke buf si = do
        ((\hsc_ptr -> pokeByteOff hsc_ptr 0)) buf (siProcessorArchitecture si)
{-# LINE 145 "System\Win32\Info.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 4))             buf (siPageSize si)
{-# LINE 146 "System\Win32\Info.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 8)) buf (siMinimumApplicationAddress si)
{-# LINE 147 "System\Win32\Info.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 12)) buf (siMaximumApplicationAddress si)
{-# LINE 148 "System\Win32\Info.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 16))  buf (siActiveProcessorMask si)
{-# LINE 149 "System\Win32\Info.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 20))   buf (siNumberOfProcessors si)
{-# LINE 150 "System\Win32\Info.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 24))        buf (siProcessorType si)
{-# LINE 151 "System\Win32\Info.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 28)) buf (siAllocationGranularity si)
{-# LINE 152 "System\Win32\Info.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 32))        buf (siProcessorLevel si)
{-# LINE 153 "System\Win32\Info.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 34))     buf (siProcessorRevision si)
{-# LINE 154 "System\Win32\Info.hsc" #-}

    peek buf = do
        processorArchitecture <-
            ((\hsc_ptr -> peekByteOff hsc_ptr 0)) buf
{-# LINE 158 "System\Win32\Info.hsc" #-}
        pageSize            <- ((\hsc_ptr -> peekByteOff hsc_ptr 4)) buf
{-# LINE 159 "System\Win32\Info.hsc" #-}
        minimumApplicationAddress <-
            ((\hsc_ptr -> peekByteOff hsc_ptr 8)) buf
{-# LINE 161 "System\Win32\Info.hsc" #-}
        maximumApplicationAddress <-
            ((\hsc_ptr -> peekByteOff hsc_ptr 12)) buf
{-# LINE 163 "System\Win32\Info.hsc" #-}
        activeProcessorMask <- ((\hsc_ptr -> peekByteOff hsc_ptr 16)) buf
{-# LINE 164 "System\Win32\Info.hsc" #-}
        numberOfProcessors  <- ((\hsc_ptr -> peekByteOff hsc_ptr 20)) buf
{-# LINE 165 "System\Win32\Info.hsc" #-}
        processorType       <- ((\hsc_ptr -> peekByteOff hsc_ptr 24)) buf
{-# LINE 166 "System\Win32\Info.hsc" #-}
        allocationGranularity <-
            ((\hsc_ptr -> peekByteOff hsc_ptr 28)) buf
{-# LINE 168 "System\Win32\Info.hsc" #-}
        processorLevel      <- ((\hsc_ptr -> peekByteOff hsc_ptr 32)) buf
{-# LINE 169 "System\Win32\Info.hsc" #-}
        processorRevision   <- ((\hsc_ptr -> peekByteOff hsc_ptr 34)) buf
{-# LINE 170 "System\Win32\Info.hsc" #-}
        return $ SYSTEM_INFO {
            siProcessorArchitecture     = processorArchitecture,
            siPageSize                  = pageSize,
            siMinimumApplicationAddress = minimumApplicationAddress,
            siMaximumApplicationAddress = maximumApplicationAddress,
            siActiveProcessorMask       = activeProcessorMask,
            siNumberOfProcessors        = numberOfProcessors,
            siProcessorType             = processorType,
            siAllocationGranularity     = allocationGranularity,
            siProcessorLevel            = processorLevel,
            siProcessorRevision         = processorRevision
            }

foreign import stdcall unsafe "windows.h GetSystemInfo"
    c_GetSystemInfo :: Ptr SYSTEM_INFO -> IO ()

getSystemInfo :: IO SYSTEM_INFO
getSystemInfo = alloca $ \ret -> do
    c_GetSystemInfo ret
    peek ret

----------------------------------------------------------------
-- System metrics
----------------------------------------------------------------

type SMSetting = UINT

sM_ARRANGE            :: SMSetting
sM_ARRANGE            =  56
sM_CLEANBOOT          :: SMSetting
sM_CLEANBOOT          =  67
sM_CMETRICS           :: SMSetting
sM_CMETRICS           =  88
sM_CMOUSEBUTTONS      :: SMSetting
sM_CMOUSEBUTTONS      =  43
sM_CXBORDER           :: SMSetting
sM_CXBORDER           =  5
sM_CYBORDER           :: SMSetting
sM_CYBORDER           =  6
sM_CXCURSOR           :: SMSetting
sM_CXCURSOR           =  13
sM_CYCURSOR           :: SMSetting
sM_CYCURSOR           =  14
sM_CXDLGFRAME         :: SMSetting
sM_CXDLGFRAME         =  7
sM_CYDLGFRAME         :: SMSetting
sM_CYDLGFRAME         =  8
sM_CXDOUBLECLK        :: SMSetting
sM_CXDOUBLECLK        =  36
sM_CYDOUBLECLK        :: SMSetting
sM_CYDOUBLECLK        =  37
sM_CXDRAG             :: SMSetting
sM_CXDRAG             =  68
sM_CYDRAG             :: SMSetting
sM_CYDRAG             =  69
sM_CXEDGE             :: SMSetting
sM_CXEDGE             =  45
sM_CYEDGE             :: SMSetting
sM_CYEDGE             =  46
sM_CXFRAME            :: SMSetting
sM_CXFRAME            =  32
sM_CYFRAME            :: SMSetting
sM_CYFRAME            =  33
sM_CXFULLSCREEN       :: SMSetting
sM_CXFULLSCREEN       =  16
sM_CYFULLSCREEN       :: SMSetting
sM_CYFULLSCREEN       =  17
sM_CXHSCROLL          :: SMSetting
sM_CXHSCROLL          =  21
sM_CYVSCROLL          :: SMSetting
sM_CYVSCROLL          =  20
sM_CXICON             :: SMSetting
sM_CXICON             =  11
sM_CYICON             :: SMSetting
sM_CYICON             =  12
sM_CXICONSPACING      :: SMSetting
sM_CXICONSPACING      =  38
sM_CYICONSPACING      :: SMSetting
sM_CYICONSPACING      =  39
sM_CXMAXIMIZED        :: SMSetting
sM_CXMAXIMIZED        =  61
sM_CYMAXIMIZED        :: SMSetting
sM_CYMAXIMIZED        =  62
sM_CXMENUCHECK        :: SMSetting
sM_CXMENUCHECK        =  71
sM_CYMENUCHECK        :: SMSetting
sM_CYMENUCHECK        =  72
sM_CXMENUSIZE         :: SMSetting
sM_CXMENUSIZE         =  54
sM_CYMENUSIZE         :: SMSetting
sM_CYMENUSIZE         =  55
sM_CXMIN              :: SMSetting
sM_CXMIN              =  28
sM_CYMIN              :: SMSetting
sM_CYMIN              =  29
sM_CXMINIMIZED        :: SMSetting
sM_CXMINIMIZED        =  57
sM_CYMINIMIZED        :: SMSetting
sM_CYMINIMIZED        =  58
sM_CXMINTRACK         :: SMSetting
sM_CXMINTRACK         =  34
sM_CYMINTRACK         :: SMSetting
sM_CYMINTRACK         =  35
sM_CXSCREEN           :: SMSetting
sM_CXSCREEN           =  0
sM_CYSCREEN           :: SMSetting
sM_CYSCREEN           =  1
sM_CXSIZE             :: SMSetting
sM_CXSIZE             =  30
sM_CYSIZE             :: SMSetting
sM_CYSIZE             =  31
sM_CXSIZEFRAME        :: SMSetting
sM_CXSIZEFRAME        =  32
sM_CYSIZEFRAME        :: SMSetting
sM_CYSIZEFRAME        =  33
sM_CXSMICON           :: SMSetting
sM_CXSMICON           =  49
sM_CYSMICON           :: SMSetting
sM_CYSMICON           =  50
sM_CXSMSIZE           :: SMSetting
sM_CXSMSIZE           =  52
sM_CYSMSIZE           :: SMSetting
sM_CYSMSIZE           =  53
sM_CXVSCROLL          :: SMSetting
sM_CXVSCROLL          =  2
sM_CYHSCROLL          :: SMSetting
sM_CYHSCROLL          =  3
sM_CYVTHUMB           :: SMSetting
sM_CYVTHUMB           =  9
sM_CYCAPTION          :: SMSetting
sM_CYCAPTION          =  4
sM_CYKANJIWINDOW      :: SMSetting
sM_CYKANJIWINDOW      =  18
sM_CYMENU             :: SMSetting
sM_CYMENU             =  15
sM_CYSMCAPTION        :: SMSetting
sM_CYSMCAPTION        =  51
sM_DBCSENABLED        :: SMSetting
sM_DBCSENABLED        =  42
sM_DEBUG              :: SMSetting
sM_DEBUG              =  22
sM_MENUDROPALIGNMENT  :: SMSetting
sM_MENUDROPALIGNMENT  =  40
sM_MIDEASTENABLED     :: SMSetting
sM_MIDEASTENABLED     =  74
sM_MOUSEPRESENT       :: SMSetting
sM_MOUSEPRESENT       =  19
sM_NETWORK            :: SMSetting
sM_NETWORK            =  63
sM_PENWINDOWS         :: SMSetting
sM_PENWINDOWS         =  41
sM_SECURE             :: SMSetting
sM_SECURE             =  44
sM_SHOWSOUNDS         :: SMSetting
sM_SHOWSOUNDS         =  70
sM_SLOWMACHINE        :: SMSetting
sM_SLOWMACHINE        =  73
sM_SWAPBUTTON         :: SMSetting
sM_SWAPBUTTON         =  23

{-# LINE 265 "System\Win32\Info.hsc" #-}

-- %fun GetSystemMetrics :: SMSetting -> IO Int

----------------------------------------------------------------
-- Thread Desktops
----------------------------------------------------------------

-- %fun GetThreadDesktop :: ThreadId -> IO HDESK
-- %fun SetThreadDesktop :: ThreadId -> HDESK -> IO ()

----------------------------------------------------------------
-- User name
----------------------------------------------------------------

-- %fun GetUserName :: IO String

----------------------------------------------------------------
-- Version Info
----------------------------------------------------------------

-- %fun GetVersionEx :: IO VersionInfo
--
-- typedef struct _OSVERSIONINFO{
--     DWORD dwOSVersionInfoSize;
--     DWORD dwMajorVersion;
--     DWORD dwMinorVersion;
--     DWORD dwBuildNumber;
--     DWORD dwPlatformId;
--     TCHAR szCSDVersion[ 128 ];
-- } OSVERSIONINFO;

----------------------------------------------------------------
-- Processor features
----------------------------------------------------------------

--
-- Including these lines causes problems on Win95
-- %fun IsProcessorFeaturePresent :: ProcessorFeature -> Bool
--
-- type ProcessorFeature   = DWORD
-- %dis processorFeature x = dWORD x
--
-- %const ProcessorFeature
-- % [ PF_FLOATING_POINT_PRECISION_ERRATA
-- % , PF_FLOATING_POINT_EMULATED
-- % , PF_COMPARE_EXCHANGE_DOUBLE
-- % , PF_MMX_INSTRUCTIONS_AVAILABLE
-- % ]

----------------------------------------------------------------
-- System Parameter Information
----------------------------------------------------------------

-- %fun SystemParametersInfo :: ?? -> Bool -> IO ??

----------------------------------------------------------------
-- End
----------------------------------------------------------------
