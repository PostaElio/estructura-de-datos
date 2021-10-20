-----------------------------------------------------------------------------
-- |
-- Module      :  Graphics.HGL.Draw.Region
-- Copyright   :  (c) Alastair Reid, 1999-2003
-- License     :  BSD-style (see the file libraries/base/LICENSE)
--
-- Maintainer  :  libraries@haskell.org
-- Stability   :  provisional
-- Portability :  non-portable (requires concurrency)
--
-- An efficient representation of sets of pixels.
--
-----------------------------------------------------------------------------

                                                      
                                                                            

                                                           


                                                         


                                                         


                                                         


                                                          


                                                         


                                                           


                                                            


                                                         


                                                                              


                                              


                                                          


                                                          


                                            


                                                        


                                                      


                                                                      




module Graphics.HGL.Draw.Region
	( Region



	, rectangleRegion	-- :: Point -> Point -> Region
	, ellipseRegion		-- :: Point -> Point -> Region
	, polygonRegion		-- :: [Point] -> Region
	, intersectRegion	-- :: Region -> Region -> Region
	, unionRegion		-- :: Region -> Region -> Region
	, subtractRegion	-- :: Region -> Region -> Region
	, xorRegion		-- :: Region -> Region -> Region
	, regionToGraphic	-- :: Region -> Graphic
	) where

import Graphics.HGL.Units (Point, Angle)
import Graphics.HGL.Draw.Monad (Graphic)
import Graphics.HGL.Internals.Draw (mkDraw)




import Graphics.HGL.Win32.Types
import qualified Graphics.Win32 as Win32


import System.IO.Unsafe( unsafePerformIO )

----------------------------------------------------------------
-- The Interface (SOE, p136)
--
-- Note that Win32 does not include emptyRegion (SOE, p140).
-- The obvious Win32 implementation (an empty rectangle) could create problems
-- when you calculate the bounding box
-- (This could be fixed by implementing Empty Regions explicitly in Haskell
--  at the (small) cost of an extra test on every region operation.)
----------------------------------------------------------------




newtype Region = MkRegion Win32.HRGN








-- | A rectangular region, with the given points as opposite corners.
rectangleRegion :: Point -> Point -> Region

-- | An elliptical region that fits in the rectangle with the given points
-- as opposite corners.
ellipseRegion   :: Point -> Point -> Region

-- | A polygonal region defined by a list of 'Point's.
polygonRegion   :: [Point] -> Region

-- | The intersection of two regions.
intersectRegion :: Region -> Region -> Region

-- | The union of two regions.
unionRegion     :: Region -> Region -> Region

-- | The part of the first region that is not also in the second.
subtractRegion  :: Region -> Region -> Region

-- | The symmetric difference of two regions.
xorRegion    	:: Region -> Region -> Region
			   
-- | Fill a 'Region' using the current 'Graphics.HGL.Draw.Brush'.
regionToGraphic :: Region -> Graphic

----------------------------------------------------------------
-- The Implementation
----------------------------------------------------------------



























































rectangleRegion pt0 pt1 = unsafePerformIO $ do
  r <- Win32.createRectRgn x0 y0 x1 y1
  return (MkRegion r)
 where
  (x0,y0) = fromPoint pt0
  (x1,y1) = fromPoint pt1

-- Sigh! createEllipticRgn raises an exception if either dimension
-- of the ellipse is empty.  We hack around this by using rectangleRegion
-- in the problematic case (since createRectRgn behaves sensibly).
ellipseRegion pt0 pt1 
  | x0 /= x1 && y0 /= y1
  = unsafePerformIO $ do
      r <- Win32.createEllipticRgn x0 y0 x1 y1
      return (MkRegion r)
  | otherwise
  = rectangleRegion pt0 pt1
 where
  (x0,y0) = fromPoint pt0
  (x1,y1) = fromPoint pt1

polygonRegion pts = unsafePerformIO $ do
  r <- Win32.createPolygonRgn (map fromPoint pts) Win32.wINDING
  return (MkRegion r)

-- combine :: Win32.ClippingMode -> Region -> Region -> Region -> IO ()
-- combine mode (MkRegion r1) (MkRegion r2) (MkRegion result) = do
--   Win32.combineRgn result r1 r2 mode
--   return ()

combine :: Win32.ClippingMode -> Region -> Region -> Region
combine mode (MkRegion r1) (MkRegion r2) = unsafePerformIO $ do
  r <- Win32.createRectRgn 0 0 0 0
  Win32.combineRgn r r1 r2 mode
  return (MkRegion r)

regionToGraphic (MkRegion r) = mkDraw (\hdc -> Win32.paintRgn hdc r)

intersectRegion = combine Win32.rGN_AND
unionRegion     = combine Win32.rGN_OR
xorRegion       = combine Win32.rGN_XOR
subtractRegion  = combine Win32.rGN_DIFF



----------------------------------------------------------------
-- End
----------------------------------------------------------------
