/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

static void hugsprim_v7850_6(HugsStackPtr);
static void hugsprim_v7850_6(HugsStackPtr hugs_root)
{
    HsInt32 (*v7850)(HsDouble arg1, HsDouble arg2, HsDouble arg3, HsDouble arg4, HsPtr arg5, HsPtr arg6, HsPtr arg7, HsDouble arg8, HsDouble arg9, HsPtr arg10, HsPtr arg11, HsPtr arg12, HsPtr arg13);
    HsDouble arg1;
    HsDouble arg2;
    HsDouble arg3;
    HsDouble arg4;
    HsPtr arg5;
    HsPtr arg6;
    HsPtr arg7;
    HsDouble arg8;
    HsDouble arg9;
    HsPtr arg10;
    HsPtr arg11;
    HsPtr arg12;
    HsPtr arg13;
    HsInt32 res1;
    v7850 = (HsInt32 (*)(HsDouble, HsDouble, HsDouble, HsDouble, HsPtr, HsPtr, HsPtr, HsDouble, HsDouble, HsPtr, HsPtr, HsPtr, HsPtr))hugs->getFunPtr();
    arg1 = hugs->getDouble();
    arg2 = hugs->getDouble();
    arg3 = hugs->getDouble();
    arg4 = hugs->getDouble();
    arg5 = hugs->getPtr();
    arg6 = hugs->getPtr();
    arg7 = hugs->getPtr();
    arg8 = hugs->getDouble();
    arg9 = hugs->getDouble();
    arg10 = hugs->getPtr();
    arg11 = hugs->getPtr();
    arg12 = hugs->getPtr();
    arg13 = hugs->getPtr();
    res1 = v7850(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluUnProject
#endif

static void hugsprim_gluUnProject_5(HugsStackPtr);
static void hugsprim_gluUnProject_5(HugsStackPtr hugs_root)
{
    HsDouble arg1;
    HsDouble arg2;
    HsDouble arg3;
    HsPtr arg4;
    HsPtr arg5;
    HsPtr arg6;
    HsPtr arg7;
    HsPtr arg8;
    HsPtr arg9;
    HsInt32 res1;
    arg1 = hugs->getDouble();
    arg2 = hugs->getDouble();
    arg3 = hugs->getDouble();
    arg4 = hugs->getPtr();
    arg5 = hugs->getPtr();
    arg6 = hugs->getPtr();
    arg7 = hugs->getPtr();
    arg8 = hugs->getPtr();
    arg9 = hugs->getPtr();
    res1 = gluUnProject(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluProject
#endif

static void hugsprim_gluProject_4(HugsStackPtr);
static void hugsprim_gluProject_4(HugsStackPtr hugs_root)
{
    HsDouble arg1;
    HsDouble arg2;
    HsDouble arg3;
    HsPtr arg4;
    HsPtr arg5;
    HsPtr arg6;
    HsPtr arg7;
    HsPtr arg8;
    HsPtr arg9;
    HsInt32 res1;
    arg1 = hugs->getDouble();
    arg2 = hugs->getDouble();
    arg3 = hugs->getDouble();
    arg4 = hugs->getPtr();
    arg5 = hugs->getPtr();
    arg6 = hugs->getPtr();
    arg7 = hugs->getPtr();
    arg8 = hugs->getPtr();
    arg9 = hugs->getPtr();
    res1 = gluProject(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluPickMatrix
#endif

static void hugsprim_gluPickMatrix_3(HugsStackPtr);
static void hugsprim_gluPickMatrix_3(HugsStackPtr hugs_root)
{
    HsDouble arg1;
    HsDouble arg2;
    HsDouble arg3;
    HsDouble arg4;
    HsPtr arg5;
    arg1 = hugs->getDouble();
    arg2 = hugs->getDouble();
    arg3 = hugs->getDouble();
    arg4 = hugs->getDouble();
    arg5 = hugs->getPtr();
    gluPickMatrix(arg1, arg2, arg3, arg4, arg5);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluLookAt
#endif

static void hugsprim_gluLookAt_2(HugsStackPtr);
static void hugsprim_gluLookAt_2(HugsStackPtr hugs_root)
{
    HsDouble arg1;
    HsDouble arg2;
    HsDouble arg3;
    HsDouble arg4;
    HsDouble arg5;
    HsDouble arg6;
    HsDouble arg7;
    HsDouble arg8;
    HsDouble arg9;
    arg1 = hugs->getDouble();
    arg2 = hugs->getDouble();
    arg3 = hugs->getDouble();
    arg4 = hugs->getDouble();
    arg5 = hugs->getDouble();
    arg6 = hugs->getDouble();
    arg7 = hugs->getDouble();
    arg8 = hugs->getDouble();
    arg9 = hugs->getDouble();
    gluLookAt(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluPerspective
#endif

static void hugsprim_gluPerspective_1(HugsStackPtr);
static void hugsprim_gluPerspective_1(HugsStackPtr hugs_root)
{
    HsDouble arg1;
    HsDouble arg2;
    HsDouble arg3;
    HsDouble arg4;
    arg1 = hugs->getDouble();
    arg2 = hugs->getDouble();
    arg3 = hugs->getDouble();
    arg4 = hugs->getDouble();
    gluPerspective(arg1, arg2, arg3, arg4);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluOrtho2D
#endif

static void hugsprim_gluOrtho2D_0(HugsStackPtr);
static void hugsprim_gluOrtho2D_0(HugsStackPtr hugs_root)
{
    HsDouble arg1;
    HsDouble arg2;
    HsDouble arg3;
    HsDouble arg4;
    arg1 = hugs->getDouble();
    arg2 = hugs->getDouble();
    arg3 = hugs->getDouble();
    arg4 = hugs->getDouble();
    gluOrtho2D(arg1, arg2, arg3, arg4);
    
    hugs->returnIO(hugs_root,0);
}

static struct hugs_primitive hugs_primTable[] = {
    {"dyn_gluUnProject4", 15, hugsprim_v7850_6},
    {"gluUnProject", 10, hugsprim_gluUnProject_5},
    {"gluProject", 10, hugsprim_gluProject_4},
    {"gluPickMatrix", 6, hugsprim_gluPickMatrix_3},
    {"gluLookAt", 10, hugsprim_gluLookAt_2},
    {"perspective", 5, hugsprim_gluPerspective_1},
    {"ortho2D", 5, hugsprim_gluOrtho2D_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGMatrix
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

