{-# OPTIONS_GHC -fffi #-}
{-# LANGUAGE ForeignFunctionInterface #-}
module Paths_hsc2hs (
	version,
	getBinDir, getLibDir, getDataDir, getLibexecDir,
	getDataFileName
	) where

import Foreign
import Foreign.C
import Data.Maybe
import Data.Version

version = Version {versionBranch = [0,66], versionTags = []}

prefix        = "C:\\Program Files"
bindirrel     = "hsc2hs-0.66"

getBinDir :: IO FilePath
getBinDir = getPrefixDirRel bindirrel

getLibDir :: IO FilePath
getLibDir = getPrefixDirRel "Haskell\\hugs\\packages\\hsc2hs"

getDataDir :: IO FilePath
getDataDir =  getPrefixDirRel "hsc2hs-0.66"

getLibexecDir :: IO FilePath
getLibexecDir = getPrefixDirRel "hsc2hs-0.66"

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getPrefixDirRel :: FilePath -> IO FilePath
getPrefixDirRel dirRel = do 
  let len = (2048::Int) -- plenty, PATH_MAX is 512 under Win32.
  buf <- mallocArray len
  ret <- getModuleFileName nullPtr buf len
  if ret == 0 
     then do free buf;
             return (prefix `joinFileName` dirRel)
     else do exePath <- peekCString buf
             free buf
             let (bindir,_) = splitFileName exePath
             return (prefixFromBinDir bindir bindirrel `joinFileName` dirRel)
  where
    prefixFromBinDir bindir path
      | path' == "." = bindir'
      | otherwise    = prefixFromBinDir bindir' path'
      where
        (bindir',_) = splitFileName bindir
        (path',  _) = splitFileName path

foreign import stdcall unsafe "windows.h GetModuleFileNameA"
  getModuleFileName :: Ptr () -> CString -> Int -> IO Int32

joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (last dir) = dir++fname
  | otherwise                  = dir++pathSeparator:fname

splitFileName p = (reverse (path2++drive), reverse fname)
  where
    (path,drive) = case p of
       (c:':':p) -> (reverse p,[':',c])
       _         -> (reverse p,"")
    (fname,path1) = break isPathSeparator path
    path2 = case path1 of
      []                           -> "."
      [_]                          -> path1   -- don't remove the trailing slash if 
                                              -- there is only one character
      (c:path) | isPathSeparator c -> path
      _                            -> path1

pathSeparator :: Char
pathSeparator = '\\'

isPathSeparator :: Char -> Bool
isPathSeparator ch =
  ch == '/' || ch == '\\'
