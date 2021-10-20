#include "escuela_magia.h"
#include "../common/Common.h"

struct EscuelaDeMagiaSt {
   Set trucosDeMagia;
   Map trucosDeMagiaQueSabeUnMago;
   MaxHeap magosRegistrados;
};
typedef EscuelaDeMagiaSt* EscuelaDeMagia;


///Funciones auxiliares:

Set trucosDeMagiaE(EscuelaDeMagia m){
    return m->trucosDeMagia;
}

Map trucosDeMagiaQueSabeUnMagoE(EscuelaDeMagia m){
    return m->trucosDeMagiaQueSabeUnMago;
}

MaxHeap magosRegistradosE(EscuelaDeMagia m){
    return m->magosRegistrados;
}

/// Propósito: Devuelve una escuela vacía.
/// O(1)
EscuelaDeMagia fundarEscuela() {
    EscuelaDeMagia edm = new EscuelaDeMagiaSt;
    edm->magosRegistrados = emptyH();
    edm->trucosDeMagiaQueSabeUnMago = emptyM();
    edm->trucosDeMagia = emptyS();
    return edm;
}

/// Propósito: Indica si la escuela está vacía.
/// O(1)
bool estaVacia(EscuelaDeMagia m) {
   return isEmptyH(m->magosRegistrados);
}

/// Propósito: Incorpora un mago a la escuela (si ya existe no hace nada).
/// O(log m)
void registrar(string nombre, EscuelaDeMagia m) {
    if(lookupM(nombre,m->trucosDeMagiaQueSabeUnMago)== NULL){
        Mago mago = crearMago(nombre);
        insertH(mago,m->magosRegistrados);
        assocM(nombre,mago,m->trucosDeMagiaQueSabeUnMago);
    }
}

/// Propósito: Devuelve los nombres de los magos registrados en la escuela.
/// O(m)
vector<string> magos(EscuelaDeMagia m) {
   return domM(m->trucosDeMagiaQueSabeUnMago);
}

/// Propósito: Devuelve los hechizos que conoce un mago dado.
/// Precondición: Existe un mago con dicho nombre.
/// O(log m)
Set hechizosDe(string nombre, EscuelaDeMagia m) {
   lookupM(nombre,m->trucosDeMagiaQueSabeUnMago);
}

/// Propósito: Dado un mago, indica la cantidad de hechizos que la escuela ha dado y él no sabe.
/// Precondición: Existe un mago con dicho nombre.
/// O(log m)
int leFaltanAprender(string nombre, EscuelaDeMagia m) {
    return (sizeS(m->trucosDeMagia) - sizeS(hechizosDe(nombre,m)));
}

/// Propósito: Devuelve el mago que más hechizos sabe.
/// Precondición: La escuela no está vacía.
/// O(log m)
Mago unEgresado(EscuelaDeMagia m) {
    Mago mago = maxH(m->magosRegistrados);
    return lookupM(nombreMago(mago),m->trucosDeMagiaQueSabeUnMago);
}

/// Propósito: Devuelve la escuela sin el mago que más sabe.
/// Precondición: La escuela no está vacía.
/// O(log m)
void quitarEgresado(EscuelaDeMagia m) {
    Mago mago = maxH(m->magosRegistrados);
    deleteMax(m->magosRegistrados);
    deleteM(nombreMago(mago), m->trucosDeMagiaQueSabeUnMago);
}

/// Propósito: Enseña un hechizo a un mago existente, y si el hechizo no existe en la escuela es incorporado a la misma.
/// O(m . log m + log h)
void enseniar(Hechizo h, string nombre, EscuelaDeMagia m) {
    Mago mago = lookupM(nombre, m->trucosDeMagiaQueSabeUnMago);
    addS(h, hechizosMago(mago));
    assocM(nombre,mago,m->trucosDeMagiaQueSabeUnMago);
    insertH(mago,m->magosRegistrados);
    addS(h,m->trucosDeMagia);
}

/// Propósito: Libera toda la memoria creada por la escuela (incluye magos, pero no hechizos).
void destruirEscuela(EscuelaDeMagia m) {
   destroyM(m->trucosDeMagiaQueSabeUnMago);
   destroyH(m->magosRegistrados);
   delete m;
}