{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DUNICODE #-}
{-# INCLUDE <windows.h> #-}
{-# LINE 1 "System\Win32\Mem.hsc" #-}
-----------------------------------------------------------------------------
{-# LINE 2 "System\Win32\Mem.hsc" #-}
-- |
-- Module      :  System.Win32.Mem
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

module System.Win32.Mem where

import System.Win32.Types

import Foreign
import Foreign.C.Types


{-# LINE 23 "System\Win32\Mem.hsc" #-}

copyMemory :: Ptr a -> Ptr a -> DWORD -> IO ()
copyMemory dest src nbytes = copyBytes dest src (fromIntegral nbytes)

moveMemory :: Ptr a -> Ptr a -> DWORD -> IO ()
moveMemory dest src nbytes = moveBytes dest src (fromIntegral nbytes)

fillMemory :: Ptr a -> DWORD -> BYTE -> IO ()
fillMemory dest nbytes val =
  memset dest (fromIntegral val) (fromIntegral nbytes)

zeroMemory :: Ptr a -> DWORD -> IO ()
zeroMemory dest nbytes = memset dest 0 (fromIntegral nbytes)

foreign import ccall unsafe "string.h" memset :: Ptr a -> CInt -> CSize -> IO ()

foreign import stdcall unsafe "windows.h GetProcessHeap"
  getProcessHeap :: IO HANDLE


{-# LINE 43 "System\Win32\Mem.hsc" #-}
foreign import stdcall unsafe "windows.h GetProcessHeaps"
  getProcessHeaps :: DWORD -> Addr -> IO DWORD

{-# LINE 46 "System\Win32\Mem.hsc" #-}

type   HGLOBAL   = Addr

type GlobalAllocFlags = UINT

gMEM_INVALID_HANDLE :: GlobalAllocFlags
gMEM_INVALID_HANDLE = 32768
{-# LINE 53 "System\Win32\Mem.hsc" #-}

gMEM_FIXED            :: GlobalAllocFlags
gMEM_FIXED            =  0
gMEM_MOVEABLE         :: GlobalAllocFlags
gMEM_MOVEABLE         =  2
gPTR                  :: GlobalAllocFlags
gPTR                  =  64
gHND                  :: GlobalAllocFlags
gHND                  =  66
gMEM_DDESHARE         :: GlobalAllocFlags
gMEM_DDESHARE         =  8192
gMEM_SHARE            :: GlobalAllocFlags
gMEM_SHARE            =  8192
gMEM_LOWER            :: GlobalAllocFlags
gMEM_LOWER            =  4096
gMEM_NOCOMPACT        :: GlobalAllocFlags
gMEM_NOCOMPACT        =  16
gMEM_NODISCARD        :: GlobalAllocFlags
gMEM_NODISCARD        =  32
gMEM_NOT_BANKED       :: GlobalAllocFlags
gMEM_NOT_BANKED       =  4096
gMEM_NOTIFY           :: GlobalAllocFlags
gMEM_NOTIFY           =  16384
gMEM_ZEROINIT         :: GlobalAllocFlags
gMEM_ZEROINIT         =  64

{-# LINE 68 "System\Win32\Mem.hsc" #-}

globalAlloc :: GlobalAllocFlags -> DWORD -> IO HGLOBAL
globalAlloc flags size =
  failIfNull "GlobalAlloc" $ c_GlobalAlloc flags size
foreign import stdcall unsafe "windows.h GlobalAlloc"
  c_GlobalAlloc :: GlobalAllocFlags -> DWORD -> IO HGLOBAL

-- %fun GlobalDiscard :: HGLOBAL -> IO HGLOBAL
-- %fail {res1==NULL}{ErrorWin("GlobalDiscard")}

globalFlags :: HGLOBAL -> IO GlobalAllocFlags
globalFlags mem =
  failIf (== gMEM_INVALID_HANDLE) "GlobalFlags" $ c_GlobalFlags mem
foreign import stdcall unsafe "windows.h GlobalFlags"
  c_GlobalFlags :: HGLOBAL -> IO GlobalAllocFlags

globalFree :: HGLOBAL -> IO HGLOBAL
globalFree mem =
  failIfNull "GlobalFree" $ c_GlobalFree mem
foreign import stdcall unsafe "windows.h GlobalFree"
  c_GlobalFree :: HGLOBAL -> IO HGLOBAL

globalHandle :: Addr -> IO HGLOBAL
globalHandle addr =
  failIfNull "GlobalHandle" $ c_GlobalHandle addr
foreign import stdcall unsafe "windows.h GlobalHandle"
  c_GlobalHandle :: Addr -> IO HGLOBAL

globalLock :: HGLOBAL -> IO Addr
globalLock mem =
  failIfNull "GlobalLock" $ c_GlobalLock mem
foreign import stdcall unsafe "windows.h GlobalLock"
  c_GlobalLock :: HGLOBAL -> IO Addr

-- %fun GlobalMemoryStatus :: IO MEMORYSTATUS

globalReAlloc :: HGLOBAL -> DWORD -> GlobalAllocFlags -> IO HGLOBAL
globalReAlloc mem size flags =
  failIfNull "GlobalReAlloc" $ c_GlobalReAlloc mem size flags
foreign import stdcall unsafe "windows.h GlobalReAlloc"
  c_GlobalReAlloc :: HGLOBAL -> DWORD -> GlobalAllocFlags -> IO HGLOBAL

globalSize :: HGLOBAL -> IO DWORD
globalSize mem =
  failIfZero "GlobalSize" $ c_GlobalSize mem
foreign import stdcall unsafe "windows.h GlobalSize"
  c_GlobalSize :: HGLOBAL -> IO DWORD

globalUnlock :: HGLOBAL -> IO ()
globalUnlock mem =
  failIfFalse_ "GlobalUnlock" $ c_GlobalUnlock mem
foreign import stdcall unsafe "windows.h GlobalUnlock"
  c_GlobalUnlock :: HGLOBAL -> IO Bool

type HeapAllocFlags = DWORD

hEAP_GENERATE_EXCEPTIONS	 :: HeapAllocFlags
hEAP_GENERATE_EXCEPTIONS	 =  4
hEAP_NO_SERIALIZE		 :: HeapAllocFlags
hEAP_NO_SERIALIZE		 =  1
hEAP_ZERO_MEMORY		 :: HeapAllocFlags
hEAP_ZERO_MEMORY		 =  8

{-# LINE 129 "System\Win32\Mem.hsc" #-}

heapAlloc :: HANDLE -> HeapAllocFlags -> DWORD -> IO Addr
heapAlloc heap flags size =
  failIfNull "HeapAlloc" $ c_HeapAlloc heap flags size
foreign import stdcall unsafe "windows.h HeapAlloc"
  c_HeapAlloc :: HANDLE -> HeapAllocFlags -> DWORD -> IO Addr

heapCompact :: HANDLE -> HeapAllocFlags -> IO UINT
heapCompact heap flags =
  failIfZero "HeapCompact" $ c_HeapCompact heap flags
foreign import stdcall unsafe "windows.h HeapCompact"
  c_HeapCompact :: HANDLE -> HeapAllocFlags -> IO UINT

heapCreate :: HeapAllocFlags -> DWORD -> DWORD -> IO HANDLE
heapCreate flags initSize maxSize =
  failIfNull "HeapCreate" $ c_HeapCreate flags initSize maxSize
foreign import stdcall unsafe "windows.h HeapCreate"
  c_HeapCreate :: HeapAllocFlags -> DWORD -> DWORD -> IO HANDLE

heapDestroy :: HANDLE -> IO ()
heapDestroy heap =
  failIfFalse_ "HeapDestroy" $ c_HeapDestroy heap
foreign import stdcall unsafe "windows.h HeapDestroy"
  c_HeapDestroy :: HANDLE -> IO Bool

heapFree :: HANDLE -> HeapAllocFlags -> Addr -> IO ()
heapFree heap flags addr =
  failIfFalse_ "HeapFree" $ c_HeapFree heap flags addr
foreign import stdcall unsafe "windows.h HeapFree"
  c_HeapFree :: HANDLE -> HeapAllocFlags -> Addr -> IO Bool

heapLock :: HANDLE -> IO ()
heapLock heap =
  failIfFalse_ "HeapLock" $ c_HeapLock heap
foreign import stdcall unsafe "windows.h HeapLock"
  c_HeapLock :: HANDLE -> IO Bool

heapReAlloc :: HANDLE -> HeapAllocFlags -> Addr -> DWORD -> IO Addr
heapReAlloc heap flags addr size =
  failIfNull "HeapReAlloc" $ c_HeapReAlloc heap flags addr size
foreign import stdcall unsafe "windows.h HeapReAlloc"
  c_HeapReAlloc :: HANDLE -> HeapAllocFlags -> Addr -> DWORD -> IO Addr

heapSize :: HANDLE -> HeapAllocFlags -> Addr -> IO DWORD
heapSize heap flags addr =
  failIfZero "HeapSize" $ c_HeapSize heap flags addr
foreign import stdcall unsafe "windows.h HeapSize"
  c_HeapSize :: HANDLE -> HeapAllocFlags -> Addr -> IO DWORD

heapUnlock :: HANDLE -> IO ()
heapUnlock heap =
  failIfFalse_ "HeapUnlock" $ c_HeapUnlock heap
foreign import stdcall unsafe "windows.h HeapUnlock"
  c_HeapUnlock :: HANDLE -> IO Bool

foreign import stdcall unsafe "windows.h HeapValidate"
  heapValidate :: HANDLE -> HeapAllocFlags -> Addr -> IO Bool

type VirtualAllocFlags = DWORD

mEM_COMMIT    :: VirtualAllocFlags
mEM_COMMIT    =  4096
mEM_RESERVE   :: VirtualAllocFlags
mEM_RESERVE   =  8192

{-# LINE 193 "System\Win32\Mem.hsc" #-}

-- % , MEM_TOP_DOWN (not in mingw-20001111 winnt.h)

type ProtectFlags = DWORD

pAGE_READONLY         :: ProtectFlags
pAGE_READONLY         =  2
pAGE_READWRITE        :: ProtectFlags
pAGE_READWRITE        =  4
pAGE_EXECUTE          :: ProtectFlags
pAGE_EXECUTE          =  16
pAGE_EXECUTE_READ     :: ProtectFlags
pAGE_EXECUTE_READ     =  32
pAGE_EXECUTE_READWRITE  :: ProtectFlags
pAGE_EXECUTE_READWRITE  =  64
pAGE_GUARD            :: ProtectFlags
pAGE_GUARD            =  256
pAGE_NOACCESS         :: ProtectFlags
pAGE_NOACCESS         =  1
pAGE_NOCACHE          :: ProtectFlags
pAGE_NOCACHE          =  512

{-# LINE 208 "System\Win32\Mem.hsc" #-}

type FreeFlags = DWORD

mEM_DECOMMIT  :: FreeFlags
mEM_DECOMMIT  =  16384
mEM_RELEASE   :: FreeFlags
mEM_RELEASE   =  32768

{-# LINE 215 "System\Win32\Mem.hsc" #-}

virtualAlloc :: Addr -> DWORD -> VirtualAllocFlags -> ProtectFlags -> IO Addr
virtualAlloc addt size ty flags =
  failIfNull "VirtualAlloc" $ c_VirtualAlloc addt size ty flags
foreign import stdcall unsafe "windows.h VirtualAlloc"
  c_VirtualAlloc :: Addr -> DWORD -> DWORD -> DWORD -> IO Addr

-- %fun VirtualAllocEx :: HANDLE -> Addr -> DWORD -> VirtualAllocFlags -> ProtectFlags ->IO Addr
-- %code extern LPVOID WINAPI VirtualAllocEx(HANDLE,LPVOID,DWORD,DWORD,DWORD);
-- %     LPVOID res1=VirtualAllocEx(arg1,arg2,arg3,arg4,arg5);
-- %fail {res1==NULL}{ErrorWin("VirtualAllocEx")}

virtualFree :: Addr -> DWORD -> FreeFlags -> IO ()
virtualFree addr size flags =
  failIfFalse_ "VirtualFree" $ c_VirtualFree addr size flags
foreign import stdcall unsafe "windows.h VirtualFree"
  c_VirtualFree :: Addr -> DWORD -> FreeFlags -> IO Bool

-- %fun VirtualFreeEx :: HANDLE -> Addr -> DWORD -> FreeFlags -> IO ()
-- %code extern BOOL WINAPI VirtualFreeEx(HANDLE,LPVOID,DWORD,DWORD);
-- %     BOOL res1=VirtualFreeEx(arg1,arg2,arg3,arg4);
-- %fail {res1=0}{ErrorWin("VirtualFreeEx")}

virtualLock :: Addr -> DWORD -> IO ()
virtualLock addr size =
  failIfFalse_ "VirtualLock" $ c_VirtualLock addr size
foreign import stdcall unsafe "windows.h VirtualLock"
  c_VirtualLock :: Addr -> DWORD -> IO Bool

virtualProtect :: Addr -> DWORD -> ProtectFlags -> IO ProtectFlags
virtualProtect addr size new_prot =
  alloca $ \ p_old -> do
  failIfFalse_ "VirtualProtect" $ c_VirtualProtect addr size new_prot p_old
  peek p_old
foreign import stdcall unsafe "windows.h VirtualProtect"
  c_VirtualProtect :: Addr -> DWORD -> DWORD -> Ptr DWORD -> IO Bool

virtualProtectEx :: HANDLE -> Addr -> DWORD -> ProtectFlags -> IO ProtectFlags
virtualProtectEx proc addr size new_prot =
  alloca $ \ p_old -> do
  failIfFalse_ "VirtualProtectEx" $
    c_VirtualProtectEx proc addr size new_prot p_old
  peek p_old
foreign import stdcall unsafe "windows.h VirtualProtectEx"
  c_VirtualProtectEx :: HANDLE -> Addr -> DWORD -> DWORD -> Ptr DWORD -> IO Bool

-- No VirtualQuery..()

virtualUnlock :: Addr -> DWORD -> IO ()
virtualUnlock addr size =
  failIfFalse_ "VirtualUnlock" $ c_VirtualUnlock addr size
foreign import stdcall unsafe "windows.h VirtualUnlock"
  c_VirtualUnlock :: Addr -> DWORD -> IO Bool
