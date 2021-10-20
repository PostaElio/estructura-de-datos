#ifndef MAXHEAP_H
#define MAXHEAP_H

#include <iostream>
#include "../mago/mago.h"

using namespace std;

struct MaxHeapSt;
typedef MaxHeapSt* MaxHeap;

/// Proposito: crea una heap vacía.
/// O(1)
MaxHeap emptyH();

/// Proposito: indica si la heap está vacía.
/// O(1)
bool isEmptyH(MaxHeap h);

/// Proposito: devuelve la cantidad de magos.
/// O(1)
int sizeH(MaxHeap h);

/// Proposito: devuelve al mago que más hechizos sabe.
/// O(1)
Mago maxH(MaxHeap h);

/// Proposito: inserta un mago en la heap.
/// O(log n)
void insertH(Mago m, MaxHeap h);


/// Proposito: borra al mago que más sabe.
/// O(log n)
void deleteMax(MaxHeap h);

/// Proposito: borra la memoria consumida por la heap (no a los magos).
/// O(1)
void destroyH(MaxHeap h);

// BEGIN IGNORAR
// Para debuggear el invariante.
bool checkHeap(MaxHeap h);
// END

#endif

