#ifndef TEST_HECHIZO_H
#define TEST_HECHIZO_H

#include "hechizo.h"
#include "../common/Test.h"

/***************************** Tests de Hechizo *****************************/

TEST(test_crearHechizo_nombre_y_poder, {
   Hechizo h1 = crearHechizo("flipendo", 1);
	ASSERT_EQ(nombreHechizo(h1), "flipendo");
	ASSERT_EQ(poderHechizo(h1), 1);
	destroyHechizo(h1);

   Hechizo h2 = crearHechizo("expectro patronum", 100);
	ASSERT_EQ(nombreHechizo(h2), "expectro patronum");
	ASSERT_EQ(poderHechizo(h2), 100);
})

TEST(test_mismoHechizo, {
   Hechizo h1 = crearHechizo("flipendo", 1);
	ASSERT_EQ(mismoHechizo(h1, h1), true);
   Hechizo h2 = crearHechizo("flipendo", 2);
	ASSERT_EQ(mismoHechizo(h1, h2), true);
	ASSERT_EQ(mismoHechizo(h2, h1), true);
	ASSERT_EQ(mismoHechizo(h2, h2), true);
	Hechizo h3 = crearHechizo("leviosa", 1);
	ASSERT_EQ(mismoHechizo(h1, h3), false);
	ASSERT_EQ(mismoHechizo(h3, h1), false);
})

TEST(test_masPoderoso, {
   Hechizo h1 = crearHechizo("flipendo", 1);
	ASSERT_EQ(masPoderoso(h1, h1), false);
   Hechizo h2 = crearHechizo("leviosa", 2);
	ASSERT_EQ(masPoderoso(h1, h2), false);
	ASSERT_EQ(masPoderoso(h2, h1), true);
	ASSERT_EQ(masPoderoso(h2, h2), false);
})

void correrTestHechizo() {
   test_crearHechizo_nombre_y_poder();
   test_mismoHechizo();
   test_masPoderoso();
}

#endif
