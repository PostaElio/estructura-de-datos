module Queue (Queue
			,emptyQ
			,isEmptyQ
			,queue
			,agregarUltimo
			,firstQ
			,dequeu
			,q1) where

data Queue a = Q [a] Int deriving(Show)
--FIFO
q1 = Q [1,2] 2
--1)
emptyQ :: Queue a
emptyQ = Q [] 0 
--2)
isEmptyQ :: Queue a -> Bool
isEmptyQ (Q [] int) = True
isEmptyQ _ = False
--3) agregar un elemento a la cola ultimo
queue :: a -> Queue a -> Queue a
queue a (Q xs int) = Q (agregarUltimo a xs) (int + 1)

agregarUltimo :: a -> [a] -> [a]
agregarUltimo a [] = [a]
agregarUltimo a xs =
	xs ++ [a] 
--4) devuelve el primer elemento
firstQ :: Queue a -> a
firstQ (Q (x:xs) int) = x 
--5) devuelve la cola sin el primer elemento
dequeu :: Queue a -> Queue a 
dequeu (Q (x:xs) int) = Q xs (int - 1)
--Bonus
agregarPorDelante :: a -> Queue a -> Queue a
agregarPorDelante a (Q xs int) = Q (a:xs) (int + 1) 

--5)***
lenQ :: Queue a -> Int
lenQ (Q xs int) = int
---Usuario
