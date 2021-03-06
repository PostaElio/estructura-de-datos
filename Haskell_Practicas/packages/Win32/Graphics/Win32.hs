-----------------------------------------------------------------------------
-- |
-- Module      :  Graphics.Win32
-- Copyright   :  (c) Alastair Reid, 1997-2003
-- License     :  BSD-style (see the file libraries/base/LICENSE)
--
-- Maintainer  :  libraries@haskell.org
-- Stability   :  provisional
-- Portability :  portable
--
-- An interface to the Microsoft Windows user interface.
-- See <http://msdn.microsoft.com/library/> under /User Interface Design
-- and Development/ and then /Windows User Interface/ for more details
-- of the underlying library.
--
-----------------------------------------------------------------------------

module Graphics.Win32 (
	module System.Win32.Types,
	module Graphics.Win32.Control,
	module Graphics.Win32.Dialogue,
	module Graphics.Win32.GDI,
	module Graphics.Win32.Icon,
	module Graphics.Win32.Key,
	module Graphics.Win32.Menu,
	module Graphics.Win32.Message,
	module Graphics.Win32.Misc,
	module Graphics.Win32.Resource,
	module Graphics.Win32.Window
	) where

import System.Win32.Types
import Graphics.Win32.Control
import Graphics.Win32.Dialogue
import Graphics.Win32.GDI
import Graphics.Win32.Icon
import Graphics.Win32.Key
import Graphics.Win32.Menu
import Graphics.Win32.Message
import Graphics.Win32.Misc
import Graphics.Win32.Resource
import Graphics.Win32.Window
