{-# OPTIONS_GHC -#include "HsBase.h" #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Data.Array.IO.Internal
-- Copyright   :  (c) The University of Glasgow 2001
-- License     :  BSD-style (see the file libraries/base/LICENSE)
-- 
-- Maintainer  :  libraries@haskell.org
-- Stability   :  experimental
-- Portability :  non-portable (uses Data.Array.Base)
--
-- Mutable boxed and unboxed arrays in the IO monad.
--
-----------------------------------------------------------------------------

-- #hide
module Data.Array.IO.Internals (
   IOArray(..),		-- instance of: Eq, Typeable
   IOUArray(..),	-- instance of: Eq, Typeable
   castIOUArray,	-- :: IOUArray ix a -> IO (IOUArray ix b)
 ) where

import Prelude

import Data.Array.MArray
import Data.Int
import Data.Word
import Data.Typeable


import Hugs.IOArray


import Control.Monad.ST		( RealWorld, stToIO )
import Foreign.Ptr		( Ptr, FunPtr )
import Foreign.StablePtr	( StablePtr )
import Data.Array.Base






                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
























































iOArrayTc = mkTyCon "IOArray"; instance Typeable2 IOArray where { typeOf2 _ = mkTyConApp iOArrayTc [] }; instance Typeable a => Typeable1 (IOArray a) where {   typeOf1 = typeOf1Default }; instance (Typeable a, Typeable b) => Typeable (IOArray a b) where {   typeOf = typeOfDefault }

-----------------------------------------------------------------------------
-- | Instance declarations for 'IOArray's








instance HasBounds IOArray where
    bounds      = boundsIOArray


instance MArray IOArray e IO where
    newArray    = newIOArray
    unsafeRead  = unsafeReadIOArray
    unsafeWrite = unsafeWriteIOArray

-----------------------------------------------------------------------------
-- Flat unboxed mutable arrays (IO monad)

-- | Mutable, unboxed, strict arrays in the 'IO' monad.  The type
-- arguments are as follows:
--
--  * @i@: the index type of the array (should be an instance of 'Ix')
--
--  * @e@: the element type of the array.  Only certain element types
--    are supported: see "Data.Array.MArray" for a list of instances.
--
newtype IOUArray i e = IOUArray (STUArray RealWorld i e)

iOUArrayTc = mkTyCon "IOUArray"; instance Typeable2 IOUArray where { typeOf2 _ = mkTyConApp iOUArrayTc [] }; instance Typeable a => Typeable1 (IOUArray a) where {   typeOf1 = typeOf1Default }; instance (Typeable a, Typeable b) => Typeable (IOUArray a b) where {   typeOf = typeOfDefault }

instance HasBounds IOUArray where
    {-# INLINE bounds #-}
    bounds (IOUArray marr) = bounds marr

instance MArray IOUArray Bool IO where
    {-# INLINE newArray #-}
    newArray lu init = stToIO $ do
        marr <- newArray lu init; return (IOUArray marr)
    {-# INLINE newArray_ #-}
    newArray_ lu = stToIO $ do
        marr <- newArray_ lu; return (IOUArray marr)
    {-# INLINE unsafeRead #-}
    unsafeRead (IOUArray marr) i = stToIO (unsafeRead marr i)
    {-# INLINE unsafeWrite #-}
    unsafeWrite (IOUArray marr) i e = stToIO (unsafeWrite marr i e)

instance MArray IOUArray Char IO where
    {-# INLINE newArray #-}
    newArray lu init = stToIO $ do
        marr <- newArray lu init; return (IOUArray marr)
    {-# INLINE newArray_ #-}
    newArray_ lu = stToIO $ do
        marr <- newArray_ lu; return (IOUArray marr)
    {-# INLINE unsafeRead #-}
    unsafeRead (IOUArray marr) i = stToIO (unsafeRead marr i)
    {-# INLINE unsafeWrite #-}
    unsafeWrite (IOUArray marr) i e = stToIO (unsafeWrite marr i e)

instance MArray IOUArray Int IO where
    {-# INLINE newArray #-}
    newArray lu init = stToIO $ do
        marr <- newArray lu init; return (IOUArray marr)
    {-# INLINE newArray_ #-}
    newArray_ lu = stToIO $ do
        marr <- newArray_ lu; return (IOUArray marr)
    {-# INLINE unsafeRead #-}
    unsafeRead (IOUArray marr) i = stToIO (unsafeRead marr i)
    {-# INLINE unsafeWrite #-}
    unsafeWrite (IOUArray marr) i e = stToIO (unsafeWrite marr i e)

instance MArray IOUArray Word IO where
    {-# INLINE newArray #-}
    newArray lu init = stToIO $ do
        marr <- newArray lu init; return (IOUArray marr)
    {-# INLINE newArray_ #-}
    newArray_ lu = stToIO $ do
        marr <- newArray_ lu; return (IOUArray marr)
    {-# INLINE unsafeRead #-}
    unsafeRead (IOUArray marr) i = stToIO (unsafeRead marr i)
    {-# INLINE unsafeWrite #-}
    unsafeWrite (IOUArray marr) i e = stToIO (unsafeWrite marr i e)

instance MArray IOUArray (Ptr a) IO where
    {-# INLINE newArray #-}
    newArray lu init = stToIO $ do
        marr <- newArray lu init; return (IOUArray marr)
    {-# INLINE newArray_ #-}
    newArray_ lu = stToIO $ do
        marr <- newArray_ lu; return (IOUArray marr)
    {-# INLINE unsafeRead #-}
    unsafeRead (IOUArray marr) i = stToIO (unsafeRead marr i)
    {-# INLINE unsafeWrite #-}
    unsafeWrite (IOUArray marr) i e = stToIO (unsafeWrite marr i e)

instance MArray IOUArray (FunPtr a) IO where
    {-# INLINE newArray #-}
    newArray lu init = stToIO $ do
        marr <- newArray lu init; return (IOUArray marr)
    {-# INLINE newArray_ #-}
    newArray_ lu = stToIO $ do
        marr <- newArray_ lu; return (IOUArray marr)
    {-# INLINE unsafeRead #-}
    unsafeRead (IOUArray marr) i = stToIO (unsafeRead marr i)
    {-# INLINE unsafeWrite #-}
    unsafeWrite (IOUArray marr) i e = stToIO (unsafeWrite marr i e)

instance MArray IOUArray Float IO where
    {-# INLINE newArray #-}
    newArray lu init = stToIO $ do
        marr <- newArray lu init; return (IOUArray marr)
    {-# INLINE newArray_ #-}
    newArray_ lu = stToIO $ do
        marr <- newArray_ lu; return (IOUArray marr)
    {-# INLINE unsafeRead #-}
    unsafeRead (IOUArray marr) i = stToIO (unsafeRead marr i)
    {-# INLINE unsafeWrite #-}
    unsafeWrite (IOUArray marr) i e = stToIO (unsafeWrite marr i e)

instance MArray IOUArray Double IO where
    {-# INLINE newArray #-}
    newArray lu init = stToIO $ do
        marr <- newArray lu init; return (IOUArray marr)
    {-# INLINE newArray_ #-}
    newArray_ lu = stToIO $ do
        marr <- newArray_ lu; return (IOUArray marr)
    {-# INLINE unsafeRead #-}
    unsafeRead (IOUArray marr) i = stToIO (unsafeRead marr i)
    {-# INLINE unsafeWrite #-}
    unsafeWrite (IOUArray marr) i e = stToIO (unsafeWrite marr i e)

instance MArray IOUArray (StablePtr a) IO where
    {-# INLINE newArray #-}
    newArray lu init = stToIO $ do
        marr <- newArray lu init; return (IOUArray marr)
    {-# INLINE newArray_ #-}
    newArray_ lu = stToIO $ do
        marr <- newArray_ lu; return (IOUArray marr)
    {-# INLINE unsafeRead #-}
    unsafeRead (IOUArray marr) i = stToIO (unsafeRead marr i)
    {-# INLINE unsafeWrite #-}
    unsafeWrite (IOUArray marr) i e = stToIO (unsafeWrite marr i e)

instance MArray IOUArray Int8 IO where
    {-# INLINE newArray #-}
    newArray lu init = stToIO $ do
        marr <- newArray lu init; return (IOUArray marr)
    {-# INLINE newArray_ #-}
    newArray_ lu = stToIO $ do
        marr <- newArray_ lu; return (IOUArray marr)
    {-# INLINE unsafeRead #-}
    unsafeRead (IOUArray marr) i = stToIO (unsafeRead marr i)
    {-# INLINE unsafeWrite #-}
    unsafeWrite (IOUArray marr) i e = stToIO (unsafeWrite marr i e)

instance MArray IOUArray Int16 IO where
    {-# INLINE newArray #-}
    newArray lu init = stToIO $ do
        marr <- newArray lu init; return (IOUArray marr)
    {-# INLINE newArray_ #-}
    newArray_ lu = stToIO $ do
        marr <- newArray_ lu; return (IOUArray marr)
    {-# INLINE unsafeRead #-}
    unsafeRead (IOUArray marr) i = stToIO (unsafeRead marr i)
    {-# INLINE unsafeWrite #-}
    unsafeWrite (IOUArray marr) i e = stToIO (unsafeWrite marr i e)

instance MArray IOUArray Int32 IO where
    {-# INLINE newArray #-}
    newArray lu init = stToIO $ do
        marr <- newArray lu init; return (IOUArray marr)
    {-# INLINE newArray_ #-}
    newArray_ lu = stToIO $ do
        marr <- newArray_ lu; return (IOUArray marr)
    {-# INLINE unsafeRead #-}
    unsafeRead (IOUArray marr) i = stToIO (unsafeRead marr i)
    {-# INLINE unsafeWrite #-}
    unsafeWrite (IOUArray marr) i e = stToIO (unsafeWrite marr i e)

instance MArray IOUArray Int64 IO where
    {-# INLINE newArray #-}
    newArray lu init = stToIO $ do
        marr <- newArray lu init; return (IOUArray marr)
    {-# INLINE newArray_ #-}
    newArray_ lu = stToIO $ do
        marr <- newArray_ lu; return (IOUArray marr)
    {-# INLINE unsafeRead #-}
    unsafeRead (IOUArray marr) i = stToIO (unsafeRead marr i)
    {-# INLINE unsafeWrite #-}
    unsafeWrite (IOUArray marr) i e = stToIO (unsafeWrite marr i e)

instance MArray IOUArray Word8 IO where
    {-# INLINE newArray #-}
    newArray lu init = stToIO $ do
        marr <- newArray lu init; return (IOUArray marr)
    {-# INLINE newArray_ #-}
    newArray_ lu = stToIO $ do
        marr <- newArray_ lu; return (IOUArray marr)
    {-# INLINE unsafeRead #-}
    unsafeRead (IOUArray marr) i = stToIO (unsafeRead marr i)
    {-# INLINE unsafeWrite #-}
    unsafeWrite (IOUArray marr) i e = stToIO (unsafeWrite marr i e)

instance MArray IOUArray Word16 IO where
    {-# INLINE newArray #-}
    newArray lu init = stToIO $ do
        marr <- newArray lu init; return (IOUArray marr)
    {-# INLINE newArray_ #-}
    newArray_ lu = stToIO $ do
        marr <- newArray_ lu; return (IOUArray marr)
    {-# INLINE unsafeRead #-}
    unsafeRead (IOUArray marr) i = stToIO (unsafeRead marr i)
    {-# INLINE unsafeWrite #-}
    unsafeWrite (IOUArray marr) i e = stToIO (unsafeWrite marr i e)

instance MArray IOUArray Word32 IO where
    {-# INLINE newArray #-}
    newArray lu init = stToIO $ do
        marr <- newArray lu init; return (IOUArray marr)
    {-# INLINE newArray_ #-}
    newArray_ lu = stToIO $ do
        marr <- newArray_ lu; return (IOUArray marr)
    {-# INLINE unsafeRead #-}
    unsafeRead (IOUArray marr) i = stToIO (unsafeRead marr i)
    {-# INLINE unsafeWrite #-}
    unsafeWrite (IOUArray marr) i e = stToIO (unsafeWrite marr i e)

instance MArray IOUArray Word64 IO where
    {-# INLINE newArray #-}
    newArray lu init = stToIO $ do
        marr <- newArray lu init; return (IOUArray marr)
    {-# INLINE newArray_ #-}
    newArray_ lu = stToIO $ do
        marr <- newArray_ lu; return (IOUArray marr)
    {-# INLINE unsafeRead #-}
    unsafeRead (IOUArray marr) i = stToIO (unsafeRead marr i)
    {-# INLINE unsafeWrite #-}
    unsafeWrite (IOUArray marr) i e = stToIO (unsafeWrite marr i e)

-- | Casts an 'IOUArray' with one element type into one with a
-- different element type.  All the elements of the resulting array
-- are undefined (unless you know what you\'re doing...).
castIOUArray :: IOUArray ix a -> IO (IOUArray ix b)
castIOUArray (IOUArray marr) = stToIO $ do
    marr' <- castSTUArray marr
    return (IOUArray marr')

