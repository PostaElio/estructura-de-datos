
#ifndef TEST_H
#define TEST_H

#include "escuela_magia.h"
#include "../common/Test.h"


TEST(test_emptyEDM, {
    EscuelaDeMagia edm = fundarEscuela();
	ASSERT_EQ(estaVacia(edm), true);
})

TEST(test_registrarEDM, {
    EscuelaDeMagia edm = fundarEscuela();
    registrar("Harry",edm);
    ASSERT_EQ(magosRegistradosE(edm) != emptyH(), true);
})

TEST(test_hechizosDeUnMago, {
    EscuelaDeMagia edm = fundarEscuela();
    registrar("Harry",edm);
    ASSERT_EQ(hechizosDe("Harry", edm), emptyS());
})

TEST(test_unEgresado, {
    EscuelaDeMagia edm = fundarEscuela();
    registrar("Harry",edm);
    Mago mago = crearMago("Harry");
    ASSERT_EQ(mismoMago(unEgresado(edm), mago), true);
})



TEST(test_hechizosAprendidos, {
    EscuelaDeMagia edm = fundarEscuela();
    registrar("Harry",edm);
    Hechizo h1 = crearHechizo("alguna", 1);
    Hechizo h2 = crearHechizo("cosa", 2);
    enseniar(h1,"Harry", edm);
    enseniar(h2,"Harry", edm);
    ASSERT_EQ(sizeS(hechizosAprendidos(edm)), 2)
})

TEST(test_hayUnExperto, {
    EscuelaDeMagia edm = fundarEscuela();
    registrar("Harry",edm);
    Hechizo h1 = crearHechizo("alguna", 1);
    Hechizo h2 = crearHechizo("QWERTY", 2);
    enseniar(h1,"Harry", edm);
    enseniar(h2,"Harry", edm);
    registrar("MyName",edm);
    Hechizo h3 = crearHechizo("cosa", 2);
    Hechizo h4 = crearHechizo("poderoso", 3);
    enseniar(h1,"MyName", edm);
    enseniar(h3,"MyName", edm);
    enseniar(h4,"MyName", edm);
    ASSERT_EQ(hayUnExperto(edm), false)
})

TEST(test_egresarExpertos, {
    EscuelaDeMagia edm = fundarEscuela();
    Hechizo h1 = crearHechizo("alguna", 1);
    Hechizo h2 = crearHechizo("QWERTY", 2);
    Hechizo h3 = crearHechizo("cosa", 3);
    Hechizo h4 = crearHechizo("poderoso", 4);
    registrar("Harry",edm);
    enseniar(h1,"Harry", edm);
    enseniar(h2,"Harry", edm);
    enseniar(h3,"Harry", edm);
    enseniar(h4,"Harry", edm);
    registrar("MyName",edm);
    enseniar(h1,"MyName", edm);
    enseniar(h2,"MyName", edm);
    enseniar(h3,"MyName", edm);
    enseniar(h4,"MyName", edm);
    ASSERT_EQ(sizeH(egresarExpertos(edm)), 2)
})

void correrTestEscuelaDeMagia(){
    test_emptyEDM();
    test_registrarEDM();
    test_hechizosDeUnMago();
    test_unEgresado();
    test_hechizosAprendidos();
    test_hayUnExperto();
    test_egresarExpertos();
}

#endif
