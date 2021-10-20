#ifndef TEST_H
#define TEST_H

#include <iostream>
#include <string>
#include <cstdlib>
#include <vector>

using namespace std;

#define TEST(NOMBRE, CUERPO) \
	void NOMBRE() { \
		string test = #NOMBRE; \
		cout << "[ TEST   ] " << test << endl; \
		{ CUERPO } \
		cout << "[     OK ] " << test << endl; \
	}

#define ASSERT_EQ(EXPR, EXPECTED) { \
	__typeof__(EXPECTED) expected = (EXPECTED); \
	__typeof__(EXPR) obtained = (EXPR); \
	if (expected != obtained) { \
		cout << "[    MAL ] " << test << endl; \
		cout << endl; \
		cout << "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" << endl; \
		cout << "FALLA EL TEST \"" << test << "\"" << endl; \
		cout << "Al evaluar:" << endl; \
		cout << "    " << #EXPR << endl; \
		cout << "Se esperaba obtener el valor:" << endl; \
		cout << "    " << expected << endl; \
		cout << "Pero se obtuvo:" << endl; \
		cout << "    " << obtained << endl; \
		cout << "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" << endl; \
		exit(1); \
	} \
}

#endif
