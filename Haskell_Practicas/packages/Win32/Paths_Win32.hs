module Paths_Win32 (
	version,
	getBinDir, getLibDir, getDataDir, getLibexecDir,
	getDataFileName
	) where

import Data.Version

version = Version {versionBranch = [1,0], versionTags = []}

bindir     = "C:\\Program Files\\Win32-1.0"
libdir     = "C:\\Program Files\\Haskell\\hugs\\packages\\Win32"
datadir    = "C:\\Program Files\\Common Files\\Win32-1.0"
libexecdir = "C:\\Program Files\\Win32-1.0"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = return bindir
getLibDir = return libdir
getDataDir = return datadir
getLibexecDir = return libexecdir

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = return (datadir ++ "\\" ++ name)
