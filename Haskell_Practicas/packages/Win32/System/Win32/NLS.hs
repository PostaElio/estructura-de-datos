{-# OPTIONS_GHC -optc-D__HUGS__ #-}
{-# OPTIONS_GHC -optc-DUNICODE #-}
{-# INCLUDE <windows.h> #-}
{-# INCLUDE "errors.h" #-}
{-# INCLUDE "win32debug.h" #-}
{-# LINE 1 "System\Win32\NLS.hsc" #-}
-----------------------------------------------------------------------------
{-# LINE 2 "System\Win32\NLS.hsc" #-}
-- |
-- Module      :  System.Win32.NLS
-- Copyright   :  (c) Alastair Reid, 1997-2003
-- License     :  BSD-style (see the file libraries/base/LICENSE)
--
-- Maintainer  :  libraries@haskell.org
-- Stability   :  provisional
-- Portability :  portable
--
-- A collection of FFI declarations for interfacing with Win32.
--
-----------------------------------------------------------------------------

module System.Win32.NLS  (
	module System.Win32.NLS,

	-- defined in System.Win32.Types
	LCID, LANGID, SortID, SubLANGID, PrimaryLANGID,
	mAKELCID, lANGIDFROMLCID, sORTIDFROMLCID,
	mAKELANGID, pRIMARYLANGID, sUBLANGID
	) where

import System.Win32.Types

import Foreign


{-# LINE 29 "System\Win32\NLS.hsc" #-}

{-# LINE 30 "System\Win32\NLS.hsc" #-}

{-# LINE 31 "System\Win32\NLS.hsc" #-}

lOCALE_SYSTEM_DEFAULT  :: LCID
lOCALE_SYSTEM_DEFAULT  =  2048
lOCALE_USER_DEFAULT    :: LCID
lOCALE_USER_DEFAULT    =  1024
lOCALE_NEUTRAL         :: LCID
lOCALE_NEUTRAL         =  0

{-# LINE 37 "System\Win32\NLS.hsc" #-}

foreign import stdcall unsafe "windows.h ConvertDefaultLocale"
  convertDefaultLocale :: LCID -> IO LCID

-- ToDo: various enum functions.

type CodePage = UINT

cP_ACP        :: CodePage
cP_ACP        =  0
cP_MACCP      :: CodePage
cP_MACCP      =  2
cP_OEMCP      :: CodePage
cP_OEMCP      =  1

{-# LINE 50 "System\Win32\NLS.hsc" #-}

foreign import stdcall unsafe "windows.h GetACP"
  getACP :: IO CodePage

foreign import stdcall unsafe "windows.h SetThreadLocale"
  setThreadLocale :: LCID -> IO ()

type LCTYPE = UINT

lOCALE_ICALENDARTYPE  :: LCTYPE
lOCALE_ICALENDARTYPE  =  4105
lOCALE_SDATE          :: LCTYPE
lOCALE_SDATE          =  29
lOCALE_ICURRDIGITS    :: LCTYPE
lOCALE_ICURRDIGITS    =  25
lOCALE_SDECIMAL       :: LCTYPE
lOCALE_SDECIMAL       =  14
lOCALE_ICURRENCY      :: LCTYPE
lOCALE_ICURRENCY      =  27
lOCALE_SGROUPING      :: LCTYPE
lOCALE_SGROUPING      =  16
lOCALE_IDIGITS        :: LCTYPE
lOCALE_IDIGITS        =  17
lOCALE_SLIST          :: LCTYPE
lOCALE_SLIST          =  12
lOCALE_IFIRSTDAYOFWEEK  :: LCTYPE
lOCALE_IFIRSTDAYOFWEEK  =  4108
lOCALE_SLONGDATE      :: LCTYPE
lOCALE_SLONGDATE      =  32
lOCALE_IFIRSTWEEKOFYEAR  :: LCTYPE
lOCALE_IFIRSTWEEKOFYEAR  =  4109
lOCALE_SMONDECIMALSEP  :: LCTYPE
lOCALE_SMONDECIMALSEP  =  22
lOCALE_ILZERO         :: LCTYPE
lOCALE_ILZERO         =  18
lOCALE_SMONGROUPING   :: LCTYPE
lOCALE_SMONGROUPING   =  24
lOCALE_IMEASURE       :: LCTYPE
lOCALE_IMEASURE       =  13
lOCALE_SMONTHOUSANDSEP  :: LCTYPE
lOCALE_SMONTHOUSANDSEP  =  23
lOCALE_INEGCURR       :: LCTYPE
lOCALE_INEGCURR       =  28
lOCALE_SNEGATIVESIGN  :: LCTYPE
lOCALE_SNEGATIVESIGN  =  81
lOCALE_INEGNUMBER     :: LCTYPE
lOCALE_INEGNUMBER     =  4112
lOCALE_SPOSITIVESIGN  :: LCTYPE
lOCALE_SPOSITIVESIGN  =  80
lOCALE_SSHORTDATE     :: LCTYPE
lOCALE_SSHORTDATE     =  31
lOCALE_ITIME          :: LCTYPE
lOCALE_ITIME          =  35
lOCALE_STHOUSAND      :: LCTYPE
lOCALE_STHOUSAND      =  15
lOCALE_S1159          :: LCTYPE
lOCALE_S1159          =  40
lOCALE_STIME          :: LCTYPE
lOCALE_STIME          =  30
lOCALE_S2359          :: LCTYPE
lOCALE_S2359          =  41
lOCALE_STIMEFORMAT    :: LCTYPE
lOCALE_STIMEFORMAT    =  4099
lOCALE_SCURRENCY      :: LCTYPE
lOCALE_SCURRENCY      =  20

{-# LINE 89 "System\Win32\NLS.hsc" #-}

setLocaleInfo :: LCID -> LCTYPE -> String -> IO ()
setLocaleInfo locale ty info =
  withTString info $ \ c_info ->
  failIfFalse_ "SetLocaleInfo" $ c_SetLocaleInfo locale ty c_info
foreign import stdcall unsafe "windows.h SetLocaleInfoW"
  c_SetLocaleInfo :: LCID -> LCTYPE -> LPCTSTR -> IO Bool

type LCMapFlags = DWORD

lCMAP_BYTEREV         :: LCMapFlags
lCMAP_BYTEREV         =  2048
lCMAP_FULLWIDTH       :: LCMapFlags
lCMAP_FULLWIDTH       =  8388608
lCMAP_HALFWIDTH       :: LCMapFlags
lCMAP_HALFWIDTH       =  4194304
lCMAP_HIRAGANA        :: LCMapFlags
lCMAP_HIRAGANA        =  1048576
lCMAP_KATAKANA        :: LCMapFlags
lCMAP_KATAKANA        =  2097152
lCMAP_LOWERCASE       :: LCMapFlags
lCMAP_LOWERCASE       =  256
lCMAP_SORTKEY         :: LCMapFlags
lCMAP_SORTKEY         =  1024
lCMAP_UPPERCASE       :: LCMapFlags
lCMAP_UPPERCASE       =  512
nORM_IGNORECASE       :: LCMapFlags
nORM_IGNORECASE       =  1
nORM_IGNORENONSPACE   :: LCMapFlags
nORM_IGNORENONSPACE   =  2
nORM_IGNOREKANATYPE   :: LCMapFlags
nORM_IGNOREKANATYPE   =  65536
nORM_IGNORESYMBOLS    :: LCMapFlags
nORM_IGNORESYMBOLS    =  4
nORM_IGNOREWIDTH      :: LCMapFlags
nORM_IGNOREWIDTH      =  131072
sORT_STRINGSORT       :: LCMapFlags
sORT_STRINGSORT       =  4096
lCMAP_LINGUISTIC_CASING       :: LCMapFlags
lCMAP_LINGUISTIC_CASING       =  16777216
lCMAP_SIMPLIFIED_CHINESE      :: LCMapFlags
lCMAP_SIMPLIFIED_CHINESE      =  33554432
lCMAP_TRADITIONAL_CHINESE     :: LCMapFlags
lCMAP_TRADITIONAL_CHINESE     =  67108864

{-# LINE 118 "System\Win32\NLS.hsc" #-}

lCMapString :: LCID -> LCMapFlags -> String -> Int -> IO String
lCMapString locale flags src dest_size =
  withTStringLen src $ \ (c_src, src_len) ->
  allocaArray dest_size $ \ c_dest -> do
  failIfZero "LCMapString" $
    c_LCMapString locale flags c_src src_len c_dest dest_size
  peekTString c_dest
foreign import stdcall unsafe "windows.h LCMapStringW"
  c_LCMapString :: LCID -> LCMapFlags -> LPCTSTR -> Int -> LPCTSTR -> Int -> IO Int

type LocaleTestFlags = DWORD

lCID_INSTALLED        :: LocaleTestFlags
lCID_INSTALLED        =  1
lCID_SUPPORTED        :: LocaleTestFlags
lCID_SUPPORTED        =  2

{-# LINE 135 "System\Win32\NLS.hsc" #-}

foreign import stdcall unsafe "windows.h IsValidLocale"
  isValidLocale :: LCID -> LocaleTestFlags -> IO Bool

foreign import stdcall unsafe "windows.h IsValidCodePage"
  isValidCodePage :: CodePage -> IO Bool

foreign import stdcall unsafe "windows.h GetUserDefaultLCID"
  getUserDefaultLCID :: LCID

foreign import stdcall unsafe "windows.h GetUserDefaultLangID"
  getUserDefaultLangID :: LANGID

foreign import stdcall unsafe "windows.h GetThreadLocale"
  getThreadLocale :: IO LCID

foreign import stdcall unsafe "windows.h GetSystemDefaultLCID"
  getSystemDefaultLCID :: LCID

foreign import stdcall unsafe "windows.h GetSystemDefaultLangID"
  getSystemDefaultLangID :: LANGID

foreign import stdcall unsafe "windows.h GetOEMCP"
  getOEMCP :: CodePage

lANG_NEUTRAL          :: PrimaryLANGID
lANG_NEUTRAL          =  0
lANG_BULGARIAN        :: PrimaryLANGID
lANG_BULGARIAN        =  2
lANG_CHINESE          :: PrimaryLANGID
lANG_CHINESE          =  4
lANG_CZECH            :: PrimaryLANGID
lANG_CZECH            =  5
lANG_DANISH           :: PrimaryLANGID
lANG_DANISH           =  6
lANG_GERMAN           :: PrimaryLANGID
lANG_GERMAN           =  7
lANG_GREEK            :: PrimaryLANGID
lANG_GREEK            =  8
lANG_ENGLISH          :: PrimaryLANGID
lANG_ENGLISH          =  9
lANG_SPANISH          :: PrimaryLANGID
lANG_SPANISH          =  10
lANG_FINNISH          :: PrimaryLANGID
lANG_FINNISH          =  11
lANG_FRENCH           :: PrimaryLANGID
lANG_FRENCH           =  12
lANG_HUNGARIAN        :: PrimaryLANGID
lANG_HUNGARIAN        =  14
lANG_ICELANDIC        :: PrimaryLANGID
lANG_ICELANDIC        =  15
lANG_ITALIAN          :: PrimaryLANGID
lANG_ITALIAN          =  16
lANG_JAPANESE         :: PrimaryLANGID
lANG_JAPANESE         =  17
lANG_KOREAN           :: PrimaryLANGID
lANG_KOREAN           =  18
lANG_DUTCH            :: PrimaryLANGID
lANG_DUTCH            =  19
lANG_NORWEGIAN        :: PrimaryLANGID
lANG_NORWEGIAN        =  20
lANG_POLISH           :: PrimaryLANGID
lANG_POLISH           =  21
lANG_PORTUGUESE       :: PrimaryLANGID
lANG_PORTUGUESE       =  22
lANG_ROMANIAN         :: PrimaryLANGID
lANG_ROMANIAN         =  24
lANG_RUSSIAN          :: PrimaryLANGID
lANG_RUSSIAN          =  25
lANG_CROATIAN         :: PrimaryLANGID
lANG_CROATIAN         =  26
lANG_SLOVAK           :: PrimaryLANGID
lANG_SLOVAK           =  27
lANG_SWEDISH          :: PrimaryLANGID
lANG_SWEDISH          =  29
lANG_TURKISH          :: PrimaryLANGID
lANG_TURKISH          =  31
lANG_SLOVENIAN        :: PrimaryLANGID
lANG_SLOVENIAN        =  36
lANG_ARABIC           :: PrimaryLANGID
lANG_ARABIC           =  1
lANG_CATALAN          :: PrimaryLANGID
lANG_CATALAN          =  3
lANG_HEBREW           :: PrimaryLANGID
lANG_HEBREW           =  13
lANG_SERBIAN          :: PrimaryLANGID
lANG_SERBIAN          =  26
lANG_ALBANIAN         :: PrimaryLANGID
lANG_ALBANIAN         =  28
lANG_THAI             :: PrimaryLANGID
lANG_THAI             =  30
lANG_URDU             :: PrimaryLANGID
lANG_URDU             =  32
lANG_INDONESIAN       :: PrimaryLANGID
lANG_INDONESIAN       =  33
lANG_BELARUSIAN       :: PrimaryLANGID
lANG_BELARUSIAN       =  35
lANG_ESTONIAN         :: PrimaryLANGID
lANG_ESTONIAN         =  37
lANG_LATVIAN          :: PrimaryLANGID
lANG_LATVIAN          =  38
lANG_LITHUANIAN       :: PrimaryLANGID
lANG_LITHUANIAN       =  39
lANG_FARSI            :: PrimaryLANGID
lANG_FARSI            =  41
lANG_VIETNAMESE       :: PrimaryLANGID
lANG_VIETNAMESE       =  42
lANG_ARMENIAN         :: PrimaryLANGID
lANG_ARMENIAN         =  43
lANG_AZERI            :: PrimaryLANGID
lANG_AZERI            =  44
lANG_BASQUE           :: PrimaryLANGID
lANG_BASQUE           =  45
lANG_MACEDONIAN       :: PrimaryLANGID
lANG_MACEDONIAN       =  47
lANG_AFRIKAANS        :: PrimaryLANGID
lANG_AFRIKAANS        =  54
lANG_GEORGIAN         :: PrimaryLANGID
lANG_GEORGIAN         =  55
lANG_FAEROESE         :: PrimaryLANGID
lANG_FAEROESE         =  56
lANG_HINDI            :: PrimaryLANGID
lANG_HINDI            =  57
lANG_MALAY            :: PrimaryLANGID
lANG_MALAY            =  62
lANG_KAZAK            :: PrimaryLANGID
lANG_KAZAK            =  63
lANG_SWAHILI          :: PrimaryLANGID
lANG_SWAHILI          =  65
lANG_UZBEK            :: PrimaryLANGID
lANG_UZBEK            =  67
lANG_TATAR            :: PrimaryLANGID
lANG_TATAR            =  68
lANG_BENGALI          :: PrimaryLANGID
lANG_BENGALI          =  69
lANG_PUNJABI          :: PrimaryLANGID
lANG_PUNJABI          =  70
lANG_GUJARATI         :: PrimaryLANGID
lANG_GUJARATI         =  71
lANG_ORIYA            :: PrimaryLANGID
lANG_ORIYA            =  72
lANG_TAMIL            :: PrimaryLANGID
lANG_TAMIL            =  73
lANG_TELUGU           :: PrimaryLANGID
lANG_TELUGU           =  74
lANG_KANNADA          :: PrimaryLANGID
lANG_KANNADA          =  75
lANG_MALAYALAM        :: PrimaryLANGID
lANG_MALAYALAM        =  76
lANG_ASSAMESE         :: PrimaryLANGID
lANG_ASSAMESE         =  77
lANG_MARATHI          :: PrimaryLANGID
lANG_MARATHI          =  78
lANG_SANSKRIT         :: PrimaryLANGID
lANG_SANSKRIT         =  79
lANG_KONKANI          :: PrimaryLANGID
lANG_KONKANI          =  87
lANG_MANIPURI         :: PrimaryLANGID
lANG_MANIPURI         =  88
lANG_SINDHI           :: PrimaryLANGID
lANG_SINDHI           =  89
lANG_KASHMIRI         :: PrimaryLANGID
lANG_KASHMIRI         =  96
lANG_NEPALI           :: PrimaryLANGID
lANG_NEPALI           =  97

{-# LINE 232 "System\Win32\NLS.hsc" #-}

sORT_DEFAULT          :: SortID
sORT_DEFAULT          =  0
sORT_JAPANESE_XJIS    :: SortID
sORT_JAPANESE_XJIS    =  0
sORT_JAPANESE_UNICODE  :: SortID
sORT_JAPANESE_UNICODE  =  1
sORT_CHINESE_BIG5     :: SortID
sORT_CHINESE_BIG5     =  0
sORT_CHINESE_UNICODE  :: SortID
sORT_CHINESE_UNICODE  =  1
sORT_KOREAN_KSC       :: SortID
sORT_KOREAN_KSC       =  0
sORT_KOREAN_UNICODE   :: SortID
sORT_KOREAN_UNICODE   =  1

{-# LINE 242 "System\Win32\NLS.hsc" #-}

sUBLANG_NEUTRAL                       :: SubLANGID
sUBLANG_NEUTRAL                       =  0
sUBLANG_DEFAULT                       :: SubLANGID
sUBLANG_DEFAULT                       =  1
sUBLANG_SYS_DEFAULT                   :: SubLANGID
sUBLANG_SYS_DEFAULT                   =  2
sUBLANG_CHINESE_TRADITIONAL           :: SubLANGID
sUBLANG_CHINESE_TRADITIONAL           =  1
sUBLANG_CHINESE_SIMPLIFIED            :: SubLANGID
sUBLANG_CHINESE_SIMPLIFIED            =  2
sUBLANG_CHINESE_HONGKONG              :: SubLANGID
sUBLANG_CHINESE_HONGKONG              =  3
sUBLANG_CHINESE_SINGAPORE             :: SubLANGID
sUBLANG_CHINESE_SINGAPORE             =  4
sUBLANG_DUTCH                         :: SubLANGID
sUBLANG_DUTCH                         =  1
sUBLANG_DUTCH_BELGIAN                 :: SubLANGID
sUBLANG_DUTCH_BELGIAN                 =  2
sUBLANG_ENGLISH_US                    :: SubLANGID
sUBLANG_ENGLISH_US                    =  1
sUBLANG_ENGLISH_UK                    :: SubLANGID
sUBLANG_ENGLISH_UK                    =  2
sUBLANG_ENGLISH_AUS                   :: SubLANGID
sUBLANG_ENGLISH_AUS                   =  3
sUBLANG_ENGLISH_CAN                   :: SubLANGID
sUBLANG_ENGLISH_CAN                   =  4
sUBLANG_ENGLISH_NZ                    :: SubLANGID
sUBLANG_ENGLISH_NZ                    =  5
sUBLANG_ENGLISH_EIRE                  :: SubLANGID
sUBLANG_ENGLISH_EIRE                  =  6
sUBLANG_FRENCH                        :: SubLANGID
sUBLANG_FRENCH                        =  1
sUBLANG_FRENCH_BELGIAN                :: SubLANGID
sUBLANG_FRENCH_BELGIAN                =  2
sUBLANG_FRENCH_CANADIAN               :: SubLANGID
sUBLANG_FRENCH_CANADIAN               =  3
sUBLANG_FRENCH_SWISS                  :: SubLANGID
sUBLANG_FRENCH_SWISS                  =  4
sUBLANG_GERMAN                        :: SubLANGID
sUBLANG_GERMAN                        =  1
sUBLANG_GERMAN_SWISS                  :: SubLANGID
sUBLANG_GERMAN_SWISS                  =  2
sUBLANG_GERMAN_AUSTRIAN               :: SubLANGID
sUBLANG_GERMAN_AUSTRIAN               =  3
sUBLANG_ITALIAN                       :: SubLANGID
sUBLANG_ITALIAN                       =  1
sUBLANG_ITALIAN_SWISS                 :: SubLANGID
sUBLANG_ITALIAN_SWISS                 =  2
sUBLANG_NORWEGIAN_BOKMAL              :: SubLANGID
sUBLANG_NORWEGIAN_BOKMAL              =  1
sUBLANG_NORWEGIAN_NYNORSK             :: SubLANGID
sUBLANG_NORWEGIAN_NYNORSK             =  2
sUBLANG_PORTUGUESE                    :: SubLANGID
sUBLANG_PORTUGUESE                    =  1
sUBLANG_PORTUGUESE_BRAZILIAN          :: SubLANGID
sUBLANG_PORTUGUESE_BRAZILIAN          =  2
sUBLANG_SPANISH                       :: SubLANGID
sUBLANG_SPANISH                       =  1
sUBLANG_SPANISH_MEXICAN               :: SubLANGID
sUBLANG_SPANISH_MEXICAN               =  2
sUBLANG_SPANISH_MODERN                :: SubLANGID
sUBLANG_SPANISH_MODERN                =  3
sUBLANG_ARABIC_SAUDI_ARABIA           :: SubLANGID
sUBLANG_ARABIC_SAUDI_ARABIA           =  1
sUBLANG_ARABIC_IRAQ                   :: SubLANGID
sUBLANG_ARABIC_IRAQ                   =  2
sUBLANG_ARABIC_EGYPT                  :: SubLANGID
sUBLANG_ARABIC_EGYPT                  =  3
sUBLANG_ARABIC_LIBYA                  :: SubLANGID
sUBLANG_ARABIC_LIBYA                  =  4
sUBLANG_ARABIC_ALGERIA                :: SubLANGID
sUBLANG_ARABIC_ALGERIA                =  5
sUBLANG_ARABIC_MOROCCO                :: SubLANGID
sUBLANG_ARABIC_MOROCCO                =  6
sUBLANG_ARABIC_TUNISIA                :: SubLANGID
sUBLANG_ARABIC_TUNISIA                =  7
sUBLANG_ARABIC_OMAN                   :: SubLANGID
sUBLANG_ARABIC_OMAN                   =  8
sUBLANG_ARABIC_YEMEN                  :: SubLANGID
sUBLANG_ARABIC_YEMEN                  =  9
sUBLANG_ARABIC_SYRIA                  :: SubLANGID
sUBLANG_ARABIC_SYRIA                  =  10
sUBLANG_ARABIC_JORDAN                 :: SubLANGID
sUBLANG_ARABIC_JORDAN                 =  11
sUBLANG_ARABIC_LEBANON                :: SubLANGID
sUBLANG_ARABIC_LEBANON                =  12
sUBLANG_ARABIC_KUWAIT                 :: SubLANGID
sUBLANG_ARABIC_KUWAIT                 =  13
sUBLANG_ARABIC_UAE                    :: SubLANGID
sUBLANG_ARABIC_UAE                    =  14
sUBLANG_ARABIC_BAHRAIN                :: SubLANGID
sUBLANG_ARABIC_BAHRAIN                =  15
sUBLANG_ARABIC_QATAR                  :: SubLANGID
sUBLANG_ARABIC_QATAR                  =  16
sUBLANG_AZERI_CYRILLIC                :: SubLANGID
sUBLANG_AZERI_CYRILLIC                =  2
sUBLANG_AZERI_LATIN                   :: SubLANGID
sUBLANG_AZERI_LATIN                   =  1
sUBLANG_CHINESE_MACAU                 :: SubLANGID
sUBLANG_CHINESE_MACAU                 =  5
sUBLANG_ENGLISH_SOUTH_AFRICA          :: SubLANGID
sUBLANG_ENGLISH_SOUTH_AFRICA          =  7
sUBLANG_ENGLISH_JAMAICA               :: SubLANGID
sUBLANG_ENGLISH_JAMAICA               =  8
sUBLANG_ENGLISH_CARIBBEAN             :: SubLANGID
sUBLANG_ENGLISH_CARIBBEAN             =  9
sUBLANG_ENGLISH_BELIZE                :: SubLANGID
sUBLANG_ENGLISH_BELIZE                =  10
sUBLANG_ENGLISH_TRINIDAD              :: SubLANGID
sUBLANG_ENGLISH_TRINIDAD              =  11
sUBLANG_ENGLISH_PHILIPPINES           :: SubLANGID
sUBLANG_ENGLISH_PHILIPPINES           =  13
sUBLANG_ENGLISH_ZIMBABWE              :: SubLANGID
sUBLANG_ENGLISH_ZIMBABWE              =  12
sUBLANG_FRENCH_LUXEMBOURG             :: SubLANGID
sUBLANG_FRENCH_LUXEMBOURG             =  5
sUBLANG_FRENCH_MONACO                 :: SubLANGID
sUBLANG_FRENCH_MONACO                 =  6
sUBLANG_GERMAN_LUXEMBOURG             :: SubLANGID
sUBLANG_GERMAN_LUXEMBOURG             =  4
sUBLANG_GERMAN_LIECHTENSTEIN          :: SubLANGID
sUBLANG_GERMAN_LIECHTENSTEIN          =  5
sUBLANG_KASHMIRI_INDIA                :: SubLANGID
sUBLANG_KASHMIRI_INDIA                =  2
sUBLANG_KOREAN                        :: SubLANGID
sUBLANG_KOREAN                        =  1
sUBLANG_LITHUANIAN                    :: SubLANGID
sUBLANG_LITHUANIAN                    =  1
sUBLANG_MALAY_MALAYSIA                :: SubLANGID
sUBLANG_MALAY_MALAYSIA                =  1
sUBLANG_MALAY_BRUNEI_DARUSSALAM       :: SubLANGID
sUBLANG_MALAY_BRUNEI_DARUSSALAM       =  2
sUBLANG_NEPALI_INDIA                  :: SubLANGID
sUBLANG_NEPALI_INDIA                  =  2
sUBLANG_SERBIAN_LATIN                 :: SubLANGID
sUBLANG_SERBIAN_LATIN                 =  2
sUBLANG_SERBIAN_CYRILLIC              :: SubLANGID
sUBLANG_SERBIAN_CYRILLIC              =  3
sUBLANG_SPANISH_GUATEMALA             :: SubLANGID
sUBLANG_SPANISH_GUATEMALA             =  4
sUBLANG_SPANISH_COSTA_RICA            :: SubLANGID
sUBLANG_SPANISH_COSTA_RICA            =  5
sUBLANG_SPANISH_PANAMA                :: SubLANGID
sUBLANG_SPANISH_PANAMA                =  6
sUBLANG_SPANISH_DOMINICAN_REPUBLIC    :: SubLANGID
sUBLANG_SPANISH_DOMINICAN_REPUBLIC    =  7
sUBLANG_SPANISH_VENEZUELA             :: SubLANGID
sUBLANG_SPANISH_VENEZUELA             =  8
sUBLANG_SPANISH_COLOMBIA              :: SubLANGID
sUBLANG_SPANISH_COLOMBIA              =  9
sUBLANG_SPANISH_PERU                  :: SubLANGID
sUBLANG_SPANISH_PERU                  =  10
sUBLANG_SPANISH_ARGENTINA             :: SubLANGID
sUBLANG_SPANISH_ARGENTINA             =  11
sUBLANG_SPANISH_ECUADOR               :: SubLANGID
sUBLANG_SPANISH_ECUADOR               =  12
sUBLANG_SPANISH_CHILE                 :: SubLANGID
sUBLANG_SPANISH_CHILE                 =  13
sUBLANG_SPANISH_URUGUAY               :: SubLANGID
sUBLANG_SPANISH_URUGUAY               =  14
sUBLANG_SPANISH_PARAGUAY              :: SubLANGID
sUBLANG_SPANISH_PARAGUAY              =  15
sUBLANG_SPANISH_BOLIVIA               :: SubLANGID
sUBLANG_SPANISH_BOLIVIA               =  16
sUBLANG_SPANISH_EL_SALVADOR           :: SubLANGID
sUBLANG_SPANISH_EL_SALVADOR           =  17
sUBLANG_SPANISH_HONDURAS              :: SubLANGID
sUBLANG_SPANISH_HONDURAS              =  18
sUBLANG_SPANISH_NICARAGUA             :: SubLANGID
sUBLANG_SPANISH_NICARAGUA             =  19
sUBLANG_SPANISH_PUERTO_RICO           :: SubLANGID
sUBLANG_SPANISH_PUERTO_RICO           =  20
sUBLANG_SWEDISH                       :: SubLANGID
sUBLANG_SWEDISH                       =  1
sUBLANG_SWEDISH_FINLAND               :: SubLANGID
sUBLANG_SWEDISH_FINLAND               =  2
sUBLANG_URDU_PAKISTAN                 :: SubLANGID
sUBLANG_URDU_PAKISTAN                 =  1
sUBLANG_URDU_INDIA                    :: SubLANGID
sUBLANG_URDU_INDIA                    =  2
sUBLANG_UZBEK_LATIN                   :: SubLANGID
sUBLANG_UZBEK_LATIN                   =  1
sUBLANG_UZBEK_CYRILLIC                :: SubLANGID
sUBLANG_UZBEK_CYRILLIC                =  2

{-# LINE 337 "System\Win32\NLS.hsc" #-}

-- , SUBLANG_LITHUANIAN_CLASSIC (not in mingw-20001111)
