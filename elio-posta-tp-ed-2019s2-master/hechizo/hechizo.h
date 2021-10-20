#ifndef HECHIZO_H
#define HECHIZO_H

#include <iostream>

using namespace std;

struct HechizoSt;
typedef HechizoSt* Hechizo;

/// Proposito: crea un hechizo dado un nombre y un poder
/// Costo: O(1)
Hechizo crearHechizo(string nombre, int poder);

/// Proposito: retorna el nombre del hechizo
/// Costo: O(1)
string nombreHechizo(Hechizo h);

/// Proposito: retorna el poder de un hechizo
/// Costo: O(1)
int poderHechizo(Hechizo h);

/// Proposito: indica si un hechizo tiene el mismo nombre que otro
/// Costo: O(1)
bool mismoHechizo(Hechizo h1, Hechizo h2);

/// Proposito: indica si el primer hechizo es mas poderoso que el otro
/// Costo: O(1)
bool masPoderoso(Hechizo h1, Hechizo h2);

/// Proposito: imprime un hechizo por pantalla
/// Costo: O(1)
void printHechizo(Hechizo h);

/// Proposito: libera la memoria
/// Costo: O(1)
void destroyHechizo(Hechizo h);

#endif
