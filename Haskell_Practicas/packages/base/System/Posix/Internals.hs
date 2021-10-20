{-# OPTIONS_GHC -fno-implicit-prelude #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  System.Posix.Internals
-- Copyright   :  (c) The University of Glasgow, 1992-2002
-- License     :  see libraries/base/LICENSE
-- 
-- Maintainer  :  cvs-ghc@haskell.org
-- Stability   :  internal
-- Portability :  non-portable (requires POSIX)
--
-- POSIX support layer for the standard libraries.
-- This library is built on *every* platform, including Win32.
--
-- Non-posix compliant in order to support the following features:
--	* S_ISSOCK (no sockets in POSIX)
--
-----------------------------------------------------------------------------

-- #hide
module System.Posix.Internals where

                                                    
                                                                          

                               
                                                                                                            







                                                      












                                                         












                                


                                  


                                 


                               


                                


                                     


                                 


                                         


                                        


                                         


                                              


                                          


                                  


                                                        


                                                         


                                                        


                                                        


                                                      
                          

                                                       
                           

                                                          
                              

                                                      
                       

                                                           


                                                         


                                                         


                                                         


                                                      
                       

                                                         


                                                         


                                                         


                                                          


                                                         


                                                               
                                

                                                           


                                                            


                                                             
                              

                                                            
                             

                                                           


                                                            


                                                              
                               

                                                                      
                            

                                                          
                           

                                                  


                                                   
                       

                                                       


                                                         


                                                        


                                                         
                          

                                                          


                                                          


                                                   
                    

                                                                              


                                              


                                                          


                                                          


                                            


                                                  


                                                    


                                                   


                                                 


                                                  


                                                       


                                                   


                                                           


                                                          


                                                           


                                                                


                                                            


                                                    


                                                      


                                                                           


                                                            
                  

                                                                                                           
                   








                                                       
                                                                             

                         


                          


                              


                                 


                        


                                


                          


                            


                         


                           


                           


                         


                          


                         


                                


                                


                              


                           


                                


                          


                        


                          


                          


                          


                         


                          


                             


                                


                         


                          


                               


                         


                          


                       


                           


                          


                         


                          


                          


                            


                             


                                


                            


                             


                               


                          


                           


                            


                           


                          


                          


                           


                          


                           


                          


                          


                          


                               


                          


                         


                          


                          


                           


                            


                           


                             


                            


                          


                         


                              


                         


                                


                         


                            


                                


                                 


                                


                          


                                   


                              


                          


                           


                           


                         


                                


                            


                             


                                   


                          


                         


                          


                          


                         


                             


                                


                           


                          


                               


                         


                            


                           


                           


                          


                           


                           


                          


                          


                          


                          


                           


                           


                           


                           


                           


                           


                           


                          


                           


                           


                           


                           


                           


                          


                           


                           


                             


                           


                           


                             


                           


                           


                           


                               


                               


                                                        


                                                        


                                                   


                                                       


                                                      
                          

                                                           


                                                      


                                                         
                             

                                                         


                                                   
                       

                                                         


                                                       
                           

                                                     
                         

                                                        
                         

                                                         


                                                         


                                                         


                                                          


                                                         


                                                               
                                

                                                           


                                                            


                                                          
                           

                                                       


                                                         


                                                         


                                                     


                                     
                       

                                     


                                        


                                      


                                       


                                      


                                      
                        

                                      


                                    


                                         


                                         


                                     


                                          


                                       


                                        
                          

                                      


                                      


                                          


                                       
                         

                                      


                                            


                                             


                                       


                                        
                          

                                        


                                         
                           

                                       


                                      
                        

                                          


                                          


                                              


                                             


                                              


                                                   


                                               


                                        


                                       


                                                                              


                                              


                                                          


                                                          


                                            


                                           


                                                      


                                                                       
                              

                                                 
                         



import Control.Monad
import System.Posix.Types

import Foreign
import Foreign.C

import Data.Bits
import Data.Maybe







import System.IO



import Hugs.Prelude (IOException(..), IOErrorType(..))

{-# CFILES cbits/PrelIOUtils.c cbits/dirUtils.c cbits/consUtils.c #-}


-- ---------------------------------------------------------------------------
-- Types

type CDir       = ()
type CDirent    = ()
type CFLock     = ()
type CGroup     = ()
type CLconv     = ()
type CPasswd    = ()
type CSigaction = ()
type CSigset    = ()
type CStat      = ()
type CTermios   = ()
type CTm	= ()
type CTms	= ()
type CUtimbuf   = ()
type CUtsname   = ()


type FD = Int


-- ---------------------------------------------------------------------------
-- stat()-related stuff

fdFileSize :: Int -> IO Integer
fdFileSize fd = 
  allocaBytes sizeof_stat $ \ p_stat -> do
    throwErrnoIfMinus1Retry "fileSize" $
	c_fstat (fromIntegral fd) p_stat
    c_mode <- st_mode p_stat :: IO CMode 
    if not (s_isreg c_mode)
	then return (-1)
	else do
    c_size <- st_size p_stat :: IO COff
    return (fromIntegral c_size)

data FDType  = Directory | Stream | RegularFile | RawDevice
	       deriving (Eq)

fileType :: FilePath -> IO FDType
fileType file =
  allocaBytes sizeof_stat $ \ p_stat -> do
  withCString file $ \p_file -> do
    throwErrnoIfMinus1Retry "fileType" $
      c_stat p_file p_stat
    statGetType p_stat

-- NOTE: On Win32 platforms, this will only work with file descriptors
-- referring to file handles. i.e., it'll fail for socket FDs.
fdType :: Int -> IO FDType
fdType fd = 
  allocaBytes sizeof_stat $ \ p_stat -> do
    throwErrnoIfMinus1Retry "fdType" $
	c_fstat (fromIntegral fd) p_stat
    statGetType p_stat

statGetType p_stat = do
  c_mode <- st_mode p_stat :: IO CMode
  case () of
      _ | s_isdir c_mode    	-> return Directory
        | s_isfifo c_mode || s_issock c_mode || s_ischr  c_mode
			  	-> return Stream
	| s_isreg c_mode	-> return RegularFile
	 -- Q: map char devices to RawDevice too?
	| s_isblk c_mode        -> return RawDevice
	| otherwise		-> ioError ioe_unknownfiletype
    

ioe_unknownfiletype = IOError Nothing UnsupportedOperation "fdType"
			"unknown file type" Nothing











fdGetMode :: Int -> IO IOMode
fdGetMode fd = do

    -- XXX: this code is *BROKEN*, _setmode only deals with O_TEXT/O_BINARY
    flags1 <- throwErrnoIfMinus1Retry "fdGetMode" 
                (c__setmode (fromIntegral fd) (fromIntegral o_WRONLY))
    flags  <- throwErrnoIfMinus1Retry "fdGetMode" 
                (c__setmode (fromIntegral fd) (fromIntegral flags1))




    let
       wH  = (flags .&. o_WRONLY) /= 0
       aH  = (flags .&. o_APPEND) /= 0
       rwH = (flags .&. o_RDWR) /= 0

       mode
	 | wH && aH  = AppendMode
	 | wH        = WriteMode
	 | rwH       = ReadWriteMode
	 | otherwise = ReadMode
	  
    return mode

-- ---------------------------------------------------------------------------
-- Terminal-related stuff

fdIsTTY :: Int -> IO Bool
fdIsTTY fd = c_isatty (fromIntegral fd) >>= return.toBool















































































-- 'raw' mode for Win32 means turn off 'line input' (=> buffering and
-- character translation for the console.) The Win32 API for doing
-- this is GetConsoleMode(), which also requires echoing to be disabled
-- when turning off 'line input' processing. Notice that turning off
-- 'line input' implies enter/return is reported as '\r' (and it won't
-- report that character until another character is input..odd.) This
-- latter feature doesn't sit too well with IO actions like IO.hGetLine..
-- consider yourself warned.
setCooked :: Int -> Bool -> IO ()
setCooked fd cooked = do
  x <- set_console_buffering (fromIntegral fd) (if cooked then 1 else 0)
  if (x /= 0)
   then ioError (ioe_unk_error "setCooked" "failed to set buffering")
   else return ()

ioe_unk_error loc msg 
 = IOError Nothing OtherError loc msg Nothing

-- Note: echoing goes hand in hand with enabling 'line input' / raw-ness
-- for Win32 consoles, hence setEcho ends up being the inverse of setCooked.
setEcho :: Int -> Bool -> IO ()
setEcho fd on = do
  x <- set_console_echo (fromIntegral fd) (if on then 1 else 0)
  if (x /= 0)
   then ioError (ioe_unk_error "setEcho" "failed to set echoing")
   else return ()

getEcho :: Int -> IO Bool
getEcho fd = do
  r <- get_console_echo (fromIntegral fd)
  if (r == (-1))
   then ioError (ioe_unk_error "getEcho" "failed to get echoing")
   else return (r == 1)

foreign import ccall unsafe "consUtils.h set_console_buffering__"
   set_console_buffering :: CInt -> CInt -> IO CInt

foreign import ccall unsafe "consUtils.h set_console_echo__"
   set_console_echo :: CInt -> CInt -> IO CInt

foreign import ccall unsafe "consUtils.h get_console_echo__"
   get_console_echo :: CInt -> IO CInt



-- ---------------------------------------------------------------------------
-- Turning on non-blocking for a file descriptor














-- bogus defns for win32
setNonBlockingFD fd = return ()



-- -----------------------------------------------------------------------------
-- foreign imports

foreign import ccall unsafe "HsBase.h access"
   c_access :: CString -> CMode -> IO CInt

foreign import ccall unsafe "HsBase.h chmod"
   c_chmod :: CString -> CMode -> IO CInt

foreign import ccall unsafe "HsBase.h chdir"
   c_chdir :: CString -> IO CInt

foreign import ccall unsafe "HsBase.h close"
   c_close :: CInt -> IO CInt

foreign import ccall unsafe "HsBase.h closedir" 
   c_closedir :: Ptr CDir -> IO CInt

foreign import ccall unsafe "HsBase.h creat"
   c_creat :: CString -> CMode -> IO CInt

foreign import ccall unsafe "HsBase.h dup"
   c_dup :: CInt -> IO CInt

foreign import ccall unsafe "HsBase.h dup2"
   c_dup2 :: CInt -> CInt -> IO CInt

foreign import ccall unsafe "HsBase.h __hscore_fstat"
   c_fstat :: CInt -> Ptr CStat -> IO CInt

foreign import ccall unsafe "HsBase.h getcwd"
   c_getcwd   :: Ptr CChar -> CInt -> IO (Ptr CChar)

foreign import ccall unsafe "HsBase.h isatty"
   c_isatty :: CInt -> IO CInt

foreign import ccall unsafe "HsBase.h __hscore_lseek"
   c_lseek :: CInt -> COff -> CInt -> IO COff

foreign import ccall unsafe "HsBase.h __hscore_lstat"
   lstat :: CString -> Ptr CStat -> IO CInt

foreign import ccall unsafe "HsBase.h __hscore_open"
   c_open :: CString -> CInt -> CMode -> IO CInt

foreign import ccall unsafe "HsBase.h opendir" 
   c_opendir :: CString  -> IO (Ptr CDir)

foreign import ccall unsafe "HsBase.h __hscore_mkdir"
   mkdir :: CString -> CInt -> IO CInt

foreign import ccall unsafe "HsBase.h read" 
   c_read :: CInt -> Ptr CChar -> CSize -> IO CSsize

foreign import ccall unsafe "dirUtils.h __hscore_renameFile"
   c_rename :: CString -> CString -> IO CInt
		     
foreign import ccall unsafe "HsBase.h rewinddir"
   c_rewinddir :: Ptr CDir -> IO ()

foreign import ccall unsafe "HsBase.h rmdir"
   c_rmdir :: CString -> IO CInt

foreign import ccall unsafe "HsBase.h __hscore_stat"
   c_stat :: CString -> Ptr CStat -> IO CInt

foreign import ccall unsafe "HsBase.h umask"
   c_umask :: CMode -> IO CMode

foreign import ccall unsafe "HsBase.h write" 
   c_write :: CInt -> Ptr CChar -> CSize -> IO CSsize

foreign import ccall unsafe "HsBase.h __hscore_ftruncate"
   c_ftruncate :: CInt -> COff -> IO CInt

foreign import ccall unsafe "HsBase.h unlink"
   c_unlink :: CString -> IO CInt

foreign import ccall unsafe "HsBase.h getpid"
   c_getpid :: IO CPid












































foreign import ccall unsafe "HsBase.h _setmode"
   c__setmode :: CInt -> CInt -> IO CInt

--   /* Set "stdin" to have binary mode: */
--   result = _setmode( _fileno( stdin ), _O_BINARY );
--   if( result == -1 )
--      perror( "Cannot set mode" );
--   else
--      printf( "'stdin' successfully changed to binary mode\n" );


-- traversing directories
foreign import ccall unsafe "dirUtils.h __hscore_readdir"
  readdir  :: Ptr CDir -> Ptr (Ptr CDirent) -> IO CInt
 
foreign import ccall unsafe "HsBase.h __hscore_free_dirent"
  freeDirEnt  :: Ptr CDirent -> IO ()
 
foreign import ccall unsafe "HsBase.h __hscore_end_of_dir"
  end_of_dir :: CInt
 
foreign import ccall unsafe "HsBase.h __hscore_d_name"
  d_name :: Ptr CDirent -> IO CString

-- POSIX flags only:
foreign import ccall unsafe "HsBase.h __hscore_o_rdonly" o_RDONLY :: CInt
foreign import ccall unsafe "HsBase.h __hscore_o_wronly" o_WRONLY :: CInt
foreign import ccall unsafe "HsBase.h __hscore_o_rdwr"   o_RDWR   :: CInt
foreign import ccall unsafe "HsBase.h __hscore_o_append" o_APPEND :: CInt
foreign import ccall unsafe "HsBase.h __hscore_o_creat"  o_CREAT  :: CInt
foreign import ccall unsafe "HsBase.h __hscore_o_excl"   o_EXCL   :: CInt
foreign import ccall unsafe "HsBase.h __hscore_o_trunc"  o_TRUNC  :: CInt

-- non-POSIX flags.
foreign import ccall unsafe "HsBase.h __hscore_o_noctty"   o_NOCTTY   :: CInt
foreign import ccall unsafe "HsBase.h __hscore_o_nonblock" o_NONBLOCK :: CInt
foreign import ccall unsafe "HsBase.h __hscore_o_binary"   o_BINARY   :: CInt

foreign import ccall unsafe "HsBase.h __hscore_s_isreg"  s_isreg  :: CMode -> Bool
foreign import ccall unsafe "HsBase.h __hscore_s_ischr"  s_ischr  :: CMode -> Bool
foreign import ccall unsafe "HsBase.h __hscore_s_isblk"  s_isblk  :: CMode -> Bool
foreign import ccall unsafe "HsBase.h __hscore_s_isdir"  s_isdir  :: CMode -> Bool
foreign import ccall unsafe "HsBase.h __hscore_s_isfifo" s_isfifo :: CMode -> Bool

foreign import ccall unsafe "HsBase.h __hscore_sizeof_stat" sizeof_stat :: Int
foreign import ccall unsafe "HsBase.h __hscore_st_mtime" st_mtime :: Ptr CStat -> IO CTime
foreign import ccall unsafe "HsBase.h __hscore_st_size" st_size :: Ptr CStat -> IO COff
foreign import ccall unsafe "HsBase.h __hscore_st_mode" st_mode :: Ptr CStat -> IO CMode

foreign import ccall unsafe "HsBase.h __hscore_echo"         const_echo :: CInt
foreign import ccall unsafe "HsBase.h __hscore_tcsanow"      const_tcsanow :: CInt
foreign import ccall unsafe "HsBase.h __hscore_icanon"       const_icanon :: CInt
foreign import ccall unsafe "HsBase.h __hscore_vmin"         const_vmin   :: CInt
foreign import ccall unsafe "HsBase.h __hscore_vtime"        const_vtime  :: CInt
foreign import ccall unsafe "HsBase.h __hscore_sigttou"      const_sigttou :: CInt
foreign import ccall unsafe "HsBase.h __hscore_sig_block"    const_sig_block :: CInt
foreign import ccall unsafe "HsBase.h __hscore_sig_setmask"  const_sig_setmask :: CInt
foreign import ccall unsafe "HsBase.h __hscore_f_getfl"      const_f_getfl :: CInt
foreign import ccall unsafe "HsBase.h __hscore_f_setfl"      const_f_setfl :: CInt













s_issock :: CMode -> Bool
s_issock cmode = False

