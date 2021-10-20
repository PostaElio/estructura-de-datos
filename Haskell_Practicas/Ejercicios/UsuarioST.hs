import Stack
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
