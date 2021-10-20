{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DUNICODE #-}
{-# INCLUDE "windows.h" #-}
{-# LINE 1 "System\Win32\Time.hsc" #-}
module System.Win32.Time where
{-# LINE 2 "System\Win32\Time.hsc" #-}

import System.Win32.Types   ( DWORD, WORD, LONG, BOOL, failIf, failIf_, HANDLE
                            , peekTStringLen, LCID, LPTSTR, LPCTSTR, DDWORD
                            , LARGE_INTEGER, ddwordToDwords, dwordsToDdword )

import Control.Monad    ( when, liftM3, liftM )
import Data.Word        ( Word8 )
import Foreign          ( Storable(sizeOf, alignment, peekByteOff, peek,
                                   pokeByteOff, poke)
                        , Ptr, nullPtr, castPtr, plusPtr, advancePtr
                        , with, alloca, allocaBytes, copyArray )
import Foreign.C        ( CInt, CWchar
                        , peekCWString, withCWStringLen, withCWString )


{-# LINE 17 "System\Win32\Time.hsc" #-}

----------------------------------------------------------------
-- data types
----------------------------------------------------------------

newtype FILETIME = FILETIME DDWORD deriving (Show, Eq, Ord)

data SYSTEMTIME = SYSTEMTIME {
    wYear, wMonth, wDayOfWeek, wDay, wHour, wMinute, wSecond, wMilliseconds :: WORD }
    deriving (Show, Eq, Ord)

data TIME_ZONE_INFORMATION = TIME_ZONE_INFORMATION
    { tziBias :: LONG
    , tziStandardName :: String
    , tziStandardDate :: SYSTEMTIME
    , tziStandardBias :: LONG
    , tziDaylightName :: String
    , tziDaylightDate :: SYSTEMTIME
    , tziDaylightBias :: LONG
    } deriving (Show,Eq,Ord)

data TimeZoneId = TzIdUnknown | TzIdStandard | TzIdDaylight
    deriving (Show, Eq, Ord)

----------------------------------------------------------------
-- Instances
----------------------------------------------------------------

instance Storable FILETIME where
    sizeOf = const ((8))
{-# LINE 47 "System\Win32\Time.hsc" #-}
    alignment = sizeOf
    poke buf (FILETIME n) = do
        ((\hsc_ptr -> pokeByteOff hsc_ptr 0)) buf low
{-# LINE 50 "System\Win32\Time.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 4)) buf hi
{-# LINE 51 "System\Win32\Time.hsc" #-}
        where (hi,low) = ddwordToDwords n
    peek buf = do
        low <- ((\hsc_ptr -> peekByteOff hsc_ptr 0)) buf
{-# LINE 54 "System\Win32\Time.hsc" #-}
        hi <- ((\hsc_ptr -> peekByteOff hsc_ptr 4)) buf
{-# LINE 55 "System\Win32\Time.hsc" #-}
        return $ FILETIME $ dwordsToDdword (hi,low)

instance Storable SYSTEMTIME where
    sizeOf _ = (16)
{-# LINE 59 "System\Win32\Time.hsc" #-}
    alignment = sizeOf
    poke buf st = do
         ((\hsc_ptr -> pokeByteOff hsc_ptr 0))          buf (wYear st)
{-# LINE 62 "System\Win32\Time.hsc" #-}
         ((\hsc_ptr -> pokeByteOff hsc_ptr 2))         buf (wMonth st)
{-# LINE 63 "System\Win32\Time.hsc" #-}
         ((\hsc_ptr -> pokeByteOff hsc_ptr 4))     buf (wDayOfWeek st)
{-# LINE 64 "System\Win32\Time.hsc" #-}
         ((\hsc_ptr -> pokeByteOff hsc_ptr 6))           buf (wDay st)
{-# LINE 65 "System\Win32\Time.hsc" #-}
         ((\hsc_ptr -> pokeByteOff hsc_ptr 8))          buf (wHour st)
{-# LINE 66 "System\Win32\Time.hsc" #-}
         ((\hsc_ptr -> pokeByteOff hsc_ptr 10))        buf (wMinute st)
{-# LINE 67 "System\Win32\Time.hsc" #-}
         ((\hsc_ptr -> pokeByteOff hsc_ptr 12))        buf (wSecond st)
{-# LINE 68 "System\Win32\Time.hsc" #-}
         ((\hsc_ptr -> pokeByteOff hsc_ptr 14))  buf (wMilliseconds st)
{-# LINE 69 "System\Win32\Time.hsc" #-}
    peek buf = do
        year    <- ((\hsc_ptr -> peekByteOff hsc_ptr 0))        buf
{-# LINE 71 "System\Win32\Time.hsc" #-}
        month   <- ((\hsc_ptr -> peekByteOff hsc_ptr 2))       buf
{-# LINE 72 "System\Win32\Time.hsc" #-}
        dow     <- ((\hsc_ptr -> peekByteOff hsc_ptr 4))   buf
{-# LINE 73 "System\Win32\Time.hsc" #-}
        day     <- ((\hsc_ptr -> peekByteOff hsc_ptr 6))         buf
{-# LINE 74 "System\Win32\Time.hsc" #-}
        hour    <- ((\hsc_ptr -> peekByteOff hsc_ptr 8))        buf
{-# LINE 75 "System\Win32\Time.hsc" #-}
        min     <- ((\hsc_ptr -> peekByteOff hsc_ptr 10))      buf
{-# LINE 76 "System\Win32\Time.hsc" #-}
        sec     <- ((\hsc_ptr -> peekByteOff hsc_ptr 12))      buf
{-# LINE 77 "System\Win32\Time.hsc" #-}
        ms      <- ((\hsc_ptr -> peekByteOff hsc_ptr 14)) buf
{-# LINE 78 "System\Win32\Time.hsc" #-}
        return $ SYSTEMTIME year month dow day hour min sec ms

instance Storable TIME_ZONE_INFORMATION where
    sizeOf _ = ((172))
{-# LINE 82 "System\Win32\Time.hsc" #-}
    alignment = sizeOf
    poke buf tzi = do
        ((\hsc_ptr -> pokeByteOff hsc_ptr 0)) buf (tziBias tzi)
{-# LINE 85 "System\Win32\Time.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 68)) buf (tziStandardDate tzi)
{-# LINE 86 "System\Win32\Time.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 84)) buf (tziStandardBias tzi)
{-# LINE 87 "System\Win32\Time.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 152)) buf (tziDaylightDate tzi)
{-# LINE 88 "System\Win32\Time.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 168)) buf (tziDaylightBias tzi)
{-# LINE 89 "System\Win32\Time.hsc" #-}
        write buf ((4)) (tziStandardName tzi)
{-# LINE 90 "System\Win32\Time.hsc" #-}
        write buf ((88)) (tziDaylightName tzi)
{-# LINE 91 "System\Win32\Time.hsc" #-}
        where
            write buf offset str = withCWStringLen str $ \(str,len) -> do
                when (len>31) $ fail "Storable TIME_ZONE_INFORMATION.poke: Too long string."
                let start = (advancePtr (castPtr buf) offset)
                    end = advancePtr start len
                copyArray (castPtr str :: Ptr Word8) start len
                poke end 0
    peek buf = do
        bias <- ((\hsc_ptr -> peekByteOff hsc_ptr 0))         buf
{-# LINE 100 "System\Win32\Time.hsc" #-}
        sdat <- ((\hsc_ptr -> peekByteOff hsc_ptr 68)) buf
{-# LINE 101 "System\Win32\Time.hsc" #-}
        sbia <- ((\hsc_ptr -> peekByteOff hsc_ptr 84)) buf
{-# LINE 102 "System\Win32\Time.hsc" #-}
        ddat <- ((\hsc_ptr -> peekByteOff hsc_ptr 152)) buf
{-# LINE 103 "System\Win32\Time.hsc" #-}
        dbia <- ((\hsc_ptr -> peekByteOff hsc_ptr 168)) buf
{-# LINE 104 "System\Win32\Time.hsc" #-}
        snam <- peekCWString (plusPtr buf ((4)))
{-# LINE 105 "System\Win32\Time.hsc" #-}
        dnam <- peekCWString (plusPtr buf ((88)))
{-# LINE 106 "System\Win32\Time.hsc" #-}
        return $ TIME_ZONE_INFORMATION bias snam sdat sbia dnam ddat dbia

foreign import stdcall "windows.h GetSystemTime"
    c_GetSystemTime :: Ptr SYSTEMTIME -> IO ()
getSystemTime :: IO SYSTEMTIME
getSystemTime = alloca $ \res -> do
    c_GetSystemTime res
    peek res

foreign import stdcall "windows.h SetSystemTime"
    c_SetSystemTime :: Ptr SYSTEMTIME -> IO BOOL
setSystemTime :: SYSTEMTIME -> IO ()
setSystemTime st = with st $ \st -> failIf_ not "setSystemTime: SetSystemTime" $
    c_SetSystemTime st

foreign import stdcall "windows.h GetSystemTimeAsFileTime"
    c_GetSystemTimeAsFileTime :: Ptr FILETIME -> IO ()
getSystemTimeAsFileTime :: IO FILETIME
getSystemTimeAsFileTime = alloca $ \ret -> do
    c_GetSystemTimeAsFileTime ret
    peek ret

foreign import stdcall "windows.h GetLocalTime"
    c_GetLocalTime :: Ptr SYSTEMTIME -> IO ()
getLocalTime :: IO SYSTEMTIME
getLocalTime = alloca $ \res -> do
    c_GetLocalTime res
    peek res

foreign import stdcall "windows.h SetLocalTime"
    c_SetLocalTime :: Ptr SYSTEMTIME -> IO BOOL
setLocalTime :: SYSTEMTIME -> IO ()
setLocalTime st = with st $ \st -> failIf_ not "setLocalTime: SetLocalTime" $
    c_SetLocalTime st

foreign import stdcall "windows.h GetSystemTimeAdjustment"
    c_GetSystemTimeAdjustment :: Ptr DWORD -> Ptr DWORD -> Ptr BOOL -> IO BOOL
getSystemTimeAdjustment :: IO (Maybe (Int, Int))
getSystemTimeAdjustment = alloca $ \ta -> alloca $ \ti -> alloca $ \enabled -> do
    failIf not "getSystemTimeAdjustment: GetSystemTimeAdjustment" $
        c_GetSystemTimeAdjustment ta ti enabled
    enabled <- peek enabled
    if enabled
        then do
            ta <- peek ta
            ti <- peek ti
            return $ Just (fromIntegral ta, fromIntegral ti)
        else return Nothing

foreign import stdcall "windows.h GetTickCount" getTickCount :: IO DWORD

foreign import stdcall "windows.h SetSystemTimeAdjustment"
    c_SetSystemTimeAdjustment :: DWORD -> BOOL -> IO BOOL
setSystemTimeAdjustment :: Maybe Int -> IO ()
setSystemTimeAdjustment ta =
    failIf_ not "setSystemTimeAjustment: SetSystemTimeAdjustment" $
        c_SetSystemTimeAdjustment time disabled
    where
        (time,disabled) = case ta of
            Nothing -> (0,True)
            Just x  -> (fromIntegral x,False)

foreign import stdcall "windows.h GetTimeZoneInformation"
    c_GetTimeZoneInformation :: Ptr TIME_ZONE_INFORMATION -> IO DWORD
getTimeZoneInformation :: IO (TimeZoneId, TIME_ZONE_INFORMATION)
getTimeZoneInformation = alloca $ \tzi -> do
    tz <- failIf (==(4294967295)) "getTimeZoneInformation: GetTimeZoneInformation" $
{-# LINE 173 "System\Win32\Time.hsc" #-}
        c_GetTimeZoneInformation tzi
    tzi <- peek tzi
    return . flip (,) tzi $ case tz of
        (0)   -> TzIdUnknown
{-# LINE 177 "System\Win32\Time.hsc" #-}
        (1)  -> TzIdStandard
{-# LINE 178 "System\Win32\Time.hsc" #-}
        (2)  -> TzIdDaylight
{-# LINE 179 "System\Win32\Time.hsc" #-}
        _                               -> TzIdUnknown   -- to remove warning

foreign import stdcall "windows.h SystemTimeToFileTime"
    c_SystemTimeToFileTime :: Ptr SYSTEMTIME -> Ptr FILETIME -> IO BOOL
systemTimeToFileTime :: SYSTEMTIME -> IO FILETIME
systemTimeToFileTime s = with s $ \s -> alloca $ \ret -> do
    failIf not "systemTimeToFileTime: SystemTimeToFileTime" $
        c_SystemTimeToFileTime s ret
    peek ret

foreign import stdcall "windows.h FileTimeToSystemTime"
    c_FileTimeToSystemTime :: Ptr FILETIME -> Ptr SYSTEMTIME -> IO BOOL
fileTimeToSystemTime :: FILETIME -> IO SYSTEMTIME
fileTimeToSystemTime s = with s $ \s -> alloca $ \ret -> do
    failIf not "fileTimeToSystemTime: FileTimeToSystemTime" $
        c_FileTimeToSystemTime s ret
    peek ret

foreign import stdcall "windows.h GetFileTime"
    c_GetFileTime :: HANDLE -> Ptr FILETIME -> Ptr FILETIME -> Ptr FILETIME -> IO BOOL
getFileTime :: HANDLE -> IO (FILETIME,FILETIME,FILETIME)
getFileTime h = alloca $ \crt -> alloca $ \acc -> alloca $ \wrt -> do
    failIf not "getFileTime: GetFileTime" $ c_GetFileTime h crt acc wrt
    liftM3 (,,) (peek crt) (peek acc) (peek wrt)

foreign import stdcall "windows.h SetFileTime"
    c_SetFileTime :: HANDLE -> Ptr FILETIME -> Ptr FILETIME -> Ptr FILETIME -> IO BOOL
setFileTime :: HANDLE -> FILETIME -> FILETIME -> FILETIME -> IO ()
setFileTime h crt acc wrt = with crt $ \crt -> with acc $ \acc -> with wrt $ \wrt -> do
    failIf not "setFileTime: SetFileTime" $ c_SetFileTime h crt acc wrt
    return ()

foreign import stdcall "windows.h FileTimeToLocalFileTime"
    c_FileTimeToLocalFileTime :: Ptr FILETIME -> Ptr FILETIME -> IO BOOL
fileTimeToLocalFileTime :: FILETIME -> IO FILETIME
fileTimeToLocalFileTime ft = with ft $ \ft -> alloca $ \res -> do
    failIf not "fileTimeToLocalFileTime: FileTimeToLocalFileTime"
        $ c_FileTimeToLocalFileTime ft res
    peek res

foreign import stdcall "windows.h LocalFileTimeToFileTime"
    c_LocalFileTimeToFileTime :: Ptr FILETIME -> Ptr FILETIME -> IO BOOL
localFileTimeToFileTime :: FILETIME -> IO FILETIME
localFileTimeToFileTime ft = with ft $ \ft -> alloca $ \res -> do
    failIf not "localFileTimeToFileTime: LocalFileTimeToFileTime"
        $ c_LocalFileTimeToFileTime ft res
    peek res

{-
-- Windows XP SP1
foreign import stdcall "windows.h GetSystemTimes"
    c_GetSystemTimes :: Ptr FILETIME -> Ptr FILETIME -> Ptr FILETIME -> IO BOOL
getSystemTimes :: IO (FILETIME,FILETIME,FILETIME)
getSystemTimes = alloca $ \idle -> alloca $ \kernel -> alloca $ \user -> do
    failIf not "getSystemTimes: GetSystemTimes" $ c_GetSystemTimes idle kernel user
    liftM3 (,,) (peek idle) (peek kernel) (peek user)
-}

{-
-- Windows XP
foreign import stdcall "windows.h SystemTimeToTzSpecificLocalTime"
    c_SystemTimeToTzSpecificLocalTime :: Ptr TIME_ZONE_INFORMATION -> Ptr SYSTEMTIME -> Ptr SYSTEMTIME -> IO BOOL
systemTimeToTzSpecificLocalTime :: TIME_ZONE_INFORMATION -> SYSTEMTIME -> IO SYSTEMTIME
systemTimeToTzSpecificLocalTime tzi st = with tzi $ \tzi -> with st $ \st -> alloca $ \res -> do
    failIf not "systemTimeToTzSpecificLocalTime: SystemTimeToTzSpecificLocalTime" $
        c_SystemTimeToTzSpecificLocalTime tzi st res
    peek res

foreign import stdcall "windows.h TzSpecificLocalTimeToSystemTime"
    c_TzSpecificLocalTimeToSystemTime :: Ptr TIME_ZONE_INFORMATION -> Ptr SYSTEMTIME -> Ptr SYSTEMTIME -> IO BOOL
tzSpecificLocalTimeToSystemTime :: TIME_ZONE_INFORMATION -> SYSTEMTIME -> IO SYSTEMTIME
tzSpecificLocalTimeToSystemTime tzi st = with tzi $ \tzi -> with st $ \st -> alloca $ \res -> do
    failIf not "tzSpecificLocalTimeToSystemTime: TzSpecificLocalTimeToSystemTime" $
        c_TzSpecificLocalTimeToSystemTime tzi st res
    peek res
-}

foreign import stdcall "windows.h QueryPerformanceFrequency"
    c_QueryPerformanceFrequency :: Ptr LARGE_INTEGER -> IO BOOL
queryPerformanceFrequency :: IO Integer
queryPerformanceFrequency = alloca $ \res -> do
    failIf not "queryPerformanceFrequency: QueryPerformanceFrequency" $
        c_QueryPerformanceFrequency res
    liftM fromIntegral $ peek res

foreign import stdcall "windows.h QueryPerformanceCounter"
    c_QueryPerformanceCounter:: Ptr LARGE_INTEGER -> IO BOOL
queryPerformanceCounter:: IO Integer
queryPerformanceCounter= alloca $ \res -> do
    failIf not "queryPerformanceCounter: QueryPerformanceCounter" $
        c_QueryPerformanceCounter res
    liftM fromIntegral $ peek res

type GetTimeFormatFlags = DWORD
lOCALE_NOUSEROVERRIDE  :: GetTimeFormatFlags
lOCALE_NOUSEROVERRIDE  =  2147483648
lOCALE_USE_CP_ACP      :: GetTimeFormatFlags
lOCALE_USE_CP_ACP      =  1073741824
tIME_NOMINUTESORSECONDS  :: GetTimeFormatFlags
tIME_NOMINUTESORSECONDS  =  1
tIME_NOSECONDS         :: GetTimeFormatFlags
tIME_NOSECONDS         =  2
tIME_NOTIMEMARKER      :: GetTimeFormatFlags
tIME_NOTIMEMARKER      =  4
tIME_FORCE24HOURFORMAT :: GetTimeFormatFlags
tIME_FORCE24HOURFORMAT =  8

{-# LINE 281 "System\Win32\Time.hsc" #-}

foreign import stdcall "windows.h GetTimeFormatW"
    c_GetTimeFormat :: LCID -> GetTimeFormatFlags -> Ptr SYSTEMTIME -> LPCTSTR -> LPTSTR -> CInt -> IO CInt
getTimeFormat :: LCID -> GetTimeFormatFlags -> SYSTEMTIME -> String -> IO String
getTimeFormat locale flags st fmt =
    with st $ \st ->
    withCWString fmt $ \fmt -> do
        size <- c_GetTimeFormat locale flags st fmt nullPtr 0
        allocaBytes ((fromIntegral size) * (sizeOf (undefined::CWchar))) $ \out -> do
            size <- failIf (==0) "getTimeFormat: GetTimeFormat" $
                c_GetTimeFormat locale flags st fmt (castPtr out) (fromIntegral size)
            peekTStringLen (out,fromIntegral size)
