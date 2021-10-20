#ifndef TEST_SET_H
#define TEST_SET_H

#include "set.h"
#include "../common/Test.h"

/***************************** Tests de Hechizo *****************************/

TEST(test_emptyS, {
   Set s = emptyS();
	ASSERT_EQ(emptyS() == NULL, false);
})

TEST(test_sizeS_emptyS, {
	ASSERT_EQ(sizeS(emptyS()), 0);
})

TEST(test_belongsS_emptyS, {
	ASSERT_EQ(belongsS(crearHechizo("flipendo", 10), emptyS()), false);
})

TEST(test_addS_1_elem_belongsS_that_elem, {
   Hechizo h = crearHechizo("flipendo", 10);
   Set s = emptyS();
   addS(h, s);
	ASSERT_EQ(sizeS(s), 1);
	ASSERT_EQ(belongsS(h, s), true);
})

TEST(test_addS_same_elem_twice_sizeS_1, {
   Hechizo h = crearHechizo("flipendo", 10);
   Set s = emptyS();
   addS(h, s);
   addS(h, s);
	ASSERT_EQ(sizeS(s), 1);
	ASSERT_EQ(belongsS(h, s), true);
})

TEST(test_removeS_when_emptyS_do_nothing, {
   Hechizo h = crearHechizo("flipendo", 10);
   Set s = emptyS();
	removeS(h, s);
	ASSERT_EQ(sizeS(s), 0);
	ASSERT_EQ(belongsS(h, s), false);
})

TEST(test_removeS_1_elem, {
   Hechizo h = crearHechizo("flipendo", 10);
   Set s = emptyS();
   addS(h, s);
	removeS(h, s);
	ASSERT_EQ(sizeS(s), 0);
	ASSERT_EQ(belongsS(h, s), false);
})

TEST(test_addS_90_belongsS_those_90, {
   Set s = emptyS();
   for (int i = 0; i <= 90; i++) {
      string name = "hechizo ";
      name += (char) (33+i);
      Hechizo h = crearHechizo(name, i);
      addS(h, s);
      ASSERT_EQ(sizeS(s), i+1);
   }
})

TEST(test_addS_90_removeS_90_not_belongsS_those_90, {
   Hechizo hechizos[90];
   Set s = emptyS();
   for (int i = 0; i <= 90; i++) {
      string name = "hechizo ";
      name += (char) (33+i);
      Hechizo h = crearHechizo(name, i);
      hechizos[i] = h;
      addS(h, s);
   }
   for (int i = 0; i <= 90; i++) {
      removeS(hechizos[i], s);
      ASSERT_EQ(sizeS(s), 90-i);
   }
})

TEST(test_destroyS_when_emptyS, {
   Hechizo h = crearHechizo("flipendo", 10);
   Set s = emptyS();
   destroyS(s);
})

TEST(test_destroyS_with_1_elem, {
   Hechizo h = crearHechizo("flipendo", 10);
   Set s = emptyS();
   addS(h, s);
   destroyS(s);
})

TEST(test_destroyS_90_elems, {
   Set s = emptyS();
   for (int i = 0; i < 90; i++) {
      string name = "hechizo ";
      name += (char) (33+i);
      Hechizo h = crearHechizo(name, i);
      addS(h, s);
   }
   destroyS(s);
})

TEST(test_unionS_between_emptyS, {
   ASSERT_EQ(sizeS(unionS(emptyS(), emptyS())), 0);
})

TEST(test_unionS_90_elems_to_emptyS, {
   Set s1 = emptyS();
   for (int i = 0; i < 90; i++) {
      string name = "hechizo ";
      name += (char) (33+i);
      Hechizo h = crearHechizo(name, i);
      addS(h, s1);
   }
   ASSERT_EQ(sizeS(unionS(s1, emptyS())), 90);
   ASSERT_EQ(sizeS(unionS(emptyS(), s1)), 90);
})

TEST(test_unionS_between_different_sets_45_elems_each, {
   Set s1 = emptyS();
   Set s2 = emptyS();
   for (int i = 0; i < 45; i++) {
      string name = "hechizo ";
      name += (char) (33+i);
      Hechizo h = crearHechizo(name, i);
      addS(h, s1);
   }
   for (int i = 45; i < 90; i++) {
      string name = "hechizo ";
      name += (char) (33+i);
      Hechizo h = crearHechizo(name, i);
      addS(h, s2);
   }
   ASSERT_EQ(sizeS(unionS(s1, s2)), 90);
})

TEST(test_unionS_between_equal_sets_90_elems_each, {
   Set s1 = emptyS();
   Set s2 = emptyS();
   for (int i = 0; i < 90; i++) {
      string name = "hechizo ";
      name += (char) (33+i);
      Hechizo h = crearHechizo(name, i);
      addS(h, s1);
   }
   for (int i = 0; i < 90; i++) {
      string name = "hechizo ";
      name += (char) (33+i);
      Hechizo h = crearHechizo(name, i);
      addS(h, s2);
   }
   ASSERT_EQ(sizeS(unionS(s1, s2)), 90);
   ASSERT_EQ(sizeS(unionS(s1, s1)), 90);
   ASSERT_EQ(sizeS(unionS(s2, s2)), 90);
})

void correrTestSet() {
   test_emptyS();
   test_sizeS_emptyS();
   test_belongsS_emptyS();
   test_addS_1_elem_belongsS_that_elem();
   test_addS_same_elem_twice_sizeS_1();
   test_removeS_when_emptyS_do_nothing();
   test_removeS_1_elem();
   test_addS_90_belongsS_those_90();
   test_addS_90_removeS_90_not_belongsS_those_90();
   test_destroyS_when_emptyS();
   test_destroyS_with_1_elem();
   test_destroyS_90_elems();
   test_unionS_between_emptyS();
   test_unionS_90_elems_to_emptyS();
   test_unionS_between_different_sets_45_elems_each();
   test_unionS_between_equal_sets_90_elems_each();
}

#endif

