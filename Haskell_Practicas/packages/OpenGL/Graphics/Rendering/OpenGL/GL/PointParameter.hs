-- #hide
--------------------------------------------------------------------------------
-- |
-- Module      :  Graphics.Rendering.OpenGL.GL.PointParameter
-- Copyright   :  (c) Sven Panne 2002-2005
-- License     :  BSD-style (see the file libraries/OpenGL/LICENSE)
-- 
-- Maintainer  :  sven.panne@aedion.de
-- Stability   :  provisional
-- Portability :  portable
--
-- This is a purely internal module for setting point parameters.
--
--------------------------------------------------------------------------------

module Graphics.Rendering.OpenGL.GL.PointParameter (
   PointParameter(..), pointParameterf, pointParameterfv
) where

import Foreign.Ptr ( Ptr )
import Graphics.Rendering.OpenGL.GL.BasicTypes ( GLenum, GLfloat )
import Graphics.Rendering.OpenGL.GL.Extensions (
   FunPtr, unsafePerformIO, Invoker, getProcAddress )

--------------------------------------------------------------------------------

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         




                                                                                                                                                                          












--------------------------------------------------------------------------------

data PointParameter =
     PointSizeMin
   | PointSizeMax
   | PointFadeThresholdSize
   | PointDistanceAttenuation

marshalPointParameter :: PointParameter -> GLenum
marshalPointParameter x = case x of
   PointSizeMin -> 0x8126
   PointSizeMax -> 0x8127
   PointFadeThresholdSize -> 0x8128
   PointDistanceAttenuation -> 0x8129

--------------------------------------------------------------------------------

pointParameterf :: PointParameter -> GLfloat -> IO ()
pointParameterf = glPointParameterfARB . marshalPointParameter

foreign import stdcall unsafe "dynamic" dyn_glPointParameterfARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> GLfloat -> IO ()) ; glPointParameterfARB :: (GLenum -> GLfloat -> IO ()) ; glPointParameterfARB = dyn_glPointParameterfARB ptr_glPointParameterfARB ; ptr_glPointParameterfARB :: FunPtr a ; ptr_glPointParameterfARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_point_parameters or OpenGL 1.4") ("glPointParameterfARB")) ; {-# NOINLINE ptr_glPointParameterfARB #-}

pointParameterfv :: PointParameter -> Ptr GLfloat -> IO ()
pointParameterfv = glPointParameterfvARB . marshalPointParameter

foreign import stdcall unsafe "dynamic" dyn_glPointParameterfvARB :: Graphics.Rendering.OpenGL.GL.Extensions.Invoker (GLenum -> Ptr GLfloat -> IO ()) ; glPointParameterfvARB :: (GLenum -> Ptr GLfloat -> IO ()) ; glPointParameterfvARB = dyn_glPointParameterfvARB ptr_glPointParameterfvARB ; ptr_glPointParameterfvARB :: FunPtr a ; ptr_glPointParameterfvARB = unsafePerformIO (Graphics.Rendering.OpenGL.GL.Extensions.getProcAddress ("GL_ARB_point_parameters or OpenGL 1.4") ("glPointParameterfvARB")) ; {-# NOINLINE ptr_glPointParameterfvARB #-}
