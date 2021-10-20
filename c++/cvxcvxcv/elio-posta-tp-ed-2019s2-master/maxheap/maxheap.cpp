#include "maxheap.h"
#include "../common/Common.h"

struct MaxHeapSt {
   Mago* elems;
   int arraySize; // capacidad del array
   int elemCount; // cantidad efectiva de elementos de la heap
};

/**
  Inv. Rep.:
  - El primer elemento del array es el máximo
  - elemCount < arraySize
**/

/**
  Observaciones:
  - El array representa un arbol completo
    donde en la raiz de cada subarbol es el maximo
    elemento de dicho subarbol
**/

/// Proposito: crea una heap vacía.
/// O(1)
MaxHeap emptyH() {
   MaxHeapSt* xs = new MaxHeapSt;
   xs->elems = new Mago[8];
   xs->arraySize = 8;
   xs->elemCount = 0;
   return xs;
}

/// Proposito: indica si la heap está vacía.
/// O(1)
bool isEmptyH(MaxHeap h) {
   return h->elemCount == 0;
}

/// Proposito: indica si la heap está vacía.
/// O(1)
int sizeH(MaxHeap h) {
   return h->elemCount;
}

/// Proposito: devuelve al mago que más hechizos sabe.
/// O(1)
Mago maxH(MaxHeap h) {
   return h->elems[0];
}

// Proposito: retorna el índice del hijo izquierdo
int leftChild(int i) {
   return (i*2)+1;
}

// Proposito: retorna el índice del hijo derecho
int rightChild(int i) {
   return (i*2)+2;
}

// Proposito: retorna el índice del padre desde hijo izquierdo
int parent(int i) {
   return (i % 2) == 0 ? (i-2)/2 : (i-1)/2;
}

// Proposito: agranda el array de elementos si es necesario
// O(1) amortizado
void checkAgrandar(MaxHeap h) {
   if (h->elemCount == h->arraySize) {
      // el nuevo tamaño si no habia array comienza con 16
      // y si habia array se duplica su tamaño
      int newArraySize = h->arraySize == 0 ? 16 : h->arraySize * 2;
      Mago* newElems = new Mago[newArraySize];
      for(int i = 0; i < h->arraySize; i++) {
         newElems[i] = h->elems[i];
      }
      delete[] h->elems;
      h->elems = newElems;
      h->arraySize = newArraySize;
   }
}

// Proposito: intercambia el contenido
// entre dos posiciones en el array
void intercambiar(Mago* elems, int x, int y) {
   Mago tmp = elems[x];
   elems[x] = elems[y];
   elems[y] = tmp;
}

// Proposito: indica si un indice cae fuera del array
bool caeFuera(int i, int elemCount) {
   return i >= elemCount;
}

// Proposito: intercambia un elemento con su padre si es necesario,
// dados el array de elementos y el indice del nodo actual
void flotar(Mago* elems, int i) {
   if(i == 0) return; // si es el primer elemento, no hay que hacer nada
   if(sabeMasMago(elems[i], elems[parent(i)])) {
      intercambiar(elems, parent(i), i);
      flotar(elems, parent(i));
   }
}

/// Proposito: inserta un mago en la heap.
/// O(log n)
void insertH(Mago m, MaxHeap h) {
    h->elems[h->elemCount] = m;
    flotar(h->elems,h->elemCount);
    checkAgrandar(h);
    h->elemCount++;
}



// Proposito: intercambia un elemento con alguno de sus hijos si es necesario,
// dados el array de elementos y el indice del nodo actual
void hundir(Mago* elems, int elemCount, int i) {
   if (caeFuera(i, elemCount) || caeFuera(leftChild(i), elemCount)) return;

   Mago mp = elems[i]; // obtengo el elemento actual
   Mago ml = elems[leftChild(i)]; // obtengo el hijo izquierdo

   // Si no hay hijo derecho solo comparo con el izquierdo
   if (caeFuera(rightChild(i), elemCount)) {
      if(sabeMasMago(ml, mp)) { // Si el hijo izquierdo sabe más que el actual
         intercambiar(elems, i, leftChild(i)); // Intercambio el contenido
         hundir(elems, elemCount, leftChild(i)); // Hago recursion hacia el hijo izquierdo
      }
   }

   // Ya puedo comparar entre los tres
   Mago mr = elems[rightChild(i)];
   if(sabeMasMago(ml, mp) && sabeMasMago(ml, mr)) {
      intercambiar(elems, leftChild(i), i);
      hundir(elems, elemCount, leftChild(i));
   }
   if (sabeMasMago(mr, mp) && sabeMasMago(mr, ml)) {
      intercambiar(elems, rightChild(i), i);
      hundir(elems, elemCount, rightChild(i));
   }
}

/// Proposito: borra al mago que más sabe.
/// O(log n)
void deleteMax(MaxHeap h) {
   if (h->elemCount == 0) return; // si esta vacia no hace nada


   int v = 1;
   /*
   MaxHeap xs = emptyH();
   while(v!= h->elemCount){
        insertH(h->elems[v],xs);
        v = v + 1;
   }
    insertH(h->elems[v],xs);
    h = xs;
*/
}


/// Proposito: borra la memoria consumida por la heap (no a los magos).
/// O(1)
void destroyH(MaxHeap h) {
    delete h->elems;
   delete h;
}

// BEGIN IGNORAR
// Para debuggear el invariante.
bool checkHeap(MaxHeap h) {
   for(int i = 0; i < h->elemCount; i++) {
      if(!caeFuera(leftChild(i), h->elemCount) && sabeMasMago(h->elems[leftChild(i)], h->elems[i])) {
         return false;
      }
      if(!caeFuera(rightChild(i), h->elemCount) && sabeMasMago(h->elems[rightChild(i)], h->elems[i])) {
         return false;
      }
   }
   return true;
}
// END
