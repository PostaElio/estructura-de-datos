/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef gluPartialDisk
#endif

static void hugsprim_gluPartialDisk_11(HugsStackPtr);
static void hugsprim_gluPartialDisk_11(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsDouble arg2;
    HsDouble arg3;
    HsInt32 arg4;
    HsInt32 arg5;
    HsDouble arg6;
    HsDouble arg7;
    arg1 = hugs->getPtr();
    arg2 = hugs->getDouble();
    arg3 = hugs->getDouble();
    arg4 = hugs->getInt32();
    arg5 = hugs->getInt32();
    arg6 = hugs->getDouble();
    arg7 = hugs->getDouble();
    gluPartialDisk(arg1, arg2, arg3, arg4, arg5, arg6, arg7);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluDisk
#endif

static void hugsprim_gluDisk_10(HugsStackPtr);
static void hugsprim_gluDisk_10(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsDouble arg2;
    HsDouble arg3;
    HsInt32 arg4;
    HsInt32 arg5;
    arg1 = hugs->getPtr();
    arg2 = hugs->getDouble();
    arg3 = hugs->getDouble();
    arg4 = hugs->getInt32();
    arg5 = hugs->getInt32();
    gluDisk(arg1, arg2, arg3, arg4, arg5);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluCylinder
#endif

static void hugsprim_gluCylinder_9(HugsStackPtr);
static void hugsprim_gluCylinder_9(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsDouble arg2;
    HsDouble arg3;
    HsDouble arg4;
    HsInt32 arg5;
    HsInt32 arg6;
    arg1 = hugs->getPtr();
    arg2 = hugs->getDouble();
    arg3 = hugs->getDouble();
    arg4 = hugs->getDouble();
    arg5 = hugs->getInt32();
    arg6 = hugs->getInt32();
    gluCylinder(arg1, arg2, arg3, arg4, arg5, arg6);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluSphere
#endif

static void hugsprim_gluSphere_8(HugsStackPtr);
static void hugsprim_gluSphere_8(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsDouble arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    arg1 = hugs->getPtr();
    arg2 = hugs->getDouble();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    gluSphere(arg1, arg2, arg3, arg4);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluQuadricDrawStyle
#endif

static void hugsprim_gluQuadricDrawStyle_7(HugsStackPtr);
static void hugsprim_gluQuadricDrawStyle_7(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    gluQuadricDrawStyle(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluQuadricOrientation
#endif

static void hugsprim_gluQuadricOrientation_6(HugsStackPtr);
static void hugsprim_gluQuadricOrientation_6(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    gluQuadricOrientation(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluQuadricTexture
#endif

static void hugsprim_gluQuadricTexture_5(HugsStackPtr);
static void hugsprim_gluQuadricTexture_5(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord8 arg2;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord8();
    gluQuadricTexture(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluQuadricNormals
#endif

static void hugsprim_gluQuadricNormals_4(HugsStackPtr);
static void hugsprim_gluQuadricNormals_4(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    gluQuadricNormals(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluQuadricCallback
#endif

static void hugsprim_gluQuadricCallback_3(HugsStackPtr);
static void hugsprim_gluQuadricCallback_3(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsFunPtr arg3;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getFunPtr();
    gluQuadricCallback(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static void v7691(HugsStablePtr fun1, void* unusedArg, HsWord32 arg1);
static void v7691(HugsStablePtr fun1, void* unusedArg, HsWord32 arg1)
{
    hugs->derefStablePtr4(fun1);
    hugs->putWord32(arg1);
    if (hugs->runIO(1)) {
        exit(hugs->getInt());
    }
    hugs->getUnit();
    return;
}

static void hugsprim_v7691_2(HugsStackPtr);
static void hugsprim_v7691_2(HugsStackPtr hugs_root)
{
    HugsStablePtr arg1 = hugs->makeStablePtr4();
    void* thunk = hugs->mkThunk((HsFunPtr)v7691,arg1);
    hugs->putAddr(thunk);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluDeleteQuadric
#endif

static void hugsprim_gluDeleteQuadric_1(HugsStackPtr);
static void hugsprim_gluDeleteQuadric_1(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    arg1 = hugs->getPtr();
    gluDeleteQuadric(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluNewQuadric
#endif

static void hugsprim_gluNewQuadric_0(HugsStackPtr);
static void hugsprim_gluNewQuadric_0(HugsStackPtr hugs_root)
{
    HsPtr res1;
    res1 = gluNewQuadric();
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"gluPartialDisk", 8, hugsprim_gluPartialDisk_11},
    {"gluDisk", 6, hugsprim_gluDisk_10},
    {"gluCylinder", 7, hugsprim_gluCylinder_9},
    {"gluSphere", 5, hugsprim_gluSphere_8},
    {"gluQuadricDrawStyle", 3, hugsprim_gluQuadricDrawStyle_7},
    {"gluQuadricOrientation", 3, hugsprim_gluQuadricOrientation_6},
    {"gluQuadricTexture", 3, hugsprim_gluQuadricTexture_5},
    {"gluQuadricNormals", 3, hugsprim_gluQuadricNormals_4},
    {"gluQuadricCallback", 4, hugsprim_gluQuadricCallback_3},
    {"makeQuadricCallback", 2, hugsprim_v7691_2},
    {"gluDeleteQuadric", 2, hugsprim_gluDeleteQuadric_1},
    {"gluNewQuadric", 1, hugsprim_gluNewQuadric_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGQuadrics
#endif

static struct hugs_primInfo hugs_prims = { hugs_primControl, hugs_primTable, 0 };

#ifdef __cplusplus
extern "C" {
#endif
#ifndef __cplusplus
DLLEXPORT(int)  HugsAPIVersion(void);
#endif
DLLEXPORT(int)  HugsAPIVersion() {return (5);}
DLLEXPORT(void) initModule(HugsAPI5 *);
DLLEXPORT(void) initModule(HugsAPI5 *hugsAPI) {
    hugs = hugsAPI;
    hugs->registerPrims(&hugs_prims);
}
#ifdef __cplusplus
}
#endif

