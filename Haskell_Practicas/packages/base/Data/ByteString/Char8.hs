{-# OPTIONS_GHC -cpp -fffi -fglasgow-exts #-}
--
-- Module      : Data.ByteString.Char8
-- Copyright   : (c) Don Stewart 2006
-- License     : BSD-style
--
-- Maintainer  : dons@cse.unsw.edu.au
-- Stability   : experimental
-- Portability : portable (tested with GHC>=6.4.1 and Hugs 2005)
-- 

--
-- | Manipulate ByteStrings using Char operations. All Chars will be
-- truncated to 8 bits. It can be expected that these functions will run
-- at identical speeds to their Word8 equivalents in @Data.ByteString@.
--
-- More specifically these byte strings are taken to be in the
-- subset of Unicode covered by code points 0-255. This covers
-- Unicode Basic Latin, Latin-1 Supplement and C0+C1 Controls.
-- 
-- See: 
--
--  * <http://www.unicode.org/charts/>
--
--  * <http://www.unicode.org/charts/PDF/U0000.pdf>
--
--  * <http://www.unicode.org/charts/PDF/U0080.pdf>
--
-- This module is intended to be imported @qualified@, to avoid name
-- clashes with Prelude functions.  eg.
--
-- > import qualified Data.ByteString.Char8 as B
--

module Data.ByteString.Char8 (

        -- * The @ByteString@ type
        ByteString(..),         -- instances: Eq, Ord, Show, Read, Data, Typeable

        -- * Introducing and eliminating 'ByteString's
        empty,                  -- :: ByteString
        packChar,               -- :: Char   -> ByteString
        pack,                   -- :: String -> ByteString
        unpack,                 -- :: ByteString -> String

        -- * Basic interface
        cons,                   -- :: Char -> ByteString -> ByteString
        snoc,                   -- :: Char -> ByteString -> ByteString
        null,                   -- :: ByteString -> Bool
        length,                 -- :: ByteString -> Int
        head,                   -- :: ByteString -> Char
        tail,                   -- :: ByteString -> ByteString
        last,                   -- :: ByteString -> Char
        init,                   -- :: ByteString -> ByteString
        append,                 -- :: ByteString -> ByteString -> ByteString

        -- * Special ByteStrings
        inits,                  -- :: ByteString -> [ByteString]
        tails,                  -- :: ByteString -> [ByteString]
        elems,                  -- :: ByteString -> [ByteString]

        -- * Transformating ByteStrings
        map,                    -- :: (Char -> Char) -> ByteString -> ByteString
        reverse,                -- :: ByteString -> ByteString
        intersperse,            -- :: Char -> ByteString -> ByteString
        transpose,              -- :: [ByteString] -> [ByteString]

        -- * Reducing 'ByteString's
        foldl,                  -- :: (a -> Char -> a) -> a -> ByteString -> a
        foldr,                  -- :: (Char -> a -> a) -> a -> ByteString -> a
        foldl1,                 -- :: (Char -> Char -> Char) -> ByteString -> Char
        foldr1,                 -- :: (Char -> Char -> Char) -> ByteString -> Char
        foldl',                 -- :: (a -> Char -> a) -> a -> ByteString -> a

        -- ** Special folds
        concat,                 -- :: [ByteString] -> ByteString
        concatMap,              -- :: (Char -> ByteString) -> ByteString -> ByteString
        any,                    -- :: (Char -> Bool) -> ByteString -> Bool
        all,                    -- :: (Char -> Bool) -> ByteString -> Bool
        maximum,                -- :: ByteString -> Char
        minimum,                -- :: ByteString -> Char
        mapIndexed,             -- :: (Int -> Char -> Char) -> ByteString -> ByteString

        -- * Generating and unfolding ByteStrings
        replicate,              -- :: Int -> Char -> ByteString
        unfoldrN,               -- :: (a -> Maybe (Char, a)) -> a -> ByteString

        -- * Substrings

        -- ** Breaking strings
        take,                   -- :: Int -> ByteString -> ByteString
        drop,                   -- :: Int -> ByteString -> ByteString
        splitAt,                -- :: Int -> ByteString -> (ByteString, ByteString)
        takeWhile,              -- :: (Char -> Bool) -> ByteString -> ByteString
        dropWhile,              -- :: (Char -> Bool) -> ByteString -> ByteString
        break,                  -- :: (Char -> Bool) -> ByteString -> (ByteString, ByteString)
        span,                   -- :: (Char -> Bool) -> ByteString -> (ByteString, ByteString)
        spanEnd,                -- :: (Char -> Bool) -> ByteString -> (ByteString, ByteString)

        -- ** Breaking and dropping on specific Chars
        breakChar,              -- :: Char -> ByteString -> (ByteString, ByteString)
        spanChar,           -- :: Char -> ByteString -> (ByteString, ByteString)
        breakFirst,             -- :: Char -> ByteString -> Maybe (ByteString,ByteString)
        breakLast,              -- :: Char -> ByteString -> Maybe (ByteString,ByteString)
        breakSpace,             -- :: ByteString -> Maybe (ByteString,ByteString)
        dropSpace,              -- :: ByteString -> ByteString
        dropSpaceEnd,           -- :: ByteString -> ByteString

        -- ** Breaking into many substrings
        split,                  -- :: Char -> ByteString -> [ByteString]
        splitWith,              -- :: (Char -> Bool) -> ByteString -> [ByteString]
        tokens,                 -- :: (Char -> Bool) -> ByteString -> [ByteString]
        group,                  -- :: ByteString -> [ByteString]
        groupBy,                -- :: (Word8 -> Word8 -> Bool) -> ByteString -> [ByteString]

        -- ** Breaking into lines and words
        lines,                  -- :: ByteString -> [ByteString]
        words,                  -- :: ByteString -> [ByteString]
        unlines,                -- :: [ByteString] -> ByteString
        unwords,                -- :: ByteString -> [ByteString]

        lines',                 -- :: ByteString -> [ByteString]
        unlines',               -- :: [ByteString] -> ByteString
        linesCRLF',             -- :: ByteString -> [ByteString]
        unlinesCRLF',           -- :: [ByteString] -> ByteString
        words',                 -- :: ByteString -> [ByteString]
        unwords',               -- :: ByteString -> [ByteString]

        lineIndices,            -- :: ByteString -> [Int]
        betweenLines,           -- :: ByteString -> ByteString -> ByteString -> Maybe (ByteString)

        -- ** Joining strings
        join,                   -- :: ByteString -> [ByteString] -> ByteString
        joinWithChar,           -- :: Char -> ByteString -> ByteString -> ByteString

        -- * Indexing ByteStrings
        index,                  -- :: ByteString -> Int -> Char
        elemIndex,              -- :: Char -> ByteString -> Maybe Int
        elemIndexLast,          -- :: Char -> ByteString -> Maybe Int
        elemIndices,            -- :: Char -> ByteString -> [Int]
        findIndex,              -- :: (Char -> Bool) -> ByteString -> Maybe Int
        findIndices,            -- :: (Char -> Bool) -> ByteString -> [Int]
        count,                  -- :: Char -> ByteString -> Int

        -- * Ordered ByteStrings
        sort,                   -- :: ByteString -> ByteString

        -- * Searching ByteStrings

        -- ** Searching by equality
        elem,                   -- :: Char -> ByteString -> Bool
        notElem,                -- :: Char -> ByteString -> Bool
        filterChar,             -- :: Char -> ByteString -> ByteString
        filterNotChar,          -- :: Char -> ByteString -> ByteString

        -- ** Searching with a predicate
        filter,                 -- :: (Char -> Bool) -> ByteString -> ByteString
        find,                   -- :: (Char -> Bool) -> ByteString -> Maybe Char

        -- ** Searching for substrings
        isPrefixOf,             -- :: ByteString -> ByteString -> Bool
        isSuffixOf,             -- :: ByteString -> ByteString -> Bool
        isSubstringOf,          -- :: ByteString -> ByteString -> Bool
        findSubstring,          -- :: ByteString -> ByteString -> Maybe Int
        findSubstrings,         -- :: ByteString -> ByteString -> [Int]

        -- * Zipping and unzipping ByteString
        zip,                    -- :: ByteString -> ByteString -> [(Char,Char)]
        zipWith,                -- :: (Char -> Char -> c) -> ByteString -> ByteString -> [c]
        unzip,                  -- :: [(Char,Char)] -> (ByteString,ByteString)

        -- * Unchecked access
        unsafeHead,             -- :: ByteString -> Char
        unsafeTail,             -- :: ByteString -> ByteString
        unsafeIndex,            -- :: ByteString -> Int -> Char
        w2c,                    -- :: Word8 -> Char
        c2w,                    -- :: Char  -> Word8

        -- * Reading from ByteStrings
        readInt,                -- :: ByteString -> Maybe Int
        unsafeReadInt,          -- :: ByteString -> Maybe Int

        -- * Copying ByteStrings
        copy,                   -- :: ByteString -> ByteString

        -- * I\/O with @ByteString@s

        -- ** Standard input and output




        getContents,            -- :: IO ByteString
        putStr,                 -- :: ByteString -> IO ()
        putStrLn,               -- :: ByteString -> IO ()

        -- ** Files
        readFile,               -- :: FilePath -> IO ByteString
--      mmapFile,               -- :: FilePath -> IO ByteString
        writeFile,              -- :: FilePath -> ByteString -> IO ()

        -- ** I\/O with Handles





        hGetContents,           -- :: Handle -> IO ByteString
        hGet,                   -- :: Handle -> Int -> IO ByteString
        hPut,                   -- :: Handle -> ByteString -> IO ()








        -- * Utilities (needed for array fusion)



        noAL, NoAL, loopArr, loopAcc, loopSndAcc,
        loopU, mapEFL, filterEFL, foldEFL, foldEFL', fuseEFL,
        filterF, mapF

    ) where

import qualified Prelude as P
import Prelude hiding           (reverse,head,tail,last,init,null
                                ,length,map,lines,foldl,foldr,unlines
                                ,concat,any,take,drop,splitAt,takeWhile
                                ,dropWhile,span,break,elem,filter,unwords
                                ,words,maximum,minimum,all,concatMap
                                ,foldl1,foldr1,readFile,writeFile,replicate
                                ,getContents,getLine,putStr,putStrLn
                                ,zip,zipWith,unzip,notElem)

import qualified Data.ByteString as B

-- Listy functions transparently exported
import Data.ByteString (ByteString(..)
                       ,empty,null,length,tail,init,append
                       ,inits,tails,elems,reverse,transpose
                       ,concat,take,drop,splitAt,join
                       ,sort,isPrefixOf,isSuffixOf,isSubstringOf,findSubstring
                       ,findSubstrings,unsafeTail,copy,group

                       ,getContents, putStr, putStrLn
                       ,readFile, {-mmapFile,-} writeFile
                       ,hGetContents, hGet, hPut





                       ,noAL, NoAL, loopArr, loopAcc, loopSndAcc
                       ,loopU, mapEFL, filterEFL, foldEFL, foldEFL', fuseEFL
                       ,useAsCString, unsafeUseAsCString
                       )

import Data.Char

import qualified Data.List as List (intersperse)

import Foreign
import Foreign.C.Types          (CLong)
import Foreign.Marshal.Utils    (with)













------------------------------------------------------------------------

-- | /O(1)/ Convert a 'Char' into a 'ByteString'
packChar :: Char -> ByteString
packChar = B.packByte . c2w
{-# INLINE packChar #-}

-- | /O(n)/ Convert a 'String' into a 'ByteString'
--
-- For applications with large numbers of string literals, pack can be a
-- bottleneck. In such cases, consider using packAddress (GHC only).
pack :: String -> ByteString


pack str = B.create (P.length str) $ \p -> go p str
    where go _ []     = return ()
          go p (x:xs) = poke p (c2w x) >> go (p `plusPtr` 1) xs




















{-# INLINE pack #-}

-- | /O(n)/ Converts a 'ByteString' to a 'String'.
unpack :: ByteString -> [Char]
unpack = B.unpackWith w2c
{-# INLINE unpack #-}

-- | /O(n)/ 'cons' is analogous to (:) for lists, but of different
-- complexity, as it requires a memcpy.
cons :: Char -> ByteString -> ByteString
cons = B.cons . c2w
{-# INLINE cons #-}

-- | /O(n)/ Append a Char to the end of a 'ByteString'. Similar to
-- 'cons', this function performs a memcpy.
snoc :: ByteString -> Char -> ByteString
snoc p = B.snoc p . c2w
{-# INLINE snoc #-}

-- | /O(1)/ Extract the first element of a ByteString, which must be non-empty.
head :: ByteString -> Char
head = w2c . B.head
{-# INLINE head #-}

-- | /O(1)/ Extract the last element of a packed string, which must be non-empty.
last :: ByteString -> Char
last = w2c . B.last
{-# INLINE last #-}

-- | /O(n)/ 'map' @f xs@ is the ByteString obtained by applying @f@ to each element of @xs@
map :: (Char -> Char) -> ByteString -> ByteString
map f = B.map (c2w . f . w2c)
{-# INLINE map #-}

-- | /O(n)/ The 'intersperse' function takes a Char and a 'ByteString'
-- and \`intersperses\' that Char between the elements of the
-- 'ByteString'.  It is analogous to the intersperse function on Lists.
intersperse :: Char -> ByteString -> ByteString
intersperse = B.intersperse . c2w
{-# INLINE intersperse #-}

-- | 'foldl', applied to a binary operator, a starting value (typically
-- the left-identity of the operator), and a ByteString, reduces the
-- ByteString using the binary operator, from left to right.
foldl :: (a -> Char -> a) -> a -> ByteString -> a
foldl f = B.foldl (\a c -> f a (w2c c))
{-# INLINE foldl #-}

-- | 'foldl\'' is like foldl, but strict in the accumulator.
foldl' :: (a -> Char -> a) -> a -> ByteString -> a
foldl' f = B.foldl' (\a c -> f a (w2c c))
{-# INLINE foldl' #-}

-- | 'foldr', applied to a binary operator, a starting value
-- (typically the right-identity of the operator), and a packed string,
-- reduces the packed string using the binary operator, from right to left.
foldr :: (Char -> a -> a) -> a -> ByteString -> a
foldr f = B.foldr (\c a -> f (w2c c) a)
{-# INLINE foldr #-}

-- | 'foldl1' is a variant of 'foldl' that has no starting value
-- argument, and thus must be applied to non-empty 'ByteStrings'.
foldl1 :: (Char -> Char -> Char) -> ByteString -> Char
foldl1 f ps = w2c (B.foldl1 (\x y -> c2w (f (w2c x) (w2c y))) ps)
{-# INLINE foldl1 #-}

-- | 'foldr1' is a variant of 'foldr' that has no starting value argument,
-- and thus must be applied to non-empty 'ByteString's
foldr1 :: (Char -> Char -> Char) -> ByteString -> Char
foldr1 f ps = w2c (B.foldr1 (\x y -> c2w (f (w2c x) (w2c y))) ps)
{-# INLINE foldr1 #-}

-- | Map a function over a 'ByteString' and concatenate the results
concatMap :: (Char -> ByteString) -> ByteString -> ByteString
concatMap f = B.concatMap (f . w2c)
{-# INLINE concatMap #-}

-- | Applied to a predicate and a ByteString, 'any' determines if
-- any element of the 'ByteString' satisfies the predicate.
any :: (Char -> Bool) -> ByteString -> Bool
any f = B.any (f . w2c)
{-# INLINE any #-}

-- | Applied to a predicate and a 'ByteString', 'all' determines if
-- all elements of the 'ByteString' satisfy the predicate.
all :: (Char -> Bool) -> ByteString -> Bool
all f = B.all (f . w2c)
{-# INLINE all #-}

-- | 'maximum' returns the maximum value from a 'ByteString'
maximum :: ByteString -> Char
maximum = w2c . B.maximum
{-# INLINE maximum #-}

-- | 'minimum' returns the minimum value from a 'ByteString'
minimum :: ByteString -> Char
minimum = w2c . B.minimum
{-# INLINE minimum #-}

-- | /O(n)/ map Char functions, provided with the index at each position
mapIndexed :: (Int -> Char -> Char) -> ByteString -> ByteString
mapIndexed f = B.mapIndexed (\i c -> c2w (f i (w2c c)))
{-# INLINE mapIndexed #-}

-- | /O(n)/ 'replicate' @n x@ is a ByteString of length @n@ with @x@
-- the value of every element. The following holds:
--
-- > replicate w c = unfoldr w (\u -> Just (u,u)) c
--
-- This implemenation uses @memset(3)@
replicate :: Int -> Char -> ByteString
replicate w = B.replicate w . c2w
{-# INLINE replicate #-}

-- | /O(n)/ The 'unfoldrN' function is analogous to the List \'unfoldr\'.
-- 'unfoldrN' builds a ByteString from a seed value.  The function takes
-- the element and returns 'Nothing' if it is done producing the
-- ByteString or returns 'Just' @(a,b)@, in which case, @a@ is a
-- prepending to the ByteString and @b@ is used as the next element in a
-- recursive call.
--
-- To preven unfoldrN having /O(n^2)/ complexity (as prepending a
-- character to a ByteString is /O(n)/, this unfoldr requires a maximum
-- final size of the ByteString as an argument. 'cons' can then be
-- implemented in /O(1)/ (i.e.  a 'poke'), and the unfoldr itself has
-- linear complexity. The depth of the recursion is limited to this
-- size, but may be less. For lazy, infinite unfoldr, use
-- 'Data.List.unfoldr' (from 'Data.List').
--
-- Examples:
--
-- > unfoldrN 10 (\x -> Just (x, chr (ord x + 1))) '0' == "0123456789"
--
-- The following equation connects the depth-limited unfoldr to the List unfoldr:
--
-- > unfoldrN n == take n $ List.unfoldr
--
unfoldrN :: Int -> (a -> Maybe (Char, a)) -> a -> ByteString
unfoldrN n f w = B.unfoldrN n ((k `fmap`) . f) w
    where k (i,j) = (c2w i, j)
{-# INLINE unfoldrN #-}

-- | 'takeWhile', applied to a predicate @p@ and a ByteString @xs@,
-- returns the longest prefix (possibly empty) of @xs@ of elements that
-- satisfy @p@.
takeWhile :: (Char -> Bool) -> ByteString -> ByteString
takeWhile f = B.takeWhile (f . w2c)
{-# INLINE takeWhile #-}

-- | 'dropWhile' @p xs@ returns the suffix remaining after 'takeWhile' @p xs@.
dropWhile :: (Char -> Bool) -> ByteString -> ByteString
dropWhile f = B.dropWhile (f . w2c)
{-# INLINE dropWhile #-}

-- | 'break' @p@ is equivalent to @'span' ('not' . p)@.
break :: (Char -> Bool) -> ByteString -> (ByteString, ByteString)
break f = B.break (f . w2c)
{-# INLINE break #-}

-- | 'span' @p xs@ breaks the ByteString into two segments. It is
-- equivalent to @('takeWhile' p xs, 'dropWhile' p xs)@
span :: (Char -> Bool) -> ByteString -> (ByteString, ByteString)
span f = B.span (f . w2c)
{-# INLINE span #-}

-- | 'spanEnd' behaves like 'span' but from the end of the 'ByteString'.
-- We have
--
-- > spanEnd (not.isSpace) "x y z" == ("x y ","z")
--
-- and
--
-- > spanEnd (not . isSpace) ps
-- >    == 
-- > let (x,y) = span (not.isSpace) (reverse ps) in (reverse y, reverse x) 
--
spanEnd :: (Char -> Bool) -> ByteString -> (ByteString, ByteString)
spanEnd f = B.spanEnd (f . w2c)
{-# INLINE spanEnd #-}

-- | 'breakChar' breaks its ByteString argument at the first occurence
-- of the specified Char. It is more efficient than 'break' as it is
-- implemented with @memchr(3)@. I.e.
-- 
-- > break (=='c') "abcd" == breakChar 'c' "abcd"
--
breakChar :: Char -> ByteString -> (ByteString, ByteString)
breakChar = B.breakByte . c2w
{-# INLINE breakChar #-}

-- | 'spanChar' breaks its ByteString argument at the first
-- occurence of a Char other than its argument. It is more efficient
-- than 'span (==)'
--
-- > span  (=='c') "abcd" == spanByte 'c' "abcd"
--
spanChar :: Char -> ByteString -> (ByteString, ByteString)
spanChar = B.spanByte . c2w
{-# INLINE spanChar #-}

-- | /O(n)/ 'breakFirst' breaks the given ByteString on the first
-- occurence of @w@. It behaves like 'break', except the delimiter is
-- not returned, and @Nothing@ is returned if the delimiter is not in
-- the ByteString. I.e.
--
-- > breakFirst 'b' "aabbcc" == Just ("aa","bcc")
--
-- > breakFirst c xs ==
-- > let (x,y) = break (== c) xs 
-- > in if null y then Nothing else Just (x, drop 1 y))
--
breakFirst :: Char -> ByteString -> Maybe (ByteString,ByteString)
breakFirst = B.breakFirst . c2w
{-# INLINE breakFirst #-}

-- | /O(n)/ 'breakLast' behaves like breakFirst, but from the end of the
-- ByteString.
--
-- > breakLast ('b') (pack "aabbcc") == Just ("aab","cc")
--
-- and the following are equivalent:
--
-- > breakLast 'c' "abcdef"
-- > let (x,y) = break (=='c') (reverse "abcdef") 
-- > in if null x then Nothing else Just (reverse (drop 1 y), reverse x)
--
breakLast :: Char -> ByteString -> Maybe (ByteString,ByteString)
breakLast = B.breakLast . c2w
{-# INLINE breakLast #-}

-- | /O(n)/ Break a 'ByteString' into pieces separated by the byte
-- argument, consuming the delimiter. I.e.
--
-- > split '\n' "a\nb\nd\ne" == ["a","b","d","e"]
-- > split 'a'  "aXaXaXa"    == ["","X","X","X"]
-- > split 'x'  "x"          == ["",""]
-- 
-- and
--
-- > join [c] . split c == id
-- > split == splitWith . (==)
-- 
-- As for all splitting functions in this library, this function does
-- not copy the substrings, it just constructs new 'ByteStrings' that
-- are slices of the original.
--
split :: Char -> ByteString -> [ByteString]
split = B.split . c2w
{-# INLINE split #-}

-- | /O(n)/ Splits a 'ByteString' into components delimited by
-- separators, where the predicate returns True for a separator element.
-- The resulting components do not contain the separators.  Two adjacent
-- separators result in an empty component in the output.  eg.
--
-- > splitWith (=='a') "aabbaca" == ["","","bb","c",""]
--
splitWith :: (Char -> Bool) -> ByteString -> [ByteString]
splitWith f = B.splitWith (f . w2c)
{-# INLINE splitWith #-}
-- the inline makes a big difference here.

-- | Like 'splitWith', except that sequences of adjacent separators are
-- treated as a single separator. eg.
-- 
-- > tokens (=='a') "aabbaca" == ["bb","c"]
--
tokens :: (Char -> Bool) -> ByteString -> [ByteString]
tokens f = B.tokens (f . w2c)
{-# INLINE tokens #-}

-- | The 'groupBy' function is the non-overloaded version of 'group'.
groupBy :: (Char -> Char -> Bool) -> ByteString -> [ByteString]
groupBy k = B.groupBy (\a b -> k (w2c a) (w2c b))

-- | /O(n)/ joinWithChar. An efficient way to join to two ByteStrings with a
-- char. Around 4 times faster than the generalised join.
--
joinWithChar :: Char -> ByteString -> ByteString -> ByteString
joinWithChar = B.joinWithByte . c2w
{-# INLINE joinWithChar #-}

-- | /O(1)/ 'ByteString' index (subscript) operator, starting from 0.
index :: ByteString -> Int -> Char
index = (w2c .) . B.index
{-# INLINE index #-}

-- | /O(n)/ The 'elemIndex' function returns the index of the first
-- element in the given 'ByteString' which is equal (by memchr) to the
-- query element, or 'Nothing' if there is no such element.
elemIndex :: Char -> ByteString -> Maybe Int
elemIndex = B.elemIndex . c2w
{-# INLINE elemIndex #-}

-- | /O(n)/ The 'elemIndexLast' function returns the last index of the
-- element in the given 'ByteString' which is equal to the query
-- element, or 'Nothing' if there is no such element. The following
-- holds:
--
-- > elemIndexLast c xs == 
-- > (-) (length xs - 1) `fmap` elemIndex c (reverse xs)
--
elemIndexLast :: Char -> ByteString -> Maybe Int
elemIndexLast = B.elemIndexLast . c2w
{-# INLINE elemIndexLast #-}

-- | /O(n)/ The 'elemIndices' function extends 'elemIndex', by returning
-- the indices of all elements equal to the query element, in ascending order.
elemIndices :: Char -> ByteString -> [Int]
elemIndices = B.elemIndices . c2w
{-# INLINE elemIndices #-}

-- | The 'findIndex' function takes a predicate and a 'ByteString' and
-- returns the index of the first element in the ByteString satisfying the predicate.
findIndex :: (Char -> Bool) -> ByteString -> Maybe Int
findIndex f = B.findIndex (f . w2c)
{-# INLINE findIndex #-}

-- | The 'findIndices' function extends 'findIndex', by returning the
-- indices of all elements satisfying the predicate, in ascending order.
findIndices :: (Char -> Bool) -> ByteString -> [Int]
findIndices f = B.findIndices (f . w2c)

-- | count returns the number of times its argument appears in the ByteString
--
-- > count = length . elemIndices
-- 
-- Also
--  
-- > count '\n' == length . lines
--
-- But more efficiently than using length on the intermediate list.
count :: Char -> ByteString -> Int
count c = B.count (c2w c)

-- | /O(n)/ 'elem' is the 'ByteString' membership predicate. This
-- implementation uses @memchr(3)@.
elem :: Char -> ByteString -> Bool
elem    c = B.elem (c2w c)
{-# INLINE elem #-}

-- | /O(n)/ 'notElem' is the inverse of 'elem'
notElem :: Char -> ByteString -> Bool
notElem c = B.notElem (c2w c)
{-# INLINE notElem #-}

-- | /O(n)/ 'filter', applied to a predicate and a ByteString,
-- returns a ByteString containing those characters that satisfy the
-- predicate.
filter :: (Char -> Bool) -> ByteString -> ByteString
filter f = B.filter (f . w2c)
{-# INLINE filter #-}

-- | /O(n)/ The 'find' function takes a predicate and a ByteString,
-- and returns the first element in matching the predicate, or 'Nothing'
-- if there is no such element.
find :: (Char -> Bool) -> ByteString -> Maybe Char
find f ps = w2c `fmap` B.find (f . w2c) ps
{-# INLINE find #-}

-- | /O(n)/ A first order equivalent of /filter . (==)/, for the common
-- case of filtering a single Char. It is more efficient to use
-- filterChar in this case.
--
-- > filterChar == filter . (==)
--
-- filterChar is around 10x faster, and uses much less space, than its
-- filter equivalent
--
filterChar :: Char -> ByteString -> ByteString
filterChar c = B.filterByte (c2w c)
{-# INLINE filterChar #-}

-- | /O(n)/ A first order equivalent of /filter . (\/=)/, for the common
-- case of filtering a single Char out of a list. It is more efficient
-- to use /filterNotChar/ in this case.
--
-- > filterNotChar == filter . (/=)
--
-- filterNotChar is around 3x faster, and uses much less space, than its
-- filter equivalent
--
filterNotChar :: Char -> ByteString -> ByteString
filterNotChar c = B.filterNotByte (c2w c)
{-# INLINE filterNotChar #-}

-- | /O(n)/ 'zip' takes two ByteStrings and returns a list of
-- corresponding pairs of Chars. If one input ByteString is short,
-- excess elements of the longer ByteString are discarded. This is
-- equivalent to a pair of 'unpack' operations, and so space
-- usage may be large for multi-megabyte ByteStrings
zip :: ByteString -> ByteString -> [(Char,Char)]
zip ps qs
    | B.null ps || B.null qs = []
    | otherwise = (unsafeHead ps, unsafeHead qs) : zip (B.unsafeTail ps) (B.unsafeTail qs)

-- | 'zipWith' generalises 'zip' by zipping with the function given as
-- the first argument, instead of a tupling function.  For example,
-- @'zipWith' (+)@ is applied to two ByteStrings to produce the list
-- of corresponding sums.
zipWith :: (Char -> Char -> a) -> ByteString -> ByteString -> [a]
zipWith f = B.zipWith ((. w2c) . f . w2c)

-- | 'unzip' transforms a list of pairs of Chars into a pair of
-- ByteStrings. Note that this performs two 'pack' operations.
unzip :: [(Char,Char)] -> (ByteString,ByteString)
unzip ls = (pack (P.map fst ls), pack (P.map snd ls))
{-# INLINE unzip #-}

-- | A variety of 'head' for non-empty ByteStrings. 'unsafeHead' omits
-- the check for the empty case, which is good for performance, but
-- there is an obligation on the programmer to provide a proof that the
-- ByteString is non-empty.
unsafeHead :: ByteString -> Char
unsafeHead  = w2c . B.unsafeHead
{-# INLINE unsafeHead #-}

-- | Unsafe 'ByteString' index (subscript) operator, starting from 0, returning a Char.
-- This omits the bounds check, which means there is an accompanying
-- obligation on the programmer to ensure the bounds are checked in some
-- other way.
unsafeIndex :: ByteString -> Int -> Char
unsafeIndex = (w2c .) . B.unsafeIndex
{-# INLINE unsafeIndex #-}

-- | Conversion between 'Word8' and 'Char'. Should compile to a no-op.
w2c :: Word8 -> Char

w2c = chr . fromIntegral



{-# INLINE w2c #-}

-- | Unsafe conversion between 'Char' and 'Word8'. This is a no-op and
-- silently truncates to 8 bits Chars > '\255'. It is provided as
-- convenience for ByteString construction.
c2w :: Char -> Word8
c2w = fromIntegral . ord
{-# INLINE c2w #-}

-- ---------------------------------------------------------------------
-- Things that depend on the encoding

-- | 'breakSpace' returns the pair of ByteStrings when the argument is
-- broken at the first whitespace byte. I.e.
-- 
-- > break isSpace == breakSpace
--
breakSpace :: ByteString -> (ByteString,ByteString)
breakSpace (PS x s l) = inlinePerformIO $ withForeignPtr x $ \p -> do
    i <- firstspace (p `plusPtr` s) 0 l
    return $ case () of {_
        | i == 0    -> (empty, PS x s l)
        | i == l    -> (PS x s l, empty)
        | otherwise -> (PS x s i, PS x (s+i) (l-i))
    }
{-# INLINE breakSpace #-}

firstspace :: Ptr Word8 -> Int -> Int -> IO Int
firstspace a b c | a `seq` b `seq` c `seq` False = undefined
firstspace ptr n m
    | n >= m    = return n
    | otherwise = do w <- peekByteOff ptr n
                     if (not . isSpaceWord8) w then firstspace ptr (n+1) m else return n

-- | 'dropSpace' efficiently returns the 'ByteString' argument with
-- white space Chars removed from the front. It is more efficient than
-- calling dropWhile for removing whitespace. I.e.
-- 
-- > dropWhile isSpace == dropSpace
--
dropSpace :: ByteString -> ByteString
dropSpace (PS x s l) = inlinePerformIO $ withForeignPtr x $ \p -> do
    i <- firstnonspace (p `plusPtr` s) 0 l
    return $ if i == l then empty else PS x (s+i) (l-i)
{-# INLINE dropSpace #-}

firstnonspace :: Ptr Word8 -> Int -> Int -> IO Int
firstnonspace a b c | a `seq` b `seq` c `seq` False = undefined
firstnonspace ptr n m
    | n >= m    = return n
    | otherwise = do w <- peekElemOff ptr n
                     if isSpaceWord8 w then firstnonspace ptr (n+1) m else return n

-- | 'dropSpaceEnd' efficiently returns the 'ByteString' argument with
-- white space removed from the end. I.e.
-- 
-- > reverse . (dropWhile isSpace) . reverse == dropSpaceEnd
--
-- but it is more efficient than using multiple reverses.
--
dropSpaceEnd :: ByteString -> ByteString
dropSpaceEnd (PS x s l) = inlinePerformIO $ withForeignPtr x $ \p -> do
    i <- lastnonspace (p `plusPtr` s) (l-1)
    return $ if i == (-1) then empty else PS x s (i+1)
{-# INLINE dropSpaceEnd #-}

lastnonspace :: Ptr Word8 -> Int -> IO Int
lastnonspace a b | a `seq` b `seq` False = undefined
lastnonspace ptr n
    | n < 0     = return n
    | otherwise = do w <- peekElemOff ptr n
                     if isSpaceWord8 w then lastnonspace ptr (n-1) else return n

-- | 'lines' breaks a ByteString up into a list of ByteStrings at
-- newline Chars. The resulting strings do not contain newlines.
--
lines :: ByteString -> [ByteString]
lines ps
    | null ps = []
    | otherwise = case search ps of
             Nothing -> [ps]
             Just n  -> take n ps : lines (drop (n+1) ps)
    where search = elemIndex '\n'
{-# INLINE lines #-}

{-# RULES

"length.lines/count" 
    P.length . lines = count '\n'

  #-}

{-
-- Just as fast, but more complex. Should be much faster, I thought.
lines :: ByteString -> [ByteString]
lines (PS _ _ 0) = []
lines (PS x s l) = inlinePerformIO $ withForeignPtr x $ \p -> do
        let ptr = p `plusPtr` s

            STRICT1(loop)
            loop n = do
                let q = memchr (ptr `plusPtr` n) 0x0a (fromIntegral (l-n))
                if q == nullPtr
                    then return [PS x (s+n) (l-n)]
                    else do let i = q `minusPtr` ptr
                            ls <- loop (i+1)
                            return $! PS x (s+n) (i-n) : ls
        loop 0
-}

-- | 'unlines' is an inverse operation to 'lines'.  It joins lines,
-- after appending a terminating newline to each.
unlines :: [ByteString] -> ByteString
unlines [] = empty
unlines ss = (concat $ List.intersperse nl ss) `append` nl -- half as much space
    where nl = packChar '\n'

-- | 'words' breaks a ByteString up into a list of words, which
-- were delimited by Chars representing white space. And
--
-- > tokens isSpace = words
--
words :: ByteString -> [ByteString]
words = B.tokens isSpaceWord8
{-# INLINE words #-}

-- | The 'unwords' function is analogous to the 'unlines' function, on words.
unwords :: [ByteString] -> ByteString
unwords = join (packChar ' ')
{-# INLINE unwords #-}

-- | /O(n)/ Indicies of newlines. Shorthand for 
--
-- > elemIndices '\n'
--
lineIndices :: ByteString -> [Int]
lineIndices = elemIndices '\n'
{-# INLINE lineIndices #-}

-- | 'lines\'' behaves like 'lines', in that it breaks a ByteString on
-- newline Chars. However, unlike the Prelude functions, 'lines\'' and
-- 'unlines\'' correctly reconstruct lines that are missing terminating
-- newlines characters. I.e.
--
-- > unlines  (lines "a\nb\nc")  == "a\nb\nc\n"
-- > unlines' (lines' "a\nb\nc") == "a\nb\nc"
--
-- Note that this means:
--
-- > lines  "a\nb\nc\n" == ["a","b","c"]
-- > lines' "a\nb\nc\n" == ["a","b","c",""]
--
lines' :: ByteString -> [ByteString]
lines' ps = ps `seq` case elemIndex '\n' ps of
     Nothing -> [ps]
     Just n -> take n ps : lines' (drop (n+1) ps)

-- | 'linesCRLF\'' behaves like 'lines\'', but breaks on (\\cr?\\lf)
linesCRLF' :: ByteString -> [ByteString]
linesCRLF' ps = ps `seq` case elemIndex '\n' ps of
     Nothing -> [ps]
     Just 0  -> empty : linesCRLF' (drop 1 ps)
     Just n  -> let k = if ps `unsafeIndex` (n-1) == '\r' then n-1 else n
                in take k ps : linesCRLF' (drop (n+1) ps)

-- | 'unlines\'' behaves like 'unlines', except that it also correctly
-- retores lines that do not have terminating newlines (see the
-- description for 'lines\'').
--
unlines' :: [ByteString] -> ByteString
unlines' ss = concat $ intersperse_newlines ss
    where intersperse_newlines (a:b:s) = a:newline: intersperse_newlines (b:s)
          intersperse_newlines s = s
          newline = packChar '\n'

-- | 'unlines\'' behaves like 'unlines', except that it also correctly
-- retores lines that do not have terminating newlines (see the
-- description for 'lines\''). Uses CRLF instead of LF.
--
unlinesCRLF' :: [ByteString] -> ByteString
unlinesCRLF' ss = concat $ intersperse_newlines ss
    where intersperse_newlines (a:b:s) = a:newline: intersperse_newlines (b:s)
          intersperse_newlines s = s
          newline = pack "\r\n"

-- | 'words\'' behaves like 'words', with the exception that it produces
-- output on ByteStrings with trailing whitespace that can be
-- correctly inverted by 'unwords'. I.e.
--
-- > words  "a b c " == ["a","b","c"]
-- > words' "a b c " == ["a","b","c",""]
--
-- > unwords $ words  "a b c " == "a b c"
-- > unwords $ words' "a b c " == "a b c "
--
words' :: ByteString -> [ByteString]
words' = B.splitWith isSpaceWord8

-- | 'unwords\'' behaves like 'unwords'. It is provided for consistency
-- with the other invertable words and lines functions.
unwords' :: [ByteString] -> ByteString
unwords' = unwords

-- | 'betweenLines' returns the ByteString between the two lines given,
-- or Nothing if they do not appear.  The returned string is the first
-- and shortest string such that the line before it is the given first
-- line, and the line after it is the given second line.
betweenLines :: ByteString -- ^ First line to look for
             -> ByteString -- ^ Second line to look for
             -> ByteString -- ^ 'ByteString' to look in
             -> Maybe (ByteString)

betweenLines start end ps =
    case P.break (start ==) (lines ps) of
        (_, _:rest@(PS ps1 s1 _:_)) ->
            case P.break (end ==) rest of
                (_, PS _ s2 _:_) -> Just $ PS ps1 s1 (s2 - s1)
                _ -> Nothing
        _ -> Nothing

-- ---------------------------------------------------------------------
-- Reading from ByteStrings

-- | readInt skips any whitespace at the beginning of its argument, and
-- reads an Int from the beginning of the ByteString.  If there is no
-- integer at the beginning of the string, it returns Nothing, otherwise
-- it just returns the int read, and the rest of the string.
readInt :: ByteString -> Maybe (Int, ByteString)
readInt p@(PS x s l) = inlinePerformIO $ useAsCString p $ \cstr ->
    with (castPtr cstr) $ \endpp -> do
        val     <- c_strtol (castPtr cstr) endpp 0
        skipped <- (`minusPtr` cstr) `fmap` peek endpp
        return $ if skipped == 0
                 then Nothing
                 else Just (fromIntegral val, PS x (s+skipped) (l-skipped))

-- | unsafeReadInt is like readInt, but requires a null terminated
-- ByteString. It avoids a copy if this is the case. It returns the Int
-- read, if any, and the rest of the string.
unsafeReadInt :: ByteString -> Maybe (Int, ByteString)
unsafeReadInt p@(PS x s l) = inlinePerformIO $ unsafeUseAsCString p $ \cstr ->
    with (castPtr cstr) $ \endpp -> do
        val     <- c_strtol (castPtr cstr) endpp 0
        skipped <- (`minusPtr` cstr) `fmap` peek endpp
        return $ if skipped == 0
                 then Nothing
                 else Just (fromIntegral val, PS x (s+skipped) (l-skipped))

foreign import ccall unsafe "stdlib.h strtol" c_strtol
    :: Ptr Word8 -> Ptr (Ptr Word8) -> Int -> IO CLong

{-
--
-- not quite there yet
--
readInt :: ByteString -> Maybe (Int, ByteString)
readInt = go 0
    where
        STRICT2(go)
        go i ps
            | B.null ps = Nothing
            | x == '-'  = neg 0 xs
            | otherwise = pos (parse x) xs
            where (x, xs) = (ps `unsafeIndex` 0, unsafeTail ps)

        STRICT2(neg)
        neg n qs | isSpace x   = return $ Just ((i-n),xs)
                 | otherwise   = neg (parse x + (10 * n)) xs
                 where (x, xs) = (qs `unsafeIndex` 0, unsafeTail qs)

        STRICT2(pos)
        pos n qs | isSpace x = go (i+n) xs
                 | otherwise = pos (parse x + (10 * n)) xs
                 where (x, xs) = (qs `unsafeIndexWord8` 0, unsafeTail qs)

        parse w = fromIntegral (w - 48) :: Int
        {-# INLINE parse #-}
-}

-- ---------------------------------------------------------------------
-- Internals

-- Just like inlinePerformIO, but we inline it. Big performance gains as
-- it exposes lots of things to further inlining
--
{-# INLINE inlinePerformIO #-}
inlinePerformIO :: IO a -> a



inlinePerformIO = unsafePerformIO


-- Selects white-space characters in the Latin-1 range
-- ordered by frequency
-- Idea from Ketil
isSpaceWord8 :: Word8 -> Bool
isSpaceWord8 w = case w of
    0x20 -> True -- SPACE
    0x0A -> True -- LF, \n
    0x09 -> True -- HT, \t
    0x0C -> True -- FF, \f
    0x0D -> True -- CR, \r
    0x0B -> True -- VT, \v
    0xA0 -> True -- spotted by QC..
    _    -> False
{-# INLINE isSpaceWord8 #-}

-- | /O(n)/ Like 'map', but not fuseable. The benefit is that it is
-- slightly faster for one-shot cases.
mapF :: (Char -> Char) -> ByteString -> ByteString
mapF f = B.mapF (c2w . f . w2c)

-- | /O(n)/ 'filterF' is a non-fuseable version of filter, that may be
-- around 2x faster for some one-shot applications.
filterF :: (Char -> Bool) -> ByteString -> ByteString
filterF f = B.filterF (f . w2c)
