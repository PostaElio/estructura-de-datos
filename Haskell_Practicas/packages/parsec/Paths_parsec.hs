module Paths_parsec (
	version,
	getBinDir, getLibDir, getDataDir, getLibexecDir,
	getDataFileName
	) where

import Data.Version

version = Version {versionBranch = [2,0], versionTags = []}

bindir     = "C:\\Program Files\\parsec-2.0"
libdir     = "C:\\Program Files\\Haskell\\hugs\\packages\\parsec"
datadir    = "C:\\Program Files\\Common Files\\parsec-2.0"
libexecdir = "C:\\Program Files\\parsec-2.0"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = return bindir
getLibDir = return libdir
getDataDir = return datadir
getLibexecDir = return libexecdir

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = return (datadir ++ "\\" ++ name)
