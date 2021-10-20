-----------------------------------------------------------------------------
-- |
-- Module      :  Graphics.HGL.Draw.Brush
-- Copyright   :  (c) Alastair Reid, 1999-2003
-- License     :  BSD-style (see the file libraries/base/LICENSE)
-- 
-- Maintainer  :  libraries@haskell.org
-- Stability   :  provisional
-- Portability :  non-portable (requires concurrency)
--
-- Brushes, used for filling shapes.
--
-----------------------------------------------------------------------------

                                                      
                                                                            

                                                           


                                                         


                                                         


                                                         


                                                          


                                                         


                                                           


                                                            


                                                         


                                                                              


                                              


                                                          


                                                          


                                            


                                                        


                                                      


                                                                      




module Graphics.HGL.Draw.Brush
	( Brush
	, createBrush
	, deleteBrush
	, selectBrush	-- :: Brush -> Draw Brush
	, mkBrush
	-- , blackBrush, whiteBrush
	) where

import Graphics.HGL.Draw.Text (RGB(..))
import Graphics.HGL.Draw.Monad (Draw)
import Graphics.HGL.Internals.Draw (mkDraw)





import Graphics.HGL.Draw.Monad (ioToDraw, bracket)
import qualified Graphics.Win32 as Win32


----------------------------------------------------------------
-- The interface
----------------------------------------------------------------


newtype Brush = MkBrush Win32.HBRUSH


-- | Create a 'Brush'.
createBrush :: RGB   -> IO Brush

-- | Destroy a 'Brush' created with 'createBrush'.
deleteBrush :: Brush -> IO ()

-- | Set the 'Brush' for subsequent drawing, returning the previous setting.
selectBrush :: Brush -> Draw Brush

-- | Create a 'Brush' locally to a drawing.
mkBrush     :: RGB   -> (Brush -> Draw a) -> Draw a

----------------------------------------------------------------
-- The implementation
----------------------------------------------------------------



















createBrush (RGB r g b) = do
  b <- Win32.createSolidBrush (Win32.rgb r g b)
  return (MkBrush b)

deleteBrush (MkBrush b) = Win32.deleteBrush b

selectBrush (MkBrush b) = mkDraw $ \hdc -> do
  b' <- Win32.selectBrush hdc b
  return (MkBrush b')

mkBrush color =
  bracket (ioToDraw $ createBrush color)
          (ioToDraw . deleteBrush)

----------------------------------------------------------------
-- 
-- -- special cases - these should _never_ be deleted
-- blackBrush :: IO Brush
-- whiteBrush :: IO Brush
-- 
-- blackBrush = Win32.getStockBrush Win32.bLACK_BRUSH >>= return . MkBrush
-- whiteBrush = Win32.getStockBrush Win32.wHITE_BRUSH >>= return . MkBrush
-- 
----------------------------------------------------------------


