#ifndef MAGO_H
#define MAGO_H

#include <iostream>
#include "../hechizo/hechizo.h"
#include "../set/set.h"

using namespace std;

struct MagoSt;
typedef MagoSt* Mago;

/// Proposito: crea un mago dado un nombre
/// Costo: O(1)
Mago crearMago(string nombre);

/// Proposito: retorna el nombre de un mago
/// Costo: O(1)
string nombreMago(Mago m);

/// Proposito: agrega un hechizo a un mago
/// Costo: O(h), siendo h la cantidad de hechizos que sabe
void aprenderHechizo(Hechizo h, Mago m);

/// Proposito: devuelve la cantidad de hechizos
/// Costo: O(1)
Set hechizosMago(Mago m);

/// Proposito: indica si ambos magos son el mismo (tienen el mismo nombre)
/// Costo: O(1)
bool mismoMago(Mago m1, Mago m2);

/// Proposito: indica si el primer mago sabe mas hechizos que el segundo
/// Costo: O(1)
bool sabeMasMago(Mago m1, Mago m2);

/// Proposito: destruye toda la memoria de un mago, incluyendo el conjunto de hechizos
/// Costo: O(n)
void destroyMago(Mago m);

#endif
