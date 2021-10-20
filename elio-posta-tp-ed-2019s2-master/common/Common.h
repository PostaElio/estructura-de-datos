
#ifndef __COMMON_H__
#define __COMMON_H__

#include <ctime>
#include <cstdio>
#include <cstdlib>
#include <cassert>
#include <iostream>

using namespace std;

#define COMPLETAR(FUNCION) { \
    fprintf(stderr, "ERROR: Falta completar -- " #FUNCION ".\n"); \
    exit(1); \
}

#endif
