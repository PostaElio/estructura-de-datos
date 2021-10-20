module Paths_fgl (
	version,
	getBinDir, getLibDir, getDataDir, getLibexecDir,
	getDataFileName
	) where

import Data.Version

version = Version {versionBranch = [5,2], versionTags = []}

bindir     = "C:\\Program Files\\fgl-5.2"
libdir     = "C:\\Program Files\\Haskell\\hugs\\packages\\fgl"
datadir    = "C:\\Program Files\\Common Files\\fgl-5.2"
libexecdir = "C:\\Program Files\\fgl-5.2"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = return bindir
getLibDir = return libdir
getDataDir = return datadir
getLibexecDir = return libexecdir

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = return (datadir ++ "\\" ++ name)
