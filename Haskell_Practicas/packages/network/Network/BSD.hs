{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DCALLCONV=stdcall #-}
{-# INCLUDE "HsNet.h" #-}
{-# LINE 1 "Network\BSD.hsc" #-}
{-# OPTIONS -fglasgow-exts -cpp #-}
{-# LINE 2 "Network\BSD.hsc" #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Network.BSD
-- Copyright   :  (c) The University of Glasgow 2001
-- License     :  BSD-style (see the file libraries/network/LICENSE)
-- 
-- Maintainer  :  libraries@haskell.org
-- Stability   :  experimental
-- Portability :  non-portable
--
-- The "Network.BSD" module defines Haskell bindings to functionality
-- provided by BSD Unix derivatives. Currently this covers
-- network programming functionality and symbolic links.
-- (OK, so the latter is pretty much supported by most Unixes
-- today, but it was BSD that introduced them.)  
--
-- The symlink stuff is really in the wrong place, at some point it will move
-- to a generic Unix library somewhere else in the module tree.
--
-----------------------------------------------------------------------------


{-# LINE 24 "Network\BSD.hsc" #-}

-- NOTE: ##, we want this interpreted when compiling the .hs, not by hsc2hs.
                                           












{-# LINE 33 "Network\BSD.hsc" #-}

module Network.BSD (
       
    -- * Host names
    HostName,
    getHostName,	    -- :: IO HostName

    HostEntry(..),
    getHostByName,	    -- :: HostName -> IO HostEntry
    getHostByAddr,	    -- :: HostAddress -> Family -> IO HostEntry
    hostAddress,	    -- :: HostEntry -> HostAddress


{-# LINE 52 "Network\BSD.hsc" #-}

    -- * Service names
    ServiceEntry(..),
    ServiceName,
    getServiceByName,	    -- :: ServiceName -> ProtocolName -> IO ServiceEntry
    getServiceByPort,       -- :: PortNumber  -> ProtocolName -> IO ServiceEntry
    getServicePortNumber,   -- :: ServiceName -> IO PortNumber


{-# LINE 67 "Network\BSD.hsc" #-}

    -- * Protocol names
    ProtocolName,
    ProtocolNumber,
    ProtocolEntry(..),
    getProtocolByName,	    -- :: ProtocolName   -> IO ProtocolEntry
    getProtocolByNumber,    -- :: ProtocolNumber -> IO ProtcolEntry
    getProtocolNumber,	    -- :: ProtocolName   -> ProtocolNumber
    defaultProtocol,        -- :: ProtocolNumber


{-# LINE 84 "Network\BSD.hsc" #-}

    -- * Port numbers
    PortNumber,

    -- * Network names
    NetworkName,
    NetworkAddr,
    NetworkEntry(..)


{-# LINE 102 "Network\BSD.hsc" #-}


{-# LINE 107 "Network\BSD.hsc" #-}

{-# LINE 110 "Network\BSD.hsc" #-}

    ) where


{-# LINE 114 "Network\BSD.hsc" #-}
import Hugs.Prelude ( IOException(..), IOErrorType(..) )

{-# LINE 116 "Network\BSD.hsc" #-}
import Network.Socket

import Control.Concurrent 	( MVar, newMVar, withMVar )
import Foreign.C.Error ( throwErrnoIfMinus1, throwErrnoIfMinus1_ )
import Foreign.C.String ( CString, peekCString, peekCStringLen, withCString )
import Foreign.C.Types ( CInt, CULong, CChar, CSize, CShort )
import Foreign.Ptr ( Ptr, nullPtr )
import Foreign.Storable ( Storable(..) )
import Foreign.Marshal.Array ( allocaArray0, peekArray0 )
import Foreign.Marshal.Utils ( with, fromBool )
import Data.Typeable
import System.IO.Unsafe ( unsafePerformIO )


{-# LINE 132 "Network\BSD.hsc" #-}

import Control.Monad ( liftM )

-- ---------------------------------------------------------------------------
-- Basic Types

type HostName     = String
type ProtocolName = String
type ServiceName  = String

-- ---------------------------------------------------------------------------
-- Service Database Access

-- Calling getServiceByName for a given service and protocol returns
-- the systems service entry.  This should be used to find the port
-- numbers for standard protocols such as SMTP and FTP.  The remaining
-- three functions should be used for browsing the service database
-- sequentially.

-- Calling setServiceEntry with True indicates that the service
-- database should be left open between calls to getServiceEntry.  To
-- close the database a call to endServiceEntry is required.  This
-- database file is usually stored in the file /etc/services.

data ServiceEntry  = 
  ServiceEntry  {
     serviceName     :: ServiceName,	-- Official Name
     serviceAliases  :: [ServiceName],	-- aliases
     servicePort     :: PortNumber,	-- Port Number  ( network byte order )
     serviceProtocol :: ProtocolName	-- Protocol
  } deriving (Show)

serviceEntryTc = mkTyCon "ServiceEntry"; instance Typeable ServiceEntry where { typeOf _ = mkTyConApp serviceEntryTc [] }

instance Storable ServiceEntry where
   sizeOf    _ = 16
{-# LINE 168 "Network\BSD.hsc" #-}
   alignment _ = alignment (undefined :: CInt) -- ???

   peek p = do
        s_name    <- ((\hsc_ptr -> peekByteOff hsc_ptr 0)) p >>= peekCString
{-# LINE 172 "Network\BSD.hsc" #-}
        s_aliases <- ((\hsc_ptr -> peekByteOff hsc_ptr 4)) p
{-# LINE 173 "Network\BSD.hsc" #-}
                           >>= peekArray0 nullPtr
                           >>= mapM peekCString
        s_port    <- ((\hsc_ptr -> peekByteOff hsc_ptr 8)) p
{-# LINE 176 "Network\BSD.hsc" #-}
        s_proto   <- ((\hsc_ptr -> peekByteOff hsc_ptr 12)) p >>= peekCString
{-# LINE 177 "Network\BSD.hsc" #-}
        return (ServiceEntry {
                        serviceName     = s_name,
                        serviceAliases  = s_aliases,

{-# LINE 181 "Network\BSD.hsc" #-}
                        servicePort     = PortNum (fromIntegral (s_port :: CShort)),

{-# LINE 187 "Network\BSD.hsc" #-}
                        serviceProtocol = s_proto
                })

   poke p = error "Storable.poke(BSD.ServiceEntry) not implemented"


-- | Get service by name.
getServiceByName :: ServiceName 	-- Service Name
		 -> ProtocolName 	-- Protocol Name
		 -> IO ServiceEntry	-- Service Entry
getServiceByName name proto = withLock $ do
 withCString name  $ \ cstr_name  -> do
 withCString proto $ \ cstr_proto -> do
 throwNoSuchThingIfNull "getServiceByName" "no such service entry"
   $ (trySysCall (c_getservbyname cstr_name cstr_proto))
 >>= peek

foreign import ccall unsafe "getservbyname" 
  c_getservbyname :: CString -> CString -> IO (Ptr ServiceEntry)

-- | Get the service given a 'PortNumber' and 'ProtocolName'.
getServiceByPort :: PortNumber -> ProtocolName -> IO ServiceEntry
getServiceByPort (PortNum port) proto = withLock $ do
 withCString proto $ \ cstr_proto -> do
 throwNoSuchThingIfNull "getServiceByPort" "no such service entry"
   $ (trySysCall (c_getservbyport (fromIntegral port) cstr_proto))
 >>= peek

foreign import ccall unsafe "getservbyport" 
  c_getservbyport :: CInt -> CString -> IO (Ptr ServiceEntry)

-- | Get the 'PortNumber' corresponding to the 'ServiceName'.
getServicePortNumber :: ServiceName -> IO PortNumber
getServicePortNumber name = do
    (ServiceEntry _ _ port _) <- getServiceByName name "tcp"
    return port


{-# LINE 248 "Network\BSD.hsc" #-}

-- ---------------------------------------------------------------------------
-- Protocol Entries

-- The following relate directly to the corresponding UNIX C
-- calls for returning the protocol entries. The protocol entry is
-- represented by the Haskell type ProtocolEntry.

-- As for setServiceEntry above, calling setProtocolEntry.
-- determines whether or not the protocol database file, usually
-- @/etc/protocols@, is to be kept open between calls of
-- getProtocolEntry. Similarly, 

data ProtocolEntry = 
  ProtocolEntry  {
     protoName    :: ProtocolName,	-- Official Name
     protoAliases :: [ProtocolName],	-- aliases
     protoNumber  :: ProtocolNumber	-- Protocol Number
  } deriving (Read, Show)

protocolEntryTc = mkTyCon "ProtocolEntry"; instance Typeable ProtocolEntry where { typeOf _ = mkTyConApp protocolEntryTc [] }

instance Storable ProtocolEntry where
   sizeOf    _ = 12
{-# LINE 272 "Network\BSD.hsc" #-}
   alignment _ = alignment (undefined :: CInt) -- ???

   peek p = do
        p_name    <- ((\hsc_ptr -> peekByteOff hsc_ptr 0)) p >>= peekCString
{-# LINE 276 "Network\BSD.hsc" #-}
        p_aliases <- ((\hsc_ptr -> peekByteOff hsc_ptr 4)) p
{-# LINE 277 "Network\BSD.hsc" #-}
                           >>= peekArray0 nullPtr
                           >>= mapM peekCString

{-# LINE 280 "Network\BSD.hsc" #-}
         -- With WinSock, the protocol number is only a short;
         -- hoist it in as such, but represent it on the Haskell side
         -- as a CInt.
        p_proto_short  <- ((\hsc_ptr -> peekByteOff hsc_ptr 8)) p 
{-# LINE 284 "Network\BSD.hsc" #-}
        let p_proto = fromIntegral (p_proto_short :: CShort)

{-# LINE 288 "Network\BSD.hsc" #-}
        return (ProtocolEntry { 
                        protoName    = p_name,
                        protoAliases = p_aliases,
                        protoNumber  = p_proto
                })

   poke p = error "Storable.poke(BSD.ProtocolEntry) not implemented"

getProtocolByName :: ProtocolName -> IO ProtocolEntry
getProtocolByName name = withLock $ do
 withCString name $ \ name_cstr -> do
 throwNoSuchThingIfNull "getProtocolByName" ("no such protocol name: " ++ name)
   $ (trySysCall.c_getprotobyname) name_cstr
 >>= peek

foreign import  ccall unsafe  "getprotobyname" 
   c_getprotobyname :: CString -> IO (Ptr ProtocolEntry)


getProtocolByNumber :: ProtocolNumber -> IO ProtocolEntry
getProtocolByNumber num = withLock $ do
 throwNoSuchThingIfNull "getProtocolByNumber" ("no such protocol number: " ++ show num)
   $ (trySysCall.c_getprotobynumber) (fromIntegral num)
 >>= peek

foreign import ccall unsafe  "getprotobynumber"
   c_getprotobynumber :: CInt -> IO (Ptr ProtocolEntry)


getProtocolNumber :: ProtocolName -> IO ProtocolNumber
getProtocolNumber proto = do
 (ProtocolEntry _ _ num) <- getProtocolByName proto
 return num

-- | This is the default protocol for the given service.
defaultProtocol :: ProtocolNumber
defaultProtocol = 0


{-# LINE 350 "Network\BSD.hsc" #-}

-- ---------------------------------------------------------------------------
-- Host lookups

data HostEntry = 
  HostEntry  {
     hostName      :: HostName,  	-- Official Name
     hostAliases   :: [HostName],	-- aliases
     hostFamily    :: Family,	        -- Host Type (currently AF_INET)
     hostAddresses :: [HostAddress]	-- Set of Network Addresses  (in network byte order)
  } deriving (Read, Show)

hostEntryTc = mkTyCon "hostEntry"; instance Typeable HostEntry where { typeOf _ = mkTyConApp hostEntryTc [] }

instance Storable HostEntry where
   sizeOf    _ = 16
{-# LINE 366 "Network\BSD.hsc" #-}
   alignment _ = alignment (undefined :: CInt) -- ???

   peek p = do
        h_name       <- ((\hsc_ptr -> peekByteOff hsc_ptr 0)) p >>= peekCString
{-# LINE 370 "Network\BSD.hsc" #-}
        h_aliases    <- ((\hsc_ptr -> peekByteOff hsc_ptr 4)) p
{-# LINE 371 "Network\BSD.hsc" #-}
                                >>= peekArray0 nullPtr
                                >>= mapM peekCString
        h_addrtype   <- ((\hsc_ptr -> peekByteOff hsc_ptr 8)) p
{-# LINE 374 "Network\BSD.hsc" #-}
        -- h_length       <- (#peek struct hostent, h_length) p
        h_addr_list  <- ((\hsc_ptr -> peekByteOff hsc_ptr 12)) p
{-# LINE 376 "Network\BSD.hsc" #-}
                                >>= peekArray0 nullPtr
                                >>= mapM peek
        return (HostEntry {
                        hostName       = h_name,
                        hostAliases    = h_aliases,
                        hostFamily     = unpackFamily h_addrtype,
                        hostAddresses  = h_addr_list
                })

   poke p = error "Storable.poke(BSD.ServiceEntry) not implemented"


-- convenience function:
hostAddress :: HostEntry -> HostAddress
hostAddress (HostEntry nm _ _ ls) =
 case ls of
   []    -> error ("BSD.hostAddress: empty network address list for " ++ nm)
   (x:_) -> x

-- getHostByName must use the same lock as the *hostent functions
-- may cause problems if called concurrently.

-- | Resolve a 'HostName' to IPv4 address.
getHostByName :: HostName -> IO HostEntry
getHostByName name = withLock $ do
  withCString name $ \ name_cstr -> do
   ent <- throwNoSuchThingIfNull "getHostByName" "no such host entry"
    		$ trySysCall $ c_gethostbyname name_cstr
   peek ent

foreign import ccall safe "gethostbyname" 
   c_gethostbyname :: CString -> IO (Ptr HostEntry)


-- The locking of gethostbyaddr is similar to gethostbyname.
-- | Get a 'HostEntry' corresponding to the given address and family.
-- Note that only IPv4 is currently supported.
getHostByAddr :: Family -> HostAddress -> IO HostEntry
getHostByAddr family addr = do
 with addr $ \ ptr_addr -> withLock $ do
 throwNoSuchThingIfNull 	"getHostByAddr" "no such host entry"
   $ trySysCall $ c_gethostbyaddr ptr_addr (fromIntegral (sizeOf addr)) (packFamily family)
 >>= peek

foreign import ccall safe "gethostbyaddr"
   c_gethostbyaddr :: Ptr HostAddress -> CInt -> CInt -> IO (Ptr HostEntry)


{-# LINE 447 "Network\BSD.hsc" #-}

-- ---------------------------------------------------------------------------
-- Accessing network information

-- Same set of access functions as for accessing host,protocol and
-- service system info, this time for the types of networks supported.

-- network addresses are represented in host byte order.
type NetworkAddr = CULong

type NetworkName = String

data NetworkEntry =
  NetworkEntry {
     networkName	:: NetworkName,   -- official name
     networkAliases	:: [NetworkName], -- aliases
     networkFamily	:: Family,	   -- type
     networkAddress	:: NetworkAddr
   } deriving (Read, Show)

networkEntryTc = mkTyCon "NetworkEntry"; instance Typeable NetworkEntry where { typeOf _ = mkTyConApp networkEntryTc [] }

instance Storable NetworkEntry where
   sizeOf    _ = 16
{-# LINE 471 "Network\BSD.hsc" #-}
   alignment _ = alignment (undefined :: CInt) -- ???

   peek p = do
        n_name         <- ((\hsc_ptr -> peekByteOff hsc_ptr 0)) p >>= peekCString
{-# LINE 475 "Network\BSD.hsc" #-}
        n_aliases      <- ((\hsc_ptr -> peekByteOff hsc_ptr 4)) p
{-# LINE 476 "Network\BSD.hsc" #-}
                                >>= peekArray0 nullPtr
                                >>= mapM peekCString
        n_addrtype     <- ((\hsc_ptr -> peekByteOff hsc_ptr 8)) p
{-# LINE 479 "Network\BSD.hsc" #-}
        n_net          <- ((\hsc_ptr -> peekByteOff hsc_ptr 12)) p
{-# LINE 480 "Network\BSD.hsc" #-}
        return (NetworkEntry {
                        networkName      = n_name,
                        networkAliases   = n_aliases,
                        networkFamily    = unpackFamily (fromIntegral 
                                                        (n_addrtype :: CInt)),
                        networkAddress   = n_net
                })

   poke p = error "Storable.poke(BSD.NetEntry) not implemented"



{-# LINE 539 "Network\BSD.hsc" #-}

-- Mutex for name service lockdown

{-# NOINLINE lock #-}
lock :: MVar ()
lock = unsafePerformIO $ newMVar ()

withLock :: IO a -> IO a
withLock act = withMVar lock (\_ -> act)

-- ---------------------------------------------------------------------------
-- Miscellaneous Functions

-- | Calling getHostName returns the standard host name for the current
-- processor, as set at boot time.

getHostName :: IO HostName
getHostName = do
  let size = 256
  allocaArray0 size $ \ cstr -> do
    throwSocketErrorIfMinus1_ "getHostName" $ c_gethostname cstr (fromIntegral size)
    peekCString cstr

foreign import ccall unsafe "gethostname" 
   c_gethostname :: CString -> CSize -> IO CInt

-- Helper function used by the exported functions that provides a
-- Haskellised view of the enumerator functions:

getEntries :: IO a  -- read
           -> IO () -- at end
	   -> IO [a]
getEntries getOne atEnd = loop
  where
    loop = do
      vv <- catch (liftM Just getOne) ((const.return) Nothing)
      case vv of
        Nothing -> return []
        Just v  -> loop >>= \ vs -> atEnd >> return (v:vs)


-- ---------------------------------------------------------------------------
-- Symbolic links


{-# LINE 594 "Network\BSD.hsc" #-}


{-# LINE 608 "Network\BSD.hsc" #-}

-- ---------------------------------------------------------------------------
-- Winsock only:
--   The BSD API networking calls made locally return NULL upon failure.
--   That failure may very well be due to WinSock not being initialised,
--   so if NULL is seen try init'ing and repeat the call.

{-# LINE 617 "Network\BSD.hsc" #-}
trySysCall act = do
  ptr <- act
  if (ptr == nullPtr)
   then withSocketsDo act
   else return ptr

{-# LINE 623 "Network\BSD.hsc" #-}

throwNoSuchThingIfNull :: String -> String -> IO (Ptr a) -> IO (Ptr a)
throwNoSuchThingIfNull loc desc act = do
  ptr <- act
  if (ptr == nullPtr)
   then ioError (IOError Nothing NoSuchThing loc desc Nothing)
   else return ptr
