{-# OPTIONS_GHC -fno-implicit-prelude #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  System.IO.Error
-- Copyright   :  (c) The University of Glasgow 2001
-- License     :  BSD-style (see the file libraries/base/LICENSE)
-- 
-- Maintainer  :  libraries@haskell.org
-- Stability   :  provisional
-- Portability :  portable
--
-- Standard IO Errors.
--
-----------------------------------------------------------------------------

module System.IO.Error (

    -- * I\/O errors
    IOError,			-- = IOException

    userError,		       	-- :: String  -> IOError


    mkIOError,			-- :: IOErrorType -> String -> Maybe Handle
				--    -> Maybe FilePath -> IOError

    annotateIOError,		-- :: IOError -> String -> Maybe Handle
				--    -> Maybe FilePath -> IOError


    -- ** Classifying I\/O errors
    isAlreadyExistsError,	-- :: IOError -> Bool
    isDoesNotExistError,
    isAlreadyInUseError,
    isFullError, 
    isEOFError,
    isIllegalOperation, 
    isPermissionError,
    isUserError,

    -- ** Attributes of I\/O errors

    ioeGetErrorType,		-- :: IOError -> IOErrorType

    ioeGetErrorString,		-- :: IOError -> String
    ioeGetHandle,		-- :: IOError -> Maybe Handle
    ioeGetFileName,		-- :: IOError -> Maybe FilePath


    ioeSetErrorType,		-- :: IOError -> IOErrorType -> IOError
    ioeSetErrorString,		-- :: IOError -> String -> IOError
    ioeSetHandle,		-- :: IOError -> Handle -> IOError
    ioeSetFileName,		-- :: IOError -> FilePath -> IOError


    -- * Types of I\/O error
    IOErrorType,		-- abstract

    alreadyExistsErrorType,	-- :: IOErrorType
    doesNotExistErrorType,
    alreadyInUseErrorType,
    fullErrorType,
    eofErrorType,
    illegalOperationErrorType, 
    permissionErrorType,
    userErrorType,

    -- ** 'IOErrorType' predicates
    isAlreadyExistsErrorType,	-- :: IOErrorType -> Bool
    isDoesNotExistErrorType,
    isAlreadyInUseErrorType,
    isFullErrorType, 
    isEOFErrorType,
    isIllegalOperationErrorType, 
    isPermissionErrorType,
    isUserErrorType, 

    -- * Throwing and catching I\/O errors

    ioError,		       	-- :: IOError -> IO a

    catch,			-- :: IO a -> (IOError -> IO a) -> IO a
    try,			-- :: IO a -> IO (Either IOError a)


    modifyIOError,		-- :: (IOError -> IOError) -> IO a -> IO a

  ) where

import Data.Either
import Data.Maybe









import Hugs.Prelude(Handle, IOException(..), IOErrorType(..))
























-- | The construct 'try' @comp@ exposes IO errors which occur within a
-- computation, and which are not fully handled.
--
-- Non-I\/O exceptions are not caught by this variant; to catch all
-- exceptions, use 'Control.Exception.try' from "Control.Exception".


try            :: IO a -> IO (Either IOError a)
try f          =  catch (do r <- f
                            return (Right r))
                        (return . Left)



-- -----------------------------------------------------------------------------
-- Constructing an IOError

-- | Construct an 'IOError' of the given type where the second argument
-- describes the error location and the third and fourth argument
-- contain the file handle and file path of the file involved in the
-- error if applicable.
mkIOError :: IOErrorType -> String -> Maybe Handle -> Maybe FilePath -> IOError
mkIOError t location maybe_hdl maybe_filename =
               IOError{ ioe_type = t, 
			ioe_location = location,
	   		ioe_description = "",
			ioe_handle = maybe_hdl, 
			ioe_filename = maybe_filename
 			}


















-- -----------------------------------------------------------------------------
-- IOErrorType

-- | An error indicating that an 'IO' operation failed because
-- one of its arguments already exists.
isAlreadyExistsError :: IOError -> Bool
isAlreadyExistsError = isAlreadyExistsErrorType    . ioeGetErrorType

-- | An error indicating that an 'IO' operation failed because
-- one of its arguments does not exist.
isDoesNotExistError :: IOError -> Bool
isDoesNotExistError  = isDoesNotExistErrorType     . ioeGetErrorType

-- | An error indicating that an 'IO' operation failed because
-- one of its arguments is a single-use resource, which is already
-- being used (for example, opening the same file twice for writing
-- might give this error).
isAlreadyInUseError :: IOError -> Bool
isAlreadyInUseError  = isAlreadyInUseErrorType     . ioeGetErrorType

-- | An error indicating that an 'IO' operation failed because
-- the device is full.
isFullError         :: IOError -> Bool
isFullError          = isFullErrorType             . ioeGetErrorType

-- | An error indicating that an 'IO' operation failed because
-- the end of file has been reached.
isEOFError          :: IOError -> Bool
isEOFError           = isEOFErrorType              . ioeGetErrorType

-- | An error indicating that an 'IO' operation failed because
-- the operation was not possible.
-- Any computation which returns an 'IO' result may fail with
-- 'isIllegalOperation'.  In some cases, an implementation will not be
-- able to distinguish between the possible error causes.  In this case
-- it should fail with 'isIllegalOperation'.
isIllegalOperation  :: IOError -> Bool
isIllegalOperation   = isIllegalOperationErrorType . ioeGetErrorType

-- | An error indicating that an 'IO' operation failed because
-- the user does not have sufficient operating system privilege
-- to perform that operation.
isPermissionError   :: IOError -> Bool
isPermissionError    = isPermissionErrorType       . ioeGetErrorType

-- | A programmer-defined error value constructed using 'userError'.
isUserError         :: IOError -> Bool
isUserError          = isUserErrorType             . ioeGetErrorType


-- -----------------------------------------------------------------------------
-- IOErrorTypes







-- | I\/O error where the operation failed because one of its arguments
-- already exists.
alreadyExistsErrorType   :: IOErrorType
alreadyExistsErrorType    = AlreadyExists

-- | I\/O error where the operation failed because one of its arguments
-- does not exist.
doesNotExistErrorType    :: IOErrorType
doesNotExistErrorType     = NoSuchThing

-- | I\/O error where the operation failed because one of its arguments
-- is a single-use resource, which is already being used.
alreadyInUseErrorType    :: IOErrorType
alreadyInUseErrorType     = ResourceBusy

-- | I\/O error where the operation failed because the device is full.
fullErrorType            :: IOErrorType
fullErrorType             = ResourceExhausted

-- | I\/O error where the operation failed because the end of file has
-- been reached.
eofErrorType             :: IOErrorType
eofErrorType              = EOF

-- | I\/O error where the operation is not possible.
illegalOperationErrorType :: IOErrorType
illegalOperationErrorType = IllegalOperation

-- | I\/O error where the operation failed because the user does not
-- have sufficient operating system privilege to perform that operation.
permissionErrorType      :: IOErrorType
permissionErrorType       = PermissionDenied

-- | I\/O error that is programmer-defined.
userErrorType		 :: IOErrorType
userErrorType		  = UserError

-- -----------------------------------------------------------------------------
-- IOErrorType predicates

-- | I\/O error where the operation failed because one of its arguments
-- already exists.
isAlreadyExistsErrorType :: IOErrorType -> Bool
isAlreadyExistsErrorType AlreadyExists = True
isAlreadyExistsErrorType _ = False

-- | I\/O error where the operation failed because one of its arguments
-- does not exist.
isDoesNotExistErrorType :: IOErrorType -> Bool
isDoesNotExistErrorType NoSuchThing = True
isDoesNotExistErrorType _ = False

-- | I\/O error where the operation failed because one of its arguments
-- is a single-use resource, which is already being used.
isAlreadyInUseErrorType :: IOErrorType -> Bool
isAlreadyInUseErrorType ResourceBusy = True
isAlreadyInUseErrorType _ = False

-- | I\/O error where the operation failed because the device is full.
isFullErrorType :: IOErrorType -> Bool
isFullErrorType ResourceExhausted = True
isFullErrorType _ = False

-- | I\/O error where the operation failed because the end of file has
-- been reached.
isEOFErrorType :: IOErrorType -> Bool
isEOFErrorType EOF = True
isEOFErrorType _ = False

-- | I\/O error where the operation is not possible.
isIllegalOperationErrorType :: IOErrorType -> Bool
isIllegalOperationErrorType IllegalOperation = True
isIllegalOperationErrorType _ = False

-- | I\/O error where the operation failed because the user does not
-- have sufficient operating system privilege to perform that operation.
isPermissionErrorType :: IOErrorType -> Bool
isPermissionErrorType PermissionDenied = True
isPermissionErrorType _ = False

-- | I\/O error that is programmer-defined.
isUserErrorType :: IOErrorType -> Bool
isUserErrorType UserError = True
isUserErrorType _ = False

-- -----------------------------------------------------------------------------
-- Miscellaneous


ioeGetErrorType	      :: IOError -> IOErrorType
ioeGetErrorString     :: IOError -> String
ioeGetHandle          :: IOError -> Maybe Handle
ioeGetFileName        :: IOError -> Maybe FilePath

ioeGetErrorType ioe = ioe_type ioe

ioeGetErrorString ioe
   | isUserErrorType (ioe_type ioe) = ioe_description ioe
   | otherwise                      = show (ioe_type ioe)

ioeGetHandle ioe = ioe_handle ioe

ioeGetFileName ioe = ioe_filename ioe

ioeSetErrorType		:: IOError -> IOErrorType -> IOError
ioeSetErrorString	:: IOError -> String      -> IOError
ioeSetHandle		:: IOError -> Handle      -> IOError
ioeSetFileName		:: IOError -> FilePath    -> IOError

ioeSetErrorType   ioe errtype  = ioe{ ioe_type = errtype }
ioeSetErrorString ioe str      = ioe{ ioe_description = str }
ioeSetHandle      ioe hdl      = ioe{ ioe_handle = Just hdl }
ioeSetFileName    ioe filename = ioe{ ioe_filename = Just filename }

-- | Catch any 'IOError' that occurs in the computation and throw a
-- modified version.
modifyIOError :: (IOError -> IOError) -> IO a -> IO a
modifyIOError f io = catch io (\e -> ioError (f e))

-- -----------------------------------------------------------------------------
-- annotating an IOError

-- | Adds a location description and maybe a file path and file handle
-- to an 'IOError'.  If any of the file handle or file path is not given
-- the corresponding value in the 'IOError' remains unaltered.
annotateIOError :: IOError 
              -> String 
              -> Maybe Handle 
              -> Maybe FilePath 
              -> IOError 
annotateIOError (IOError ohdl errTy _ str opath) loc hdl path = 
  IOError (hdl `mplus` ohdl) errTy loc str (path `mplus` opath)
  where
    Nothing `mplus` ys = ys
    xs      `mplus` _  = xs












