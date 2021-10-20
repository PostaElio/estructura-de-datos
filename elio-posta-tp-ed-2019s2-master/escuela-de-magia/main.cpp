#include <iostream>
#include <cstdlib>
#include <vector>
#include "../hechizo/hechizo.h"
#include "../mago/mago.h"
#include "../set/set.h"
#include "../map/map.h"
#include "../maxheap/maxheap.h"
#include "escuela_magia.h"
#include "../common/Common.h"
#include "test_escuela-de-magia.h"

using namespace std;

/// Proposito: Retorna todos los hechizos aprendidos por los magos.
/// Eficiencia: O(s . log h^2)
Set hechizosAprendidos(EscuelaDeMagia m) {
    vector<string> nombres = domM(trucosDeMagiaQueSabeUnMagoE(m));
    Set s = emptyS();
    for (std::size_t i = 0; i < nombres.size(); i++){
        Set hechizos = hechizosDe(nombres[i],m);
        unionS(s,hechizos);
    }
    return s;
}

/// Proposito: Indica si existe un mago que sabe todos los hechizos enseñados por la escuela.
/// Eficiencia: O(1)
bool hayUnExperto(EscuelaDeMagia m) {
    Mago mago = (maxH(magosRegistradosE(m)));
    return sizeS(hechizosMago(mago)) == sizeS(trucosDeMagiaE(m));
}

/// Proposito: Devuelve una maxheap con los magos que saben todos los hechizos dados por la escuela, quitándolos de la escuela.
/// Eficiencia: O(n . log n)
MaxHeap egresarExpertos(EscuelaDeMagia m) {
    MaxHeap sabiondos = emptyH();
    while(hayUnExperto(m)){
        Mago mago = (maxH(magosRegistradosE(m)));
        insertH(mago, sabiondos);
        quitarEgresado(m);
    }
    return sabiondos;
}

int main()
{
    /// Escribir algunas pruebas para las funciones de la interfaz
    /// de escuela de magia, y también las de usuario.
    // esta en el archivo test_escuela-de-magia.h  .
    correrTestEscuelaDeMagia();
return 0;
}
