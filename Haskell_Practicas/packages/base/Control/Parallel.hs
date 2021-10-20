-----------------------------------------------------------------------------
-- |
-- Module      :  Control.Parallel
-- Copyright   :  (c) The University of Glasgow 2001
-- License     :  BSD-style (see the file libraries/base/LICENSE)
-- 
-- Maintainer  :  libraries@haskell.org
-- Stability   :  experimental
-- Portability :  non-portable
--
-- Parallel Constructs
--
-----------------------------------------------------------------------------

module Control.Parallel (
          par, seq -- re-exported



    ) where

import Prelude

































-- Maybe parIO and the like could be added here later.

-- For now, Hugs does not support par properly.
par a b = b

