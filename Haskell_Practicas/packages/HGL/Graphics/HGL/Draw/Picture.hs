-----------------------------------------------------------------------------
-- |
-- Module      :  Graphics.HGL.Draw.Picture
-- Copyright   :  (c) Alastair Reid, 1999-2003
-- License     :  BSD-style (see the file libraries/base/LICENSE)
-- 
-- Maintainer  :  libraries@haskell.org
-- Stability   :  provisional
-- Portability :  non-portable (requires concurrency)
--
-- Drawing various shapes.
--
-----------------------------------------------------------------------------

                                                      
                                                                            

                                                           


                                                         


                                                         


                                                         


                                                          


                                                         


                                                           


                                                            


                                                         


                                                                              


                                              


                                                          


                                                          


                                            


                                                        


                                                      


                                                                      




module Graphics.HGL.Draw.Picture
	( arc, ellipse, shearEllipse
	, line, polyline, polygon
	, polyBezier -- becomes error message and polyline in X11
	) where







import Graphics.HGL.Win32.Types
import qualified Graphics.Win32 as Win32


import Graphics.HGL.Draw.Monad(Graphic)
import Graphics.HGL.Internals.Draw(mkDraw)
import Graphics.HGL.Units

----------------------------------------------------------------
-- The Interface (SOE, p50)
----------------------------------------------------------------

-- | A filled arc from an ellipse.
arc
  :: Point	-- ^ a corner of the rectangle bounding the ellipse.
  -> Point	-- ^ the opposite corner of the rectangle bounding the ellipse.
  -> Angle	-- ^ the start angle of the arc, measured counter-clockwise
		-- from the horizontal.
  -> Angle	-- ^ the extent of the arc, measured counter-clockwise from
		-- the start angle.
  -> Graphic	-- ^ a filled shape

-- | A filled ellipse that fits inside a rectangle defined by two
-- 'Point's on the window.
ellipse
  :: Point	-- ^ a corner of the rectangle bounding the ellipse.
  -> Point	-- ^ the opposite corner of the rectangle bounding the ellipse.
  -> Graphic	-- ^ a filled shape

-- | A filled sheared ellipse that fits inside a parallelogram defined
-- by three 'Point's on the window.  This function is implemented using
-- polygons on both Win32 and X11.
shearEllipse
  :: Point	-- ^ a corner of the bounding parallelogram.
  -> Point	-- ^ another corner of the parallelogram, adjacent to the first.
  -> Point	-- ^ another corner of the parallelogram, adjacent to the first
		-- and thus opposite to the second.
  -> Graphic	-- ^ a filled shape

-- | A filled polygon defined by a list of 'Point's.
polygon      :: [Point]                          -> Graphic  -- filled

-- | A line between two 'Point's.
line         :: Point -> Point           	 -> Graphic  -- unfilled

-- | A series of lines through a list of 'Point's.
polyline     :: [Point]                          -> Graphic  -- unfilled

-- | A series of (unfilled) Bezier curves defined by a list of 3/n/+1
-- control 'Point's.  This function is not supported on X11 (it yields
-- an error message and a 'polyline').
polyBezier   :: [Point]                          -> Graphic  -- unfilled

----------------------------------------------------------------
-- The Implementation
----------------------------------------------------------------














































































arc p0 p1 start end = mkDraw (\ hdc -> Win32.arc hdc x0 y0 x1 y1 xs ys xe ye)
 where 
  (x0,y0) = fromPoint p0
  (x1,y1) = fromPoint p1
  x = (x0 + x1) `div` 2
  y = (y0 + y1) `div` 2
  start' = 2 * pi * start / 360
  end'   = 2 * pi * end   / 360
  xs = x + round (100 * cos start')
  ys = y + round (100 * sin start')
  xe = x + round (100 * cos end')
  ye = y + round (100 * sin end')

ellipse p0 p1  = mkDraw (\ hdc -> Win32.ellipse hdc x0 y0 x1 y1)
 where 
  (x0,y0) = fromPoint p0
  (x1,y1) = fromPoint p1

shearEllipse p0 p1 p2 = mkDraw (\ hdc -> 
  Win32.transformedEllipse hdc (fromPoint p0) (fromPoint p1) (fromPoint p2))

line p0 p1 = mkDraw (\ hdc -> Win32.moveToEx hdc x0 y0 >> Win32.lineTo   hdc x1 y1)
 where 
  (x0,y0) = fromPoint p0
  (x1,y1) = fromPoint p1

polyline pts   = mkDraw (\ hdc -> Win32.polyline   hdc (map fromPoint pts))
polygon pts    = mkDraw (\ hdc -> Win32.polygon    hdc (map fromPoint pts))
polyBezier pts = mkDraw (\ hdc -> Win32.polyBezier hdc (map fromPoint pts))



----------------------------------------------------------------
-- End
----------------------------------------------------------------
