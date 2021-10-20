import Queue

--1)
--No funciona con números
lengthQ :: Queue a -> Int
lengthQ q = 
	if isEmptyQ q 
		then 0
		else 1 + lengthQ (dequeu q)
--2)
queueToList :: Queue a -> [a]
queueToList q =
	if isEmptyQ q 
		then []
		else [(firstQ q)] ++ queueToList (dequeu q)
--3)
unionQ :: Queue a -> Queue a -> Queue a
unionQ q1 q2 =
	if isEmptyQ q2
		then q1
		else unionQ (queue (firstQ q2) q1) (dequeu q2)
