
module Set (Set
			,emptyS
			,addS
			,belongs
			,sizeS
			,removeS
			,unionS
			,intersectionS
			,setToList
			,set1) where

set1 :: Set Int
set1 = UnSet [1,2,3] 3
set2 = UnSet [4,1] 2

data Set a = UnSet [a] Int  deriving (Show)
--No tiene repetidos
--1)
--no le pasas nada
emptyS :: Set a
emptyS = UnSet [] 0

--2)
addS :: Eq a => a -> Set a -> Set a 
addS x (UnSet xs s) = 
	if elem x xs 
		then UnSet xs s 
		else UnSet (x:xs) (s + 1)
-- O(n)
--3)
belongs :: Eq a => a -> Set a -> Bool
belongs a (UnSet xs s) =
	elem a xs
--O(n)
--4)
sizeS :: Eq a => Set a -> Int
sizeS (UnSet xs s) = s
--O(1)
--5)
-- por cada elemento de la lista hace algo 
removeS :: Eq a => a -> Set a -> Set a
removeS a (UnSet xs s) = 
	UnSet (eliminarElemento a xs) s

eliminarElemento ::Eq a => a -> [a] -> [a]
eliminarElemento y [] = []
eliminarElemento y (x:xs) =
	if y == x
		then eliminarElemento y xs
		else x : (eliminarElemento y xs)
--6)

unionS :: Eq a => Set a -> Set a -> Set a
unionS (UnSet xs s) (UnSet xs1 s1) =
	UnSet (sinRepetidos (xs ++ xs1)) 
	(length (sinRepetidos (xs ++ xs1)))
--9)*****
sinRepetidos :: Eq a => [a] -> [a]
sinRepetidos [] = []
sinRepetidos (y:ys) =
	if elem y ys
		then sinRepetidos ys
		else y : (sinRepetidos ys) 
--7)
intersectionS :: Eq a => Set a -> Set a -> Set a
intersectionS (UnSet xs s) (UnSet xs1 s1) =
	UnSet (interseccionEntre xs xs1) 
	(length (interseccionEntre xs xs1))

interseccionEntre :: Eq a => [a] -> [a] -> [a]
interseccionEntre xs [] = []
interseccionEntre xs (y:ys) =
	if elem y xs
		then y : interseccionEntre xs ys
		else interseccionEntre xs ys
--8)
setToList :: Eq a => Set a -> [a]
setToList (UnSet xs s) = xs

------ Usuario!
