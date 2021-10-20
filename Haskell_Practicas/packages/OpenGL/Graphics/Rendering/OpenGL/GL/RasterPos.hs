--------------------------------------------------------------------------------
-- |
-- Module      :  Graphics.Rendering.OpenGL.GL.RasterPos
-- Copyright   :  (c) Sven Panne 2002-2005
-- License     :  BSD-style (see the file libraries/OpenGL/LICENSE)
-- 
-- Maintainer  :  sven.panne@aedion.de
-- Stability   :  provisional
-- Portability :  portable
--
-- This module corresponds to section 2.13 (Current Raster Position) of the
-- OpenGL 1.5 specs.
--
--------------------------------------------------------------------------------

module Graphics.Rendering.OpenGL.GL.RasterPos (
   currentRasterPosition, RasterPosComponent, RasterPos(..),
   WindowPosComponent, WindowPos(..),
   currentRasterDistance, currentRasterColor, currentRasterIndex,
   currentRasterTexCoords, currentRasterPositionValid,
   rasterPositionUnclipped
) where

import Data.Int
import Foreign.Ptr ( Ptr, castPtr )
import Graphics.Rendering.OpenGL.GL.BasicTypes (
   GLshort, GLint, GLfloat, GLdouble, Capability )
import Graphics.Rendering.OpenGL.GL.GLboolean ( unmarshalGLboolean )
import Graphics.Rendering.OpenGL.GL.Capability (
   EnableCap(CapRasterPositionUnclipped), makeCapability )
import Graphics.Rendering.OpenGL.GL.Extensions (
   FunPtr, unsafePerformIO, Invoker, getProcAddress )
import Graphics.Rendering.OpenGL.GL.QueryUtils (
   GetPName(GetCurrentRasterPosition,GetCurrentRasterDistance,
            GetCurrentRasterColor,GetCurrentRasterIndex,
            GetCurrentRasterTextureCoords,GetCurrentRasterPositionValid),
   getBoolean1, getInteger1, getFloat1, getFloat4 )
import Graphics.Rendering.OpenGL.GL.StateVar (
   GettableStateVar, makeGettableStateVar, StateVar, makeStateVar )
import Graphics.Rendering.OpenGL.GL.VertexSpec (
   Vertex2(..), Vertex3(..), Vertex4(..), TexCoord4(..),
   Color4(..), Index1(..) )

--------------------------------------------------------------------------------

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         




                                                                                                                                                                          











                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    




                                                         
                                                                               

                                                    


                                                            


                                                          


                                                         


                                                        


                                                           


                                                         


                                                             
                              

                                                            
                             

                                                         


                                                         


                                                          


                                                         


                                                           


                                                            


                                                         


                                           


                                          


                                       


                                         


                                         


                                         


                                       


                                        


                                      


                                        


                                        


                                        


                                       


                                         


                                                                              


                                              


                                                          


                                                          


                                            


                                                      


                                                             
                              

                                                                      
                              



                                                                                                                     
























--------------------------------------------------------------------------------

currentRasterPosition :: StateVar (Vertex4 GLfloat)
currentRasterPosition =
   makeStateVar (getFloat4 Vertex4 GetCurrentRasterPosition) rasterPos

--------------------------------------------------------------------------------

class RasterPosComponent a where
   rasterPos2 :: a -> a -> IO ()
   rasterPos3 :: a -> a -> a -> IO ()
   rasterPos4 :: a -> a -> a -> a -> IO ()

   rasterPos2v :: Ptr a -> IO ()
   rasterPos3v :: Ptr a -> IO ()
   rasterPos4v :: Ptr a -> IO ()

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glRasterPos2s" glRasterPos2s ::
   GLshort -> GLshort -> IO ()

foreign import stdcall unsafe "glRasterPos3s" glRasterPos3s ::
   GLshort -> GLshort -> GLshort -> IO ()

foreign import stdcall unsafe "glRasterPos4s" glRasterPos4s ::
   GLshort -> GLshort -> GLshort -> GLshort -> IO ()

foreign import stdcall unsafe "glRasterPos2sv" glRasterPos2sv ::
   Ptr GLshort -> IO ()

foreign import stdcall unsafe "glRasterPos3sv" glRasterPos3sv ::
   Ptr GLshort -> IO ()

foreign import stdcall unsafe "glRasterPos4sv" glRasterPos4sv ::
   Ptr GLshort -> IO ()

instance RasterPosComponent Int16 where
   rasterPos2 = glRasterPos2s
   rasterPos3 = glRasterPos3s
   rasterPos4 = glRasterPos4s

   rasterPos2v = glRasterPos2sv
   rasterPos3v = glRasterPos3sv
   rasterPos4v = glRasterPos4sv

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glRasterPos2i" glRasterPos2i ::
   GLint -> GLint -> IO ()

foreign import stdcall unsafe "glRasterPos3i" glRasterPos3i ::
   GLint -> GLint -> GLint -> IO ()

foreign import stdcall unsafe "glRasterPos4i" glRasterPos4i ::
   GLint -> GLint -> GLint -> GLint -> IO ()

foreign import stdcall unsafe "glRasterPos2iv" glRasterPos2iv ::
   Ptr GLint -> IO ()

foreign import stdcall unsafe "glRasterPos3iv" glRasterPos3iv ::
   Ptr GLint -> IO ()

foreign import stdcall unsafe "glRasterPos4iv" glRasterPos4iv ::
   Ptr GLint -> IO ()

instance RasterPosComponent Int32 where
   rasterPos2 = glRasterPos2i
   rasterPos3 = glRasterPos3i
   rasterPos4 = glRasterPos4i

   rasterPos2v = glRasterPos2iv
   rasterPos3v = glRasterPos3iv
   rasterPos4v = glRasterPos4iv

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glRasterPos2f" glRasterPos2f ::
   GLfloat -> GLfloat -> IO ()

foreign import stdcall unsafe "glRasterPos3f" glRasterPos3f ::
   GLfloat -> GLfloat -> GLfloat -> IO ()

foreign import stdcall unsafe "glRasterPos4f" glRasterPos4f ::
   GLfloat -> GLfloat -> GLfloat -> GLfloat -> IO ()

foreign import stdcall unsafe "glRasterPos2fv" glRasterPos2fv ::
   Ptr GLfloat -> IO ()

foreign import stdcall unsafe "glRasterPos3fv" glRasterPos3fv ::
   Ptr GLfloat -> IO ()

foreign import stdcall unsafe "glRasterPos4fv" glRasterPos4fv ::
   Ptr GLfloat -> IO ()

instance RasterPosComponent Float where
   rasterPos2 = glRasterPos2f
   rasterPos3 = glRasterPos3f
   rasterPos4 = glRasterPos4f

   rasterPos2v = glRasterPos2fv
   rasterPos3v = glRasterPos3fv
   rasterPos4v = glRasterPos4fv

--------------------------------------------------------------------------------

foreign import stdcall unsafe "glRasterPos2d" glRasterPos2d ::
   GLdouble -> GLdouble -> IO ()

foreign import stdcall unsafe "glRasterPos3d" glRasterPos3d ::
   GLdouble -> GLdouble -> GLdouble -> IO ()

foreign import stdcall unsafe "glRasterPos4d" glRasterPos4d ::
   GLdouble -> GLdouble -> GLdouble -> GLdouble -> IO ()

foreign import stdcall unsafe "glRasterPos2dv" glRasterPos2dv ::
   Ptr GLdouble -> IO ()

foreign import stdcall unsafe "glRasterPos3dv" glRasterPos3dv ::
   Ptr GLdouble -> IO ()

foreign import stdcall unsafe "glRasterPos4dv" glRasterPos4dv ::
   Ptr GLdouble -> IO ()

instance RasterPosComponent Double where
   rasterPos2 = glRasterPos2d
   rasterPos3 = glRasterPos3d
   rasterPos4 = glRasterPos4d

   rasterPos2v = glRasterPos2dv
   rasterPos3v = glRasterPos3dv
   rasterPos4v = glRasterPos4dv

--------------------------------------------------------------------------------

class RasterPos a where
   rasterPos  ::     a -> IO ()
   rasterPosv :: Ptr a -> IO ()

instance RasterPosComponent a => RasterPos (Vertex2 a) where
   rasterPos (Vertex2 x y) = rasterPos2 x y
   rasterPosv = rasterPos2v . (castPtr :: Ptr (Vertex2 b) -> Ptr b)

instance RasterPosComponent a => RasterPos (Vertex3 a) where
   rasterPos (Vertex3 x y z) = rasterPos3 x y z
   rasterPosv = rasterPos3v . (castPtr :: Ptr (Vertex3 b) -> Ptr b)

instance RasterPosComponent a => RasterPos (Vertex4 a) where
   rasterPos (Vertex4 x y z w) = rasterPos4 x y z w
   rasterPosv = rasterPos4v . (castPtr :: Ptr (Vertex4 b) -> Ptr b)

--------------------------------------------------------------------------------

class WindowPosComponent a where
   windowPos2 :: a -> a -> IO ()
   windowPos3 :: a -> a -> a -> IO ()

   windowPos2v :: Ptr a -> IO ()
   windowPos3v :: Ptr a -> IO ()

--------------------------------------------------------------------------------

foreign import stdcall unsafe "dynamic" dyn_glWindowPos2sARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLshort -> GLshort -> IO ()) ; glWindowPos2sARB :: (GLshort -> GLshort -> IO ()) ; glWindowPos2sARB = dyn_glWindowPos2sARB ptr_glWindowPos2sARB ; ptr_glWindowPos2sARB :: FunPtr a ; ptr_glWindowPos2sARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_window_pos or OpenGL 1.4") ("glWindowPos2sARB")) ; {-# NOINLINE ptr_glWindowPos2sARB #-}
foreign import stdcall unsafe "dynamic" dyn_glWindowPos3sARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLshort -> GLshort -> GLshort -> IO ()) ; glWindowPos3sARB :: (GLshort -> GLshort -> GLshort -> IO ()) ; glWindowPos3sARB = dyn_glWindowPos3sARB ptr_glWindowPos3sARB ; ptr_glWindowPos3sARB :: FunPtr a ; ptr_glWindowPos3sARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_window_pos or OpenGL 1.4") ("glWindowPos3sARB")) ; {-# NOINLINE ptr_glWindowPos3sARB #-}
foreign import stdcall unsafe "dynamic" dyn_glWindowPos2svARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (Ptr GLshort -> IO ()) ; glWindowPos2svARB :: (Ptr GLshort -> IO ()) ; glWindowPos2svARB = dyn_glWindowPos2svARB ptr_glWindowPos2svARB ; ptr_glWindowPos2svARB :: FunPtr a ; ptr_glWindowPos2svARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_window_pos or OpenGL 1.4") ("glWindowPos2svARB")) ; {-# NOINLINE ptr_glWindowPos2svARB #-}
foreign import stdcall unsafe "dynamic" dyn_glWindowPos3svARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (Ptr GLshort -> IO ()) ; glWindowPos3svARB :: (Ptr GLshort -> IO ()) ; glWindowPos3svARB = dyn_glWindowPos3svARB ptr_glWindowPos3svARB ; ptr_glWindowPos3svARB :: FunPtr a ; ptr_glWindowPos3svARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_window_pos or OpenGL 1.4") ("glWindowPos3svARB")) ; {-# NOINLINE ptr_glWindowPos3svARB #-}

instance WindowPosComponent Int16 where
   windowPos2 = glWindowPos2sARB
   windowPos3 = glWindowPos3sARB

   windowPos2v = glWindowPos2svARB
   windowPos3v = glWindowPos3svARB

--------------------------------------------------------------------------------

foreign import stdcall unsafe "dynamic" dyn_glWindowPos2iARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLint -> GLint -> IO ()) ; glWindowPos2iARB :: (GLint -> GLint -> IO ()) ; glWindowPos2iARB = dyn_glWindowPos2iARB ptr_glWindowPos2iARB ; ptr_glWindowPos2iARB :: FunPtr a ; ptr_glWindowPos2iARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_window_pos or OpenGL 1.4") ("glWindowPos2iARB")) ; {-# NOINLINE ptr_glWindowPos2iARB #-}
foreign import stdcall unsafe "dynamic" dyn_glWindowPos3iARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLint -> GLint -> GLint -> IO ()) ; glWindowPos3iARB :: (GLint -> GLint -> GLint -> IO ()) ; glWindowPos3iARB = dyn_glWindowPos3iARB ptr_glWindowPos3iARB ; ptr_glWindowPos3iARB :: FunPtr a ; ptr_glWindowPos3iARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_window_pos or OpenGL 1.4") ("glWindowPos3iARB")) ; {-# NOINLINE ptr_glWindowPos3iARB #-}
foreign import stdcall unsafe "dynamic" dyn_glWindowPos2ivARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (Ptr GLint -> IO ()) ; glWindowPos2ivARB :: (Ptr GLint -> IO ()) ; glWindowPos2ivARB = dyn_glWindowPos2ivARB ptr_glWindowPos2ivARB ; ptr_glWindowPos2ivARB :: FunPtr a ; ptr_glWindowPos2ivARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_window_pos or OpenGL 1.4") ("glWindowPos2ivARB")) ; {-# NOINLINE ptr_glWindowPos2ivARB #-}
foreign import stdcall unsafe "dynamic" dyn_glWindowPos3ivARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (Ptr GLint -> IO ()) ; glWindowPos3ivARB :: (Ptr GLint -> IO ()) ; glWindowPos3ivARB = dyn_glWindowPos3ivARB ptr_glWindowPos3ivARB ; ptr_glWindowPos3ivARB :: FunPtr a ; ptr_glWindowPos3ivARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_window_pos or OpenGL 1.4") ("glWindowPos3ivARB")) ; {-# NOINLINE ptr_glWindowPos3ivARB #-}

instance WindowPosComponent Int32 where
   windowPos2 = glWindowPos2iARB
   windowPos3 = glWindowPos3iARB

   windowPos2v = glWindowPos2ivARB
   windowPos3v = glWindowPos3ivARB

--------------------------------------------------------------------------------

foreign import stdcall unsafe "dynamic" dyn_glWindowPos2fARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLfloat -> GLfloat -> IO ()) ; glWindowPos2fARB :: (GLfloat -> GLfloat -> IO ()) ; glWindowPos2fARB = dyn_glWindowPos2fARB ptr_glWindowPos2fARB ; ptr_glWindowPos2fARB :: FunPtr a ; ptr_glWindowPos2fARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_window_pos or OpenGL 1.4") ("glWindowPos2fARB")) ; {-# NOINLINE ptr_glWindowPos2fARB #-}
foreign import stdcall unsafe "dynamic" dyn_glWindowPos3fARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLfloat -> GLfloat -> GLfloat -> IO ()) ; glWindowPos3fARB :: (GLfloat -> GLfloat -> GLfloat -> IO ()) ; glWindowPos3fARB = dyn_glWindowPos3fARB ptr_glWindowPos3fARB ; ptr_glWindowPos3fARB :: FunPtr a ; ptr_glWindowPos3fARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_window_pos or OpenGL 1.4") ("glWindowPos3fARB")) ; {-# NOINLINE ptr_glWindowPos3fARB #-}
foreign import stdcall unsafe "dynamic" dyn_glWindowPos2fvARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (Ptr GLfloat -> IO ()) ; glWindowPos2fvARB :: (Ptr GLfloat -> IO ()) ; glWindowPos2fvARB = dyn_glWindowPos2fvARB ptr_glWindowPos2fvARB ; ptr_glWindowPos2fvARB :: FunPtr a ; ptr_glWindowPos2fvARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_window_pos or OpenGL 1.4") ("glWindowPos2fvARB")) ; {-# NOINLINE ptr_glWindowPos2fvARB #-}
foreign import stdcall unsafe "dynamic" dyn_glWindowPos3fvARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (Ptr GLfloat -> IO ()) ; glWindowPos3fvARB :: (Ptr GLfloat -> IO ()) ; glWindowPos3fvARB = dyn_glWindowPos3fvARB ptr_glWindowPos3fvARB ; ptr_glWindowPos3fvARB :: FunPtr a ; ptr_glWindowPos3fvARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_window_pos or OpenGL 1.4") ("glWindowPos3fvARB")) ; {-# NOINLINE ptr_glWindowPos3fvARB #-}

instance WindowPosComponent Float where
   windowPos2 = glWindowPos2fARB
   windowPos3 = glWindowPos3fARB

   windowPos2v = glWindowPos2fvARB
   windowPos3v = glWindowPos3fvARB

--------------------------------------------------------------------------------

foreign import stdcall unsafe "dynamic" dyn_glWindowPos2dARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLdouble -> GLdouble -> IO ()) ; glWindowPos2dARB :: (GLdouble -> GLdouble -> IO ()) ; glWindowPos2dARB = dyn_glWindowPos2dARB ptr_glWindowPos2dARB ; ptr_glWindowPos2dARB :: FunPtr a ; ptr_glWindowPos2dARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_window_pos or OpenGL 1.4") ("glWindowPos2dARB")) ; {-# NOINLINE ptr_glWindowPos2dARB #-}
foreign import stdcall unsafe "dynamic" dyn_glWindowPos3dARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLdouble -> GLdouble -> GLdouble -> IO ()) ; glWindowPos3dARB :: (GLdouble -> GLdouble -> GLdouble -> IO ()) ; glWindowPos3dARB = dyn_glWindowPos3dARB ptr_glWindowPos3dARB ; ptr_glWindowPos3dARB :: FunPtr a ; ptr_glWindowPos3dARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_window_pos or OpenGL 1.4") ("glWindowPos3dARB")) ; {-# NOINLINE ptr_glWindowPos3dARB #-}
foreign import stdcall unsafe "dynamic" dyn_glWindowPos2dvARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (Ptr GLdouble -> IO ()) ; glWindowPos2dvARB :: (Ptr GLdouble -> IO ()) ; glWindowPos2dvARB = dyn_glWindowPos2dvARB ptr_glWindowPos2dvARB ; ptr_glWindowPos2dvARB :: FunPtr a ; ptr_glWindowPos2dvARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_window_pos or OpenGL 1.4") ("glWindowPos2dvARB")) ; {-# NOINLINE ptr_glWindowPos2dvARB #-}
foreign import stdcall unsafe "dynamic" dyn_glWindowPos3dvARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (Ptr GLdouble -> IO ()) ; glWindowPos3dvARB :: (Ptr GLdouble -> IO ()) ; glWindowPos3dvARB = dyn_glWindowPos3dvARB ptr_glWindowPos3dvARB ; ptr_glWindowPos3dvARB :: FunPtr a ; ptr_glWindowPos3dvARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_window_pos or OpenGL 1.4") ("glWindowPos3dvARB")) ; {-# NOINLINE ptr_glWindowPos3dvARB #-}

instance WindowPosComponent Double where
   windowPos2 = glWindowPos2dARB
   windowPos3 = glWindowPos3dARB

   windowPos2v = glWindowPos2dvARB
   windowPos3v = glWindowPos3dvARB

--------------------------------------------------------------------------------

class WindowPos a where
   windowPos  ::     a -> IO ()
   windowPosv :: Ptr a -> IO ()

instance WindowPosComponent a => WindowPos (Vertex2 a) where
   windowPos (Vertex2 x y) = windowPos2 x y
   windowPosv = windowPos2v . (castPtr :: Ptr (Vertex2 b) -> Ptr b)

instance WindowPosComponent a => WindowPos (Vertex3 a) where
   windowPos (Vertex3 x y z) = windowPos3 x y z
   windowPosv = windowPos3v . (castPtr :: Ptr (Vertex3 b) -> Ptr b)

--------------------------------------------------------------------------------

currentRasterDistance :: GettableStateVar GLfloat
currentRasterDistance =
   makeGettableStateVar (getFloat1 id GetCurrentRasterDistance)

currentRasterColor :: GettableStateVar (Color4 GLfloat)
currentRasterColor =
   makeGettableStateVar (getFloat4 Color4 GetCurrentRasterColor)

currentRasterIndex :: GettableStateVar (Index1 GLint)
currentRasterIndex =
   makeGettableStateVar (getInteger1 Index1 GetCurrentRasterIndex)

currentRasterTexCoords :: GettableStateVar (TexCoord4 GLfloat)
currentRasterTexCoords =
   makeGettableStateVar (getFloat4 TexCoord4 GetCurrentRasterTextureCoords)

currentRasterPositionValid :: GettableStateVar Bool
currentRasterPositionValid =
   makeGettableStateVar
      (getBoolean1 unmarshalGLboolean GetCurrentRasterPositionValid)

--------------------------------------------------------------------------------

rasterPositionUnclipped :: StateVar Capability
rasterPositionUnclipped = makeCapability CapRasterPositionUnclipped
