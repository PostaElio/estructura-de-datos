#ifndef TEST_MAP_H
#define TEST_MAP_H

#include "map.h"
#include "../common/Test.h"

/***************************** Tests de Hechizo *****************************/

TEST(test_emptyM, {
   Map m = emptyM();
	ASSERT_EQ(emptyM() == NULL, false);
})

TEST(test_lookupM_in_emptyM, {
   Map m = emptyM();
	ASSERT_EQ(lookupM("harry", m) == NULL, true);
})

TEST(test_assocM_1_elem, {
   Map m = emptyM();
   assocM("harry", crearMago("harry"), m);
	ASSERT_EQ(lookupM("harry", m) != NULL, true);
	ASSERT_EQ(mismoMago(crearMago("harry"), lookupM("harry", m)), true);
})

TEST(test_assocM_2_elem_replace, {
   Map m = emptyM();
   assocM("harry", crearMago("harry 1"), m);
   assocM("harry", crearMago("harry 2"), m);
	ASSERT_EQ(mismoMago(crearMago("harry 2"), lookupM("harry", m)), true);
})

TEST(test_assocM_90_lookupM_those_90, {
   Map m = emptyM();
   for (int i = 0; i < 90; i++) {
      string nombre = "mago ";
      nombre += (char) (33+i);
      Mago mago = crearMago(nombre);
      assocM(nombre, mago, m);
      ASSERT_EQ(mismoMago(mago, lookupM(nombre, m)), true);
   }
})

TEST(test_assocM_90_remains_balanced_simpleLeftRotation, {
   Map m = emptyM();
   for (int i = 0; i < 90; i++) {
      string nombre = "";
      Mago mago = crearMago(nombre);
      assocM(nombre, mago, m);
      ASSERT_EQ(checkBalanced(m), true);
   }
})

TEST(test_assocM_90_remains_balanced_simpleRightRotation, {
   Map m = emptyM();
   for (int i = 122; i > 32; i--) {
      string nombre = "";
      nombre += (char) i;
      Mago mago = crearMago(nombre);
      assocM(nombre, mago, m);
      ASSERT_EQ(checkBalanced(m), true);
   }
})

TEST(test_assocM_90_remains_balanced_dobleLeftRotations, {
   Map m = emptyM();
   for (int i = 0; i < 90; i++) {
      string nombre = "";
      nombre += (char) (i % 2 ? 33+i+2 : 33+i);
      Mago mago = crearMago(nombre);
      assocM(nombre, mago, m);
      ASSERT_EQ(checkBalanced(m), true);
   }
})

TEST(test_assocM_90_remains_balanced_dobleRightRotations, {
   Map m = emptyM();
   for (int i = 122; i > 32; i--) {
      string nombre = "";
      nombre += (char) (i % 2 ? i : i+2);
      Mago mago = crearMago(nombre);
      assocM(nombre, mago, m);
      ASSERT_EQ(checkBalanced(m), true);
   }
})

void correrTestMap() {
   test_emptyM();
   test_lookupM_in_emptyM();
   test_assocM_1_elem();
   test_assocM_2_elem_replace();
   test_assocM_90_lookupM_those_90();
   test_assocM_90_remains_balanced_simpleLeftRotation();
   test_assocM_90_remains_balanced_simpleRightRotation();
   test_assocM_90_remains_balanced_dobleLeftRotations();
   test_assocM_90_remains_balanced_dobleRightRotations();
}

#endif


