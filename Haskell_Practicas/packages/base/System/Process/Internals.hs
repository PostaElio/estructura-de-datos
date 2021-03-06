{-# OPTIONS_GHC -cpp -fffi #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  System.Process.Internals
-- Copyright   :  (c) The University of Glasgow 2004
-- License     :  BSD-style (see the file libraries/base/LICENSE)
-- 
-- Maintainer  :  libraries@haskell.org
-- Stability   :  experimental
-- Portability :  portable
--
-- Operations for creating and interacting with sub-processes.
--
-----------------------------------------------------------------------------

-- #hide
module System.Process.Internals (
	ProcessHandle(..), ProcessHandle__(..), 
	PHANDLE, closePHANDLE, mkProcessHandle, 
	withProcessHandle, withProcessHandle_,














	withFilePathException, withCEnvironment
  ) where

import Prelude -- necessary to get dependencies right





import Data.Word ( Word32 )
import Data.IORef


import System.Exit	( ExitCode )
import Data.Maybe	( fromMaybe )




import Hugs.Exception	( Exception(..), IOException(..) )


import Control.Concurrent
import Control.Exception ( handle, throwIO )
import Foreign.C
import Foreign


import Control.Monad		( when )
import System.Directory		( doesFileExist )
import Control.Exception 	( catchJust, ioErrors )
import System.IO.Error		( isDoesNotExistError, doesNotExistErrorType,
				  mkIOError )
import System.Environment	( getEnv )
import System.Directory.Internals ( parseSearchPath, joinFileName )



{-# CFILES cbits/execvpe.c  #-}


                                                       
                                                                             

                         


                          


                              


                                 


                        


                                


                          


                            


                         


                           


                           


                         


                          


                         


                                


                                


                              


                           


                                


                          


                        


                          


                          


                          


                         


                          


                             


                                


                         


                          


                               


                         


                          


                       


                           


                          


                         


                          


                          


                            


                             


                                


                            


                             


                               


                          


                           


                            


                           


                          


                          


                           


                          


                           


                          


                          


                          


                               


                          


                         


                          


                          


                           


                            


                           


                             


                            


                          


                         


                              


                         


                                


                         


                            


                                


                                 


                                


                          


                                   


                              


                          


                           


                           


                         


                                


                            


                             


                                   


                          


                         


                          


                          


                         


                             


                                


                           


                          


                               


                         


                            


                           


                           


                          


                           


                           


                          


                          


                          


                          


                           


                           


                           


                           


                           


                           


                           


                          


                           


                           


                           


                           


                           


                          


                           


                           


                             


                           


                           


                             


                           


                           


                           


                               


                               


                                                        


                                                        


                                                   


                                                       


                                                      
                          

                                                           


                                                      


                                                         
                             

                                                         


                                                   
                       

                                                         


                                                       
                           

                                                     
                         

                                                        
                         

                                                         


                                                         


                                                         


                                                          


                                                         


                                                               
                                

                                                           


                                                            


                                                          
                           

                                                       


                                                         


                                                         


                                                     


                                     
                       

                                     


                                        


                                      


                                       


                                      


                                      
                        

                                      


                                    


                                         


                                         


                                     


                                          


                                       


                                        
                          

                                      


                                      


                                          


                                       
                         

                                      


                                            


                                             


                                       


                                        
                          

                                        


                                         
                           

                                       


                                      
                        

                                          


                                          


                                              


                                             


                                              


                                                   


                                               


                                        


                                       


                                                                              


                                              


                                                          


                                                          


                                            


                                           


                                                      


                                                                       
                              

                                                 
                         



-- ----------------------------------------------------------------------------
-- ProcessHandle type

{- | A handle to a process, which can be used to wait for termination
     of the process using 'waitForProcess'.

     None of the process-creation functions in this library wait for
     termination: they all return a 'ProcessHandle' which may be used
     to wait for the process later.
-}
data ProcessHandle__ = OpenHandle PHANDLE | ClosedHandle ExitCode
newtype ProcessHandle = ProcessHandle (MVar ProcessHandle__)

withProcessHandle
	:: ProcessHandle 
	-> (ProcessHandle__ -> IO (ProcessHandle__, a))
	-> IO a
withProcessHandle (ProcessHandle m) io = modifyMVar m io

withProcessHandle_
	:: ProcessHandle 
	-> (ProcessHandle__ -> IO ProcessHandle__)
	-> IO ()
withProcessHandle_ (ProcessHandle m) io = modifyMVar_ m io















type PHANDLE = Word32

-- On Windows, we have to close this HANDLE when it is no longer required,
-- hence we add a finalizer to it, using an IORef as the box on which to
-- attach the finalizer.
mkProcessHandle :: PHANDLE -> IO ProcessHandle
mkProcessHandle h = do
   m <- newMVar (OpenHandle h)
   addMVarFinalizer m (processHandleFinaliser m)
   return (ProcessHandle m)

processHandleFinaliser m =
   modifyMVar_ m $ \p_ -> do 
	case p_ of
	  OpenHandle ph -> closePHANDLE ph
	  _ -> return ()
	return (error "closed process handle")

closePHANDLE :: PHANDLE -> IO ()
closePHANDLE ph = c_CloseHandle ph

foreign import stdcall unsafe "CloseHandle"
  c_CloseHandle
	:: PHANDLE
	-> IO ()


-- ----------------------------------------------------------------------------




































































































































































































































































-- ----------------------------------------------------------------------------
-- Utils

withFilePathException :: FilePath -> IO a -> IO a
withFilePathException fpath act = handle mapEx act
  where
    mapEx (IOException (IOError h iot fun str _)) = ioError (IOError h iot fun str (Just fpath))
    mapEx e                                       = throwIO e







withCEnvironment :: [(String,String)] -> (Ptr () -> IO a) -> IO a
withCEnvironment env act =
  let env' = foldr (\(name, val) env -> name ++ ('=':val)++'\0':env) "\0" env 
  in withCString env' (act . castPtr)


