module Paths_Cabal (
	version,
	getBinDir, getLibDir, getDataDir, getLibexecDir,
	getDataFileName
	) where

import Data.Version

version = Version {versionBranch = [1,1,5], versionTags = []}

bindir     = "C:\\Program Files\\Cabal-1.1.5"
libdir     = "C:\\Program Files\\Haskell\\hugs\\packages\\Cabal"
datadir    = "C:\\Program Files\\Common Files\\Cabal-1.1.5"
libexecdir = "C:\\Program Files\\Cabal-1.1.5"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = return bindir
getLibDir = return libdir
getDataDir = return datadir
getLibexecDir = return libexecdir

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = return (datadir ++ "\\" ++ name)
