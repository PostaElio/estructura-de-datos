module Paths_OpenGL (
	version,
	getBinDir, getLibDir, getDataDir, getLibexecDir,
	getDataFileName
	) where

import Data.Version

version = Version {versionBranch = [2,1], versionTags = []}

bindir     = "C:\\Program Files\\OpenGL-2.1"
libdir     = "C:\\Program Files\\Haskell\\hugs\\packages\\OpenGL"
datadir    = "C:\\Program Files\\Common Files\\OpenGL-2.1"
libexecdir = "C:\\Program Files\\OpenGL-2.1"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = return bindir
getLibDir = return libdir
getDataDir = return datadir
getLibexecDir = return libexecdir

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = return (datadir ++ "\\" ++ name)
