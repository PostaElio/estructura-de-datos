#include <iostream>

using namespace std;
// UN ARBOL SE RECORRE CON RECURSION
struct TNode {
    int elem;
    TNode* left;
    TNode* right;
};
typedef TNode* Tree;

// LA INTERFAZ ES FUNCIONAL
Tree emptyT();
bool isEmptyT(Tree t);
Tree leaf(int x); // crea una hoja
Tree branch(int x, Tree t1, Tree t2);
int root(Tree t);
Tree left(Tree t);
Tree right(Tree t);
void destroyT(Tree& t); // borra todo el arbol
