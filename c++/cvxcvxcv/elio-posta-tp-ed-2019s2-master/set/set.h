#ifndef SET_H
#define SET_H

#include "../hechizo/hechizo.h"

struct SetSt;
typedef SetSt* Set;

/// Proposito: retorna un conjunto de hechizos vacio
/// Costo: O(1)
Set emptyS();

/// Proposito: retorna la cantidad de hechizos
/// Costo: O(1)
int sizeS(Set s);

/// Proposito: indica si el hechizo pertenece al conjunto
/// Costo: O(h), h = cantidad de hechizos
bool belongsS(Hechizo h, Set s);

/// Proposito: agrega un hechizo al conjunto
/// Costo: O(h), h = cantidad de hechizos
void addS(Hechizo h, Set s);

/// Proposito: borra un hechizo del conjunto (si no existe no hace nada)
/// Costo: O(h), h = cantidad de hechizos
void removeS(Hechizo h, Set s);

/// Proposito: retorna un nuevo conjunto que es la union entre ambos (no modifica estos conjuntos)
/// Costo: O(h^2), h = cantidad de hechizos
Set unionS(Set s1, Set s2);

/// Proposito: borra toda la memoria consumida por el conjunto (pero no la de los hechizos)
/// Costo: O(n)
void destroyS(Set s);

#endif
