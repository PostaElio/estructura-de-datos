{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DUNICODE #-}
{-# INCLUDE <windows.h> #-}
{-# LINE 1 "System\Win32\File.hsc" #-}
-----------------------------------------------------------------------------
{-# LINE 2 "System\Win32\File.hsc" #-}
-- |
-- Module      :  System.Win32.File
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

module System.Win32.File
{-
	( AccessMode, ShareMode, CreateMode, FileAttributeOrFlag
	, CreateFile, CloseHandle, DeleteFile, CopyFile
	, MoveFileFlag, MoveFile, MoveFileEx,
	)
-}
where

import System.Win32.Types
import System.Win32.Time

import Foreign


{-# LINE 30 "System\Win32\File.hsc" #-}

----------------------------------------------------------------
-- Enumeration types
----------------------------------------------------------------

type AccessMode   = UINT

gENERIC_NONE :: AccessMode
gENERIC_NONE = 0

gENERIC_READ              :: AccessMode
gENERIC_READ              =  2147483648
gENERIC_WRITE             :: AccessMode
gENERIC_WRITE             =  1073741824
gENERIC_EXECUTE           :: AccessMode
gENERIC_EXECUTE           =  536870912
gENERIC_ALL               :: AccessMode
gENERIC_ALL               =  268435456
dELETE                    :: AccessMode
dELETE                    =  65536
rEAD_CONTROL              :: AccessMode
rEAD_CONTROL              =  131072
wRITE_DAC                 :: AccessMode
wRITE_DAC                 =  262144
wRITE_OWNER               :: AccessMode
wRITE_OWNER               =  524288
sYNCHRONIZE               :: AccessMode
sYNCHRONIZE               =  1048576
sTANDARD_RIGHTS_REQUIRED  :: AccessMode
sTANDARD_RIGHTS_REQUIRED  =  983040
sTANDARD_RIGHTS_READ      :: AccessMode
sTANDARD_RIGHTS_READ      =  131072
sTANDARD_RIGHTS_WRITE     :: AccessMode
sTANDARD_RIGHTS_WRITE     =  131072
sTANDARD_RIGHTS_EXECUTE   :: AccessMode
sTANDARD_RIGHTS_EXECUTE   =  131072
sTANDARD_RIGHTS_ALL       :: AccessMode
sTANDARD_RIGHTS_ALL       =  2031616
sPECIFIC_RIGHTS_ALL       :: AccessMode
sPECIFIC_RIGHTS_ALL       =  65535
aCCESS_SYSTEM_SECURITY    :: AccessMode
aCCESS_SYSTEM_SECURITY    =  16777216
mAXIMUM_ALLOWED           :: AccessMode
mAXIMUM_ALLOWED           =  33554432

{-# LINE 59 "System\Win32\File.hsc" #-}

----------------------------------------------------------------

type ShareMode   = UINT

fILE_SHARE_NONE :: ShareMode
fILE_SHARE_NONE = 0

fILE_SHARE_READ       :: ShareMode
fILE_SHARE_READ       =  1
fILE_SHARE_WRITE      :: ShareMode
fILE_SHARE_WRITE      =  2

{-# LINE 71 "System\Win32\File.hsc" #-}

----------------------------------------------------------------

type CreateMode   = UINT

cREATE_NEW            :: CreateMode
cREATE_NEW            =  1
cREATE_ALWAYS         :: CreateMode
cREATE_ALWAYS         =  2
oPEN_EXISTING         :: CreateMode
oPEN_EXISTING         =  3
oPEN_ALWAYS           :: CreateMode
oPEN_ALWAYS           =  4
tRUNCATE_EXISTING     :: CreateMode
tRUNCATE_EXISTING     =  5

{-# LINE 83 "System\Win32\File.hsc" #-}

----------------------------------------------------------------

type FileAttributeOrFlag   = UINT

fILE_ATTRIBUTE_READONLY       :: FileAttributeOrFlag
fILE_ATTRIBUTE_READONLY       =  1
fILE_ATTRIBUTE_HIDDEN         :: FileAttributeOrFlag
fILE_ATTRIBUTE_HIDDEN         =  2
fILE_ATTRIBUTE_SYSTEM         :: FileAttributeOrFlag
fILE_ATTRIBUTE_SYSTEM         =  4
fILE_ATTRIBUTE_DIRECTORY      :: FileAttributeOrFlag
fILE_ATTRIBUTE_DIRECTORY      =  16
fILE_ATTRIBUTE_ARCHIVE        :: FileAttributeOrFlag
fILE_ATTRIBUTE_ARCHIVE        =  32
fILE_ATTRIBUTE_NORMAL         :: FileAttributeOrFlag
fILE_ATTRIBUTE_NORMAL         =  128
fILE_ATTRIBUTE_TEMPORARY      :: FileAttributeOrFlag
fILE_ATTRIBUTE_TEMPORARY      =  256
fILE_ATTRIBUTE_COMPRESSED     :: FileAttributeOrFlag
fILE_ATTRIBUTE_COMPRESSED     =  2048
fILE_FLAG_WRITE_THROUGH       :: FileAttributeOrFlag
fILE_FLAG_WRITE_THROUGH       =  2147483648
fILE_FLAG_OVERLAPPED          :: FileAttributeOrFlag
fILE_FLAG_OVERLAPPED          =  1073741824
fILE_FLAG_NO_BUFFERING        :: FileAttributeOrFlag
fILE_FLAG_NO_BUFFERING        =  536870912
fILE_FLAG_RANDOM_ACCESS       :: FileAttributeOrFlag
fILE_FLAG_RANDOM_ACCESS       =  268435456
fILE_FLAG_SEQUENTIAL_SCAN     :: FileAttributeOrFlag
fILE_FLAG_SEQUENTIAL_SCAN     =  134217728
fILE_FLAG_DELETE_ON_CLOSE     :: FileAttributeOrFlag
fILE_FLAG_DELETE_ON_CLOSE     =  67108864
fILE_FLAG_BACKUP_SEMANTICS    :: FileAttributeOrFlag
fILE_FLAG_BACKUP_SEMANTICS    =  33554432
fILE_FLAG_POSIX_SEMANTICS     :: FileAttributeOrFlag
fILE_FLAG_POSIX_SEMANTICS     =  16777216

{-# LINE 106 "System\Win32\File.hsc" #-}

{-# LINE 107 "System\Win32\File.hsc" #-}
sECURITY_ANONYMOUS            :: FileAttributeOrFlag
sECURITY_ANONYMOUS            =  0
sECURITY_IDENTIFICATION       :: FileAttributeOrFlag
sECURITY_IDENTIFICATION       =  65536
sECURITY_IMPERSONATION        :: FileAttributeOrFlag
sECURITY_IMPERSONATION        =  131072
sECURITY_DELEGATION           :: FileAttributeOrFlag
sECURITY_DELEGATION           =  196608
sECURITY_CONTEXT_TRACKING     :: FileAttributeOrFlag
sECURITY_CONTEXT_TRACKING     =  262144
sECURITY_EFFECTIVE_ONLY       :: FileAttributeOrFlag
sECURITY_EFFECTIVE_ONLY       =  524288
sECURITY_SQOS_PRESENT         :: FileAttributeOrFlag
sECURITY_SQOS_PRESENT         =  1048576
sECURITY_VALID_SQOS_FLAGS     :: FileAttributeOrFlag
sECURITY_VALID_SQOS_FLAGS     =  2031616

{-# LINE 117 "System\Win32\File.hsc" #-}

{-# LINE 118 "System\Win32\File.hsc" #-}

----------------------------------------------------------------

type MoveFileFlag   = DWORD

mOVEFILE_REPLACE_EXISTING	 :: MoveFileFlag
mOVEFILE_REPLACE_EXISTING	 =  1
mOVEFILE_COPY_ALLOWED	 :: MoveFileFlag
mOVEFILE_COPY_ALLOWED	 =  2
mOVEFILE_DELAY_UNTIL_REBOOT	 :: MoveFileFlag
mOVEFILE_DELAY_UNTIL_REBOOT	 =  4

{-# LINE 128 "System\Win32\File.hsc" #-}

----------------------------------------------------------------

type FilePtrDirection   = DWORD

fILE_BEGIN    :: FilePtrDirection
fILE_BEGIN    =  0
fILE_CURRENT  :: FilePtrDirection
fILE_CURRENT  =  1
fILE_END      :: FilePtrDirection
fILE_END      =  2

{-# LINE 138 "System\Win32\File.hsc" #-}

----------------------------------------------------------------

type DriveType = UINT

dRIVE_UNKNOWN         :: DriveType
dRIVE_UNKNOWN         =  0
dRIVE_NO_ROOT_DIR     :: DriveType
dRIVE_NO_ROOT_DIR     =  1
dRIVE_REMOVABLE       :: DriveType
dRIVE_REMOVABLE       =  2
dRIVE_FIXED           :: DriveType
dRIVE_FIXED           =  3
dRIVE_REMOTE          :: DriveType
dRIVE_REMOTE          =  4
dRIVE_CDROM           :: DriveType
dRIVE_CDROM           =  5
dRIVE_RAMDISK         :: DriveType
dRIVE_RAMDISK         =  6

{-# LINE 152 "System\Win32\File.hsc" #-}

----------------------------------------------------------------

type DefineDosDeviceFlags = DWORD

dDD_RAW_TARGET_PATH           :: DefineDosDeviceFlags
dDD_RAW_TARGET_PATH           =  1
dDD_REMOVE_DEFINITION         :: DefineDosDeviceFlags
dDD_REMOVE_DEFINITION         =  2
dDD_EXACT_MATCH_ON_REMOVE     :: DefineDosDeviceFlags
dDD_EXACT_MATCH_ON_REMOVE     =  4

{-# LINE 162 "System\Win32\File.hsc" #-}

----------------------------------------------------------------

type BinaryType = DWORD

sCS_32BIT_BINARY      :: BinaryType
sCS_32BIT_BINARY      =  0
sCS_DOS_BINARY        :: BinaryType
sCS_DOS_BINARY        =  1
sCS_WOW_BINARY        :: BinaryType
sCS_WOW_BINARY        =  2
sCS_PIF_BINARY        :: BinaryType
sCS_PIF_BINARY        =  3
sCS_POSIX_BINARY      :: BinaryType
sCS_POSIX_BINARY      =  4
sCS_OS216_BINARY      :: BinaryType
sCS_OS216_BINARY      =  5

{-# LINE 175 "System\Win32\File.hsc" #-}

----------------------------------------------------------------

type FileNotificationFlag = DWORD

fILE_NOTIFY_CHANGE_FILE_NAME   :: FileNotificationFlag
fILE_NOTIFY_CHANGE_FILE_NAME   =  1
fILE_NOTIFY_CHANGE_DIR_NAME    :: FileNotificationFlag
fILE_NOTIFY_CHANGE_DIR_NAME    =  2
fILE_NOTIFY_CHANGE_ATTRIBUTES  :: FileNotificationFlag
fILE_NOTIFY_CHANGE_ATTRIBUTES  =  4
fILE_NOTIFY_CHANGE_SIZE        :: FileNotificationFlag
fILE_NOTIFY_CHANGE_SIZE        =  8
fILE_NOTIFY_CHANGE_LAST_WRITE  :: FileNotificationFlag
fILE_NOTIFY_CHANGE_LAST_WRITE  =  16
fILE_NOTIFY_CHANGE_SECURITY    :: FileNotificationFlag
fILE_NOTIFY_CHANGE_SECURITY    =  256

{-# LINE 188 "System\Win32\File.hsc" #-}

----------------------------------------------------------------

type FileType = DWORD

fILE_TYPE_UNKNOWN     :: FileType
fILE_TYPE_UNKNOWN     =  0
fILE_TYPE_DISK        :: FileType
fILE_TYPE_DISK        =  1
fILE_TYPE_CHAR        :: FileType
fILE_TYPE_CHAR        =  2
fILE_TYPE_PIPE        :: FileType
fILE_TYPE_PIPE        =  3
fILE_TYPE_REMOTE      :: FileType
fILE_TYPE_REMOTE      =  32768

{-# LINE 200 "System\Win32\File.hsc" #-}

----------------------------------------------------------------

type LPSECURITY_ATTRIBUTES = Ptr ()
type MbLPSECURITY_ATTRIBUTES = Maybe LPSECURITY_ATTRIBUTES

----------------------------------------------------------------
-- Other types
----------------------------------------------------------------

data BY_HANDLE_FILE_INFORMATION = BY_HANDLE_FILE_INFORMATION
    { bhfiFileAttributes :: FileAttributeOrFlag
    , bhfiCreationTime, bhfiLastAccessTime, bhfiLastWriteTime :: FILETIME
    , bhfiVolumeSerialNumber :: DWORD
    , bhfiSize :: DDWORD
    , bhfiNumberOfLinks :: DWORD
    , bhfiFileIndex :: DDWORD
    } deriving (Show)

instance Storable BY_HANDLE_FILE_INFORMATION where
    sizeOf = const ((52))
{-# LINE 221 "System\Win32\File.hsc" #-}
    alignment = sizeOf
    poke buf bhi = do
        ((\hsc_ptr -> pokeByteOff hsc_ptr 0))     buf (bhfiFileAttributes bhi)
{-# LINE 224 "System\Win32\File.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 4))       buf (bhfiCreationTime bhi)
{-# LINE 225 "System\Win32\File.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 12))     buf (bhfiLastAccessTime bhi)
{-# LINE 226 "System\Win32\File.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 20))      buf (bhfiLastWriteTime bhi)
{-# LINE 227 "System\Win32\File.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 28)) buf (bhfiVolumeSerialNumber bhi)
{-# LINE 228 "System\Win32\File.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 32))        buf sizeHi
{-# LINE 229 "System\Win32\File.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 36))         buf sizeLow
{-# LINE 230 "System\Win32\File.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 40))       buf (bhfiNumberOfLinks bhi)
{-# LINE 231 "System\Win32\File.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 44))       buf idxHi
{-# LINE 232 "System\Win32\File.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 48))        buf idxLow
{-# LINE 233 "System\Win32\File.hsc" #-}
        where
            (sizeHi,sizeLow) = ddwordToDwords $ bhfiSize bhi
            (idxHi,idxLow) = ddwordToDwords $ bhfiFileIndex bhi

    peek buf = do
        attr <- ((\hsc_ptr -> peekByteOff hsc_ptr 0))     buf
{-# LINE 239 "System\Win32\File.hsc" #-}
        ctim <- ((\hsc_ptr -> peekByteOff hsc_ptr 4))       buf
{-# LINE 240 "System\Win32\File.hsc" #-}
        lati <- ((\hsc_ptr -> peekByteOff hsc_ptr 12))     buf
{-# LINE 241 "System\Win32\File.hsc" #-}
        lwti <- ((\hsc_ptr -> peekByteOff hsc_ptr 20))      buf
{-# LINE 242 "System\Win32\File.hsc" #-}
        vser <- ((\hsc_ptr -> peekByteOff hsc_ptr 28)) buf
{-# LINE 243 "System\Win32\File.hsc" #-}
        fshi <- ((\hsc_ptr -> peekByteOff hsc_ptr 32))        buf
{-# LINE 244 "System\Win32\File.hsc" #-}
        fslo <- ((\hsc_ptr -> peekByteOff hsc_ptr 36))         buf
{-# LINE 245 "System\Win32\File.hsc" #-}
        link <- ((\hsc_ptr -> peekByteOff hsc_ptr 40))       buf
{-# LINE 246 "System\Win32\File.hsc" #-}
        idhi <- ((\hsc_ptr -> peekByteOff hsc_ptr 44))       buf
{-# LINE 247 "System\Win32\File.hsc" #-}
        idlo <- ((\hsc_ptr -> peekByteOff hsc_ptr 48))        buf
{-# LINE 248 "System\Win32\File.hsc" #-}
        return $ BY_HANDLE_FILE_INFORMATION attr ctim lati lwti vser
            (dwordsToDdword (fshi,fslo)) link (dwordsToDdword (idhi,idlo))

----------------------------------------------------------------
-- File operations
----------------------------------------------------------------

deleteFile :: String -> IO ()
deleteFile name =
  withTString name $ \ c_name ->
  failIfFalse_ "DeleteFile" $ c_DeleteFile c_name
foreign import stdcall unsafe "windows.h DeleteFileW"
  c_DeleteFile :: LPCTSTR -> IO Bool

copyFile :: String -> String -> Bool -> IO ()
copyFile src dest over =
  withTString src $ \ c_src ->
  withTString dest $ \ c_dest ->
  failIfFalse_ "CopyFile" $ c_CopyFile c_src c_dest over
foreign import stdcall unsafe "windows.h CopyFileW"
  c_CopyFile :: LPCTSTR -> LPCTSTR -> Bool -> IO Bool

moveFile :: String -> String -> IO ()
moveFile src dest =
  withTString src $ \ c_src ->
  withTString dest $ \ c_dest ->
  failIfFalse_ "MoveFile" $ c_MoveFile c_src c_dest
foreign import stdcall unsafe "windows.h MoveFileW"
  c_MoveFile :: LPCTSTR -> LPCTSTR -> IO Bool

moveFileEx :: String -> String -> MoveFileFlag -> IO ()
moveFileEx src dest flags =
  withTString src $ \ c_src ->
  withTString dest $ \ c_dest ->
  failIfFalse_ "MoveFileEx" $ c_MoveFileEx c_src c_dest flags
foreign import stdcall unsafe "windows.h MoveFileExW"
  c_MoveFileEx :: LPCTSTR -> LPCTSTR -> MoveFileFlag -> IO Bool

setCurrentDirectory :: String -> IO ()
setCurrentDirectory name =
  withTString name $ \ c_name ->
  failIfFalse_ "SetCurrentDirectory" $ c_SetCurrentDirectory c_name
foreign import stdcall unsafe "windows.h SetCurrentDirectoryW"
  c_SetCurrentDirectory :: LPCTSTR -> IO Bool

createDirectory :: String -> Maybe LPSECURITY_ATTRIBUTES -> IO ()
createDirectory name mb_attr =
  withTString name $ \ c_name ->
  failIfFalse_ "CreateDirectory" $ c_CreateDirectory c_name (maybePtr mb_attr)
foreign import stdcall unsafe "windows.h CreateDirectoryW"
  c_CreateDirectory :: LPCTSTR -> LPSECURITY_ATTRIBUTES -> IO Bool

createDirectoryEx :: String -> String -> Maybe LPSECURITY_ATTRIBUTES -> IO ()
createDirectoryEx template name mb_attr =
  withTString template $ \ c_template ->
  withTString name $ \ c_name ->
  failIfFalse_ "CreateDirectoryEx" $
    c_CreateDirectoryEx c_template c_name (maybePtr mb_attr)
foreign import stdcall unsafe "windows.h CreateDirectoryExW"
  c_CreateDirectoryEx :: LPCTSTR -> LPCTSTR -> LPSECURITY_ATTRIBUTES -> IO Bool

removeDirectory :: String -> IO ()
removeDirectory name =
  withTString name $ \ c_name ->
  failIfFalse_ "RemoveDirectory" $ c_RemoveDirectory c_name
foreign import stdcall unsafe "windows.h RemoveDirectoryW"
  c_RemoveDirectory :: LPCTSTR -> IO Bool

getBinaryType :: String -> IO BinaryType
getBinaryType name =
  withTString name $ \ c_name ->
  alloca $ \ p_btype -> do
  failIfFalse_ "GetBinaryType" $ c_GetBinaryType c_name p_btype
  peek p_btype
foreign import stdcall unsafe "windows.h GetBinaryTypeW"
  c_GetBinaryType :: LPCTSTR -> Ptr DWORD -> IO Bool

----------------------------------------------------------------
-- HANDLE operations
----------------------------------------------------------------

createFile :: String -> AccessMode -> ShareMode -> Maybe LPSECURITY_ATTRIBUTES -> CreateMode -> FileAttributeOrFlag -> Maybe HANDLE -> IO HANDLE
createFile name access share mb_attr mode flag mb_h =
  withTString name $ \ c_name ->
  failIf (==iNVALID_HANDLE_VALUE) "CreateFile" $
    c_CreateFile c_name access share (maybePtr mb_attr) mode flag (maybePtr mb_h)
foreign import stdcall unsafe "windows.h CreateFileW"
  c_CreateFile :: LPCTSTR -> AccessMode -> ShareMode -> LPSECURITY_ATTRIBUTES -> CreateMode -> FileAttributeOrFlag -> HANDLE -> IO HANDLE

closeHandle :: HANDLE -> IO ()
closeHandle h =
  failIfFalse_ "CloseHandle" $ c_CloseHandle h
foreign import stdcall unsafe "windows.h CloseHandle"
  c_CloseHandle :: HANDLE -> IO Bool

foreign import stdcall unsafe "windows.h GetFileType"
  getFileType :: HANDLE -> IO FileType
--Apparently no error code

flushFileBuffers :: HANDLE -> IO ()
flushFileBuffers h =
  failIfFalse_ "FlushFileBuffers" $ c_FlushFileBuffers h
foreign import stdcall unsafe "windows.h FlushFileBuffers"
  c_FlushFileBuffers :: HANDLE -> IO Bool

setEndOfFile :: HANDLE -> IO ()
setEndOfFile h =
  failIfFalse_ "SetEndOfFile" $ c_SetEndOfFile h
foreign import stdcall unsafe "windows.h SetEndOfFile"
  c_SetEndOfFile :: HANDLE -> IO Bool

setFileAttributes :: String -> FileAttributeOrFlag -> IO ()
setFileAttributes name attr =
  withTString name $ \ c_name ->
  failIfFalse_ "SetFileAttributes" $ c_SetFileAttributes c_name attr
foreign import stdcall unsafe "windows.h SetFileAttributesW"
  c_SetFileAttributes :: LPCTSTR -> FileAttributeOrFlag -> IO Bool

getFileAttributes :: String -> IO FileAttributeOrFlag
getFileAttributes name =
  withTString name $ \ c_name ->
  failIf (== 0xFFFFFFFF) "GetFileAttributes" $ c_GetFileAttributes c_name
foreign import stdcall unsafe "windows.h GetFileAttributesW"
  c_GetFileAttributes :: LPCTSTR -> IO FileAttributeOrFlag

getFileInformationByHandle :: HANDLE -> IO BY_HANDLE_FILE_INFORMATION
getFileInformationByHandle h = alloca $ \res -> do
    failIfFalse_ "GetFileInformationByHandle" $ c_GetFileInformationByHandle h res
    peek res
foreign import stdcall unsafe "windows.h GetFileInformationByHandle"
    c_GetFileInformationByHandle :: HANDLE -> Ptr BY_HANDLE_FILE_INFORMATION -> IO BOOL

----------------------------------------------------------------
-- Read/write files
----------------------------------------------------------------

-- No support for this yet
--type OVERLAPPED =
-- (DWORD,  -- Offset
--  DWORD,  -- OffsetHigh
--  HANDLE) -- hEvent

type LPOVERLAPPED = Ptr ()

type MbLPOVERLAPPED = Maybe LPOVERLAPPED

--Sigh - I give up & prefix win32_ to the next two to avoid
-- senseless Prelude name clashes. --sof.

win32_ReadFile :: HANDLE -> Ptr a -> DWORD -> Maybe LPOVERLAPPED -> IO DWORD
win32_ReadFile h buf n mb_over =
  alloca $ \ p_n -> do
  failIfFalse_ "ReadFile" $ c_ReadFile h buf n p_n (maybePtr mb_over)
  peek p_n
foreign import stdcall unsafe "windows.h ReadFile"
  c_ReadFile :: HANDLE -> Ptr a -> DWORD -> Ptr DWORD -> LPOVERLAPPED -> IO Bool

win32_WriteFile :: HANDLE -> Ptr a -> DWORD -> Maybe LPOVERLAPPED -> IO DWORD
win32_WriteFile h buf n mb_over =
  alloca $ \ p_n -> do
  failIfFalse_ "WriteFile" $ c_WriteFile h buf n p_n (maybePtr mb_over)
  peek p_n
foreign import stdcall unsafe "windows.h WriteFile"
  c_WriteFile :: HANDLE -> Ptr a -> DWORD -> Ptr DWORD -> LPOVERLAPPED -> IO Bool

-- missing Seek functioinality; GSL ???
-- Dont have Word64; ADR
-- %fun SetFilePointer :: HANDLE -> Word64 -> FilePtrDirection -> IO Word64

----------------------------------------------------------------
-- File Notifications
--
-- Use these to initialise, "increment" and close a HANDLE you can wait
-- on.
----------------------------------------------------------------

findFirstChangeNotification :: String -> Bool -> FileNotificationFlag -> IO HANDLE
findFirstChangeNotification path watch flag =
  withTString path $ \ c_path ->
  failIfNull "FindFirstChangeNotification" $
    c_FindFirstChangeNotification c_path watch flag
foreign import stdcall unsafe "windows.h FindFirstChangeNotificationW"
  c_FindFirstChangeNotification :: LPCTSTR -> Bool -> FileNotificationFlag -> IO HANDLE

findNextChangeNotification :: HANDLE -> IO ()
findNextChangeNotification h =
  failIfFalse_ "FindNextChangeNotification" $ c_FindNextChangeNotification h
foreign import stdcall unsafe "windows.h FindNextChangeNotification"
  c_FindNextChangeNotification :: HANDLE -> IO Bool

findCloseChangeNotification :: HANDLE -> IO ()
findCloseChangeNotification h =
  failIfFalse_ "FindCloseChangeNotification" $ c_FindCloseChangeNotification h
foreign import stdcall unsafe "windows.h FindCloseChangeNotification"
  c_FindCloseChangeNotification :: HANDLE -> IO Bool

----------------------------------------------------------------
-- DOS Device flags
----------------------------------------------------------------

defineDosDevice :: DefineDosDeviceFlags -> String -> String -> IO ()
defineDosDevice flags name path =
  withTString path $ \ c_path ->
  withTString name $ \ c_name ->
  failIfFalse_ "DefineDosDevice" $ c_DefineDosDevice flags c_name c_path
foreign import stdcall unsafe "windows.h DefineDosDeviceW"
  c_DefineDosDevice :: DefineDosDeviceFlags -> LPCTSTR -> LPCTSTR -> IO Bool

----------------------------------------------------------------

-- These functions are very unusual in the Win32 API:
-- They dont return error codes

foreign import stdcall unsafe "windows.h AreFileApisANSI"
  areFileApisANSI :: IO Bool

foreign import stdcall unsafe "windows.h SetFileApisToOEM"
  setFileApisToOEM :: IO ()

foreign import stdcall unsafe "windows.h SetFileApisToANSI"
  setFileApisToANSI :: IO ()

foreign import stdcall unsafe "windows.h SetHandleCount"
  setHandleCount :: UINT -> IO UINT

----------------------------------------------------------------

getLogicalDrives :: IO DWORD
getLogicalDrives =
  failIfZero "GetLogicalDrives" $ c_GetLogicalDrives
foreign import stdcall unsafe "windows.h GetLogicalDrives"
  c_GetLogicalDrives :: IO DWORD

-- %fun GetDriveType :: Maybe String -> IO DriveType

getDiskFreeSpace :: Maybe String -> IO (DWORD,DWORD,DWORD,DWORD)
getDiskFreeSpace path =
  maybeWith withTString path $ \ c_path ->
  alloca $ \ p_sectors ->
  alloca $ \ p_bytes ->
  alloca $ \ p_nfree ->
  alloca $ \ p_nclusters -> do
  failIfFalse_ "GetDiskFreeSpace" $
    c_GetDiskFreeSpace c_path p_sectors p_bytes p_nfree p_nclusters
  sectors <- peek p_sectors
  bytes <- peek p_bytes
  nfree <- peek p_nfree
  nclusters <- peek p_nclusters
  return (sectors, bytes, nfree, nclusters)
foreign import stdcall unsafe "windows.h GetDiskFreeSpaceW"
  c_GetDiskFreeSpace :: LPCTSTR -> Ptr DWORD -> Ptr DWORD -> Ptr DWORD -> Ptr DWORD -> IO Bool

setVolumeLabel :: String -> String -> IO ()
setVolumeLabel path name =
  withTString path $ \ c_path ->
  withTString name $ \ c_name ->
  failIfFalse_ "SetVolumeLabel" $ c_SetVolumeLabel c_path c_name
foreign import stdcall unsafe "windows.h SetVolumeLabelW"
  c_SetVolumeLabel :: LPCTSTR -> LPCTSTR -> IO Bool

----------------------------------------------------------------
-- End
----------------------------------------------------------------
