--------------------------------------------------------------------------------
-- |
-- Module      :  Graphics.Rendering.OpenGL.GL.BasicTypes
-- Copyright   :  (c) Sven Panne 2002-2005
-- License     :  BSD-style (see the file libraries/OpenGL/LICENSE)
-- 
-- Maintainer  :  sven.panne@aedion.de
-- Stability   :  provisional
-- Portability :  portable
--
-- This module corresponds to section 2.3 (GL Command Sytax) of the OpenGL 1.5
-- specs.
--
--------------------------------------------------------------------------------

module Graphics.Rendering.OpenGL.GL.BasicTypes (
   GLenum, GLboolean, GLbitfield, GLbyte, GLshort, GLint, GLintptr, GLubyte,
   GLushort, GLuint, GLsizei, GLsizeiptr, GLfloat, GLclampf, GLdouble, GLclampd,
   Capability(..)
) where

--------------------------------------------------------------------------------

import Data.Int
import Data.Word

--------------------------------------------------------------------------------

                                                         
                                                                               

                                                    


                                                            


                                                          


                                                         


                                                        


                                                           


                                                         


                                                             
                              

                                                            
                             

                                                         


                                                         


                                                          


                                                         


                                                           


                                                            


                                                         


                                           


                                          


                                       


                                         


                                         


                                         


                                       


                                        


                                      


                                        


                                        


                                        


                                       


                                         


                                                                              


                                              


                                                          


                                                          


                                            


                                                      


                                                             
                              

                                                                      
                              



--------------------------------------------------------------------------------

-- | Enumerated binary integer value (min. 32 bits)
type GLenum = Word32

-- | Boolean (min. 1 bit)
type GLboolean = Word8

-- | Bit field (min. 32 bits)
type GLbitfield = Word32

-- | Signed 2\'s complement binary integer (min. 8 bits)
type GLbyte = Int8

-- | Signed 2\'s complement binary integer (min. 16 bits)
type GLshort = Int16

-- | Signed 2\'s complement binary integer (min. 32 bits)
type GLint = Int32

-- | Signed 2\'s complement binary integer (sufficiently large enough to hold
-- any address)
type GLintptr = Int32 -- TODO: Use autoconf stuff for this!

-- | Unsigned binary integer (min. 8 bits)
type GLubyte = Word8

-- | Unsigned binary integer (min. 16 bits)
type GLushort = Word16

-- | Unsigned binary integer (min. 32 bits)
type GLuint = Word32

-- | Non-negatitve binary integer size (min. 32 bits)
type GLsizei = Int32

-- | Non-negatitve binary integer size (sufficiently large enough to hold any
-- address)
type GLsizeiptr = Int32 -- TODO: Use autoconf stuff for this!

-- | Floating-point value (min. 32 bits)
type GLfloat = Float

-- | Floating-point value clamped to [0,1] (min. 32 bits)
type GLclampf = Float

-- | Floating-point value (min. 64 bits)
type GLdouble = Double

-- | Floating-point value clamped to [0,1] (min. 64 bits)
type GLclampd = Double

--------------------------------------------------------------------------------

data Capability =
     Disabled
   | Enabled
   deriving ( Eq, Ord, Show )
