#include "mago.h"
#include "../common/Common.h"

struct MagoSt {
   string nombre; // nombre del mago
   Set hechizos; // hechizos aprendidos
};

/// Proposito: crea un mago dado un nombre
/// Costo: O(1)
Mago crearMago(string nombre) {
    Mago m = new MagoSt;
    m->nombre = nombre;
    m->hechizos = emptyS();
    return m;
}

/// Proposito: retorna el nombre de un mago
/// Costo: O(1)
string nombreMago(Mago m) {
    return m->nombre;
}

/// Proposito: agrega un hechizo a un mago
/// Costo: O(h), siendo h la cantidad de hechizos que sabe
void aprenderHechizo(Hechizo h, Mago m) {
    addS(h,m->hechizos);
}

/// Proposito: devuelve la cantidad de hechizos
/// Costo: O(1)
Set hechizosMago(Mago m) {
    return m->hechizos;
}

/// Proposito: indica si ambos magos son el mismo (tienen el mismo nombre)
/// Costo: O(1)
bool mismoMago(Mago m1, Mago m2) {
   return nombreMago(m1) == nombreMago(m2);
}

/// Proposito: indica si el primer mago sabe mas hechizos que el segundo
/// Costo: O(1)
bool sabeMasMago(Mago m1, Mago m2) {
   return sizeS(hechizosMago(m1)) > sizeS(hechizosMago(m2));
}

/// Proposito: destruye toda la memoria de un mago, incluyendo el conjunto de hechizos
/// Costo: O(n)
void destroyMago(Mago m) {
   destroyS(m->hechizos);
   delete m;
}
