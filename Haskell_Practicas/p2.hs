--1)
data Dir = Norte | Sur | Este | Oeste deriving (Show)

opuesto :: Dir -> Dir
opuesto Norte = Sur
opuesto Sur = Norte 
opuesto Este = Oeste
opuesto Oeste = Este

siguiente :: Dir -> Dir
siguiente Norte = Este
siguiente Este = Sur
siguiente Sur = Oeste
siguiente Oeste = Norte

--2)
data Persona = P Int String deriving (Show)
nombre :: Persona -> String
nombre (P edad nombre) = nombre
unaPersona1 = P 50 "Pepe"
unaPersona2 = P 25 "Pepita"

edad :: Persona -> Int
edad (P edad nombre) = edad

crecer :: Persona -> Persona
crecer (P edad nombre) = P (edad+1) nombre

cambioDeNombre :: String -> Persona -> Persona
cambioDeNombre x (P edad nombre) = P edad x

esMenorQueLaOtra :: Persona -> Persona -> Bool
esMenorQueLaOtra (P edad nombre) (P edad1 nombre1) = 
	edad < edad1

mayoresA :: Int -> [Persona] -> [Persona]
mayoresA x [] = []
mayoresA x (y:ys) = 
	if (esMayorA x y)
		then y : mayoresA x ys
		else mayoresA x ys

esMayorA :: Int -> Persona -> Bool
esMayorA x (P edad nombre) = x < edad

promedioEdad :: [Persona] -> Int
promedioEdad [] = 0
promedioEdad x = sumaDeEdades x `div` length x

sumaDeEdades :: [Persona] -> Int
sumaDeEdades [] = 0
sumaDeEdades (x:xs) = edad x + sumaDeEdades xs

elMasViejo :: [Persona] -> Persona
elMasViejo [x] = x
elMasViejo (x:xs) = elMayor x (elMasViejo xs)

elMayor :: Persona -> Persona -> Persona
elMayor (P edad nombre) (P edad1 nombre1) = 
	if edad > edad1
		then (P edad nombre)
		else (P edad1 nombre1)
--3)
data TipoPokemon = Agua | Fuego | Planta deriving (Show)
data Pokemon = ElPokemon TipoPokemon Int deriving (Show)
data Entrenador = ElEntrenador Nombre [Pokemon] deriving (Show)
type Nombre = String

squirlle = ElPokemon Agua 20
bulbasour = ElPokemon Planta 35
charizard = ElPokemon Fuego 90

leGanaAlToque :: Pokemon -> Pokemon -> Bool
leGanaAlToque (ElPokemon tipoLeft _) (ElPokemon tipoRight _) = 
	leGanaAlToqueTipo (tipoLeft) (tipoRight)

leGanaAlToqueTipo :: TipoPokemon -> TipoPokemon -> Bool
leGanaAlToqueTipo Agua Fuego = True 
leGanaAlToqueTipo Fuego Planta = True
leGanaAlToqueTipo Planta Agua = True 
leGanaAlToqueTipo x y = False
---
capturarPokemon :: Pokemon -> Entrenador -> Entrenador
capturarPokemon x (ElEntrenador nombre pokemones) =
	(ElEntrenador nombre (x:pokemones)) 
---
ash = ElEntrenador "Ash" [squirlle, bulbasour, charizard]
cantidadDePokemon :: Entrenador -> Int
cantidadDePokemon (ElEntrenador nombre pokemones) = 
	length pokemones
---
cantidadDePokemonDeTipo :: TipoPokemon -> Entrenador -> Int
cantidadDePokemonDeTipo x (ElEntrenador nombre pokemones) =
	length (pokemonesQueSonDeTipo pokemones x)

pokemonesQueSonDeTipo :: [Pokemon] -> TipoPokemon -> [Pokemon]
pokemonesQueSonDeTipo [] x = []
pokemonesQueSonDeTipo (x:xs) y = 
	if (pokemonEsDeTipo x y)
		then x : (pokemonesQueSonDeTipo xs y)
		else (pokemonesQueSonDeTipo xs y)

pokemonEsDeTipo :: Pokemon -> TipoPokemon -> Bool
pokemonEsDeTipo (ElPokemon tipoPokemon porcentaje) x = 
	tiposIguales tipoPokemon x 

tiposIguales :: TipoPokemon -> TipoPokemon -> Bool
tiposIguales Agua Agua = True 
tiposIguales Planta Planta = True
tiposIguales Fuego Fuego = True
tiposIguales x y = False
---
esExperto :: Entrenador -> Bool
esExperto (ElEntrenador nombre pokemones) = 
	tienePokemonesDeCadaTipo pokemones

tienePokemonesDeCadaTipo :: [Pokemon] -> Bool
tienePokemonesDeCadaTipo x = (existeUnPokemonDeTipo x Agua)
	&& (existeUnPokemonDeTipo x Planta) 
	&& (existeUnPokemonDeTipo x Fuego)

existeUnPokemonDeTipo :: [Pokemon] -> TipoPokemon -> Bool
existeUnPokemonDeTipo [] y = False
existeUnPokemonDeTipo (x:xs) y = 
	(tiposIguales (tipoDePokemon x) y) ||
	 (existeUnPokemonDeTipo xs y) 

tipoDePokemon :: Pokemon -> TipoPokemon
tipoDePokemon (ElPokemon tipoPokemon porcentaje) = tipoPokemon
--4)
data Pizza = Prepizza
	| Agregar Ingrediente Pizza deriving (Show)
data Ingrediente = Salsa
	| Queso
	| Jamon
	| AceitunasVerdes Int deriving (Show)

quesoComun = Agregar (AceitunasVerdes 8)(
	Agregar Jamon(
		Agregar Queso(
			Prepizza)))
--pizzaPelada =(Prepizza)
---
ingredientes :: Pizza -> [Ingrediente]
ingredientes Prepizza = []
ingredientes (Agregar ingrediente pizza) = 
	ingrediente : (ingredientes pizza)
---
tieneJamon :: Pizza -> Bool
tieneJamon x = laPizzaContieneIngrediente x Jamon

laPizzaContieneIngrediente :: Pizza -> Ingrediente -> Bool
laPizzaContieneIngrediente y x =
	(algunIngredienteEs (ingredientes y) x) 

algunIngredienteEs :: [Ingrediente] -> Ingrediente -> Bool
algunIngredienteEs [] y = False
algunIngredienteEs (x:xs) y = (ingredientesIguales x y)||
	(algunIngredienteEs xs y)

ingredientesIguales :: Ingrediente -> Ingrediente -> Bool
ingredientesIguales Queso Queso = True 
ingredientesIguales Jamon Jamon = True
ingredientesIguales (AceitunasVerdes x) (AceitunasVerdes y)=True
ingredientesIguales x y = False
---Si el ingrediente es jamon entonces no agrega el ingrediente y sigue con la recursion.
---Si no de jamon entonces agrega el ingrediente y corremos con la pizza WTF
sacarJamon :: Pizza -> Pizza
sacarJamon Prepizza = Prepizza
sacarJamon (Agregar ingrediente pizza) =
	if (ingredientesIguales ingrediente Jamon)
		then sacarJamon pizza
		else (Agregar ingrediente (sacarJamon pizza))

listaDeIngredientesSin :: [Ingrediente] -> Ingrediente -> [Ingrediente]
listaDeIngredientesSin [] y = []
listaDeIngredientesSin (x:xs) y =
	if (ingredientesIguales x y)
		then listaDeIngredientesSin xs y
		else x : (listaDeIngredientesSin xs y)
--- Recorre la lista de ingredientes y los va agregado, terminando con Prepizza para crear la msima pizza
pizzaPelada =(Prepizza)
armarPizza :: [Ingrediente] -> Pizza
armarPizza [] = Prepizza
armarPizza (x:xs) = (Agregar x) (armarPizza xs) 
---
duplicarAceitunas :: Pizza -> Pizza
duplicarAceitunas x = 
	armarPizza (buscarAceitunasYDuplicarlos (ingredientes x)) 

buscarAceitunasYDuplicarlos :: [Ingrediente] -> [Ingrediente]
buscarAceitunasYDuplicarlos [] = []
buscarAceitunasYDuplicarlos (x:xs) =
	if (ingredientesIguales x (AceitunasVerdes 8))
		then duplicarNumero x : buscarAceitunasYDuplicarlos xs
		else x : buscarAceitunasYDuplicarlos xs 

duplicarNumero :: Ingrediente -> Ingrediente
duplicarNumero (AceitunasVerdes int) = AceitunasVerdes (int * 2) 

cantidadDeAceitunas :: Ingrediente -> Int
cantidadDeAceitunas (AceitunasVerdes int) = int
---
sacar :: [Ingrediente] -> Pizza -> Pizza
sacar x Prepizza = Prepizza
sacar x (Agregar ingrediente pizza) =
	if (pertenece ingrediente x)
		then sacar x pizza
		else (Agregar ingrediente (sacar x pizza))

pertenece :: Ingrediente -> [Ingrediente] -> Bool
pertenece x [] = False
pertenece x (y:ys) = (ingredientesIguales x y) || pertenece x ys

		{-
sacarJamon (Agregar ingrediente pizza) =
	if (ingredientesIguales ingrediente Jamon)
		then sacarJamon pizza
		else (Agregar ingrediente (sacarJamon pizza))
-}

sacarIngrediente :: Pizza -> Ingrediente -> Pizza
sacarIngrediente Prepizza x = Prepizza
sacarIngrediente (Agregar ingrediente pizza) x =
	if (ingredientesIguales ingrediente x)
		then sacarIngrediente pizza x
		else (Agregar ingrediente (sacarIngrediente pizza x))
---
pizzaExtraJamon = Agregar (AceitunasVerdes 8)(
	Agregar Jamon (
		Agregar Jamon(
			Agregar Jamon(
				Prepizza))))
cantJamon :: [Pizza] -> [(Int, Pizza)]
cantJamon [] = []
cantJamon (x:xs) = 
	if (laPizzaContieneIngrediente x Jamon)
		then ((cantidadDeJamon x),(x)): cantJamon xs
		else cantJamon xs

cantidadDeJamon :: Pizza -> Int
cantidadDeJamon x = 
	length (ingredientesQueSean (ingredientes x) Jamon)

ingredientesQueSean :: [Ingrediente] -> Ingrediente -> [Ingrediente]
ingredientesQueSean [] y = []
ingredientesQueSean (x:xs) y =
	if (ingredientesIguales y x)
		then x : ingredientesQueSean xs y
		else ingredientesQueSean xs y 
---
pizzaExtraAceituna = Agregar (AceitunasVerdes 8)(
	Agregar (AceitunasVerdes 8) (
		Agregar Jamon(
			Agregar Jamon(
				Prepizza))))
mayorNAceitunas :: Int -> [Pizza] -> [Pizza]
mayorNAceitunas x [] = []
mayorNAceitunas x (y:ys) =
	if (pizzaTieneMasAceitunasQue y x)
		then y : mayorNAceitunas x ys
		else mayorNAceitunas x ys

pizzaTieneMasAceitunasQue :: Pizza -> Int -> Bool
pizzaTieneMasAceitunasQue x y =
	(cantidadDeAceitunasDePizza x) > y

cantidadDeAceitunasDePizza :: Pizza -> Int
cantidadDeAceitunasDePizza x = 
	(verCantidadDeAceitunas (ingredientesQueSean (ingredientes x) (AceitunasVerdes 1)))

verCantidadDeAceitunas :: [Ingrediente] -> Int
verCantidadDeAceitunas [] = 0
verCantidadDeAceitunas (x:xs) = 
	(cantidadDeAceitunas x) + verCantidadDeAceitunas xs
---
data Objeto = Cacharro 
			| Tesoro deriving (Show)
data Camino = Fin 
			| Cofre [Objeto] Camino 
			| Nada Camino deriving (Show)

objeto1 = Cacharro
objeto2 = Tesoro
camino1 = Fin
camino2 = Cofre [objeto1, objeto1, objeto1] (Cofre [objeto1, objeto2, objeto1] Fin)
camino3 = Nada (Cofre [objeto1, objeto1, objeto1] Fin)

hayTesoro :: Camino -> Bool
hayTesoro Fin = False
hayTesoro (Nada c) = hayTesoro c
hayTesoro (Cofre xs c) = hayTesoroenCofre xs || hayTesoro c

hayTesoroenCofre :: [Objeto] -> Bool
hayTesoroenCofre [] = False
hayTesoroenCofre (x:xs) =
	esTesoro x || hayTesoroenCofre xs

esTesoro :: Objeto -> Bool
esTesoro Tesoro = True
esTesoro Cacharro = False
---
pasoHastaElTesoro :: Camino -> Int
pasoHastaElTesoro Fin = 0"tiene que haber un tesoro "
pasoHastaElTesoro (Nada c) = 1 + pasoHastaElTesoro c
pasoHastaElTesoro (Cofre xs c) =
	if (hayTesoroenCofre xs) 
		then 0 + pasoHastaElTesoro Fin
		else 1 + pasoHastaElTesoro c
{-
hayTesoroEn :: Int -> Camino -> Bool
hayTesoroEn 0 c = hayTesoroAca c
hayTesoroEn n Fin =
hayTesoroEn n (Nada c) = hayTesoro (n-1) c
hayTesoroEn n (Cofre xs c) = hayTesoroEn (n-1) c
-}
--otherCase
 --   if n == 0
  --  	then hayTesoroEnCofre xs
--		else hayTesoro (n-1) c
{-
hayTesoroAca :: Camino -> Bool
hayTesoroAca (Cofre xs _) = hayTesoroEnCofre xs
hayTesoroAca _ = False
-}
--6)
data ListaNoVacia a = Unit a 
					| Cons a (ListaNoVacia a) deriving (Show)
unidad1 = Unit 1
--unidad2 = Cons 1 ([1] )
--length' :: ListaNoVacia a -> Int
data T a = A
		 | B a
		 | C a a
		 | D (T a)
		 | E a (T a) deriving (Show)
		
-- los casos base son "A", "B a" y "C a a"		
letraA = A
letras = E 1 (D (C 1 2))
size :: T a -> Int
size A = 0
size (B a) = 1
size (C a b) = 2
size (D a) = size a
size (E a b) = 1 + size b
---
sum' :: T Int -> Int
sum' A = 0
sum' (B a) = a
sum' (C a b) = 2
sum' (D a) = sum' a
sum' (E a b) = a + sum' b




--18)
ramaMasLarga :: Tree a -> [a]
ramaMasLarga EmptyT = []
ramaMasLarga (NodeT x ti td) = 
    x : (maxEntreListas (ramaMasLarga ti) (ramaMasLarga td))

maxEntreListas :: [a] -> [a] -> [a]
maxEntreListas xs ys =
    if (length xs) > (length ys)
        then xs
        else ys
hayTesoro :: Mapa -> Bool
hayTesoro (Cofre contenido ) = esTesoro contenido 
hayTesoro (Bicurfacion contenidno mapal mapar) =
    esTesoro (cotenido) || (hayTesoro mapal) || (hayTesoro mapar)


esTesoro :: Obejeto -> Bool 
esTesoro Tesoro = True 
esTesoro _ = False