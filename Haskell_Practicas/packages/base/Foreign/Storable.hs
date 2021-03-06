{-# OPTIONS_GHC -fno-implicit-prelude #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Foreign.Storable
-- Copyright   :  (c) The FFI task force 2001
-- License     :  see libraries/base/LICENSE
-- 
-- Maintainer  :  ffi@haskell.org
-- Stability   :  provisional
-- Portability :  portable
--
-- The module "Foreign.Storable" provides most elementary support for
-- marshalling and is part of the language-independent portion of the
-- Foreign Function Interface (FFI), and will normally be imported via
-- the "Foreign" module.
--
-----------------------------------------------------------------------------

module Foreign.Storable
	( Storable(
	     sizeOf,         -- :: a -> Int
	     alignment,      -- :: a -> Int
	     peekElemOff,    -- :: Ptr a -> Int      -> IO a
	     pokeElemOff,    -- :: Ptr a -> Int -> a -> IO ()
	     peekByteOff,    -- :: Ptr b -> Int      -> IO a
	     pokeByteOff,    -- :: Ptr b -> Int -> a -> IO ()
	     peek,           -- :: Ptr a             -> IO a
	     poke)           -- :: Ptr a        -> a -> IO ()
        ) where







import Control.Monad		( liftM )

                                                                                                                                                                                                        

                                                    
                                                                          

                               
                                                                                                            







                                                      












                                                         












                                


                                  


                                 


                               


                                


                                     


                                 


                                         


                                        


                                         


                                              


                                          


                                  


                                                        


                                                         


                                                        


                                                        


                                                      
                          

                                                       
                           

                                                          
                              

                                                      
                       

                                                           


                                                         


                                                         


                                                         


                                                      
                       

                                                         


                                                         


                                                         


                                                          


                                                         


                                                               
                                

                                                           


                                                            


                                                             
                              

                                                            
                             

                                                           


                                                            


                                                              
                               

                                                                      
                            

                                                          
                           

                                                  


                                                   
                       

                                                       


                                                         


                                                        


                                                         
                          

                                                          


                                                          


                                                   
                    

                                                                              


                                              


                                                          


                                                          


                                            


                                                  


                                                    


                                                   


                                                 


                                                  


                                                       


                                                   


                                                           


                                                          


                                                           


                                                                


                                                            


                                                    


                                                      


                                                                           


                                                            
                  

                                                                                                           
                   


















































                                                       
                                                                             

                         


                          


                              


                                 


                        


                                


                          


                            


                         


                           


                           


                         


                          


                         


                                


                                


                              


                           


                                


                          


                        


                          


                          


                          


                         


                          


                             


                                


                         


                          


                               


                         


                          


                       


                           


                          


                         


                          


                          


                            


                             


                                


                            


                             


                               


                          


                           


                            


                           


                          


                          


                           


                          


                           


                          


                          


                          


                               


                          


                         


                          


                          


                           


                            


                           


                             


                            


                          


                         


                              


                         


                                


                         


                            


                                


                                 


                                


                          


                                   


                              


                          


                           


                           


                         


                                


                            


                             


                                   


                          


                         


                          


                          


                         


                             


                                


                           


                          


                               


                         


                            


                           


                           


                          


                           


                           


                          


                          


                          


                          


                           


                           


                           


                           


                           


                           


                           


                          


                           


                           


                           


                           


                           


                          


                           


                           


                             


                           


                           


                             


                           


                           


                           


                               


                               


                                                        


                                                        


                                                   


                                                       


                                                      
                          

                                                           


                                                      


                                                         
                             

                                                         


                                                   
                       

                                                         


                                                       
                           

                                                     
                         

                                                        
                         

                                                         


                                                         


                                                         


                                                          


                                                         


                                                               
                                

                                                           


                                                            


                                                          
                           

                                                       


                                                         


                                                         


                                                     


                                     
                       

                                     


                                        


                                      


                                       


                                      


                                      
                        

                                      


                                    


                                         


                                         


                                     


                                          


                                       


                                        
                          

                                      


                                      


                                          


                                       
                         

                                      


                                            


                                             


                                       


                                        
                          

                                        


                                         
                           

                                       


                                      
                        

                                          


                                          


                                              


                                             


                                              


                                                   


                                               


                                        


                                       


                                                                              


                                              


                                                          


                                                          


                                            


                                           


                                                      


                                                                       
                              

                                                 
                         
















import Data.Int
import Data.Word
import Foreign.StablePtr



import Hugs.Prelude
import Hugs.Ptr
import Hugs.Storable


{- |
The member functions of this class facilitate writing values of
primitive types to raw memory (which may have been allocated with the
above mentioned routines) and reading values from blocks of raw
memory.  The class, furthermore, includes support for computing the
storage requirements and alignment restrictions of storable types.

Memory addresses are represented as values of type @'Ptr' a@, for some
@a@ which is an instance of class 'Storable'.  The type argument to
'Ptr' helps provide some valuable type safety in FFI code (you can\'t
mix pointers of different types without an explicit cast), while
helping the Haskell type system figure out which marshalling method is
needed for a given pointer.

All marshalling between Haskell and a foreign language ultimately
boils down to translating Haskell data structures into the binary
representation of a corresponding data structure of the foreign
language and vice versa.  To code this marshalling in Haskell, it is
necessary to manipulate primitive data types stored in unstructured
memory blocks.  The class 'Storable' facilitates this manipulation on
all types for which it is instantiated, which are the standard basic
types of Haskell, the fixed size @Int@ types ('Int8', 'Int16',
'Int32', 'Int64'), the fixed size @Word@ types ('Word8', 'Word16',
'Word32', 'Word64'), 'StablePtr', all types from "Foreign.C.Types",
as well as 'Ptr'.

Minimal complete definition: 'sizeOf', 'alignment', one of 'peek',
'peekElemOff' and 'peekByteOff', and one of 'poke', 'pokeElemOff' and
'pokeByteOff'.
-}

class Storable a where

   sizeOf      :: a -> Int
   -- ^ Computes the storage requirements (in bytes) of the argument.
   -- The value of the argument is not used.

   alignment   :: a -> Int
   -- ^ Computes the alignment constraint of the argument.  An
   -- alignment constraint @x@ is fulfilled by any address divisible
   -- by @x@.  The value of the argument is not used.

   peekElemOff :: Ptr a -> Int      -> IO a
   -- ^       Read a value from a memory area regarded as an array
   --         of values of the same kind.  The first argument specifies
   --         the start address of the array and the second the index into
   --         the array (the first element of the array has index
   --         @0@).  The following equality holds,
   -- 
   -- > peekElemOff addr idx = IOExts.fixIO $ \result ->
   -- >   peek (addr `plusPtr` (idx * sizeOf result))
   --
   --         Note that this is only a specification, not
   --         necessarily the concrete implementation of the
   --         function.

   pokeElemOff :: Ptr a -> Int -> a -> IO ()
   -- ^       Write a value to a memory area regarded as an array of
   --         values of the same kind.  The following equality holds:
   -- 
   -- > pokeElemOff addr idx x = 
   -- >   poke (addr `plusPtr` (idx * sizeOf x)) x

   peekByteOff :: Ptr b -> Int      -> IO a
   -- ^       Read a value from a memory location given by a base
   --         address and offset.  The following equality holds:
   --
   -- > peekByteOff addr off = peek (addr `plusPtr` off)

   pokeByteOff :: Ptr b -> Int -> a -> IO ()
   -- ^       Write a value to a memory location given by a base
   --         address and offset.  The following equality holds:
   --
   -- > pokeByteOff addr off x = poke (addr `plusPtr` off) x
  
   peek        :: Ptr a      -> IO a
   -- ^ Read a value from the given memory location.
   --
   --  Note that the peek and poke functions might require properly
   --  aligned addresses to function correctly.  This is architecture
   --  dependent; thus, portable code should ensure that when peeking or
   --  poking values of some type @a@, the alignment
   --  constraint for @a@, as given by the function
   --  'alignment' is fulfilled.

   poke        :: Ptr a -> a -> IO ()
   -- ^ Write the given value to the given memory location.  Alignment
   -- restrictions might apply; see 'peek'.
 
   -- circular default instances





   peekElemOff ptr off = peekByteOff ptr (off * sizeOfPtr ptr undefined)

   pokeElemOff ptr off val = pokeByteOff ptr (off * sizeOf val) val

   peekByteOff ptr off = peek (ptr `plusPtr` off)
   pokeByteOff ptr off = poke (ptr `plusPtr` off)

   peek ptr = peekElemOff ptr 0
   poke ptr = pokeElemOff ptr 0


sizeOfPtr :: Storable a => Ptr a -> a -> Int
sizeOfPtr px x = sizeOf x


-- System-dependent, but rather obvious instances

instance Storable Bool where
   sizeOf _          = sizeOf (undefined::Int32)
   alignment _       = alignment (undefined::Int32)
   peekElemOff p i   = liftM (/= (0::Int32)) $ peekElemOff (castPtr p) i
   pokeElemOff p i x = pokeElemOff (castPtr p) i (if x then 1 else 0::Int32)












instance Storable (Char) where {			    sizeOf    _ = 4;				    alignment _ = 4;			    peekElemOff = readCharOffPtr;				    pokeElemOff = writeCharOffPtr }


instance Storable (Int) where {			    sizeOf    _ = 4;				    alignment _ = 4;			    peekElemOff = readIntOffPtr;				    pokeElemOff = writeIntOffPtr }


instance Storable (Word) where {			    sizeOf    _ = 4;				    alignment _ = 4;			    peekElemOff = readWordOffPtr;				    pokeElemOff = writeWordOffPtr }


instance Storable ((Ptr a)) where {			    sizeOf    _ = 4;				    alignment _ = 4;			    peekElemOff = readPtrOffPtr;				    pokeElemOff = writePtrOffPtr }

instance Storable ((FunPtr a)) where {			    sizeOf    _ = 4;				    alignment _ = 4;			    peekElemOff = readFunPtrOffPtr;				    pokeElemOff = writeFunPtrOffPtr }

instance Storable ((StablePtr a)) where {			    sizeOf    _ = 4;				    alignment _ = 4;			    peekElemOff = readStablePtrOffPtr;				    pokeElemOff = writeStablePtrOffPtr }

instance Storable (Float) where {			    sizeOf    _ = 4;				    alignment _ = 4;			    peekElemOff = readFloatOffPtr;				    pokeElemOff = writeFloatOffPtr }

instance Storable (Double) where {			    sizeOf    _ = 8;				    alignment _ = 8;			    peekElemOff = readDoubleOffPtr;				    pokeElemOff = writeDoubleOffPtr }

instance Storable (Word8) where {			    sizeOf    _ = 1;				    alignment _ = 1;			    peekElemOff = readWord8OffPtr;				    pokeElemOff = writeWord8OffPtr }

instance Storable (Word16) where {			    sizeOf    _ = 2;				    alignment _ = 2;			    peekElemOff = readWord16OffPtr;				    pokeElemOff = writeWord16OffPtr }

instance Storable (Word32) where {			    sizeOf    _ = 4;				    alignment _ = 4;			    peekElemOff = readWord32OffPtr;				    pokeElemOff = writeWord32OffPtr }

instance Storable (Word64) where {			    sizeOf    _ = 8;				    alignment _ = 8;			    peekElemOff = readWord64OffPtr;				    pokeElemOff = writeWord64OffPtr }

instance Storable (Int8) where {			    sizeOf    _ = 1;				    alignment _ = 1;			    peekElemOff = readInt8OffPtr;				    pokeElemOff = writeInt8OffPtr }

instance Storable (Int16) where {			    sizeOf    _ = 2;				    alignment _ = 2;			    peekElemOff = readInt16OffPtr;				    pokeElemOff = writeInt16OffPtr }

instance Storable (Int32) where {			    sizeOf    _ = 4;				    alignment _ = 4;			    peekElemOff = readInt32OffPtr;				    pokeElemOff = writeInt32OffPtr }

instance Storable (Int64) where {			    sizeOf    _ = 8;				    alignment _ = 8;			    peekElemOff = readInt64OffPtr;				    pokeElemOff = writeInt64OffPtr }


