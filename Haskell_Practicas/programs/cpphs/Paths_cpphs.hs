module Paths_cpphs (
	version,
	getBinDir, getLibDir, getDataDir, getLibexecDir,
	getDataFileName
	) where

import Data.Version

version = Version {versionBranch = [1,2], versionTags = []}

bindir     = "C:\\Program Files\\cpphs-1.2"
libdir     = "C:\\Program Files\\Haskell\\hugs\\packages\\cpphs"
datadir    = "C:\\Program Files\\Common Files\\cpphs-1.2"
libexecdir = "C:\\Program Files\\cpphs-1.2"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = return bindir
getLibDir = return libdir
getDataDir = return datadir
getLibexecDir = return libexecdir

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = return (datadir ++ "\\" ++ name)
