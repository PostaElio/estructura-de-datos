#ifndef TEST_MAX_HEAP_H
#define TEST_MAX_HEAP_H

#include "maxheap.h"
#include "../hechizo/hechizo.h";
#include "../common/Test.h"

/***************************** Tests de Hechizo *****************************/

void aprenderN(Mago m, int n) {
   for (int i = 0; i < n; i++) {
      string nombre = "";
      nombre += (char) (33+i);
      aprenderHechizo(crearHechizo(nombre, 0), m);
   }
}

TEST(test_emptyM_not_NULL, {
   MaxHeap h = emptyH();
	ASSERT_EQ(emptyH() == NULL, false);
})

TEST(test_emptyM_isEmptyH, {
   MaxHeap h = emptyH();
	ASSERT_EQ(isEmptyH(h), true);
})

TEST(test_emptyM_sizeH_is_0, {
   MaxHeap h = emptyH();
	ASSERT_EQ(sizeH(h) == 0, true);
})

TEST(test_insertH_1_elem_not_isEmptyH, {
   MaxHeap h = emptyH();
   insertH(crearMago("harry"), h);
	ASSERT_EQ(isEmptyH(h), false);
})

TEST(test_insertH_1_sizeH_is_1, {
   MaxHeap h = emptyH();
   insertH(crearMago("harry"), h);
	ASSERT_EQ(sizeH(h) == 1, true);
})

TEST(test_insertH_1_elem_maxH_that_elem, {
   MaxHeap h = emptyH();
   Mago m = crearMago("harry");
   insertH(m, h);
	ASSERT_EQ(maxH(h) == m, true);
})

TEST(test_insertH_1000_equal_elems, {
   MaxHeap h = emptyH();
   Mago m = crearMago("harry");
   for(int i = 0; i < 1000; i++) {
      insertH(m, h);
      ASSERT_EQ(sizeH(h) == i+1, true);
   }
	ASSERT_EQ(maxH(h) == m, true);
})

TEST(test_insertH_1000_not_equal_elems, {
   MaxHeap h = emptyH();
   Mago m = crearMago("harry");
   insertH(m, h);
   for(int i = 1; i < 1000; i++) {
      insertH(crearMago("ron"), h);
      ASSERT_EQ(sizeH(h) == i+1, true);
   }
	ASSERT_EQ(maxH(h) == m, true);
})

TEST(test_insertH_2_checkHeap, {
   MaxHeap h = emptyH();
   for(int i = 0; i < 2; i++) {
      Mago m = crearMago("harry");
      aprenderN(m, i);
      insertH(m, h);
      ASSERT_EQ(checkHeap(h), true);
      ASSERT_EQ(maxH(h) == m, true);
   }
})

TEST(test_insertH_90_checkHeap, {
   MaxHeap h = emptyH();
   for(int i = 0; i < 90; i++) {
      Mago m = crearMago("harry");
      aprenderN(m, i);
      insertH(m, h);
      ASSERT_EQ(checkHeap(h), true);
      ASSERT_EQ(maxH(h) == m, true);
   }
})

TEST(test_deleteMax_1000_equal_elems_sizeH, {
   MaxHeap h = emptyH();
   Mago m = crearMago("harry");
   for(int i = 0; i < 1000; i++) {
      insertH(m, h);
   }
   for(int i = 999; i >= 0; i--) {
      deleteMax(h);
      ASSERT_EQ(sizeH(h) == i, true);
   }
})

TEST(test_deleteMax_90_checkHeap, {
   MaxHeap h = emptyH();
   Mago magos[90];

   for(int i = 0; i < 90; i++) {
      Mago m = crearMago("harry");
      aprenderN(m, i);
      magos[i] = m;
      insertH(m, h);
   }
   for(int i = 0; i < 90; i++) {
      ASSERT_EQ(maxH(h) == magos[89-i], true);
      deleteMax(h);
      ASSERT_EQ(checkHeap(h), true);
   }
})

TEST(test_destroyH, {
   MaxHeap h = emptyH();
   for(int i = 0; i < 90; i++) {
      Mago m = crearMago("harry");
      insertH(m, h);
   }
   destroyH(h);
})

void correrTestHeap() {
   test_emptyM_not_NULL();
   test_emptyM_isEmptyH();
   test_emptyM_sizeH_is_0();
   test_insertH_1_elem_not_isEmptyH();
   test_insertH_1_sizeH_is_1();
   test_insertH_1_elem_maxH_that_elem();
   test_insertH_1000_equal_elems();
   test_insertH_1000_not_equal_elems();
   test_insertH_2_checkHeap();
   test_insertH_90_checkHeap();
   test_deleteMax_1000_equal_elems_sizeH();
   test_deleteMax_90_checkHeap();
   test_destroyH();
}

#endif
