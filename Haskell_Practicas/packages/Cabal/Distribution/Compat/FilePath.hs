module Distribution.Compat.FilePath
         ( -- * File path
           FilePath
         , splitFileName
         , splitFileExt
         , splitFilePath
         , baseName
         , dirName
         , joinFileName
         , joinFileExt
         , joinPaths         
         , changeFileExt
         , isRootedPath
         , isAbsolutePath
         , dropAbsolutePrefix
         , breakFilePath
         , dropPrefix

         , pathParents
         , commonParent

         -- * Search path
         , parseSearchPath
         , mkSearchPath

         -- * Separators
         , isPathSeparator
         , pathSeparator
         , searchPathSeparator
         , platformPath

         -- * Filename extensions
         , exeExtension
         , objExtension
         , dllExtension
         ) where









import Data.List(intersperse)

--------------------------------------------------------------
-- * FilePath
--------------------------------------------------------------

-- | Split the path into directory and file name
--
-- Examples:
--
-- \[Posix\]
--
-- > splitFileName "/"            == ("/",    ".")
-- > splitFileName "/foo/bar.ext" == ("/foo", "bar.ext")
-- > splitFileName "bar.ext"      == (".",    "bar.ext")
-- > splitFileName "/foo/."       == ("/foo", ".")
-- > splitFileName "/foo/.."      == ("/foo", "..")
--
-- \[Windows\]
--
-- > splitFileName "\\"               == ("\\",      "")
-- > splitFileName "c:\\foo\\bar.ext" == ("c:\\foo", "bar.ext")
-- > splitFileName "bar.ext"          == (".",       "bar.ext")
-- > splitFileName "c:\\foo\\."       == ("c:\\foo", ".")
-- > splitFileName "c:\\foo\\.."      == ("c:\\foo", "..")
--
-- The first case in the Windows examples returns an empty file name.
-- This is a special case because the \"\\\\\" path doesn\'t refer to
-- an object (file or directory) which resides within a directory.
splitFileName :: FilePath -> (String, String)

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














-- | Split the path into file name and extension. If the file doesn\'t have extension,
-- the function will return empty string. The extension doesn\'t include a leading period.
--
-- Examples:
--
-- > splitFileExt "foo.ext" == ("foo", "ext")
-- > splitFileExt "foo"     == ("foo", "")
-- > splitFileExt "."       == (".",   "")
-- > splitFileExt ".."      == ("..",  "")
-- > splitFileExt "foo.bar."== ("foo.bar.", "")
-- > splitFileExt "foo.tar.gz" == ("foo.tar","gz")

splitFileExt :: FilePath -> (String, String)
splitFileExt p =
  case break (== '.') fname of
        (suf@(_:_),_:pre) -> (reverse (pre++path), reverse suf)
        _                 -> (p, [])
  where
    (fname,path) = break isPathSeparator (reverse p)

-- | Split the path into directory, file name and extension. 
-- The function is an optimized version of the following equation:
--
-- > splitFilePath path = (dir,name,ext)
-- >   where
-- >     (dir,basename) = splitFileName path
-- >     (name,ext)     = splitFileExt  basename
splitFilePath :: FilePath -> (String, String, String)
splitFilePath path = case break (== '.') (reverse basename) of
    (name_r, "")      -> (dir, reverse name_r, "")
    (ext_r, _:name_r) -> (dir, reverse name_r, reverse ext_r)
  where
    (dir, basename) = splitFileName path

baseName :: FilePath -> FilePath
baseName = snd . splitFileName
dirName :: FilePath -> FilePath
dirName  = fst . splitFileName


-- | The 'joinFileName' function is the opposite of 'splitFileName'. 
-- It joins directory and file names to form a complete file path.
--
-- The general rule is:
--
-- > dir `joinFileName` basename == path
-- >   where
-- >     (dir,basename) = splitFileName path
--
-- There might be an exceptions to the rule but in any case the
-- reconstructed path will refer to the same object (file or directory).
-- An example exception is that on Windows some slashes might be converted
-- to backslashes.
joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (last dir) = dir++fname
  | otherwise                  = dir++pathSeparator:fname

-- | The 'joinFileExt' function is the opposite of 'splitFileExt'.
-- It joins a file name and an extension to form a complete file path.
--
-- The general rule is:
--
-- > filename `joinFileExt` ext == path
-- >   where
-- >     (filename,ext) = splitFileExt path
joinFileExt :: String -> String -> FilePath
joinFileExt path ""  = path
joinFileExt path ext = path ++ '.':ext

-- | Given a directory path \"dir\" and a file\/directory path \"rel\",
-- returns a merged path \"full\" with the property that
-- (cd dir; do_something_with rel) is equivalent to
-- (do_something_with full). If the \"rel\" path is an absolute path
-- then the returned path is equal to \"rel\"
joinPaths :: FilePath -> FilePath -> FilePath
joinPaths path1 path2
  | isRootedPath path2 = path2
  | otherwise          = 

        case path2 of
          d:':':path2' | take 2 path1 == [d,':'] -> path1 `joinFileName` path2'
                       | otherwise               -> path2
          _                                      -> path1 `joinFileName` path2



  
-- | Changes the extension of a file path.
changeFileExt :: FilePath           -- ^ The path information to modify.
          -> String                 -- ^ The new extension (without a leading period).
                                    -- Specify an empty string to remove an existing 
                                    -- extension from path.
          -> FilePath               -- ^ A string containing the modified path information.
changeFileExt path ext = joinFileExt name ext
  where
    (name,_) = splitFileExt path

-- | On Unix and Macintosh the 'isRootedPath' function is a synonym to 'isAbsolutePath'.
-- The difference is important only on Windows. The rooted path must start from the root
-- directory but may not include the drive letter while the absolute path always includes
-- the drive letter and the full file path.
isRootedPath :: FilePath -> Bool
isRootedPath (c:_) | isPathSeparator c = True

isRootedPath (_:':':c:_) | isPathSeparator c = True  -- path with drive letter

isRootedPath _ = False

-- | Returns 'True' if this path\'s meaning is independent of any OS
-- \"working directory\", or 'False' if it isn\'t.
isAbsolutePath :: FilePath -> Bool

isAbsolutePath (_:':':c:_) | isPathSeparator c = True



isAbsolutePath _ = False

-- | If the function is applied to an absolute path then it returns a local path droping
-- the absolute prefix in the path. Under Windows the prefix is \"\\\", \"c:\" or \"c:\\\". Under
-- Unix the prefix is always \"\/\".
dropAbsolutePrefix :: FilePath -> FilePath
dropAbsolutePrefix (c:cs) | isPathSeparator c = cs

dropAbsolutePrefix (_:':':c:cs) | isPathSeparator c = cs  -- path with drive letter
dropAbsolutePrefix (_:':':cs)                       = cs

dropAbsolutePrefix cs = cs

-- | Split the path into a list of strings constituting the filepath
-- 
-- >  breakFilePath "/usr/bin/ls" == ["/","usr","bin","ls"]
breakFilePath :: FilePath -> [String]
breakFilePath = worker []
    where worker ac path
              | less == path = less:ac
              | otherwise = worker (current:ac) less
              where (less,current) = splitFileName path

-- | Drops a specified prefix from a filepath.
-- 
-- >  stripPrefix "." "Src/Test.hs" == "Src/Test.hs"
-- >  stripPrefix "Src" "Src/Test.hs" == "Test.hs"
dropPrefix :: FilePath -> FilePath -> FilePath
dropPrefix prefix path
    = worker (breakFilePath prefix) (breakFilePath path)
    where worker (x:xs) (y:ys)
              | x == y = worker xs ys
          worker _ ys = foldr1 joinPaths ys
-- | Gets this path and all its parents.
-- The function is useful in case if you want to create 
-- some file but you aren\'t sure whether all directories 
-- in the path exist or if you want to search upward for some file.
-- 
-- Some examples:
--
-- \[Posix\]
--
-- >  pathParents "/"          == ["/"]
-- >  pathParents "/dir1"      == ["/", "/dir1"]
-- >  pathParents "/dir1/dir2" == ["/", "/dir1", "/dir1/dir2"]
-- >  pathParents "dir1"       == [".", "dir1"]
-- >  pathParents "dir1/dir2"  == [".", "dir1", "dir1/dir2"]
--
-- \[Windows\]
--
-- >  pathParents "c:"             == ["c:."]
-- >  pathParents "c:\\"           == ["c:\\"]
-- >  pathParents "c:\\dir1"       == ["c:\\", "c:\\dir1"]
-- >  pathParents "c:\\dir1\\dir2" == ["c:\\", "c:\\dir1", "c:\\dir1\\dir2"]
-- >  pathParents "c:dir1"         == ["c:.","c:dir1"]
-- >  pathParents "dir1\\dir2"     == [".", "dir1", "dir1\\dir2"]
--
-- Note that if the file is relative then the current directory (\".\") 
-- will be explicitly listed.
pathParents :: FilePath -> [FilePath]
pathParents p =
    root'' : map ((++) root') (dropEmptyPath $ inits path')
    where

       (root,path) = case break (== ':') p of
          (path,    "") -> ("",path)
          (root,_:path) -> (root++":",path)



       (root',root'',path') = case path of
         (c:path) | isPathSeparator c -> (root++[pathSeparator],root++[pathSeparator],path)
         _                            -> (root                 ,root++"."            ,path)

       dropEmptyPath ("":paths) = paths
       dropEmptyPath paths      = paths

       inits :: String -> [String]
       inits [] =  [""]
       inits cs = 
         case pre of
           "."  -> inits suf
           ".." -> map (joinFileName pre) (dropEmptyPath $ inits suf)
           _    -> "" : map (joinFileName pre) (inits suf)
         where
           (pre,suf) = case break isPathSeparator cs of
              (pre,"")    -> (pre, "")
              (pre,_:suf) -> (pre,suf)

-- | Given a list of file paths, returns the longest common parent.
commonParent :: [FilePath] -> Maybe FilePath
commonParent []           = Nothing
commonParent paths@(p:ps) = 
  case common Nothing "" p ps of

    Nothing | all (not . isAbsolutePath) paths -> 
      let
         getDrive (d:':':_) ds 
           | not (d `elem` ds) = d:ds
         getDrive _         ds = ds
      in
      case foldr getDrive [] paths of
        []  -> Just "."
        [d] -> Just [d,':']
        _   -> Nothing



    mb_path   -> mb_path
  where
    common i acc []     ps = checkSep   i acc         ps
    common i acc (c:cs) ps
      | isPathSeparator c  = removeSep  i acc   cs [] ps
      | otherwise          = removeChar i acc c cs [] ps

    checkSep i acc []      = Just (reverse acc)
    checkSep i acc ([]:ps) = Just (reverse acc)
    checkSep i acc ((c1:p):ps)
      | isPathSeparator c1 = checkSep i acc ps
    checkSep i acc ps      = i

    removeSep i acc cs pacc []          = 
      common (Just (reverse (pathSeparator:acc))) (pathSeparator:acc) cs pacc
    removeSep i acc cs pacc ([]    :ps) = Just (reverse acc)
    removeSep i acc cs pacc ((c1:p):ps)
      | isPathSeparator c1              = removeSep i acc cs (p:pacc) ps
    removeSep i acc cs pacc ps          = i

    removeChar i acc c cs pacc []          = common i (c:acc) cs pacc
    removeChar i acc c cs pacc ([]    :ps) = i
    removeChar i acc c cs pacc ((c1:p):ps)
      | c == c1                            = removeChar i acc c cs (p:pacc) ps
    removeChar i acc c cs pacc ps          = i

--------------------------------------------------------------
-- * Search path
--------------------------------------------------------------

-- | The function splits the given string to substrings
-- using the 'searchPathSeparator'.
parseSearchPath :: String -> [FilePath]
parseSearchPath path = split path
  where
    split :: String -> [String]
    split s =
      case rest' of
        []     -> [chunk] 
        _:rest -> chunk : split rest
      where
        chunk = 
          case chunk' of

            ('\"':xs@(_:_)) | last xs == '\"' -> init xs

            _                                 -> chunk'

        (chunk', rest') = break (==searchPathSeparator) s

-- | The function concatenates the given paths to form a
-- single string where the paths are separated with 'searchPathSeparator'.
mkSearchPath :: [FilePath] -> String
mkSearchPath paths = concat (intersperse [searchPathSeparator] paths)


--------------------------------------------------------------
-- * Separators
--------------------------------------------------------------

-- | Checks whether the character is a valid path separator for the host
-- platform. The valid character is a 'pathSeparator' but since the Windows
-- operating system also accepts a slash (\"\/\") since DOS 2, the function
-- checks for it on this platform, too.
isPathSeparator :: Char -> Bool
isPathSeparator ch =

  ch == '/' || ch == '\\'




-- | Provides a platform-specific character used to separate directory levels in
-- a path string that reflects a hierarchical file system organization. The
-- separator is a slash (@\"\/\"@) on Unix and Macintosh, and a backslash
-- (@\"\\\"@) on the Windows operating system.
pathSeparator :: Char

pathSeparator = '\\'




-- | A platform-specific character used to separate search path strings in 
-- environment variables. The separator is a colon (\":\") on Unix and Macintosh, 
-- and a semicolon (\";\") on the Windows operating system.
searchPathSeparator :: Char

searchPathSeparator = ';'




-- |Convert Unix-style path separators to the path separators for this platform.
platformPath :: FilePath -> FilePath

platformPath = map slash
  where slash '/' = '\\'
        slash c = c




-- ToDo: This should be determined via autoconf (AC_EXEEXT)
-- | Extension for executable files
-- (typically @\"\"@ on Unix and @\"exe\"@ on Windows or OS\/2)
exeExtension :: String

exeExtension = "exe"




-- ToDo: This should be determined via autoconf (AC_OBJEXT)
-- | Extension for object files. For GHC and NHC the extension is @\"o\"@.
-- Hugs uses either @\"o\"@ or @\"obj\"@ depending on the used C compiler.
objExtension :: String
objExtension = "o"

-- | Extension for dynamically linked (or shared) libraries
-- (typically @\"so\"@ on Unix and @\"dll\"@ on Windows)
dllExtension :: String

dllExtension = "dll"



