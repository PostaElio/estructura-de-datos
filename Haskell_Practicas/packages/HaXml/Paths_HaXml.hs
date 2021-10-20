module Paths_HaXml (
	version,
	getBinDir, getLibDir, getDataDir, getLibexecDir,
	getDataFileName
	) where

import Data.Version

version = Version {versionBranch = [1,15], versionTags = []}

bindir     = "C:\\Program Files\\HaXml-1.15"
libdir     = "C:\\Program Files\\Haskell\\hugs\\packages\\HaXml"
datadir    = "C:\\Program Files\\Common Files\\HaXml-1.15"
libexecdir = "C:\\Program Files\\HaXml-1.15"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = return bindir
getLibDir = return libdir
getDataDir = return datadir
getLibexecDir = return libexecdir

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = return (datadir ++ "\\" ++ name)
