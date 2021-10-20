#ifndef __MAP_H__
#define __MAP_H__

#include <iostream>
#include <cstdlib>
#include <vector>
#include "../mago/mago.h"

using namespace std;

struct MapSt;
typedef struct MapSt* Map;

/// Proposito: crea un diccionario vacío.
/// O(1)
Map emptyM();

/// Proposito: devuelve el mago asociado a un nombre,
/// Si la clave no esta en el diccionario devuelve NULL.
/// O(log n), n es la cantidad de claves
Mago lookupM(string nombre, Map m);

/// Proposito: devuelve una lista con todas las claves.
/// O(n), n es la cantidad de claves
vector<string> domM(Map m);

/// Proposito: inserta una clave k en el diccionario asociada al valor v.
/// Si la clave ya estaba, sobreescribe su valor.
/// O(log n), n es la cantidad de claves
void assocM(string nombre, Mago mago, Map m);

/// Proposito: borra un mago dado un nombre.
/// No hace nada si el mago no se encuentra en el diccionario.
/// O(log n), n es la cantidad de claves
void deleteM(string nombre, Map m);

/// Proposito: libera toda la memoria usada por el diccionario (pero no a los magos)
/// O(n), n es la cantidad de claves
void destroyM(Map m);

// BEGIN IGNORAR
// Para debuggear el invariante.
bool checkBalanced(Map m);
// END

#endif

