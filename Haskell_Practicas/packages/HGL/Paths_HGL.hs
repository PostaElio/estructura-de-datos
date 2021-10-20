module Paths_HGL (
	version,
	getBinDir, getLibDir, getDataDir, getLibexecDir,
	getDataFileName
	) where

import Data.Version

version = Version {versionBranch = [3,1], versionTags = []}

bindir     = "C:\\Program Files\\HGL-3.1"
libdir     = "C:\\Program Files\\Haskell\\hugs\\packages\\HGL"
datadir    = "C:\\Program Files\\Common Files\\HGL-3.1"
libexecdir = "C:\\Program Files\\HGL-3.1"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = return bindir
getLibDir = return libdir
getDataDir = return datadir
getLibexecDir = return libexecdir

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = return (datadir ++ "\\" ++ name)
