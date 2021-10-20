--1.a)
sucesor :: Int -> Int
sucesor x = x + 1
--b)
sumar :: Int -> Int -> Int
sumar x y = x + y
--c)
maximo :: Int -> Int -> Int
maximo x y =
		if x > y
			then x
			else y
--2.a)
negar :: Bool -> Bool
negar x = not x
--b)
andLogico :: Bool -> Bool -> Bool
andLogico True True = True
andLogico x y = False
--c)
orLogico :: Bool -> Bool -> Bool
orLogico False False = False
orLogico x y = True 
--d)
primera :: (Int,Int) -> Int
primera (x,y) = x
--e)
segunda :: (Int,Int) -> Int
segunda (x,y) = y
--f)
sumarPar :: (Int,Int) -> Int
sumarPar x = primera x + segunda x
--g)
maxDelPar :: (Int,Int) -> Int
maxDelPar (x,y) = maximo x y 
--3.a)
loMismo :: a -> a
loMismo x = x
--b)
siempreSiete :: a -> Int
siempreSiete x = 7
--c)
duplicar :: a -> (a,a)
duplicar x = (x,x)
--d)
singleton :: a -> [a]
singleton x = [x]
--4.a)
isEmpty :: [a] -> Bool
isEmpty [] = True
isEmpty (x:xs) = False  --Esto es como decir que si porlomenos hay uno es falso 
--b)
head' :: [a] -> a
head' (x:xs) = x
--c)
tail' :: [a] -> [a]
tail' (x:xs) = xs
--Recursion
--1)
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs
--2)length
longitud :: [a] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs 
--3)
mapSucesor :: [Int] -> [Int]
mapSucesor [] = []
mapSucesor (x:xs) = sucesor x : mapSucesor xs
--4)
mapSumarPar :: [(Int,Int)] -> [Int]
mapSumarPar [] = []
mapSumarPar (x:xs) = sumarPar x : mapSumarPar xs
--5)
mapMaxDelPar :: [(Int,Int)] -> [Int]
mapMaxDelPar [] = []
mapMaxDelPar ((x,y):z) = maximo x y : mapMaxDelPar z 
--6)
todoVerdad :: [Bool] -> Bool
todoVerdad [] = True
todoVerdad (x:xs) = x && (todoVerdad xs) 
--7)
algunoVerdad :: [Bool] -> Bool
algunoVerdad [] = False
algunoVerdad (x:xs) = x || algunoVerdad xs
--8)
pertenece :: Eq a => a -> [a] -> Bool
pertenece x [] = False
pertenece x (y:ys) =
	if x == y 
		then True
		else pertenece x ys
--9)
apariciones :: Eq a => a -> [a] -> Int
apariciones x [] = 0
apariciones x (y:ys) =
	if x == y
		then 1 + apariciones x ys
		else apariciones x ys
--10)
filtrarMenoresA :: Int -> [Int] -> [Int]
filtrarMenoresA x [] = []
filtrarMenoresA x (y:ys) = 
	if y < x 
		then y : filtrarMenoresA x ys
		else filtrarMenoresA x ys
--11)
--Si el elemento es igual al de la lista entonces sigo recorriendo ,si no es igual 
--entonces lo agrego
filtrarElemento :: Eq a => a -> [a] -> [a]
filtrarElemento x [] = []
filtrarElemento x (y:ys) = 
	if x == y
		then filtrarElemento x ys
		else y : filtrarElemento x ys
--12)
-- [[1],[1,2,3],[1,2,3,4],[1,2,3,4,5]] => [1,3,4,5]
mapLongitudes :: [[a]] -> [Int]
mapLongitudes [] = []
mapLongitudes (x:xs) = longitud x : (mapLongitudes xs)
--13) 
longitudMayorA :: Int -> [[a]] -> [[a]]
longitudMayorA x [] = []
longitudMayorA x (y:ys) = 
	if x < (longitud y)
		then y : longitudMayorA x ys
		else longitudMayorA x ys
--14)
intercalar :: a -> [a] -> [a]
intercalar x [] = []
intercalar x [y] = [y]
intercalar x (y:ys) =  y:x : intercalar x  ys 
--por que no se lo puede hacer sin parentensis en (y:x)
--por que intercalar es una lista de listas 
--15)
snoc :: [a] -> a -> [a]
snoc [] x = [x]
snoc (y:ys) x = y: snoc ys x 
--16)
--x:x:x: (append [] ys) -> x:x:x:ys
--Desarma la primera lista ,una vez vacia agrega  la siguiente lista completa
append :: [a] -> [a] -> [a]
append []  ys = ys
append (x:xs) ys = x : (append xs ys)
--17)
-- como ambos son listas se usa si o si el ++
aplanar :: [[a]] -> [a]
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs 
--18)
--REVISAR!
reversa ::Eq a => [a] -> [a]
reversa [] = [] 
reversa x = lastOfList x : reversa (sinElemento (lastOfList x) x)

--Precondicion: la lista siempre deve tener porlomenos un objeto
lastOfList :: [a] -> a
lastOfList [a] = a
lastOfList (x:xs) = lastOfList xs
--19)
--zipMaximos :: [Int] -> [Int] -> [Int]
--zipMaximos [] [] = []
--zipMaximos x y = maximo (maximum x) (maximum y)

--20)
zipSort :: [Int] -> [Int] -> [(Int,Int)]
zipSort [] [] = []
zipSort (x:xs) (y:ys) = generarParMinMax x y : zipSort xs ys

generarParMinMax :: Int -> Int -> (Int,Int)
generarParMinMax x y = 
	if x > y
		then (y,x)
		else (x,y)
--21)
promedio :: [Int] -> Int
promedio x = (sumarLista x) `div` (longitud x)

sumarLista :: [Int] -> Int
sumarLista [] = 0
sumarLista (x:xs) = x + sumarLista xs
--22)
minimum' :: Ord a => [a] -> a
minimum' [x] = x
minimum' (x:xs) = min x (minimum xs) 
--Recursion sobre numeros
--1)
factorial :: Int -> Int
factorial 0 = 1
factorial x = x * factorial (x-1)
--2)
cuentaRegresiva :: Int -> [Int]
cuentaRegresiva 0 = []
cuentaRegresiva x = x : cuentaRegresiva (x-1)
--3)
--contarHasta :: Int -> [Int]
--contarHasta x = 
--	if (x == 0)
--		then  contarHasta (x-1)
--4)
replicarN :: Int -> a -> [a]
replicarN 0 y = []
replicarN x y = y : replicarN (x-1) y
--5)
--Revisar
desdeHasta :: Int -> Int -> [Int]
desdeHasta x y =
	if x < y 
		then x : desdeHasta (x+1) y
		else [y]
--6)
--cuando es una lista vacia sea el numero que sea se devuelve []
--cuando el numero es 0 y hay una lista se devuelve []
takeN :: Int -> [a] -> [a]
takeN 0 xs = []
takeN n [] = []
takeN x (y:ys) = y : (takeN (x-1) ys)
--7)
dropN :: Int -> [a] -> [a]
dropN x (y:ys) = 
	if x == 0 
		then y:ys
		else dropN (x-1) ys
--8)
splitN :: Int -> [a] -> ([a],[a])
splitN x y = (takeN x y , dropN x y)
--1)
maximum' :: Ord a => [a] -> a
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)
--2)
splitMin :: Ord a => [a] -> (a, [a])
splitMin x = (minimum' x , filtrarElemento (minimum' x) x)
--3)
ordenar :: Ord a => [a] -> [a]
ordenar [] = []
ordenar x = minimum' x : ordenar (sinElemento (minimum' x) x)
--Elimina a todos los elementos de la lista que son igual al dado
sinElemento :: Eq a => a -> [a] -> [a]
sinElemento x [] = []
sinElemento x (y:ys) = 
	if x == y
		then sinElemento x ys
		else y : (sinElemento x ys) 
--4)
--Una vez que se terminma de recorrer X se devuelve una lista vacia
interseccion :: Eq a => [a] -> [a] -> [a]
interseccion [] y = []
interseccion (x:xs) y =
	if (pertenece x y)
		then x : interseccion xs y
		else interseccion xs y 
--5)
-- A - B
-- Revisar T_T
diferencia :: Eq a => [a] -> [a] -> [a]
diferencia x [] = []
diferencia x (y:ys) =
	if (pertenece y x)
		then diferencia x ys
		else y : diferencia x ys 
--6)
--Dada una lista agrupa en la izquierda los numeros mayores o iguales a 0
particionPorSigno :: [Int] -> ([Int],[Int])
particionPorSigno [] = ([],[])
particionPorSigno (x:xs) = ponerDentro x (particionPorSigno xs)

ponerDentro :: Int -> ([Int],[Int]) -> ([Int],[Int])
ponerDentro x (ps,ns) =
	if x > 0
		then (x:ps,ns)
		else (ps,x:ns)		

particionPorSigno' :: [Int] -> ([Int], [Int])
particionPorSigno' [] = ([],[])
particionPorSigno' (x:xs) = 
	let (mayores, menores) = particionPorSigno' xs
	in if x >= 0
	then (x:mayores, menores)
	else (mayores, x:menores) 
--7)
particionPorParidad :: [Int] -> ([Int],[Int])
particionPorParidad [] = ([],[])
particionPorParidad (x:xs) = ordenarParidad x (particionPorParidad xs)
--even: devuelve True si es np, odd: devuelve True si es ni
ordenarParidad :: Int -> ([Int],[Int]) -> ([Int],[Int])
ordenarParidad x (np,ni) =
	if (even x)
		then (x:np,ni)
		else (np,x:ni)
--8)
subtails :: [a] -> [[a]]
subtails [] = [[]]
subtails x = x : subtails (tail x)
--9)
agrupar :: Eq a => [a] -> [[a]]
agrupar [] = []
agrupar (x:xs) = (x:(listaDeObjetosQueSon x xs)) : (agrupar (sinElemento x xs))

listaDeObjetosQueSon ::Eq a => a -> [a] -> [a]
listaDeObjetosQueSon a [] = []
listaDeObjetosQueSon x (y:ys) = 
	if x == y 
		then y : listaDeObjetosQueSon x ys
		else listaDeObjetosQueSon x ys
{-
agrupar :: Eq a => [a] -> [[a]]
agrupar [] = []
agrupar (x:xs) = agregarAGrupo x (agrupar xs)

agregarAGrupo :: Eq a => [[a]] -> [[a]]
agregarAGrupo x [] = [[x]]
agregarAGrupo x (xs:xss) = 
	if pertenece x xs
		then (x:xs):xss
		else [x]:xs:xss
-}
--10)
esPrefijo :: Eq a => [a] -> [a] -> Bool
esPrefijo [] y = True
esPrefijo (x:xs) (y:ys) =
	if x == y
		then True && esPrefijo xs ys
		else False 
--11)
esSufijo :: Eq a => [a] -> [a] -> Bool
esSufijo x y = esPrefijo (reversa x) (reversa y) 




