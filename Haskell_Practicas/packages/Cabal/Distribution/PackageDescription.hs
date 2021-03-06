-----------------------------------------------------------------------------
-- |
-- Module      :  Distribution.PackageDescription
-- Copyright   :  Isaac Jones 2003-2005
-- 
-- Maintainer  :  Isaac Jones <ijones@syntaxpolice.org>
-- Stability   :  alpha
-- Portability :  portable
--
-- Package description and parsing.

{- All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.

    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.

    * Neither the name of Isaac Jones nor the names of other
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. -}

module Distribution.PackageDescription (
        -- * Package descriptions
        PackageDescription(..),
        emptyPackageDescription,
        readPackageDescription,
        parseDescription,
        StanzaField(..),
        LineNo,
        basicStanzaFields,
        writePackageDescription,
        showPackageDescription,
        sanityCheckPackage, errorOut,
        setupMessage,
        Library(..),
        withLib,
        hasLibs,
        libModules,
        Executable(..),
        withExe,
        exeModules,
        -- * Build information
        BuildInfo(..),
        emptyBuildInfo,
        -- ** Supplementary build information
        HookedBuildInfo,
        emptyHookedBuildInfo,
        readHookedBuildInfo,
        parseHookedBuildInfo,
        writeHookedBuildInfo,
        showHookedBuildInfo,        
        updatePackageDescription,
        -- * Utilities
        ParseResult(..),
        PError, showError,
        hcOptions,
        autogenModuleName,




  ) where

import Control.Monad(liftM, foldM, when)
import Data.Char
import Data.Maybe(fromMaybe, fromJust, isNothing, catMaybes)
import Data.List (nub)
import Text.PrettyPrint.HughesPJ
import System.Directory(doesFileExist)
import System.Environment(getProgName)
import System.IO(hPutStrLn, stderr)
import System.Exit

import Distribution.ParseUtils
import Distribution.Package(PackageIdentifier(..),showPackageId,
                            parsePackageName)
import Distribution.Version(Version(..), VersionRange(..), withinRange,
                            showVersion, parseVersion, showVersionRange, parseVersionRange)
import Distribution.License(License(..))
import Distribution.Version(Dependency(..))
import Distribution.Compiler(CompilerFlavor(..))
import Distribution.Simple.Utils(currentDir, die, dieWithLocation, warn)
import Language.Haskell.Extension(Extension(..))

import Distribution.Compat.ReadP as ReadP hiding (get)






-- |Fix. Figure out a way to get this from .cabal file
cabalVersion :: Version
cabalVersion = Version [1,1,4] []

-- | This data type is the internal representation of the file @pkg.cabal@.
-- It contains two kinds of information about the package: information
-- which is needed for all packages, such as the package name and version, and 
-- information which is needed for the simple build system only, such as 
-- the compiler options and library name.
-- 
data PackageDescription
    =  PackageDescription {
        -- the following are required by all packages:
        package        :: PackageIdentifier,
        license        :: License,
        licenseFile    :: FilePath,
        copyright      :: String,
        maintainer     :: String,
        author         :: String,
        stability      :: String,
        testedWith     :: [(CompilerFlavor,VersionRange)],
        homepage       :: String,
        pkgUrl         :: String,
        synopsis       :: String, -- ^A one-line summary of this package
        description    :: String, -- ^A more verbose description of this package
        category       :: String,
        buildDepends   :: [Dependency],
        descCabalVersion :: VersionRange, -- ^If this package depends on a specific version of Cabal, give that here.
        -- components
        library        :: Maybe Library,
        executables    :: [Executable],
        dataFiles      :: [FilePath],
        extraSrcFiles  :: [FilePath],
        extraTmpFiles  :: [FilePath]
    }
    deriving (Show, Read, Eq)

data Library = Library {
        exposedModules    :: [String],
        libBuildInfo      :: BuildInfo
    }
    deriving (Show, Eq, Read)

emptyLibrary :: Library
emptyLibrary = Library [] emptyBuildInfo

emptyPackageDescription :: PackageDescription
emptyPackageDescription
    =  PackageDescription {package      = PackageIdentifier "" (Version [] []),
                      license      = AllRightsReserved,
                      licenseFile  = "",
                      descCabalVersion = AnyVersion,
                      copyright    = "",
                      maintainer   = "",
                      author       = "",
                      stability    = "",
                      testedWith   = [],
                      buildDepends = [],
                      homepage     = "",
                      pkgUrl       = "",
                      synopsis     = "",
                      description  = "",
                      category     = "",
                      library      = Nothing,
                      executables  = [],
                      dataFiles    = [],
                      extraSrcFiles = [],
                      extraTmpFiles = []
                     }

-- |Get all the module names from the libraries in this package
libModules :: PackageDescription -> [String]
libModules PackageDescription{library=lib}
    = (maybe [] exposedModules lib)
      ++ (maybe [] (otherModules . libBuildInfo) lib)

-- |Get all the module names from the exes in this package
exeModules :: PackageDescription -> [String]
exeModules PackageDescription{executables=execs}
    = concatMap (otherModules . buildInfo) execs

-- |does this package have any libraries?
hasLibs :: PackageDescription -> Bool
hasLibs p = maybe False (buildable . libBuildInfo) (library p)

-- Consider refactoring into executable and library versions.
data BuildInfo = BuildInfo {
        buildable         :: Bool,      -- ^ component is buildable here
        ccOptions         :: [String],  -- ^ options for C compiler
        ldOptions         :: [String],  -- ^ options for linker
        frameworks        :: [String], -- ^support frameworks for Mac OS X
        cSources          :: [FilePath],
        hsSourceDirs      :: [FilePath], -- ^ where to look for the haskell module hierarchy
        otherModules      :: [String], -- ^ non-exposed or non-main modules
        extensions        :: [Extension],
        extraLibs         :: [String], -- ^ what libraries to link with when compiling a program that uses your package
        extraLibDirs      :: [String],
        includeDirs       :: [FilePath], -- ^directories to find .h files
        includes          :: [FilePath], -- ^ The .h files to be found in includeDirs
	installIncludes   :: [FilePath], -- ^ .h files to install with the package
        options           :: [(CompilerFlavor,[String])],
        ghcProfOptions       :: [String]
    }
    deriving (Show,Read,Eq)

emptyBuildInfo :: BuildInfo
emptyBuildInfo = BuildInfo {
                      buildable         = True,
                      ccOptions         = [],
                      ldOptions         = [],
                      frameworks        = [],
                      cSources          = [],
                      hsSourceDirs      = [currentDir],
                      otherModules      = [],
                      extensions        = [],
                      extraLibs         = [],
                      extraLibDirs      = [],
                      includeDirs       = [],
                      includes          = [],
                      installIncludes   = [],
                      options           = [],
                      ghcProfOptions       = []
                     }

data Executable = Executable {
        exeName    :: String,
        modulePath :: FilePath,
        buildInfo  :: BuildInfo
    }
    deriving (Show, Read, Eq)

emptyExecutable :: Executable
emptyExecutable = Executable {
                      exeName = "",
                      modulePath = "",
                      buildInfo = emptyBuildInfo
                     }

-- | Perform the action on each buildable 'Executable' in the package
-- description.
withExe :: PackageDescription -> (Executable -> IO a) -> IO ()
withExe pkg_descr f =
  sequence_ [f exe | exe <- executables pkg_descr, buildable (buildInfo exe)]

type HookedBuildInfo = (Maybe BuildInfo, [(String, BuildInfo)])

emptyHookedBuildInfo :: HookedBuildInfo
emptyHookedBuildInfo = (Nothing, [])

-- ------------------------------------------------------------
-- * Utils
-- ------------------------------------------------------------

-- |If the package description has a library section, call the given
--  function with the library build info as argument.
withLib :: PackageDescription -> a -> (Library -> IO a) -> IO a
withLib pkg_descr a f = if hasLibs pkg_descr
                        then f (fromJust (library pkg_descr))
                        else return a

setupMessage :: String -> PackageDescription -> IO ()
setupMessage msg pkg_descr = 
   putStrLn (msg ++ ' ':showPackageId (package pkg_descr) ++ "...")

-- |Update the given package description with the output from the
-- pre-hooks.

updatePackageDescription :: HookedBuildInfo -> PackageDescription -> PackageDescription
updatePackageDescription (mb_lib_bi, exe_bi) p
    = p{ executables = updateExecutables exe_bi    (executables p)
       , library     = updateLibrary     mb_lib_bi (library     p)
       }
    where
      updateLibrary :: Maybe BuildInfo -> Maybe Library -> Maybe Library
      updateLibrary (Just bi) (Just lib) = Just (lib{libBuildInfo = unionBuildInfo bi (libBuildInfo lib)})
      updateLibrary Nothing   mb_lib     = mb_lib

       --the lib only exists in the buildinfo file.  FIX: Is this
       --wrong?  If there aren't any exposedModules, then the library
       --won't build anyway.  add to sanity checker?
      updateLibrary (Just bi) Nothing     = Just emptyLibrary{libBuildInfo=bi}

      updateExecutables :: [(String, BuildInfo)] -- ^[(exeName, new buildinfo)]
                        -> [Executable]          -- ^list of executables to update
                        -> [Executable]          -- ^list with exeNames updated
      updateExecutables exe_bi' executables' = foldr updateExecutable executables' exe_bi'
      
      updateExecutable :: (String, BuildInfo) -- ^(exeName, new buildinfo)
                       -> [Executable]        -- ^list of executables to update
                       -> [Executable]        -- ^libst with exeName updated
      updateExecutable _                 []         = []
      updateExecutable exe_bi'@(name,bi) (exe:exes)
        | exeName exe == name = exe{buildInfo = unionBuildInfo bi (buildInfo exe)} : exes
        | otherwise           = exe : updateExecutable exe_bi' exes

unionBuildInfo :: BuildInfo -> BuildInfo -> BuildInfo
unionBuildInfo b1 b2
    = b1{buildable         = buildable b1 && buildable b2,
         ccOptions         = combine ccOptions,
         ldOptions         = combine ldOptions,
         frameworks        = combine frameworks,
         cSources          = combine cSources,
         hsSourceDirs      = combine hsSourceDirs,
         otherModules      = combine otherModules,
         extensions        = combine extensions,
         extraLibs         = combine extraLibs,
         extraLibDirs      = combine extraLibDirs,
         includeDirs       = combine includeDirs,
         includes          = combine includes,
         installIncludes   = combine installIncludes,
         options           = combine options
        }
      where 
      combine :: (Eq a) => (BuildInfo -> [a]) -> [a]
      combine f = nub $ f b1 ++ f b2

-- |Select options for a particular Haskell compiler.
hcOptions :: CompilerFlavor -> [(CompilerFlavor, [String])] -> [String]
hcOptions hc hc_opts = [opt | (hc',opts) <- hc_opts, hc' == hc, opt <- opts]

-- |The name of the auto-generated module associated with a package
autogenModuleName :: PackageDescription -> String
autogenModuleName pkg_descr =
    "Paths_" ++ map fixchar (pkgName (package pkg_descr))
  where fixchar '-' = '_'
        fixchar c   = c

-- ------------------------------------------------------------
-- * Parsing & Pretty printing
-- ------------------------------------------------------------

-- the strings for the required fields are necessary here, and so we
-- don't repeat ourselves, I name them:

reqNameName       = "name"
reqNameVersion    = "version"
reqNameCopyright  = "copyright"
reqNameMaintainer = "maintainer"
reqNameSynopsis   = "synopsis"

basicStanzaFields :: [StanzaField PackageDescription]
basicStanzaFields =
 [ simpleField reqNameName
                           text                   parsePackageName
                           (pkgName . package)    (\name pkg -> pkg{package=(package pkg){pkgName=name}})
 , simpleField reqNameVersion
                           (text . showVersion)   parseVersion
                           (pkgVersion . package) (\ver pkg -> pkg{package=(package pkg){pkgVersion=ver}})
 , simpleField "cabal-version"
                           (text . showVersionRange) parseVersionRange
                           descCabalVersion       (\v pkg -> pkg{descCabalVersion=v})
 , simpleField "license"
                           (text . show)          parseLicenseQ
                           license                (\l pkg -> pkg{license=l})
 , simpleField "license-file"
                           showFilePath           parseFilePathQ
                           licenseFile            (\l pkg -> pkg{licenseFile=l})
 , simpleField reqNameCopyright
                           showFreeText           (munch (const True))
                           copyright              (\val pkg -> pkg{copyright=val})
 , simpleField reqNameMaintainer
                           showFreeText           (munch (const True))
                           maintainer             (\val pkg -> pkg{maintainer=val})
 , commaListField  "build-depends"
                           showDependency         parseDependency
                           buildDepends           (\xs    pkg -> pkg{buildDepends=xs})
 , simpleField "stability"
                           showFreeText           (munch (const True))
                           stability              (\val pkg -> pkg{stability=val})
 , simpleField "homepage"
                           showFreeText           (munch (const True))
                           homepage               (\val pkg -> pkg{homepage=val})
 , simpleField "package-url"
                           showFreeText           (munch (const True))
                           pkgUrl                 (\val pkg -> pkg{pkgUrl=val})
 , simpleField reqNameSynopsis
                           showFreeText           (munch (const True))
                           synopsis               (\val pkg -> pkg{synopsis=val})
 , simpleField "description"
                           showFreeText           (munch (const True))
                           description            (\val pkg -> pkg{description=val})
 , simpleField "category"
                           showFreeText           (munch (const True))
                           category               (\val pkg -> pkg{category=val})
 , simpleField "author"
                           showFreeText           (munch (const True))
                           author                 (\val pkg -> pkg{author=val})
 , listField "tested-with"
                           showTestedWith         parseTestedWithQ
                           testedWith             (\val pkg -> pkg{testedWith=val})
 , listField "data-files"  showFilePath           parseFilePathQ
                           dataFiles              (\val pkg -> pkg{dataFiles=val})
 , listField "extra-source-files" showFilePath    parseFilePathQ
                           extraSrcFiles          (\val pkg -> pkg{extraSrcFiles=val})
 , listField "extra-tmp-files" showFilePath       parseFilePathQ
                           extraTmpFiles          (\val pkg -> pkg{extraTmpFiles=val})
 ]

executableStanzaFields :: [StanzaField Executable]
executableStanzaFields =
 [ simpleField "executable"
                           showFreeText       (munch (const True))
                           exeName            (\xs    exe -> exe{exeName=xs})
 , simpleField "main-is"
                           showFilePath       parseFilePathQ
                           modulePath         (\xs    exe -> exe{modulePath=xs})
 ]

binfoFields :: [StanzaField BuildInfo]
binfoFields =
 [ simpleField "buildable"
                           (text . show)      parseReadS
                           buildable          (\val binfo -> binfo{buildable=val})
 , listField "cc-options"
                           showToken          parseTokenQ
                           ccOptions          (\val binfo -> binfo{ccOptions=val})
 , listField "ld-options"
                           showToken          parseTokenQ
                           ldOptions          (\val binfo -> binfo{ldOptions=val})
 , listField "frameworks"
                           showToken          parseTokenQ
                           frameworks         (\val binfo -> binfo{frameworks=val})
 , listField   "c-sources"
                           showFilePath       parseFilePathQ
                           cSources           (\paths binfo -> binfo{cSources=paths})
 , listField   "extensions"
                           (text . show)      parseExtensionQ
                           extensions         (\exts  binfo -> binfo{extensions=exts})
 , listField   "extra-libraries"
                           showToken          parseTokenQ
                           extraLibs          (\xs    binfo -> binfo{extraLibs=xs})
 , listField   "extra-lib-dirs"
                           showFilePath       parseFilePathQ
                           extraLibDirs       (\xs    binfo -> binfo{extraLibDirs=xs})
 , listField   "includes"
                           showFilePath       parseFilePathQ
                           includes           (\paths binfo -> binfo{includes=paths})
 , listField   "install-includes"
                           showFilePath       parseFilePathQ
                           includes           (\paths binfo -> binfo{installIncludes=paths})
 , listField   "include-dirs"
                           showFilePath       parseFilePathQ
                           includeDirs        (\paths binfo -> binfo{includeDirs=paths})
 , listField   "hs-source-dirs"
                           showFilePath       parseFilePathQ
                           hsSourceDirs       (\paths binfo -> binfo{hsSourceDirs=paths})
 , listField   "other-modules"         
                           text               parseModuleNameQ
                           otherModules       (\val binfo -> binfo{otherModules=val})
 , listField   "ghc-prof-options"         
                           text               parseTokenQ
                           ghcProfOptions        (\val binfo -> binfo{ghcProfOptions=val})
 , optsField   "ghc-options"  GHC
                           options            (\path  binfo -> binfo{options=path})
 , optsField   "hugs-options" Hugs
                           options            (\path  binfo -> binfo{options=path})
 , optsField   "nhc-options"  NHC
                           options            (\path  binfo -> binfo{options=path})
 , optsField   "jhc-options"  JHC
                           options            (\path  binfo -> binfo{options=path})
 ]


-- --------------------------------------------
-- ** Parsing

-- | Given a parser and a filename, return the parse of the file,
-- after checking if the file exists.
readAndParseFile ::  (String -> ParseResult a) -> FilePath -> IO a
readAndParseFile parser fpath = do 
  exists <- doesFileExist fpath
  when (not exists) (die $ "Error Parsing: file \"" ++ fpath ++ "\" doesn't exist. Cannot continue.")
  str <- readFile fpath
  case parser str of
    ParseFailed e -> do
        let (lineNo, message) = locatedErrorMsg e
        dieWithLocation fpath lineNo message
    ParseOk ws x -> do
        mapM_ warn ws
        return x

-- |Parse the given package file.
readPackageDescription :: FilePath -> IO PackageDescription
readPackageDescription = readAndParseFile parseDescription 

readHookedBuildInfo :: FilePath -> IO HookedBuildInfo
readHookedBuildInfo = readAndParseFile parseHookedBuildInfo

parseDescription :: String -> ParseResult PackageDescription
parseDescription inp = do (st:sts) <- splitStanzas inp
                          pkg <- foldM (parseBasicStanza basicStanzaFields) emptyPackageDescription st
                          exes <- mapM parseExecutableStanza sts
                          return pkg{executables=exes}
  where -- The basic stanza, with library building info
        parseBasicStanza ((StanzaField name _ set):fields) pkg (lineNo, f, val)
          | name == f = set lineNo val pkg
          | otherwise = parseBasicStanza fields pkg (lineNo, f, val)
          {-     
     , listField   "exposed-modules"
                           text               parseModuleNameQ
                           (\p -> maybe [] exposedModules (library p))
                           (\xs    pkg -> let lib = fromMaybe emptyLibrary (library pkg) in
                                              pkg{library = Just lib{exposedModules=xs}})
-}
        parseBasicStanza [] pkg (lineNo, f, val)
          | "exposed-modules" == f = do
               mods <- runP lineNo f (parseOptCommaList parseModuleNameQ) val
               return pkg{library=Just lib{exposedModules=mods}}
          | otherwise = do
               bi <- parseBInfoField binfoFields (libBuildInfo lib) (lineNo, f, val)
               return pkg{library=Just lib{libBuildInfo=bi}}
          where
            lib = fromMaybe emptyLibrary (library pkg)

        parseExecutableStanza st@((lineNo, "executable",eName):_) =
          case lookupField "main-is" st of
            Just (_,_) -> foldM (parseExecutableField executableStanzaFields) emptyExecutable st
            Nothing           -> syntaxError lineNo $ "No 'Main-Is' field found for " ++ eName ++ " stanza"
        parseExecutableStanza ((lineNo, f,_):_) = 
          syntaxError lineNo $ "'Executable' stanza starting with field '" ++ f ++ "'"
        parseExecutableStanza _ = error "This shouldn't happen!"

        parseExecutableField ((StanzaField name _ set):fields) exe (lineNo, f, val)
          | name == f = set lineNo val exe
          | otherwise = parseExecutableField fields exe (lineNo, f, val)
        parseExecutableField [] exe (lineNo, f, val) = do
          binfo <- parseBInfoField binfoFields (buildInfo exe) (lineNo, f, val)
          return exe{buildInfo=binfo}

        -- ...
        lookupField :: String -> Stanza -> Maybe (LineNo,String)

        lookupField x ((n,f,v):st)
          | x == f      = Just (n,v)
          | otherwise   = lookupField x st
        lookupField _ [] = Nothing

parseHookedBuildInfo :: String -> ParseResult HookedBuildInfo
parseHookedBuildInfo inp = do
  stanzas@(mLibStr:exes) <- splitStanzas inp
  mLib <- parseLib mLibStr
  case mLib of
    Nothing      -> do biExes <- mapM parseExe stanzas
                       return (Nothing, biExes)
    lib@(Just _) -> do biExes <- mapM parseExe exes
                       return (lib, biExes)
  where
    parseLib :: Stanza -> ParseResult (Maybe BuildInfo)
    parseLib (bi@((_, inFieldName, _):_))
        | map toLower inFieldName /= "executable" = liftM Just (parseBI bi)
    parseLib _ = return Nothing
    parseExe :: Stanza -> ParseResult (String, BuildInfo)
    parseExe ((lineNo, inFieldName, mName):bi)
        | map toLower inFieldName == "executable"
            = do bis <- parseBI bi
                 return (mName, bis)
        | otherwise = syntaxError lineNo "expecting 'executable' at top of stanza"
    parseExe [] = syntaxError 0 "error in parsing buildinfo file. Expected executable stanza"
    parseBI :: Stanza -> ParseResult BuildInfo
    parseBI st = foldM (parseBInfoField binfoFields) emptyBuildInfo st

parseBInfoField :: [StanzaField a] -> a -> (LineNo, String, String) -> ParseResult a
parseBInfoField ((StanzaField name _ set):fields) binfo (lineNo, f, val)
          | name == f = set lineNo val binfo
          | otherwise = parseBInfoField fields binfo (lineNo, f, val)
-- ignore "x-" extension fields without a warning
parseBInfoField [] binfo (lineNo, 'x':'-':f, _) = return binfo
parseBInfoField [] binfo (lineNo, f, _) = do
          warning $ "Unknown field '" ++ f ++ "'"
          return binfo

-- --------------------------------------------
-- ** Pretty printing

writePackageDescription :: FilePath -> PackageDescription -> IO ()
writePackageDescription fpath pkg = writeFile fpath (showPackageDescription pkg)

showPackageDescription :: PackageDescription -> String
showPackageDescription pkg = render $
  ppFields pkg basicStanzaFields $$
  (case library pkg of
     Nothing  -> empty
     Just lib -> 
        text "exposed-modules" <> colon <+> fsep (punctuate comma (map text (exposedModules lib))) $$
        ppFields (libBuildInfo lib) binfoFields) $$
  vcat (map ppExecutable (executables pkg))
  where
    ppExecutable exe =
      space $$
      ppFields exe executableStanzaFields $$
      ppFields (buildInfo exe) binfoFields

    ppFields _ [] = empty
    ppFields pkg' ((StanzaField name get _):flds) =
           ppField name (get pkg') $$ ppFields pkg' flds

ppField name field = text name <> colon <+> field

writeHookedBuildInfo :: FilePath -> HookedBuildInfo -> IO ()
writeHookedBuildInfo fpath pbi = writeFile fpath (showHookedBuildInfo pbi)

showHookedBuildInfo :: HookedBuildInfo -> String
showHookedBuildInfo (mb_lib_bi, ex_bi) = render $
  (case mb_lib_bi of
     Nothing -> empty
     Just bi -> ppFields bi binfoFields) $$
  vcat (map ppExeBuildInfo ex_bi)
  where
    ppExeBuildInfo (name, bi) =
      space $$
      text "executable:" <+> text name $$
      ppFields bi binfoFields

    ppFields _  [] = empty
    ppFields bi ((StanzaField name get _):flds) =
           ppField name (get bi) $$ ppFields bi flds


-- ------------------------------------------------------------
-- * Sanity Checking
-- ------------------------------------------------------------

-- |Sanity check this description file.

-- FIX: add a sanity check for missing haskell files? That's why its
-- in the IO monad.

sanityCheckPackage :: PackageDescription -> IO ([String] -- Warnings
                                               ,[String])-- Errors
sanityCheckPackage pkg_descr
    = let libSane   = sanityCheckLib (library pkg_descr)
          nothingToDo = checkSanity
                        (null (executables pkg_descr) && isNothing (library pkg_descr))
                        "No executables and no library found. Nothing to do."
          noModules = checkSanity (hasMods pkg_descr)
                      "No exposed modules or executables in this package."
          allRights = checkSanity (license pkg_descr == AllRightsReserved)
                      "Package is copyright All Rights Reserved"
          noLicenseFile = checkSanity (null $ licenseFile pkg_descr)
                          "No license-file field."
          goodCabal = let v = (descCabalVersion pkg_descr)
                          in checkSanity (not $ cabalVersion  `withinRange` v)
                                 ("This package requires Cabal verion: " ++ (showVersionRange v) ++ ".")

         in return $ (catMaybes [nothingToDo, noModules,
                                 allRights, noLicenseFile]
                     ,catMaybes $ libSane:goodCabal:(checkMissingFields pkg_descr))

-- |Output warnings and errors. Exit if any errors.
errorOut :: [String]  -- ^Warnings
         -> [String]  -- ^errors
         -> IO ()
errorOut warnings errors = do
  mapM warn warnings
  when (not (null errors)) $ do
    pname <- getProgName
    mapM (hPutStrLn stderr . ((pname ++ ": Error: ") ++)) errors
    exitWith (ExitFailure 1)

checkMissingFields :: PackageDescription -> [Maybe String]
checkMissingFields pkg_descr = 
    [missingField (pkgName . package)    reqNameName
    ,missingField (versionBranch .pkgVersion .package) reqNameVersion
    ]
    where missingField :: (PackageDescription -> [a]) -- Field accessor
                       -> String -- Name of field
                       -> Maybe String -- error message
          missingField f n
              = if null (f pkg_descr)
                 then Just $ "Missing field: " ++ n
                 else Nothing

sanityCheckLib :: Maybe Library -> Maybe String
sanityCheckLib Nothing  = Nothing
sanityCheckLib (Just l)
    = if null $ exposedModules l
      then Just "Non-empty library, but empty exposed modules list. Cabal may not build this library correctly"
      else Nothing

checkSanity :: Bool -> String -> Maybe String
checkSanity False _  = Nothing
checkSanity True  s  = Just s

hasMods :: PackageDescription -> Bool
hasMods pkg_descr
    | isNothing (library pkg_descr) = null $ executables pkg_descr
    | otherwise = null (executables pkg_descr)
                   && null (exposedModules (fromJust (library pkg_descr)))

-- ------------------------------------------------------------
-- * Testing
-- ------------------------------------------------------------





























































































































































































