import Set

--1)
losQuePertenecen :: Eq a => [a] -> Set a -> [a]
losQuePertenecen [] set = []
losQuePertenecen (x:xs) set = 
	if belongs x set
		then x : losQuePertenecen xs set
		else losQuePertenecen xs set
--2)
--listToSet: dada una lista devuelve un nuevo Set con todos los elementos de la lista
--setToList: dado un Set devuelve la lista de un Set
{-
sinRepetidosl :: Eq a => [a] -> [a]
sinRepetidosl xs = setToList (listToSet xs) 

listToSet :: Eq a => [a] -> Set a 
listToSet [] = emptyS 
listToSet (x:xs) = addS x (listToSet xs)
-}

--3)
data Tree a = EmptyT 
			| NodeT (Set a) (Tree a) (Tree a) deriving (Show)

arbol1 :: Tree Int
arbol1 = NodeT set1 EmptyT EmptyT

unirTodos :: Eq a => Tree (Set a) -> Set a
unirTodos EmptyT = emptyS
unirTodos (NodeT set t1 t2) =
	agregar (setToList set)
	(unionS (unirTodos t1) (unirTodos t2))

agregar :: Eq a => [a] -> Set a -> Set a 
agregar [] set = set
agregar (x:xs) set =
	agregar xs (addS x set) 


