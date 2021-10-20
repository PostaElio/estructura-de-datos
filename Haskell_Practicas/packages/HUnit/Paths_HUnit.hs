module Paths_HUnit (
	version,
	getBinDir, getLibDir, getDataDir, getLibexecDir,
	getDataFileName
	) where

import Data.Version

version = Version {versionBranch = [1,1], versionTags = []}

bindir     = "C:\\Program Files\\HUnit-1.1"
libdir     = "C:\\Program Files\\Haskell\\hugs\\packages\\HUnit"
datadir    = "C:\\Program Files\\Common Files\\HUnit-1.1"
libexecdir = "C:\\Program Files\\HUnit-1.1"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = return bindir
getLibDir = return libdir
getDataDir = return datadir
getLibexecDir = return libexecdir

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = return (datadir ++ "\\" ++ name)
