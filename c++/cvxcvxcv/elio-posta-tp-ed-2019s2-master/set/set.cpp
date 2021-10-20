#include "set.h"
#include "../common/Common.h"

struct Node {
   Hechizo elem; // el elemento que este nodo almacena
   Node* next; // siguiente nodo de la cadena de punteros
};

struct SetSt {
   int size; // cantidad de elementos del conjunto
   Node* first; // puntero al primer elemento
};

typedef SetSt* Set;

/**
  Invariantes de representacion:
    - size es la cantidad de nodos
    - no hay nodos con hechizos repetidos
**/

/// Proposito: retorna un conjunto de hechizos vacio
/// Costo: O(1)
Set emptyS() {
    Set s = new SetSt;
    s->size = 0;
    s->first = NULL;
    return s;
}

/// Proposito: retorna la cantidad de hechizos
/// Costo: O(1)
int sizeS(Set s) {
    return s->size;
}

/// Proposito: indica si el hechizo pertenece al conjunto
/// Costo: O(h), h = cantidad de hechizos
bool belongsS(Hechizo h, Set s){
    bool res = false;
    Node* n = s->first;
    while (n != NULL || n->elem != h){
        res = res || n->elem == h;
        n = n->next;
    }
    return res;
}

/// Proposito: agrega un hechizo al conjunto
/// Costo: O(h), h = cantidad de hechizos
void agregarElemento(Hechizo h, Set s){
    Node* n = new Node;
    n->elem = h;
    n->next= s->first;
    s->first= n;
    s->size ++;
}

void addS(Hechizo h, Set s) {
    if (!(belongsS(h,s))){
        agregarElemento(h,s);
    }
}

/// Proposito: borra un hechizo del conjunto (si no existe no hace nada)
/// Costo: O(h), h = cantidad de hechizos

/*void eliminarHechizo(Hechizo h, Set s){
    Node* n = s->first;
    if (n->elem == h){
        Node* tmp = s->first;
        s->first = s->first->next;
        delete tmp;
    }else{
        while(not(n->next->elem == h)){
            n = n->next;
        }
        Node* tmpl = n->next;
        n->next = n->next->next;
        delete tmpl;
}}
*/


void eliminarHechizo(Hechizo h, Set s){
    Node* n = s->first;
    Node* newN = new Node;
    newN->elem = n->elem;
    newN->next = NULL;
    while(n!=NULL){
        if(n->elem == h){
            Node* tmp = n;
            n = n->next;
            delete tmp;
        }else{
            newN->next = n;
            n = n->next;
        }
    }
    s->first = newN;
}

void removeS(Hechizo h, Set s) {
    if(belongsS(h,s)){
      eliminarHechizo(h,s);
    }
}



/// Proposito: borra toda la memoria consumida por el conjunto (pero no la de los hechizos)
/// Costo: O(n)s
void destroyS(Set s) {
    delete s;
}

Set copiar(Set s){
    Set se = emptyS();
    Node* n = s-> first;
    while (n!= NULL){
        addS(n->elem,se);
        n = n->next;
    }
    return se;
}

/// Proposito: retorna un nuevo conjunto que es la union entre ambos (no modifica estos conjuntos)
/// Costo: O(h^2), h = cantidad de hechizos
Set unionS(Set s1, Set s2) {
    Set s3 = copiar(s1);
    Node* n = s2->first;
    while (not(n->next == NULL)){
        addS(n->elem, s3);
        n = n->next;
    }
    return s3;
}
