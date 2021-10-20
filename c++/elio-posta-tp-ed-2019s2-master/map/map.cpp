#include "map.h"
#include "../common/Common.h"

struct BSTNode {
   string key;
   Mago value;
   int height;
   BSTNode* left;
   BSTNode* right;
};

struct MapSt {
   BSTNode* root;
};

/// Proposito: crea un diccionario vac�o.
/// O(1)
Map emptyM() {
   MapSt* m = new MapSt;
   m->root = NULL;
   return m;
}


/// Proposito: devuelve el mago asociado a un nombre,
/// Si la clave no esta en el diccionario devuelve NULL.
/// O(log n), n es la cantidad de claves
Mago lookupBST(string nombre, BSTNode* node) {
    BSTNode* actual = node;
    while(actual!=NULL){
        if(actual->key==nombre){
            return actual->value;
        }else if(actual->key > nombre){
            actual = actual->left;
        }else{
            actual = actual->right;
        }
    return NULL;
    }
}

/// Proposito: Devuelve el mago asociado a un nombre,
/// Si la clave no esta en el diccionario devuelve NULL.
/// O(log n), n es la cantidad de claves
Mago lookupM(string nombre, Map m) {
   return lookupBST(nombre, m->root);
}

/// Proposito: Agrega
/// O(n), n es la cantidad de claves
void collectDom(vector<string> result, BSTNode* node) {
   if (node == NULL) return;
   result.push_back(node->key);
   collectDom(result, node->left);
   collectDom(result, node->right);
}

/// Proposito: devuelve una lista con todas las claves.
/// O(n), n es la cantidad de claves
vector<string> domM(Map m) {
   vector<string> result;
   collectDom(result, m->root);
   return result;
}

// Devuelve la altura almacenada en el nodo
int getHeight(BSTNode* node) {
   if (node == NULL) return 0;
   return node->height;
}

// Actualiza la altura guardada en el nodo
void updateHeight(BSTNode* node) {
   if (node == NULL) return;
   node->height = 1 + max(getHeight(node->left), getHeight(node->right));
}

/// Crea un nuevo nodo
BSTNode* newNode(string nombre, Mago mago) {
   BSTNode* n = new BSTNode;
   n->key = nombre;
   n->value = mago;
   n->height = 1;
   n->left = NULL;
   n->right = NULL;
   return n;
}

/// Intercambia el contenido entre dos nodos
/// O(1)
void swapContents(BSTNode* node1, BSTNode* node2) {
    string tk = node1->key;
    Mago tv = node1->value;
    node1->key = node2->key;
    node1->value = node2->value;
    node2->key = tk;
    node2->value = tv;
}

/// Rotacion simple a izquierda
/// O(1)
void simpleRotateLeft(BSTNode* node) {
   BSTNode* x = node;
   BSTNode* t1 = node->left;
   BSTNode* z = node->right;
   BSTNode* t23 = node->right->left;
   BSTNode* t4 = node->right->right;
   swapContents(x, z);
   BSTNode* newZ = x;
   BSTNode* newX = z;
   newZ->left = newX;
   newZ->right = t4;
   newX->left = t1;
   newX->right = t23;
   updateHeight(newX);
   updateHeight(newZ);
}

/// Rotacion simple a derecha
/// O(1)
void simpleRotateRight(BSTNode* node) {
   BSTNode* x = node;
   BSTNode* t1 = node->right;
   BSTNode* z = node->left;
   BSTNode* t23 = node->left->right;
   BSTNode* t4 = node->left->left;
   swapContents(x, z);
   BSTNode* newZ = x;
   BSTNode* newX = z;
   newZ->left = t4;
   newZ->right = newX;
   newX->left = t23;
   newX->right = t1;
   updateHeight(newX);
   updateHeight(newZ);
}

/// Rotacion doble a izquierda
/// O(1)
void doubleRotateLeft(BSTNode* node) {
   simpleRotateRight(node->right);
   simpleRotateLeft(node);
}

/// Rotacion doble a derecha
/// O(1)
void doubleRotateRight(BSTNode* node) {
   simpleRotateLeft(node->left);
   simpleRotateRight(node);
}

/// Modifica un arbol destructivamente con una rotacion izquierda
/// O(1)
void rotateLeft(BSTNode* node) {
   if(getHeight(node->right->right) > getHeight(node->right->left)) {
      simpleRotateLeft(node);
   } else {
      doubleRotateLeft(node);
   }
}

/// Modifica un arbol destructivamente con una rotacion derecha
/// O(1)
void rotateRight(BSTNode* node) {
   if(getHeight(node->left->left) > getHeight(node->left->right)) {
      simpleRotateRight(node);
   } else {
      doubleRotateRight(node);
   }
}

/// Indica si el arbol esta balanceado
/// O(1)
bool isBalanced(BSTNode* node) {
   return node == NULL || abs(getHeight(node->left) - getHeight(node->right)) <= 1;
}

/// Proposito: realiza rotaciones en caso de ser necesario
/// O(1)
void checkIfRotate(BSTNode* node) {
   updateHeight(node);
   if (isBalanced(node)) return;
   if (getHeight(node->right) > getHeight(node->left)) {
      rotateLeft(node);
   } else {
      rotateRight(node);
   }
}

/// Proposito: inserta un elemento en el arbol.
/// Si la clave ya estaba, sobreescribe su valor.
/// Observar que retorna el nodo modificado, dado que
/// puede haber cambiado.
/// O(log n), n es la cantidad de claves
BSTNode* insertBST(string nombre, Mago mago, BSTNode* node) {
   if (node == NULL) return newNode(nombre, mago);
   if (node->key == nombre) {
        node->value = mago;
   }
   if (nombre < node->key) {
      node = node->left;
   } else {
      node = node->right;
   }
   checkIfRotate(node);
   return node;
}


/// Proposito: inserta una clave k en el diccionario asociada al valor v.
/// Si la clave ya estaba, sobreescribe su valor.
/// O(log n), n es la cantidad de claves
void assocM(string nombre, Mago mago, Map m) {
   m->root = insertBST(nombre, mago, m->root);
}

BSTNode* splitMax(BSTNode* node, string& k, Mago& v) {
   if (node->right == NULL) {
      k = node->key;
      v = node->value;
      BSTNode* left = node->left;
      delete node;
      return left;
   } else {
      node->right = splitMax(node->right, k, v);
      return node;
   }
}

BSTNode* removeRoot(BSTNode* node) {
   if (node->left == NULL) {
      BSTNode* tmp = node->right;
      delete node;
      return tmp;
   } else {
      node->left = splitMax(node->left, node->key, node->value);
      return node;
   }
}

/// Proposito: borra un nodo a partir de una clave dada
BSTNode* removeNode(BSTNode* node, string nombre) {
    if (node == NULL) {
        return NULL;
    } else if (node->key == nombre) {
        return removeRoot(node);
    } else if (nombre < node->key) {
        node->left = removeNode(node->left, nombre);
    } else {
        node->right = removeNode(node->right, nombre);
    }
    checkIfRotate(node);
    return node;
}

/// Proposito: borra un mago dado un nombre.
/// No hace nada si el mago no se encuentra en el diccionario.
/// O(log n), n es la cantidad de claves
void deleteM(string nombre, Map m) {
   m->root = removeNode(m->root, nombre);
}

void destroyNode(BSTNode* node) {
    while(node!=NULL){
        destroyNode(node->left);
        destroyNode(node->right);
        delete node;
    }
}

/// Proposito: libera toda la memoria usada por el diccionario (pero no a los magos)
/// O(n), n es la cantidad de claves
void destroyM(Map m) {
   destroyNode(m->root);
   delete m;
}

// BEGIN IGNORAR
// Para debuggear el invariante.
int heightBST(BSTNode* node) {
   if (node == NULL) return 0;
   return 1 + max(heightBST(node->left), heightBST(node->right));
}

bool checkBalancedBST(BSTNode* node) {
   return node == NULL
     || abs(heightBST(node->left) - heightBST(node->right)) <= 1
        && checkBalancedBST(node->left)
        && checkBalancedBST(node->right);
}

bool checkBalanced(Map m) {
   return checkBalancedBST(m->root);
}
// END
