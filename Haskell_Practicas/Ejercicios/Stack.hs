module Stack (Stack
			 ,emptyS
			 ,isEmptyS
			 ,push
			 ,top
			 ,pop) where
data Stack a = S [a] Int deriving(Show)
--LIFO
--1)
emptyS :: Stack a 
emptyS = S [] 0 
--2)
isEmptyS :: Stack a -> Bool
isEmptyS (S [] 0) = True
isEmptyS _ = False
--3)
push :: a -> Stack a -> Stack a 
push a (S xs int) = S (agregarUltimo a xs) (length (agregarUltimo a xs))

agregarUltimo :: a -> [a] -> [a]
agregarUltimo a [] = [a]
agregarUltimo a xs =
	xs ++ [a] 
--4)
top :: Stack a -> a
top (S xs int) = elPrimero (reverse xs)

elPrimero :: [a] -> a
elPrimero (x:xs) = x
--5)
pop :: Stack a -> Stack a 
pop (S xs int) = S (reverse (sinElPrimero (reverse xs))) 
	(length (reverse (sinElPrimero (reverse xs))))

sinElPrimero :: [a] -> [a]
sinElPrimero [] = []
sinElPrimero (x:xs) = xs

isEmpty :: [a] -> Bool
isEmpty [] = True
isEmpty _ = False

--6)******

--maxS :: Ord a => Stack a -> a
maxS (S xs int) = maximoDeUnaLista xs

maximoDeUnaLista :: (Ord a, Num a) => [a] -> a
maximoDeUnaLista [] = 0
maximoDeUnaLista (x:xs) =
	max x (maximoDeUnaLista xs)

---USUARIO
--1)
--apilar :: [a] -> Stack a
--apilar xs =

--2)
desapilar :: Stack a -> [a]
desapilar s =
	if isEmptyS s
		then []
		else top s : (desapilar (pop s)) 
--3)
--treeToStack :: Tree a -> Stack a

