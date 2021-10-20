--------------------------------------------------------------------------------
-- |
-- Module      :  Graphics.Rendering.OpenGL.GL.VertexSpec
-- Copyright   :  (c) Sven Panne 2002-2005
-- License     :  BSD-style (see the file libraries/OpenGL/LICENSE)
-- 
-- Maintainer  :  sven.panne@aedion.de
-- Stability   :  provisional
-- Portability :  portable
--
-- This module corresponds to section 2.7 (Vertex Specification) of the
-- OpenGL 1.5 specs.
--
--------------------------------------------------------------------------------

module Graphics.Rendering.OpenGL.GL.VertexSpec (
   -- * Vertex Coordinates
   Vertex(..),
   VertexComponent,
   Vertex2(..), Vertex3(..), Vertex4(..),

   -- * Auxiliary Vertex Attributes
   -- $AuxiliaryVertexAttributes

   -- ** Texture Coordinates
   currentTextureCoords, TexCoord(..),
   TexCoordComponent,
   TexCoord1(..), TexCoord2(..), TexCoord3(..), TexCoord4(..),

   -- ** Normal
   currentNormal, Normal(..),
   NormalComponent,
   Normal3(..),

   -- ** Fog Coordinate
   currentFogCoord, FogCoord(..),
   FogCoordComponent,
   FogCoord1(..),

   -- ** Color and Secondary Color
   rgbaMode,
   currentColor, Color(..),
   currentSecondaryColor, SecondaryColor(..),
   ColorComponent,
   Color3(..), Color4(..),

   currentIndex, Index(..),
   IndexComponent,
   Index1(..),

   -- * Texture Units
   TextureUnit(..), maxTextureUnit
) where

import Data.Int
import Data.Word
import Foreign.Ptr ( Ptr, castPtr )
import Foreign.Storable ( Storable(..) )
import Graphics.Rendering.OpenGL.GL.BasicTypes (
   GLenum, GLbyte, GLshort, GLint, GLubyte, GLushort, GLuint, GLfloat,
   GLdouble )
import Graphics.Rendering.OpenGL.GL.Extensions (
   FunPtr, unsafePerformIO, Invoker, getProcAddress )
import Graphics.Rendering.OpenGL.GL.GLboolean ( unmarshalGLboolean )
import Graphics.Rendering.OpenGL.GL.PeekPoke (
   poke1, poke2, poke3, poke4,
   peek1, peek2, peek3, peek4 )
import Graphics.Rendering.OpenGL.GL.QueryUtils (
   GetPName(GetCurrentTextureCoords, GetCurrentNormal, GetCurrentFogCoord,
            GetCurrentColor, GetCurrentSecondaryColor, GetCurrentIndex,
            GetMaxTextureUnits,GetRGBAMode),
   getBoolean1, getInteger1, getEnum1, getFloat1, getFloat3, getFloat4 )
import Graphics.Rendering.OpenGL.GL.StateVar (
   GettableStateVar, makeGettableStateVar, StateVar, makeStateVar )
import Graphics.Rendering.OpenGL.GL.Texturing.TextureUnit (
   TextureUnit(..), marshalTextureUnit, unmarshalTextureUnit )

--------------------------------------------------------------------------------

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         




                                                                                                                                                                          











                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    




                                                         
                                                                               

                                                    


                                                            


                                                          


                                                         


                                                        


                                                           


                                                         


                                                             
                              

                                                            
                             

                                                         


                                                         


                                                          


                                                         


                                                           


                                                            


                                                         


                                           


                                          


                                       


                                         


                                         


                                         


                                       


                                        


                                      


                                        


                                        


                                        


                                       


                                         


                                                                              


                                              


                                                          


                                                          


                                            


                                                      


                                                             
                              

                                                                      
                              



                                                                                                                     
























--------------------------------------------------------------------------------

-- | The class of all types which can be used as a vertex coordinate.

class VertexComponent a where
   vertex2 :: a -> a -> IO ()
   vertex3 :: a -> a -> a -> IO ()
   vertex4 :: a -> a -> a -> a -> IO ()

   vertex2v :: Ptr a -> IO ()
   vertex3v :: Ptr a -> IO ()
   vertex4v :: Ptr a -> IO ()

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glVertex2s" glVertex2s ::
   GLshort -> GLshort -> IO ()

foreign import stdcall unsafe "glVertex3s" glVertex3s ::
   GLshort -> GLshort -> GLshort -> IO ()

foreign import stdcall unsafe "glVertex4s" glVertex4s ::
   GLshort -> GLshort -> GLshort -> GLshort -> IO ()

foreign import stdcall unsafe "glVertex2sv" glVertex2sv ::
   Ptr GLshort -> IO ()

foreign import stdcall unsafe "glVertex3sv" glVertex3sv ::
   Ptr GLshort -> IO ()

foreign import stdcall unsafe "glVertex4sv" glVertex4sv ::
   Ptr GLshort -> IO ()

instance VertexComponent Int16 where
   vertex2 = glVertex2s
   vertex3 = glVertex3s
   vertex4 = glVertex4s

   vertex2v = glVertex2sv
   vertex3v = glVertex3sv
   vertex4v = glVertex4sv

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glVertex2i" glVertex2i ::
   GLint -> GLint -> IO ()

foreign import stdcall unsafe "glVertex3i" glVertex3i ::
   GLint -> GLint -> GLint -> IO ()

foreign import stdcall unsafe "glVertex4i" glVertex4i ::
   GLint -> GLint -> GLint -> GLint -> IO ()

foreign import stdcall unsafe "glVertex2iv" glVertex2iv ::
   Ptr GLint -> IO ()

foreign import stdcall unsafe "glVertex3iv" glVertex3iv ::
   Ptr GLint -> IO ()

foreign import stdcall unsafe "glVertex4iv" glVertex4iv ::
   Ptr GLint -> IO ()

instance VertexComponent Int32 where
   vertex2 = glVertex2i
   vertex3 = glVertex3i
   vertex4 = glVertex4i

   vertex2v = glVertex2iv
   vertex3v = glVertex3iv
   vertex4v = glVertex4iv

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glVertex2f" glVertex2f ::
   GLfloat -> GLfloat -> IO ()

foreign import stdcall unsafe "glVertex3f" glVertex3f ::
   GLfloat -> GLfloat -> GLfloat -> IO ()

foreign import stdcall unsafe "glVertex4f" glVertex4f ::
   GLfloat -> GLfloat -> GLfloat -> GLfloat -> IO ()

foreign import stdcall unsafe "glVertex2fv" glVertex2fv ::
   Ptr GLfloat -> IO ()

foreign import stdcall unsafe "glVertex3fv" glVertex3fv ::
   Ptr GLfloat -> IO ()

foreign import stdcall unsafe "glVertex4fv" glVertex4fv ::
   Ptr GLfloat -> IO ()

instance VertexComponent Float where
   vertex2 = glVertex2f
   vertex3 = glVertex3f
   vertex4 = glVertex4f

   vertex2v = glVertex2fv
   vertex3v = glVertex3fv
   vertex4v = glVertex4fv

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glVertex2d" glVertex2d ::
   GLdouble -> GLdouble -> IO ()

foreign import stdcall unsafe "glVertex3d" glVertex3d ::
   GLdouble -> GLdouble -> GLdouble -> IO ()

foreign import stdcall unsafe "glVertex4d" glVertex4d ::
   GLdouble -> GLdouble -> GLdouble -> GLdouble -> IO ()

foreign import stdcall unsafe "glVertex2dv" glVertex2dv ::
   Ptr GLdouble -> IO ()

foreign import stdcall unsafe "glVertex3dv" glVertex3dv ::
   Ptr GLdouble -> IO ()

foreign import stdcall unsafe "glVertex4dv" glVertex4dv ::
   Ptr GLdouble -> IO ()

instance VertexComponent Double where
   vertex2 = glVertex2d
   vertex3 = glVertex3d
   vertex4 = glVertex4d

   vertex2v = glVertex2dv
   vertex3v = glVertex3dv
   vertex4v = glVertex4dv

--------------------------------------------------------------------------------

-- | Specify the (/x/, /y/, /z/, /w/) coordinates of a four-dimensional vertex.
-- This must only be done during
-- 'Graphics.Rendering.OpenGL.GL.BeginEnd.renderPrimitive', otherwise the
-- behaviour is unspecified. The current values of the auxiliary vertex
-- attributes are associated with the vertex.
-- 
-- Note that there is no such thing as a \"current vertex\" which could be
-- retrieved.

class Vertex a where
   vertex  ::     a -> IO ()
   vertexv :: Ptr a -> IO ()

-- | A vertex with /z/=0 and /w/=1.
data Vertex2 a = Vertex2 !a !a
   deriving ( Eq, Ord, Show )

instance VertexComponent a => Vertex (Vertex2 a) where
   vertex (Vertex2 x y) = vertex2 x y
   vertexv = vertex2v . (castPtr :: Ptr (Vertex2 b) -> Ptr b)

instance Storable a => Storable (Vertex2 a) where
   sizeOf    ~(Vertex2 x _) = 2 * sizeOf x
   alignment ~(Vertex2 x _) = alignment x
   peek                     = peek2 Vertex2 . castPtr
   poke ptr   (Vertex2 x y) = poke2 (castPtr ptr) x y

-- | A vertex with /w/=1.
data Vertex3 a = Vertex3 !a !a !a
   deriving ( Eq, Ord, Show )

instance VertexComponent a => Vertex (Vertex3 a) where
   vertex (Vertex3 x y z) = vertex3 x y z
   vertexv = vertex3v . (castPtr :: Ptr (Vertex3 b) -> Ptr b)

instance Storable a => Storable (Vertex3 a) where
   sizeOf    ~(Vertex3 x _ _) = 3 * sizeOf x
   alignment ~(Vertex3 x _ _) = alignment x
   peek                       = peek3 Vertex3 . castPtr
   poke ptr   (Vertex3 x y z) = poke3 (castPtr ptr) x y z

-- | A fully-fledged four-dimensional vertex.
data Vertex4 a = Vertex4 !a !a !a !a
   deriving ( Eq, Ord, Show )

instance VertexComponent a => Vertex (Vertex4 a) where
   vertex (Vertex4 x y z w) = vertex4 x y z w
   vertexv = vertex4v . (castPtr :: Ptr (Vertex4 b) -> Ptr b)

instance Storable a => Storable (Vertex4 a) where
   sizeOf    ~(Vertex4 x _ _ _) = 4 * sizeOf x
   alignment ~(Vertex4 x _ _ _) = alignment x
   peek                         = peek4 Vertex4 . castPtr
   poke ptr   (Vertex4 x y z w) = poke4 (castPtr ptr) x y z w

--------------------------------------------------------------------------------
-- $AuxiliaryVertexAttributes
-- Apart from its coordinates in four-dimensional space, every vertex has
-- associated /auxiliary attributes/: Its texture coordinates, a normal, a
-- fog coordinate, and a color plus a secondary color. For every attribute, the
-- OpenGL state contains its current value, which can be changed at any time.
--
-- Every attribute has a \"natural\" format via which it can be manipulated
-- directly as part of the OpenGL state, e.g. the current texture coordinates
-- are internally handled as @'TexCoord4' 'GLfloat'@. Different formats are
-- converted to this format, e.g. the /s/, /r/, and /t/ coordinates of a
-- @'TexCoord3' 'GLint'@ are converted to floating point values and a /q/
-- coordinate of 1.0 is implicitly assumed.
--
-- Consequently, the vast majority of classes, functions, and data types in this
-- module are for convenience only and offer no additional functionality.

--------------------------------------------------------------------------------

-- | The current texture coordinates (/s/, /t/, /r/, /q/) for the current
-- texture unit (see 'Graphics.Rendering.OpenGL.GL.CoordTrans.activeTexture').
-- The initial value is (0,0,0,1) for all texture units.

currentTextureCoords :: StateVar (TexCoord4 GLfloat)
currentTextureCoords =
   makeStateVar (getFloat4 TexCoord4 GetCurrentTextureCoords) texCoord

--------------------------------------------------------------------------------

-- | The class of all types which can be used as a texture coordinate.

class TexCoordComponent a where
   texCoord1 :: a -> IO ()
   texCoord2 :: a -> a -> IO ()
   texCoord3 :: a -> a -> a -> IO ()
   texCoord4 :: a -> a -> a -> a -> IO ()

   texCoord1v :: Ptr a -> IO ()
   texCoord2v :: Ptr a -> IO ()
   texCoord3v :: Ptr a -> IO ()
   texCoord4v :: Ptr a -> IO ()

   multiTexCoord1 :: GLenum -> a -> IO ()
   multiTexCoord2 :: GLenum -> a -> a -> IO ()
   multiTexCoord3 :: GLenum -> a -> a -> a -> IO ()
   multiTexCoord4 :: GLenum -> a -> a -> a -> a -> IO ()

   multiTexCoord1v :: GLenum -> Ptr a -> IO ()
   multiTexCoord2v :: GLenum -> Ptr a -> IO ()
   multiTexCoord3v :: GLenum -> Ptr a -> IO ()
   multiTexCoord4v :: GLenum -> Ptr a -> IO ()

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glTexCoord1s" glTexCoord1s ::
   GLshort -> IO ()

foreign import stdcall unsafe "glTexCoord2s" glTexCoord2s ::
   GLshort -> GLshort -> IO ()

foreign import stdcall unsafe "glTexCoord3s" glTexCoord3s ::
   GLshort -> GLshort -> GLshort -> IO ()

foreign import stdcall unsafe "glTexCoord4s" glTexCoord4s ::
   GLshort -> GLshort -> GLshort -> GLshort -> IO ()

foreign import stdcall unsafe "glTexCoord1sv" glTexCoord1sv ::
   Ptr GLshort -> IO ()

foreign import stdcall unsafe "glTexCoord2sv" glTexCoord2sv ::
   Ptr GLshort -> IO ()

foreign import stdcall unsafe "glTexCoord3sv" glTexCoord3sv ::
   Ptr GLshort -> IO ()

foreign import stdcall unsafe "glTexCoord4sv" glTexCoord4sv ::
   Ptr GLshort -> IO ()

foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord1sARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> GLshort -> IO ()) ; glMultiTexCoord1sARB :: (GLenum -> GLshort -> IO ()) ; glMultiTexCoord1sARB = dyn_glMultiTexCoord1sARB ptr_glMultiTexCoord1sARB ; ptr_glMultiTexCoord1sARB :: FunPtr a ; ptr_glMultiTexCoord1sARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord1sARB")) ; {-# NOINLINE ptr_glMultiTexCoord1sARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord2sARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> GLshort -> GLshort -> IO ()) ; glMultiTexCoord2sARB :: (GLenum -> GLshort -> GLshort -> IO ()) ; glMultiTexCoord2sARB = dyn_glMultiTexCoord2sARB ptr_glMultiTexCoord2sARB ; ptr_glMultiTexCoord2sARB :: FunPtr a ; ptr_glMultiTexCoord2sARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord2sARB")) ; {-# NOINLINE ptr_glMultiTexCoord2sARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord3sARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> GLshort -> GLshort -> GLshort -> IO ()) ; glMultiTexCoord3sARB :: (GLenum -> GLshort -> GLshort -> GLshort -> IO ()) ; glMultiTexCoord3sARB = dyn_glMultiTexCoord3sARB ptr_glMultiTexCoord3sARB ; ptr_glMultiTexCoord3sARB :: FunPtr a ; ptr_glMultiTexCoord3sARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord3sARB")) ; {-# NOINLINE ptr_glMultiTexCoord3sARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord4sARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> GLshort -> GLshort -> GLshort -> GLshort -> IO ()) ; glMultiTexCoord4sARB :: (GLenum -> GLshort -> GLshort -> GLshort -> GLshort -> IO ()) ; glMultiTexCoord4sARB = dyn_glMultiTexCoord4sARB ptr_glMultiTexCoord4sARB ; ptr_glMultiTexCoord4sARB :: FunPtr a ; ptr_glMultiTexCoord4sARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord4sARB")) ; {-# NOINLINE ptr_glMultiTexCoord4sARB #-}

foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord1svARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> Ptr GLshort -> IO ()) ; glMultiTexCoord1svARB :: (GLenum -> Ptr GLshort -> IO ()) ; glMultiTexCoord1svARB = dyn_glMultiTexCoord1svARB ptr_glMultiTexCoord1svARB ; ptr_glMultiTexCoord1svARB :: FunPtr a ; ptr_glMultiTexCoord1svARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord1svARB")) ; {-# NOINLINE ptr_glMultiTexCoord1svARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord2svARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> Ptr GLshort -> IO ()) ; glMultiTexCoord2svARB :: (GLenum -> Ptr GLshort -> IO ()) ; glMultiTexCoord2svARB = dyn_glMultiTexCoord2svARB ptr_glMultiTexCoord2svARB ; ptr_glMultiTexCoord2svARB :: FunPtr a ; ptr_glMultiTexCoord2svARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord2svARB")) ; {-# NOINLINE ptr_glMultiTexCoord2svARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord3svARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> Ptr GLshort -> IO ()) ; glMultiTexCoord3svARB :: (GLenum -> Ptr GLshort -> IO ()) ; glMultiTexCoord3svARB = dyn_glMultiTexCoord3svARB ptr_glMultiTexCoord3svARB ; ptr_glMultiTexCoord3svARB :: FunPtr a ; ptr_glMultiTexCoord3svARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord3svARB")) ; {-# NOINLINE ptr_glMultiTexCoord3svARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord4svARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> Ptr GLshort -> IO ()) ; glMultiTexCoord4svARB :: (GLenum -> Ptr GLshort -> IO ()) ; glMultiTexCoord4svARB = dyn_glMultiTexCoord4svARB ptr_glMultiTexCoord4svARB ; ptr_glMultiTexCoord4svARB :: FunPtr a ; ptr_glMultiTexCoord4svARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord4svARB")) ; {-# NOINLINE ptr_glMultiTexCoord4svARB #-}

instance TexCoordComponent Int16 where
   texCoord1 = glTexCoord1s
   texCoord2 = glTexCoord2s
   texCoord3 = glTexCoord3s
   texCoord4 = glTexCoord4s

   texCoord1v = glTexCoord1sv
   texCoord2v = glTexCoord2sv
   texCoord3v = glTexCoord3sv
   texCoord4v = glTexCoord4sv

   multiTexCoord1 = glMultiTexCoord1sARB
   multiTexCoord2 = glMultiTexCoord2sARB
   multiTexCoord3 = glMultiTexCoord3sARB
   multiTexCoord4 = glMultiTexCoord4sARB

   multiTexCoord1v = glMultiTexCoord1svARB
   multiTexCoord2v = glMultiTexCoord2svARB
   multiTexCoord3v = glMultiTexCoord3svARB
   multiTexCoord4v = glMultiTexCoord4svARB

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glTexCoord1i" glTexCoord1i ::
   GLint -> IO ()

foreign import stdcall unsafe "glTexCoord2i" glTexCoord2i ::
   GLint -> GLint -> IO ()

foreign import stdcall unsafe "glTexCoord3i" glTexCoord3i ::
   GLint -> GLint -> GLint -> IO ()

foreign import stdcall unsafe "glTexCoord4i" glTexCoord4i ::
   GLint -> GLint -> GLint -> GLint -> IO ()

foreign import stdcall unsafe "glTexCoord1iv" glTexCoord1iv ::
   Ptr GLint -> IO ()

foreign import stdcall unsafe "glTexCoord2iv" glTexCoord2iv ::
   Ptr GLint -> IO ()

foreign import stdcall unsafe "glTexCoord3iv" glTexCoord3iv ::
   Ptr GLint -> IO ()

foreign import stdcall unsafe "glTexCoord4iv" glTexCoord4iv ::
   Ptr GLint -> IO ()

foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord1iARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> GLint -> IO ()) ; glMultiTexCoord1iARB :: (GLenum -> GLint -> IO ()) ; glMultiTexCoord1iARB = dyn_glMultiTexCoord1iARB ptr_glMultiTexCoord1iARB ; ptr_glMultiTexCoord1iARB :: FunPtr a ; ptr_glMultiTexCoord1iARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord1iARB")) ; {-# NOINLINE ptr_glMultiTexCoord1iARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord2iARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> GLint -> GLint -> IO ()) ; glMultiTexCoord2iARB :: (GLenum -> GLint -> GLint -> IO ()) ; glMultiTexCoord2iARB = dyn_glMultiTexCoord2iARB ptr_glMultiTexCoord2iARB ; ptr_glMultiTexCoord2iARB :: FunPtr a ; ptr_glMultiTexCoord2iARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord2iARB")) ; {-# NOINLINE ptr_glMultiTexCoord2iARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord3iARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> GLint -> GLint -> GLint -> IO ()) ; glMultiTexCoord3iARB :: (GLenum -> GLint -> GLint -> GLint -> IO ()) ; glMultiTexCoord3iARB = dyn_glMultiTexCoord3iARB ptr_glMultiTexCoord3iARB ; ptr_glMultiTexCoord3iARB :: FunPtr a ; ptr_glMultiTexCoord3iARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord3iARB")) ; {-# NOINLINE ptr_glMultiTexCoord3iARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord4iARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> GLint -> GLint -> GLint -> GLint -> IO ()) ; glMultiTexCoord4iARB :: (GLenum -> GLint -> GLint -> GLint -> GLint -> IO ()) ; glMultiTexCoord4iARB = dyn_glMultiTexCoord4iARB ptr_glMultiTexCoord4iARB ; ptr_glMultiTexCoord4iARB :: FunPtr a ; ptr_glMultiTexCoord4iARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord4iARB")) ; {-# NOINLINE ptr_glMultiTexCoord4iARB #-}

foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord1ivARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> Ptr GLint -> IO ()) ; glMultiTexCoord1ivARB :: (GLenum -> Ptr GLint -> IO ()) ; glMultiTexCoord1ivARB = dyn_glMultiTexCoord1ivARB ptr_glMultiTexCoord1ivARB ; ptr_glMultiTexCoord1ivARB :: FunPtr a ; ptr_glMultiTexCoord1ivARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord1ivARB")) ; {-# NOINLINE ptr_glMultiTexCoord1ivARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord2ivARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> Ptr GLint -> IO ()) ; glMultiTexCoord2ivARB :: (GLenum -> Ptr GLint -> IO ()) ; glMultiTexCoord2ivARB = dyn_glMultiTexCoord2ivARB ptr_glMultiTexCoord2ivARB ; ptr_glMultiTexCoord2ivARB :: FunPtr a ; ptr_glMultiTexCoord2ivARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord2ivARB")) ; {-# NOINLINE ptr_glMultiTexCoord2ivARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord3ivARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> Ptr GLint -> IO ()) ; glMultiTexCoord3ivARB :: (GLenum -> Ptr GLint -> IO ()) ; glMultiTexCoord3ivARB = dyn_glMultiTexCoord3ivARB ptr_glMultiTexCoord3ivARB ; ptr_glMultiTexCoord3ivARB :: FunPtr a ; ptr_glMultiTexCoord3ivARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord3ivARB")) ; {-# NOINLINE ptr_glMultiTexCoord3ivARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord4ivARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> Ptr GLint -> IO ()) ; glMultiTexCoord4ivARB :: (GLenum -> Ptr GLint -> IO ()) ; glMultiTexCoord4ivARB = dyn_glMultiTexCoord4ivARB ptr_glMultiTexCoord4ivARB ; ptr_glMultiTexCoord4ivARB :: FunPtr a ; ptr_glMultiTexCoord4ivARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord4ivARB")) ; {-# NOINLINE ptr_glMultiTexCoord4ivARB #-}

instance TexCoordComponent Int32 where
   texCoord1 = glTexCoord1i
   texCoord2 = glTexCoord2i
   texCoord3 = glTexCoord3i
   texCoord4 = glTexCoord4i

   texCoord1v = glTexCoord1iv
   texCoord2v = glTexCoord2iv
   texCoord3v = glTexCoord3iv
   texCoord4v = glTexCoord4iv

   multiTexCoord1 = glMultiTexCoord1iARB
   multiTexCoord2 = glMultiTexCoord2iARB
   multiTexCoord3 = glMultiTexCoord3iARB
   multiTexCoord4 = glMultiTexCoord4iARB

   multiTexCoord1v = glMultiTexCoord1ivARB
   multiTexCoord2v = glMultiTexCoord2ivARB
   multiTexCoord3v = glMultiTexCoord3ivARB
   multiTexCoord4v = glMultiTexCoord4ivARB

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glTexCoord1f" glTexCoord1f ::
   GLfloat -> IO ()

foreign import stdcall unsafe "glTexCoord2f" glTexCoord2f ::
   GLfloat -> GLfloat -> IO ()

foreign import stdcall unsafe "glTexCoord3f" glTexCoord3f ::
   GLfloat -> GLfloat -> GLfloat -> IO ()

foreign import stdcall unsafe "glTexCoord4f" glTexCoord4f ::
   GLfloat -> GLfloat -> GLfloat -> GLfloat -> IO ()

foreign import stdcall unsafe "glTexCoord1fv" glTexCoord1fv ::
   Ptr GLfloat -> IO ()

foreign import stdcall unsafe "glTexCoord2fv" glTexCoord2fv ::
   Ptr GLfloat -> IO ()

foreign import stdcall unsafe "glTexCoord3fv" glTexCoord3fv ::
   Ptr GLfloat -> IO ()

foreign import stdcall unsafe "glTexCoord4fv" glTexCoord4fv ::
   Ptr GLfloat -> IO ()

foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord1fARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> GLfloat -> IO ()) ; glMultiTexCoord1fARB :: (GLenum -> GLfloat -> IO ()) ; glMultiTexCoord1fARB = dyn_glMultiTexCoord1fARB ptr_glMultiTexCoord1fARB ; ptr_glMultiTexCoord1fARB :: FunPtr a ; ptr_glMultiTexCoord1fARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord1fARB")) ; {-# NOINLINE ptr_glMultiTexCoord1fARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord2fARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> GLfloat -> GLfloat -> IO ()) ; glMultiTexCoord2fARB :: (GLenum -> GLfloat -> GLfloat -> IO ()) ; glMultiTexCoord2fARB = dyn_glMultiTexCoord2fARB ptr_glMultiTexCoord2fARB ; ptr_glMultiTexCoord2fARB :: FunPtr a ; ptr_glMultiTexCoord2fARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord2fARB")) ; {-# NOINLINE ptr_glMultiTexCoord2fARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord3fARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> GLfloat -> GLfloat -> GLfloat -> IO ()) ; glMultiTexCoord3fARB :: (GLenum -> GLfloat -> GLfloat -> GLfloat -> IO ()) ; glMultiTexCoord3fARB = dyn_glMultiTexCoord3fARB ptr_glMultiTexCoord3fARB ; ptr_glMultiTexCoord3fARB :: FunPtr a ; ptr_glMultiTexCoord3fARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord3fARB")) ; {-# NOINLINE ptr_glMultiTexCoord3fARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord4fARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> GLfloat -> GLfloat -> GLfloat -> GLfloat -> IO ()) ; glMultiTexCoord4fARB :: (GLenum -> GLfloat -> GLfloat -> GLfloat -> GLfloat -> IO ()) ; glMultiTexCoord4fARB = dyn_glMultiTexCoord4fARB ptr_glMultiTexCoord4fARB ; ptr_glMultiTexCoord4fARB :: FunPtr a ; ptr_glMultiTexCoord4fARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord4fARB")) ; {-# NOINLINE ptr_glMultiTexCoord4fARB #-}

foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord1fvARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> Ptr GLfloat -> IO ()) ; glMultiTexCoord1fvARB :: (GLenum -> Ptr GLfloat -> IO ()) ; glMultiTexCoord1fvARB = dyn_glMultiTexCoord1fvARB ptr_glMultiTexCoord1fvARB ; ptr_glMultiTexCoord1fvARB :: FunPtr a ; ptr_glMultiTexCoord1fvARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord1fvARB")) ; {-# NOINLINE ptr_glMultiTexCoord1fvARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord2fvARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> Ptr GLfloat -> IO ()) ; glMultiTexCoord2fvARB :: (GLenum -> Ptr GLfloat -> IO ()) ; glMultiTexCoord2fvARB = dyn_glMultiTexCoord2fvARB ptr_glMultiTexCoord2fvARB ; ptr_glMultiTexCoord2fvARB :: FunPtr a ; ptr_glMultiTexCoord2fvARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord2fvARB")) ; {-# NOINLINE ptr_glMultiTexCoord2fvARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord3fvARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> Ptr GLfloat -> IO ()) ; glMultiTexCoord3fvARB :: (GLenum -> Ptr GLfloat -> IO ()) ; glMultiTexCoord3fvARB = dyn_glMultiTexCoord3fvARB ptr_glMultiTexCoord3fvARB ; ptr_glMultiTexCoord3fvARB :: FunPtr a ; ptr_glMultiTexCoord3fvARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord3fvARB")) ; {-# NOINLINE ptr_glMultiTexCoord3fvARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord4fvARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> Ptr GLfloat -> IO ()) ; glMultiTexCoord4fvARB :: (GLenum -> Ptr GLfloat -> IO ()) ; glMultiTexCoord4fvARB = dyn_glMultiTexCoord4fvARB ptr_glMultiTexCoord4fvARB ; ptr_glMultiTexCoord4fvARB :: FunPtr a ; ptr_glMultiTexCoord4fvARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord4fvARB")) ; {-# NOINLINE ptr_glMultiTexCoord4fvARB #-}

instance TexCoordComponent Float where
   texCoord1 = glTexCoord1f
   texCoord2 = glTexCoord2f
   texCoord3 = glTexCoord3f
   texCoord4 = glTexCoord4f

   texCoord1v = glTexCoord1fv
   texCoord2v = glTexCoord2fv
   texCoord3v = glTexCoord3fv
   texCoord4v = glTexCoord4fv

   multiTexCoord1 = glMultiTexCoord1fARB
   multiTexCoord2 = glMultiTexCoord2fARB
   multiTexCoord3 = glMultiTexCoord3fARB
   multiTexCoord4 = glMultiTexCoord4fARB

   multiTexCoord1v = glMultiTexCoord1fvARB
   multiTexCoord2v = glMultiTexCoord2fvARB
   multiTexCoord3v = glMultiTexCoord3fvARB
   multiTexCoord4v = glMultiTexCoord4fvARB

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glTexCoord1d" glTexCoord1d ::
   GLdouble -> IO ()

foreign import stdcall unsafe "glTexCoord2d" glTexCoord2d ::
   GLdouble -> GLdouble -> IO ()

foreign import stdcall unsafe "glTexCoord3d" glTexCoord3d ::
   GLdouble -> GLdouble -> GLdouble -> IO ()

foreign import stdcall unsafe "glTexCoord4d" glTexCoord4d ::
   GLdouble -> GLdouble -> GLdouble -> GLdouble -> IO ()

foreign import stdcall unsafe "glTexCoord1dv" glTexCoord1dv ::
   Ptr GLdouble -> IO ()

foreign import stdcall unsafe "glTexCoord2dv" glTexCoord2dv ::
   Ptr GLdouble -> IO ()

foreign import stdcall unsafe "glTexCoord3dv" glTexCoord3dv ::
   Ptr GLdouble -> IO ()

foreign import stdcall unsafe "glTexCoord4dv" glTexCoord4dv ::
   Ptr GLdouble -> IO ()

foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord1dARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> GLdouble -> IO ()) ; glMultiTexCoord1dARB :: (GLenum -> GLdouble -> IO ()) ; glMultiTexCoord1dARB = dyn_glMultiTexCoord1dARB ptr_glMultiTexCoord1dARB ; ptr_glMultiTexCoord1dARB :: FunPtr a ; ptr_glMultiTexCoord1dARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord1dARB")) ; {-# NOINLINE ptr_glMultiTexCoord1dARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord2dARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> GLdouble -> GLdouble -> IO ()) ; glMultiTexCoord2dARB :: (GLenum -> GLdouble -> GLdouble -> IO ()) ; glMultiTexCoord2dARB = dyn_glMultiTexCoord2dARB ptr_glMultiTexCoord2dARB ; ptr_glMultiTexCoord2dARB :: FunPtr a ; ptr_glMultiTexCoord2dARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord2dARB")) ; {-# NOINLINE ptr_glMultiTexCoord2dARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord3dARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> GLdouble -> GLdouble -> GLdouble -> IO ()) ; glMultiTexCoord3dARB :: (GLenum -> GLdouble -> GLdouble -> GLdouble -> IO ()) ; glMultiTexCoord3dARB = dyn_glMultiTexCoord3dARB ptr_glMultiTexCoord3dARB ; ptr_glMultiTexCoord3dARB :: FunPtr a ; ptr_glMultiTexCoord3dARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord3dARB")) ; {-# NOINLINE ptr_glMultiTexCoord3dARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord4dARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> GLdouble -> GLdouble -> GLdouble -> GLdouble -> IO ()) ; glMultiTexCoord4dARB :: (GLenum -> GLdouble -> GLdouble -> GLdouble -> GLdouble -> IO ()) ; glMultiTexCoord4dARB = dyn_glMultiTexCoord4dARB ptr_glMultiTexCoord4dARB ; ptr_glMultiTexCoord4dARB :: FunPtr a ; ptr_glMultiTexCoord4dARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord4dARB")) ; {-# NOINLINE ptr_glMultiTexCoord4dARB #-}

foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord1dvARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> Ptr GLdouble -> IO ()) ; glMultiTexCoord1dvARB :: (GLenum -> Ptr GLdouble -> IO ()) ; glMultiTexCoord1dvARB = dyn_glMultiTexCoord1dvARB ptr_glMultiTexCoord1dvARB ; ptr_glMultiTexCoord1dvARB :: FunPtr a ; ptr_glMultiTexCoord1dvARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord1dvARB")) ; {-# NOINLINE ptr_glMultiTexCoord1dvARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord2dvARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> Ptr GLdouble -> IO ()) ; glMultiTexCoord2dvARB :: (GLenum -> Ptr GLdouble -> IO ()) ; glMultiTexCoord2dvARB = dyn_glMultiTexCoord2dvARB ptr_glMultiTexCoord2dvARB ; ptr_glMultiTexCoord2dvARB :: FunPtr a ; ptr_glMultiTexCoord2dvARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord2dvARB")) ; {-# NOINLINE ptr_glMultiTexCoord2dvARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord3dvARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> Ptr GLdouble -> IO ()) ; glMultiTexCoord3dvARB :: (GLenum -> Ptr GLdouble -> IO ()) ; glMultiTexCoord3dvARB = dyn_glMultiTexCoord3dvARB ptr_glMultiTexCoord3dvARB ; ptr_glMultiTexCoord3dvARB :: FunPtr a ; ptr_glMultiTexCoord3dvARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord3dvARB")) ; {-# NOINLINE ptr_glMultiTexCoord3dvARB #-}
foreign import stdcall unsafe "dynamic" dyn_glMultiTexCoord4dvARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> Ptr GLdouble -> IO ()) ; glMultiTexCoord4dvARB :: (GLenum -> Ptr GLdouble -> IO ()) ; glMultiTexCoord4dvARB = dyn_glMultiTexCoord4dvARB ptr_glMultiTexCoord4dvARB ; ptr_glMultiTexCoord4dvARB :: FunPtr a ; ptr_glMultiTexCoord4dvARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_multitexture or OpenGL 1.3") ("glMultiTexCoord4dvARB")) ; {-# NOINLINE ptr_glMultiTexCoord4dvARB #-}

instance TexCoordComponent Double where
   texCoord1 = glTexCoord1d
   texCoord2 = glTexCoord2d
   texCoord3 = glTexCoord3d
   texCoord4 = glTexCoord4d

   texCoord1v = glTexCoord1dv
   texCoord2v = glTexCoord2dv
   texCoord3v = glTexCoord3dv
   texCoord4v = glTexCoord4dv

   multiTexCoord1 = glMultiTexCoord1dARB
   multiTexCoord2 = glMultiTexCoord2dARB
   multiTexCoord3 = glMultiTexCoord3dARB
   multiTexCoord4 = glMultiTexCoord4dARB

   multiTexCoord1v = glMultiTexCoord1dvARB
   multiTexCoord2v = glMultiTexCoord2dvARB
   multiTexCoord3v = glMultiTexCoord3dvARB
   multiTexCoord4v = glMultiTexCoord4dvARB

--------------------------------------------------------------------------------

-- | Change the current texture coordinates of the current or given texture
-- unit.

class TexCoord a where
   texCoord       ::                    a -> IO ()
   texCoordv      ::                Ptr a -> IO ()
   multiTexCoord  :: TextureUnit ->     a -> IO ()
   multiTexCoordv :: TextureUnit -> Ptr a -> IO ()

-- | Texture coordinates with /t/=0, /r/=0, and /q/=1.

newtype TexCoord1 a = TexCoord1 a
   deriving ( Eq, Ord, Show )

instance TexCoordComponent a => TexCoord (TexCoord1 a) where
   texCoord (TexCoord1 s) = texCoord1 s
   texCoordv = texCoord1v . (castPtr :: Ptr (TexCoord1 b) -> Ptr b)
   multiTexCoord u (TexCoord1 s) =
      multiTexCoord1 (marshalTextureUnit u) s
   multiTexCoordv u =
      multiTexCoord1v (marshalTextureUnit u) . (castPtr :: Ptr (TexCoord1 b) -> Ptr b)

instance Storable a => Storable (TexCoord1 a) where
   sizeOf    ~(TexCoord1 s) = sizeOf s
   alignment ~(TexCoord1 s) = alignment s
   peek                     = peek1 TexCoord1 . castPtr
   poke ptr   (TexCoord1 s) = poke1 (castPtr ptr) s

-- | Texture coordinates with /r/=0 and /q/=1.

data TexCoord2 a = TexCoord2 !a !a
   deriving ( Eq, Ord, Show )

instance TexCoordComponent a => TexCoord (TexCoord2 a) where
   texCoord (TexCoord2 s t) = texCoord2 s t
   texCoordv = texCoord2v . (castPtr :: Ptr (TexCoord2 b) -> Ptr b)
   multiTexCoord u (TexCoord2 s t) =
      multiTexCoord2 (marshalTextureUnit u) s t
   multiTexCoordv u =
      multiTexCoord2v (marshalTextureUnit u) . (castPtr :: Ptr (TexCoord2 b) -> Ptr b)

instance Storable a => Storable (TexCoord2 a) where
   sizeOf    ~(TexCoord2 s _) = 2 * sizeOf s
   alignment ~(TexCoord2 s _) = alignment s
   peek                       = peek2 TexCoord2 . castPtr
   poke ptr   (TexCoord2 s t) = poke2 (castPtr ptr) s t

-- | Texture coordinates with /q/=1.

data TexCoord3 a = TexCoord3 !a !a !a
   deriving ( Eq, Ord, Show )

instance TexCoordComponent a => TexCoord (TexCoord3 a) where
   texCoord (TexCoord3 s t r) = texCoord3 s t r
   texCoordv = texCoord3v . (castPtr :: Ptr (TexCoord3 b) -> Ptr b)
   multiTexCoord u (TexCoord3 s t r) =
      multiTexCoord3 (marshalTextureUnit u) s t r
   multiTexCoordv u =
      multiTexCoord3v (marshalTextureUnit u) . (castPtr :: Ptr (TexCoord3 b) -> Ptr b)

instance Storable a => Storable (TexCoord3 a) where
   sizeOf    ~(TexCoord3 s _ _) = 3 * sizeOf s
   alignment ~(TexCoord3 s _ _) = alignment s
   peek                         = peek3 TexCoord3 . castPtr
   poke ptr   (TexCoord3 s t r) = poke3 (castPtr ptr) s t r

-- | Fully-fledged four-dimensional texture coordinates.

data TexCoord4 a = TexCoord4 !a !a !a !a
   deriving ( Eq, Ord, Show )

instance TexCoordComponent a => TexCoord (TexCoord4 a) where
   texCoord (TexCoord4 s t r q) = texCoord4 s t r q
   texCoordv = texCoord4v . (castPtr :: Ptr (TexCoord4 b) -> Ptr b)
   multiTexCoord u (TexCoord4 s t r q) =
      multiTexCoord4 (marshalTextureUnit u) s t r q
   multiTexCoordv u =
      multiTexCoord4v (marshalTextureUnit u) . (castPtr :: Ptr (TexCoord4 b) -> Ptr b)

instance Storable a => Storable (TexCoord4 a) where
   sizeOf    ~(TexCoord4 s _ _ _) = 4 * sizeOf s
   alignment ~(TexCoord4 s _ _ _) = alignment s
   peek                           = peek4 TexCoord4 . castPtr
   poke ptr   (TexCoord4 s t r q) = poke4 (castPtr ptr) s t r q

--------------------------------------------------------------------------------

-- | The current normal (/x/, /y/, /z/). The initial value is the unit vector
-- (0, 0, 1).

currentNormal :: StateVar (Normal3 GLfloat)
currentNormal = makeStateVar (getFloat3 Normal3 GetCurrentNormal) normal

--------------------------------------------------------------------------------

-- | The class of all types which can be used as a component of a normal.

class NormalComponent a where
   normal3 :: a -> a -> a -> IO ()
   normal3v :: Ptr a -> IO ()

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glNormal3b" glNormal3b ::
   GLbyte -> GLbyte -> GLbyte -> IO ()

foreign import stdcall unsafe "glNormal3bv" glNormal3bv ::
   Ptr GLbyte -> IO ()

instance NormalComponent Int8 where
   normal3 = glNormal3b
   normal3v = glNormal3bv

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glNormal3s" glNormal3s ::
   GLshort -> GLshort -> GLshort -> IO ()

foreign import stdcall unsafe "glNormal3sv" glNormal3sv ::
   Ptr GLshort -> IO ()

instance NormalComponent Int16 where
   normal3 = glNormal3s
   normal3v = glNormal3sv

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glNormal3i" glNormal3i ::
   GLint -> GLint -> GLint -> IO ()

foreign import stdcall unsafe "glNormal3iv" glNormal3iv ::
   Ptr GLint -> IO ()

instance NormalComponent Int32 where
   normal3 = glNormal3i
   normal3v = glNormal3iv

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glNormal3f" glNormal3f ::
   GLfloat -> GLfloat -> GLfloat -> IO ()

foreign import stdcall unsafe "glNormal3fv" glNormal3fv ::
   Ptr GLfloat -> IO ()

instance NormalComponent Float where
   normal3 = glNormal3f
   normal3v = glNormal3fv

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glNormal3d" glNormal3d ::
   GLdouble -> GLdouble -> GLdouble -> IO ()

foreign import stdcall unsafe "glNormal3dv" glNormal3dv ::
   Ptr GLdouble -> IO ()

instance NormalComponent Double where
   normal3 = glNormal3d
   normal3v = glNormal3dv

--------------------------------------------------------------------------------

-- | Change the current normal. Integral arguments are converted to
-- floating-point with a linear mapping that maps the most positive
-- representable integer value to 1.0, and the most negative representable
-- integer value to -1.0.
--
-- Normals specified with 'normal' or 'normalv' need not have unit length.
-- If 'Graphics.Rendering.OpenGL.GL.CoordTrans.normalize' is enabled, then
-- normals of any length specified with 'normal' or 'normalv' are normalized
-- after transformation. If
-- 'Graphics.Rendering.OpenGL.GL.CoordTrans.rescaleNormal' is enabled, normals
-- are scaled by a scaling factor derived from the modelview matrix.
-- 'Graphics.Rendering.OpenGL.GL.CoordTrans.rescaleNormal' requires that the
-- originally specified normals were of unit length, and that the modelview
-- matrix contains only uniform scales for proper results. Normalization is 
-- initially disabled.

class Normal a where
   normal  ::     a -> IO ()
   normalv :: Ptr a -> IO ()

-- A three-dimensional normal.

data Normal3 a = Normal3 !a !a !a
   deriving ( Eq, Ord, Show )

instance NormalComponent a => Normal (Normal3 a) where
   normal (Normal3 x y z) = normal3 x y z
   normalv = normal3v . (castPtr :: Ptr (Normal3 b) -> Ptr b)

instance Storable a => Storable (Normal3 a) where
   sizeOf    ~(Normal3 x _ _) = 3 * sizeOf x
   alignment ~(Normal3 x _ _) = alignment x
   peek                       = peek3 Normal3 . castPtr
   poke ptr   (Normal3 x y z) = poke3 (castPtr ptr) x y z

--------------------------------------------------------------------------------

-- | The current fog coordinate. The initial value is 0.

currentFogCoord :: StateVar (FogCoord1 GLfloat)
currentFogCoord =
   makeStateVar (getFloat1 FogCoord1 GetCurrentFogCoord) fogCoord

--------------------------------------------------------------------------------

-- | The class of all types which can be used as the fog coordinate.

class FogCoordComponent a where
   fogCoord1 :: a -> IO ()
   fogCoord1v :: Ptr a -> IO ()

--------------------------------------------------------------------------------

foreign import stdcall unsafe "dynamic" dyn_glFogCoordfEXT :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLfloat -> IO ()) ; glFogCoordfEXT :: (GLfloat -> IO ()) ; glFogCoordfEXT = dyn_glFogCoordfEXT ptr_glFogCoordfEXT ; ptr_glFogCoordfEXT :: FunPtr a ; ptr_glFogCoordfEXT = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_EXT_fog_coord or OpenGL 1.4") ("glFogCoordfEXT")) ; {-# NOINLINE ptr_glFogCoordfEXT #-}
foreign import stdcall unsafe "dynamic" dyn_glFogCoordfvEXT :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (Ptr GLfloat -> IO ()) ; glFogCoordfvEXT :: (Ptr GLfloat -> IO ()) ; glFogCoordfvEXT = dyn_glFogCoordfvEXT ptr_glFogCoordfvEXT ; ptr_glFogCoordfvEXT :: FunPtr a ; ptr_glFogCoordfvEXT = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_EXT_fog_coord or OpenGL 1.4") ("glFogCoordfvEXT")) ; {-# NOINLINE ptr_glFogCoordfvEXT #-}

instance FogCoordComponent Float where
   fogCoord1 = glFogCoordfEXT
   fogCoord1v = glFogCoordfvEXT

--------------------------------------------------------------------------------

foreign import stdcall unsafe "dynamic" dyn_glFogCoorddEXT :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLdouble -> IO ()) ; glFogCoorddEXT :: (GLdouble -> IO ()) ; glFogCoorddEXT = dyn_glFogCoorddEXT ptr_glFogCoorddEXT ; ptr_glFogCoorddEXT :: FunPtr a ; ptr_glFogCoorddEXT = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_EXT_fog_coord or OpenGL 1.4") ("glFogCoorddEXT")) ; {-# NOINLINE ptr_glFogCoorddEXT #-}
foreign import stdcall unsafe "dynamic" dyn_glFogCoorddvEXT :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (Ptr GLdouble -> IO ()) ; glFogCoorddvEXT :: (Ptr GLdouble -> IO ()) ; glFogCoorddvEXT = dyn_glFogCoorddvEXT ptr_glFogCoorddvEXT ; ptr_glFogCoorddvEXT :: FunPtr a ; ptr_glFogCoorddvEXT = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_EXT_fog_coord or OpenGL 1.4") ("glFogCoorddvEXT")) ; {-# NOINLINE ptr_glFogCoorddvEXT #-}

instance FogCoordComponent Double where
   fogCoord1 = glFogCoorddEXT
   fogCoord1v = glFogCoorddvEXT

--------------------------------------------------------------------------------

-- | Change the current fog coordinate.

class FogCoord a where
   fogCoord  ::     a -> IO ()
   fogCoordv :: Ptr a -> IO ()

-- | A fog coordinate.

newtype FogCoord1 a = FogCoord1 a
   deriving ( Eq, Ord, Show )

instance FogCoordComponent a => FogCoord (FogCoord1 a) where
   fogCoord (FogCoord1 c) = fogCoord1 c
   fogCoordv = fogCoord1v . (castPtr :: Ptr (FogCoord1 b) -> Ptr b)

--------------------------------------------------------------------------------

-- | If 'rgbaMode' contains 'True', the color buffers store RGBA value. If
-- color indexes are stored, it contains 'False'.

rgbaMode :: GettableStateVar Bool
rgbaMode = makeGettableStateVar (getBoolean1 unmarshalGLboolean GetRGBAMode)

--------------------------------------------------------------------------------

-- The current color (/R/, /G/, /B/, /A/). The initial value is (1, 1, 1, 1).
-- Note that this state variable is significant only when the GL is in RGBA
-- mode.

currentColor :: StateVar (Color4 GLfloat)
currentColor =
   makeStateVar (getFloat4 Color4 GetCurrentColor) color

-- The current secondary color (/R/, /G/, /B/). The initial value is (0, 0, 0).
-- Note that this state variable is significant only when the GL is in RGBA
-- mode.

currentSecondaryColor :: StateVar (Color3 GLfloat)
currentSecondaryColor =
   makeStateVar
      (do Color4 r g b _ <- getFloat4 Color4 GetCurrentSecondaryColor
          return $ Color3 r g b)
      secondaryColor

--------------------------------------------------------------------------------

-- | The class of all types which can be used as a color component.

class ColorComponent a where
   color3 :: a -> a -> a -> IO ()
   color4 :: a -> a -> a -> a -> IO ()

   color3v :: Ptr a -> IO ()
   color4v :: Ptr a -> IO ()

   secondaryColor3  :: a -> a -> a -> IO ()
   secondaryColor3v :: Ptr a -> IO ()

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glColor3b" glColor3b ::
   GLbyte -> GLbyte -> GLbyte -> IO ()

foreign import stdcall unsafe "glColor4b" glColor4b ::
   GLbyte -> GLbyte -> GLbyte -> GLbyte -> IO ()

foreign import stdcall unsafe "glColor3bv" glColor3bv ::
   Ptr GLbyte -> IO ()

foreign import stdcall unsafe "glColor4bv" glColor4bv ::
   Ptr GLbyte -> IO ()

foreign import stdcall unsafe "dynamic" dyn_glSecondaryColor3bEXT :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLbyte -> GLbyte -> GLbyte -> IO ()) ; glSecondaryColor3bEXT :: (GLbyte -> GLbyte -> GLbyte -> IO ()) ; glSecondaryColor3bEXT = dyn_glSecondaryColor3bEXT ptr_glSecondaryColor3bEXT ; ptr_glSecondaryColor3bEXT :: FunPtr a ; ptr_glSecondaryColor3bEXT = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_EXT_secondary_color or OpenGL 1.4") ("glSecondaryColor3bEXT")) ; {-# NOINLINE ptr_glSecondaryColor3bEXT #-}
foreign import stdcall unsafe "dynamic" dyn_glSecondaryColor3bvEXT :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (Ptr GLbyte -> IO ()) ; glSecondaryColor3bvEXT :: (Ptr GLbyte -> IO ()) ; glSecondaryColor3bvEXT = dyn_glSecondaryColor3bvEXT ptr_glSecondaryColor3bvEXT ; ptr_glSecondaryColor3bvEXT :: FunPtr a ; ptr_glSecondaryColor3bvEXT = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_EXT_secondary_color or OpenGL 1.4") ("glSecondaryColor3bvEXT")) ; {-# NOINLINE ptr_glSecondaryColor3bvEXT #-}

instance ColorComponent Int8 where
   color3 = glColor3b
   color4 = glColor4b

   color3v = glColor3bv
   color4v = glColor4bv

   secondaryColor3 = glSecondaryColor3bEXT
   secondaryColor3v = glSecondaryColor3bvEXT

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glColor3s" glColor3s ::
   GLshort -> GLshort -> GLshort -> IO ()

foreign import stdcall unsafe "glColor4s" glColor4s ::
   GLshort -> GLshort -> GLshort -> GLshort -> IO ()

foreign import stdcall unsafe "glColor3sv" glColor3sv ::
   Ptr GLshort -> IO ()

foreign import stdcall unsafe "glColor4sv" glColor4sv ::
   Ptr GLshort -> IO ()

foreign import stdcall unsafe "dynamic" dyn_glSecondaryColor3sEXT :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLshort -> GLshort -> GLshort -> IO ()) ; glSecondaryColor3sEXT :: (GLshort -> GLshort -> GLshort -> IO ()) ; glSecondaryColor3sEXT = dyn_glSecondaryColor3sEXT ptr_glSecondaryColor3sEXT ; ptr_glSecondaryColor3sEXT :: FunPtr a ; ptr_glSecondaryColor3sEXT = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_EXT_secondary_color or OpenGL 1.4") ("glSecondaryColor3sEXT")) ; {-# NOINLINE ptr_glSecondaryColor3sEXT #-}
foreign import stdcall unsafe "dynamic" dyn_glSecondaryColor3svEXT :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (Ptr GLshort -> IO ()) ; glSecondaryColor3svEXT :: (Ptr GLshort -> IO ()) ; glSecondaryColor3svEXT = dyn_glSecondaryColor3svEXT ptr_glSecondaryColor3svEXT ; ptr_glSecondaryColor3svEXT :: FunPtr a ; ptr_glSecondaryColor3svEXT = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_EXT_secondary_color or OpenGL 1.4") ("glSecondaryColor3svEXT")) ; {-# NOINLINE ptr_glSecondaryColor3svEXT #-}

instance ColorComponent Int16 where
   color3 = glColor3s
   color4 = glColor4s

   color3v = glColor3sv
   color4v = glColor4sv

   secondaryColor3 = glSecondaryColor3sEXT
   secondaryColor3v = glSecondaryColor3svEXT

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glColor3i" glColor3i ::
   GLint -> GLint -> GLint -> IO ()

foreign import stdcall unsafe "glColor4i" glColor4i ::
   GLint -> GLint -> GLint -> GLint -> IO ()

foreign import stdcall unsafe "glColor3iv" glColor3iv ::
   Ptr GLint -> IO ()

foreign import stdcall unsafe "glColor4iv" glColor4iv ::
   Ptr GLint -> IO ()

foreign import stdcall unsafe "dynamic" dyn_glSecondaryColor3iEXT :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLint -> GLint -> GLint -> IO ()) ; glSecondaryColor3iEXT :: (GLint -> GLint -> GLint -> IO ()) ; glSecondaryColor3iEXT = dyn_glSecondaryColor3iEXT ptr_glSecondaryColor3iEXT ; ptr_glSecondaryColor3iEXT :: FunPtr a ; ptr_glSecondaryColor3iEXT = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_EXT_secondary_color or OpenGL 1.4") ("glSecondaryColor3iEXT")) ; {-# NOINLINE ptr_glSecondaryColor3iEXT #-}
foreign import stdcall unsafe "dynamic" dyn_glSecondaryColor3ivEXT :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (Ptr GLint -> IO ()) ; glSecondaryColor3ivEXT :: (Ptr GLint -> IO ()) ; glSecondaryColor3ivEXT = dyn_glSecondaryColor3ivEXT ptr_glSecondaryColor3ivEXT ; ptr_glSecondaryColor3ivEXT :: FunPtr a ; ptr_glSecondaryColor3ivEXT = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_EXT_secondary_color or OpenGL 1.4") ("glSecondaryColor3ivEXT")) ; {-# NOINLINE ptr_glSecondaryColor3ivEXT #-}

instance ColorComponent Int32 where
   color3 = glColor3i
   color4 = glColor4i

   color3v = glColor3iv
   color4v = glColor4iv

   secondaryColor3 = glSecondaryColor3iEXT
   secondaryColor3v = glSecondaryColor3ivEXT

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glColor3f" glColor3f ::
   GLfloat -> GLfloat -> GLfloat -> IO ()

foreign import stdcall unsafe "glColor4f" glColor4f ::
   GLfloat -> GLfloat -> GLfloat -> GLfloat -> IO ()

foreign import stdcall unsafe "glColor3fv" glColor3fv ::
   Ptr GLfloat -> IO ()

foreign import stdcall unsafe "glColor4fv" glColor4fv ::
   Ptr GLfloat -> IO ()

foreign import stdcall unsafe "dynamic" dyn_glSecondaryColor3fEXT :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLfloat -> GLfloat -> GLfloat -> IO ()) ; glSecondaryColor3fEXT :: (GLfloat -> GLfloat -> GLfloat -> IO ()) ; glSecondaryColor3fEXT = dyn_glSecondaryColor3fEXT ptr_glSecondaryColor3fEXT ; ptr_glSecondaryColor3fEXT :: FunPtr a ; ptr_glSecondaryColor3fEXT = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_EXT_secondary_color or OpenGL 1.4") ("glSecondaryColor3fEXT")) ; {-# NOINLINE ptr_glSecondaryColor3fEXT #-}
foreign import stdcall unsafe "dynamic" dyn_glSecondaryColor3fvEXT :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (Ptr GLfloat -> IO ()) ; glSecondaryColor3fvEXT :: (Ptr GLfloat -> IO ()) ; glSecondaryColor3fvEXT = dyn_glSecondaryColor3fvEXT ptr_glSecondaryColor3fvEXT ; ptr_glSecondaryColor3fvEXT :: FunPtr a ; ptr_glSecondaryColor3fvEXT = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_EXT_secondary_color or OpenGL 1.4") ("glSecondaryColor3fvEXT")) ; {-# NOINLINE ptr_glSecondaryColor3fvEXT #-}

instance ColorComponent Float where
   color3 = glColor3f
   color4 = glColor4f

   color3v = glColor3fv
   color4v = glColor4fv

   secondaryColor3 = glSecondaryColor3fEXT
   secondaryColor3v = glSecondaryColor3fvEXT

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glColor3d" glColor3d ::
   GLdouble -> GLdouble -> GLdouble -> IO ()

foreign import stdcall unsafe "glColor4d" glColor4d ::
   GLdouble -> GLdouble -> GLdouble -> GLdouble -> IO ()

foreign import stdcall unsafe "glColor3dv" glColor3dv ::
   Ptr GLdouble -> IO ()

foreign import stdcall unsafe "glColor4dv" glColor4dv ::
   Ptr GLdouble -> IO ()

foreign import stdcall unsafe "dynamic" dyn_glSecondaryColor3dEXT :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLdouble -> GLdouble -> GLdouble -> IO ()) ; glSecondaryColor3dEXT :: (GLdouble -> GLdouble -> GLdouble -> IO ()) ; glSecondaryColor3dEXT = dyn_glSecondaryColor3dEXT ptr_glSecondaryColor3dEXT ; ptr_glSecondaryColor3dEXT :: FunPtr a ; ptr_glSecondaryColor3dEXT = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_EXT_secondary_color or OpenGL 1.4") ("glSecondaryColor3dEXT")) ; {-# NOINLINE ptr_glSecondaryColor3dEXT #-}
foreign import stdcall unsafe "dynamic" dyn_glSecondaryColor3dvEXT :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (Ptr GLdouble -> IO ()) ; glSecondaryColor3dvEXT :: (Ptr GLdouble -> IO ()) ; glSecondaryColor3dvEXT = dyn_glSecondaryColor3dvEXT ptr_glSecondaryColor3dvEXT ; ptr_glSecondaryColor3dvEXT :: FunPtr a ; ptr_glSecondaryColor3dvEXT = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_EXT_secondary_color or OpenGL 1.4") ("glSecondaryColor3dvEXT")) ; {-# NOINLINE ptr_glSecondaryColor3dvEXT #-}

instance ColorComponent Double where
   color3 = glColor3d
   color4 = glColor4d

   color3v = glColor3dv
   color4v = glColor4dv

   secondaryColor3 = glSecondaryColor3dEXT
   secondaryColor3v = glSecondaryColor3dvEXT

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glColor3ub" glColor3ub ::
   GLubyte -> GLubyte -> GLubyte -> IO ()

foreign import stdcall unsafe "glColor4ub" glColor4ub ::
   GLubyte -> GLubyte -> GLubyte -> GLubyte -> IO ()


foreign import stdcall unsafe "glColor3ubv" glColor3ubv ::
   Ptr GLubyte -> IO ()

foreign import stdcall unsafe "glColor4ubv" glColor4ubv ::
   Ptr GLubyte -> IO ()

foreign import stdcall unsafe "dynamic" dyn_glSecondaryColor3ubEXT :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLubyte -> GLubyte -> GLubyte -> IO ()) ; glSecondaryColor3ubEXT :: (GLubyte -> GLubyte -> GLubyte -> IO ()) ; glSecondaryColor3ubEXT = dyn_glSecondaryColor3ubEXT ptr_glSecondaryColor3ubEXT ; ptr_glSecondaryColor3ubEXT :: FunPtr a ; ptr_glSecondaryColor3ubEXT = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_EXT_secondary_color or OpenGL 1.4") ("glSecondaryColor3ubEXT")) ; {-# NOINLINE ptr_glSecondaryColor3ubEXT #-}
foreign import stdcall unsafe "dynamic" dyn_glSecondaryColor3ubvEXT :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (Ptr GLubyte -> IO ()) ; glSecondaryColor3ubvEXT :: (Ptr GLubyte -> IO ()) ; glSecondaryColor3ubvEXT = dyn_glSecondaryColor3ubvEXT ptr_glSecondaryColor3ubvEXT ; ptr_glSecondaryColor3ubvEXT :: FunPtr a ; ptr_glSecondaryColor3ubvEXT = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_EXT_secondary_color or OpenGL 1.4") ("glSecondaryColor3ubvEXT")) ; {-# NOINLINE ptr_glSecondaryColor3ubvEXT #-}

instance ColorComponent Word8 where
   color3 = glColor3ub
   color4 = glColor4ub

   color3v = glColor3ubv
   color4v = glColor4ubv

   secondaryColor3 = glSecondaryColor3ubEXT
   secondaryColor3v = glSecondaryColor3ubvEXT

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glColor3us" glColor3us ::
   GLushort -> GLushort -> GLushort -> IO ()

foreign import stdcall unsafe "glColor4us" glColor4us ::
   GLushort -> GLushort -> GLushort -> GLushort -> IO ()

foreign import stdcall unsafe "glColor3usv" glColor3usv ::
   Ptr GLushort -> IO ()

foreign import stdcall unsafe "glColor4usv" glColor4usv ::
   Ptr GLushort -> IO ()

foreign import stdcall unsafe "dynamic" dyn_glSecondaryColor3usEXT :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLushort -> GLushort -> GLushort -> IO ()) ; glSecondaryColor3usEXT :: (GLushort -> GLushort -> GLushort -> IO ()) ; glSecondaryColor3usEXT = dyn_glSecondaryColor3usEXT ptr_glSecondaryColor3usEXT ; ptr_glSecondaryColor3usEXT :: FunPtr a ; ptr_glSecondaryColor3usEXT = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_EXT_secondary_color or OpenGL 1.4") ("glSecondaryColor3usEXT")) ; {-# NOINLINE ptr_glSecondaryColor3usEXT #-}
foreign import stdcall unsafe "dynamic" dyn_glSecondaryColor3usvEXT :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (Ptr GLushort -> IO ()) ; glSecondaryColor3usvEXT :: (Ptr GLushort -> IO ()) ; glSecondaryColor3usvEXT = dyn_glSecondaryColor3usvEXT ptr_glSecondaryColor3usvEXT ; ptr_glSecondaryColor3usvEXT :: FunPtr a ; ptr_glSecondaryColor3usvEXT = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_EXT_secondary_color or OpenGL 1.4") ("glSecondaryColor3usvEXT")) ; {-# NOINLINE ptr_glSecondaryColor3usvEXT #-}

instance ColorComponent Word16 where
   color3 = glColor3us
   color4 = glColor4us

   color3v = glColor3usv
   color4v = glColor4usv

   secondaryColor3 = glSecondaryColor3usEXT
   secondaryColor3v = glSecondaryColor3usvEXT

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glColor3ui" glColor3ui ::
   GLuint -> GLuint -> GLuint -> IO ()

foreign import stdcall unsafe "glColor4ui" glColor4ui ::
   GLuint -> GLuint -> GLuint -> GLuint -> IO ()

foreign import stdcall unsafe "glColor3uiv" glColor3uiv ::
   Ptr GLuint -> IO ()

foreign import stdcall unsafe "glColor4uiv" glColor4uiv ::
   Ptr GLuint -> IO ()

foreign import stdcall unsafe "dynamic" dyn_glSecondaryColor3uiEXT :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLuint -> GLuint -> GLuint -> IO ()) ; glSecondaryColor3uiEXT :: (GLuint -> GLuint -> GLuint -> IO ()) ; glSecondaryColor3uiEXT = dyn_glSecondaryColor3uiEXT ptr_glSecondaryColor3uiEXT ; ptr_glSecondaryColor3uiEXT :: FunPtr a ; ptr_glSecondaryColor3uiEXT = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_EXT_secondary_color or OpenGL 1.4") ("glSecondaryColor3uiEXT")) ; {-# NOINLINE ptr_glSecondaryColor3uiEXT #-}
foreign import stdcall unsafe "dynamic" dyn_glSecondaryColor3uivEXT :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (Ptr GLuint -> IO ()) ; glSecondaryColor3uivEXT :: (Ptr GLuint -> IO ()) ; glSecondaryColor3uivEXT = dyn_glSecondaryColor3uivEXT ptr_glSecondaryColor3uivEXT ; ptr_glSecondaryColor3uivEXT :: FunPtr a ; ptr_glSecondaryColor3uivEXT = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_EXT_secondary_color or OpenGL 1.4") ("glSecondaryColor3uivEXT")) ; {-# NOINLINE ptr_glSecondaryColor3uivEXT #-}

instance ColorComponent Word32 where
   color3 = glColor3ui
   color4 = glColor4ui

   color3v = glColor3uiv
   color4v = glColor4uiv

   secondaryColor3 = glSecondaryColor3uiEXT
   secondaryColor3v = glSecondaryColor3uivEXT

--------------------------------------------------------------------------------

-- | Change the current color.

class Color a where
   color  ::     a -> IO ()
   colorv :: Ptr a -> IO ()

-- An RGBA color with /A/=1.

data Color3 a = Color3 !a !a !a
   deriving ( Eq, Ord, Show )

instance ColorComponent a => Color (Color3 a) where
   color (Color3 r g b) = color3 r g b
   colorv = color3v . (castPtr :: Ptr (Color3 b) -> Ptr b)

instance Storable a => Storable (Color3 a) where
   sizeOf    ~(Color3 r _ _) = 3 * sizeOf r
   alignment ~(Color3 r _ _) = alignment r
   peek                      = peek3 Color3 . castPtr
   poke ptr   (Color3 r g b) = poke3 (castPtr ptr) r g b

-- | A fully-fledged RGBA color.

data Color4 a = Color4 !a !a !a !a
   deriving ( Eq, Ord, Show )

instance ColorComponent a => Color (Color4 a) where
   color (Color4 r g b a) = color4 r g b a
   colorv = color4v . (castPtr :: Ptr (Color4 b) -> Ptr b)

instance Storable a => Storable (Color4 a) where
   sizeOf    ~(Color4 r _ _ _) = 4 * sizeOf r
   alignment ~(Color4 r _ _ _) = alignment r
   peek                        = peek4 Color4 . castPtr
   poke ptr   (Color4 r g b a) = poke4 (castPtr ptr) r g b a

--------------------------------------------------------------------------------

-- | Change the current secondary color.

class SecondaryColor a where
   secondaryColor  ::     a -> IO ()
   secondaryColorv :: Ptr a -> IO ()

instance ColorComponent a => SecondaryColor (Color3 a) where
   secondaryColor (Color3 r g b) = secondaryColor3 r g b
   secondaryColorv = secondaryColor3v . (castPtr :: Ptr (Color3 b) -> Ptr b)

--------------------------------------------------------------------------------

-- The current color index. The initial value is 1. Note that this state
-- variable is significant only when the GL is in color index mode.

currentIndex :: StateVar (Index1 GLint)
currentIndex = makeStateVar (getInteger1 Index1 GetCurrentIndex) index

--------------------------------------------------------------------------------

-- | The class of all types which can be used as a color index.

class IndexComponent a where
   index1 :: a -> IO ()
   index1v :: Ptr a -> IO ()

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glIndexs" glIndexs ::
   GLshort -> IO ()

foreign import stdcall unsafe "glIndexsv" glIndexsv ::
   Ptr GLshort -> IO ()

instance IndexComponent Int16 where
   index1 = glIndexs
   index1v = glIndexsv

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glIndexi" glIndexi ::
   GLint -> IO ()

foreign import stdcall unsafe "glIndexiv" glIndexiv ::
   Ptr GLint -> IO ()

instance IndexComponent Int32 where
   index1 = glIndexi
   index1v = glIndexiv

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glIndexf" glIndexf ::
   GLfloat -> IO ()

foreign import stdcall unsafe "glIndexfv" glIndexfv ::
   Ptr GLfloat -> IO ()

instance IndexComponent Float where
   index1 = glIndexf
   index1v = glIndexfv

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glIndexd" glIndexd ::
   GLdouble -> IO ()

foreign import stdcall unsafe "glIndexdv" glIndexdv ::
   Ptr GLdouble -> IO ()

instance IndexComponent Double where
   index1 = glIndexd
   index1v = glIndexdv

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glIndexub" glIndexub ::
   GLubyte -> IO ()

foreign import stdcall unsafe "glIndexubv" glIndexubv ::
   Ptr GLubyte -> IO ()

instance IndexComponent Word8 where
   index1 = glIndexub
   index1v = glIndexubv

--------------------------------------------------------------------------------

-- | Change the current color index.

class Index a where
   index  ::     a -> IO ()  -- Collision with Prelude.index
   indexv :: Ptr a -> IO ()

-- | A color index.

newtype Index1 a = Index1 a
   deriving ( Eq, Ord, Show )

instance IndexComponent a => Index (Index1 a) where
   index (Index1 i) = index1 i
   indexv = index1v . (castPtr :: Ptr (Index1 b) -> Ptr b)

instance Storable a => Storable (Index1 a) where
   sizeOf    ~(Index1 s) = sizeOf s
   alignment ~(Index1 s) = alignment s
   peek                  = peek1 Index1 . castPtr
   poke ptr   (Index1 s) = poke1 (castPtr ptr) s

--------------------------------------------------------------------------------

-- | An implementation must support at least 2 texture units, but it may
-- support up to 32 ones. This state variable can be used to query the actual
-- implementation limit.

maxTextureUnit :: GettableStateVar TextureUnit
maxTextureUnit =
   makeGettableStateVar (getEnum1 unmarshalTextureUnit GetMaxTextureUnits)
