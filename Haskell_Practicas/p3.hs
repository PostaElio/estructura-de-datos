data Tree a = EmptyT | NodeT a (Tree a) (Tree a) deriving (Show)
arbol1 = NodeT 51
            ( NodeT 12
                ( NodeT 1
                    EmptyT
                    EmptyT )
                ( NodeT 43
                    ( NodeT 36
                        EmptyT
                        EmptyT )
                    EmptyT ))
            ( NodeT 87
                ( NodeT 52
                    EmptyT
                    ( NodeT 83
                        EmptyT
                        EmptyT ) )
                        EmptyT )
--Arboles Binarios
--1)
{-
sumarT :: Tree Int -> Int
sumarT EmptyT = 0
sumarT (NodeT x ti td) = x + sumarT ti + sumarT td
-}
--2)
sizeT :: Tree a -> Int
sizeT EmptyT = 0
sizeT (NodeT x ti td) = 1 + sizeT ti + sizeT td
--3)
{-
mapDobleT :: Tree Int -> Tree Int
mapDobleT EmptyT = EmptyT
mapDobleT (NodeT x ti td) = 
    NodeT (x * 2) (mapDobleT ti) (mapDobleT td)
-}
--5)
perteneceT :: Eq a => a -> Tree a -> Bool
perteneceT y EmptyT = False
perteneceT y (NodeT x ti td) = 
    (y == x) || (perteneceT y ti) || (perteneceT y td)
--6)
aparicionesT :: Eq a => a -> Tree a -> Int
aparicionesT y EmptyT = 0
aparicionesT y (NodeT x ti td) = 
    if (y == x)
        then 1 + (aparicionesT y ti) + (aparicionesT y td)
        else (aparicionesT y ti) + (aparicionesT y td)   
--7)
--cuenta a los nodos que no tienen hijos
countLeaves :: Tree a -> Int
countLeaves EmptyT = 0
countLeaves (NodeT x EmptyT EmptyT) = 1
countLeaves (NodeT x ti td) = 
    (countLeaves ti) + (countLeaves td)
--8)
leaves :: Tree a -> [a]
leaves EmptyT = []
leaves (NodeT x EmptyT EmptyT) = [x]
leaves (NodeT x ti td) = 
    (leaves ti) ++ (leaves td)
--9)
heigthT :: Tree a -> Int
heigthT (NodeT x EmptyT EmptyT) = 0
--10)
--Revisar
countNotLeaves :: Tree a -> Int
countNotLeaves EmptyT = 0
countNotLeaves (NodeT x ti EmptyT) = 1
countNotLeaves (NodeT x EmptyT td) = 1
countNotLeaves (NodeT x EmptyT EmptyT) = 0
countNotLeaves (NodeT x ti td) =
    (countNotLeaves ti) + (countNotLeaves td)
--countNotLeaves x = (sizeT x) - (countLeaves x)
--11)
mirrorT :: Tree a -> Tree a
mirrorT EmptyT = EmptyT
mirrorT (NodeT x ti td) =
    NodeT x (mirrorT td) (mirrorT ti)
--12)
listInOrder :: Tree a -> [a]


