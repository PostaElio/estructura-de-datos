#include "escuela_magia.h"
#include "../common/Common.h"

struct EscuelaDeMagiaSt {
   Set* trucosDeMagia;
   Map* trucosDeMagiaQueSabeUnMago;
   MaxHeap* magosRegistrados;
};
typedef EscuelaDeMagiaSt* EscuelaDeMagia;

Set hechizosAprendidosEDM(EscuelaDeMagia m) {
   Set s = emptyS();
   MaxHeap* mh = m->magosRegistrados;
   MaxHeap nuevo = emptyH();
   while(!isEmptyH(mh)){
        Mago mago = maxH(mh);
        nuevo = insertH(mago,nuevo);
        Set hechizos = hechizosMago(mago);
        s = unionS(s,hechizos);
        deleteMax(mh);
   }
   m->magosRegistrados = nuevo;
   return s;
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
   return isEmptyH(m->MagosRegistrados);
}

/// Propósito: Incorpora un mago a la escuela (si ya existe no hace nada).
/// O(log m)
void registrar(string nombre, EscuelaDeMagia m) {
    if(lookupM(nombre,m->TrucosDeMagiaQueSabeUnMago)== NULL){
        Mago mago = crearMago(nombre);
        insertH(m->MagosRegistrados);
        assocM(nombre,mago,m);
    }
}

/// Propósito: Devuelve los nombres de los magos registrados en la escuela.
/// O(m)
vector<string> magos(EscuelaDeMagia m) {
   return domM(m->TrucosDeMagiaQueSabeUnMago);
}

/// Propósito: Devuelve los hechizos que conoce un mago dado.
/// Precondición: Existe un mago con dicho nombre.
/// O(log m)
Set hechizosDe(string nombre, EscuelaDeMagia m) {
   lookupM(nombre,m->TrucosDeMagiaQueSabeUnMago);
}

/// Propósito: Dado un mago, indica la cantidad de hechizos que la escuela ha dado y él no sabe.
/// Precondición: Existe un mago con dicho nombre.
/// O(log m)
int leFaltanAprender(string nombre, EscuelaDeMagia m) {
    Mago mago = lookupM(nombre,m->TrucosDeMagiaQueSabeUnMago);
    return (sizeH(m->TrucosDeMagia) - sizeH(mago->hechizos))
}

/// Propósito: Devuelve el mago que más hechizos sabe.
/// Precondición: La escuela no está vacía.
/// O(log m)
Mago unEgresado(EscuelaDeMagia m) {
    Mago mago = maxH(m->MagosRegistrados);
    return lookupM(mago->nombre,m->TrucosDeMagiaQueSabeUnMago);
}

/// Propósito: Devuelve la escuela sin el mago que más sabe.
/// Precondición: La escuela no está vacía.
/// O(log m)
void quitarEgresado(EscuelaDeMagia m) {
    Mago mago = maxH(m->MagosRegistrados);
    deleteMax(m->MagosRegistrados);
    deleteM(mago->nombre, m->TrucosDeMagiaQueSabeUnMago);
}

/// Propósito: Enseña un hechizo a un mago existente, y si el hechizo no existe en la escuela es incorporado a la misma.
/// O(m . log m + log h)
void enseniar(Hechizo h, string nombre, EscuelaDeMagia m) {
    Mago mago = lookupM(nombre, m->TrucosDeMagiaQueSabeUnMago);
    addS(h, mago->hechizos);
    assocM(nombre,mago,m->TrucosDeMagiaQueSabeUnMago);
    insertH(mago,m->MagosRegistrados);
    addS(h,m->TrucosDeMagia);
}

/// Propósito: Libera toda la memoria creada por la escuela (incluye magos, pero no hechizos).
void destruirEscuela(EscuelaDeMagia m) {
   destroyM(m->TrucosDeMagiaQueSabeUnMago);
   destroyH(m->MagosRegistrados);
   delete m;
}


