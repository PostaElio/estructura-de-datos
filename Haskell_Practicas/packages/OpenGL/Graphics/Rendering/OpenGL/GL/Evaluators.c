/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef glEvalPoint2
#endif

static void hugsprim_glEvalPoint2_22(HugsStackPtr);
static void hugsprim_glEvalPoint2_22(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 arg2;
    arg1 = hugs->getInt32();
    arg2 = hugs->getInt32();
    glEvalPoint2(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glEvalPoint1
#endif

static void hugsprim_glEvalPoint1_21(HugsStackPtr);
static void hugsprim_glEvalPoint1_21(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    arg1 = hugs->getInt32();
    glEvalPoint1(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glEvalMesh2
#endif

static void hugsprim_glEvalMesh2_20(HugsStackPtr);
static void hugsprim_glEvalMesh2_20(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    HsInt32 arg5;
    arg1 = hugs->getWord32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    arg5 = hugs->getInt32();
    glEvalMesh2(arg1, arg2, arg3, arg4, arg5);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glEvalMesh1
#endif

static void hugsprim_glEvalMesh1_19(HugsStackPtr);
static void hugsprim_glEvalMesh1_19(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    arg1 = hugs->getWord32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    glEvalMesh1(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glMapGrid2d
#endif

static void hugsprim_glMapGrid2d_18(HugsStackPtr);
static void hugsprim_glMapGrid2d_18(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsDouble arg2;
    HsDouble arg3;
    HsInt32 arg4;
    HsDouble arg5;
    HsDouble arg6;
    arg1 = hugs->getInt32();
    arg2 = hugs->getDouble();
    arg3 = hugs->getDouble();
    arg4 = hugs->getInt32();
    arg5 = hugs->getDouble();
    arg6 = hugs->getDouble();
    glMapGrid2d(arg1, arg2, arg3, arg4, arg5, arg6);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glMapGrid2f
#endif

static void hugsprim_glMapGrid2f_17(HugsStackPtr);
static void hugsprim_glMapGrid2f_17(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsFloat arg2;
    HsFloat arg3;
    HsInt32 arg4;
    HsFloat arg5;
    HsFloat arg6;
    arg1 = hugs->getInt32();
    arg2 = hugs->getFloat();
    arg3 = hugs->getFloat();
    arg4 = hugs->getInt32();
    arg5 = hugs->getFloat();
    arg6 = hugs->getFloat();
    glMapGrid2f(arg1, arg2, arg3, arg4, arg5, arg6);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glMapGrid1d
#endif

static void hugsprim_glMapGrid1d_16(HugsStackPtr);
static void hugsprim_glMapGrid1d_16(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsDouble arg2;
    HsDouble arg3;
    arg1 = hugs->getInt32();
    arg2 = hugs->getDouble();
    arg3 = hugs->getDouble();
    glMapGrid1d(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glMapGrid1f
#endif

static void hugsprim_glMapGrid1f_15(HugsStackPtr);
static void hugsprim_glMapGrid1f_15(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsFloat arg2;
    HsFloat arg3;
    arg1 = hugs->getInt32();
    arg2 = hugs->getFloat();
    arg3 = hugs->getFloat();
    glMapGrid1f(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glEvalCoord2dv
#endif

static void hugsprim_glEvalCoord2dv_14(HugsStackPtr);
static void hugsprim_glEvalCoord2dv_14(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    arg1 = hugs->getPtr();
    glEvalCoord2dv(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glEvalCoord2d
#endif

static void hugsprim_glEvalCoord2d_13(HugsStackPtr);
static void hugsprim_glEvalCoord2d_13(HugsStackPtr hugs_root)
{
    HsDouble arg1;
    HsDouble arg2;
    arg1 = hugs->getDouble();
    arg2 = hugs->getDouble();
    glEvalCoord2d(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glEvalCoord2fv
#endif

static void hugsprim_glEvalCoord2fv_12(HugsStackPtr);
static void hugsprim_glEvalCoord2fv_12(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    arg1 = hugs->getPtr();
    glEvalCoord2fv(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glEvalCoord2f
#endif

static void hugsprim_glEvalCoord2f_11(HugsStackPtr);
static void hugsprim_glEvalCoord2f_11(HugsStackPtr hugs_root)
{
    HsFloat arg1;
    HsFloat arg2;
    arg1 = hugs->getFloat();
    arg2 = hugs->getFloat();
    glEvalCoord2f(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glEvalCoord1dv
#endif

static void hugsprim_glEvalCoord1dv_10(HugsStackPtr);
static void hugsprim_glEvalCoord1dv_10(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    arg1 = hugs->getPtr();
    glEvalCoord1dv(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glEvalCoord1d
#endif

static void hugsprim_glEvalCoord1d_9(HugsStackPtr);
static void hugsprim_glEvalCoord1d_9(HugsStackPtr hugs_root)
{
    HsDouble arg1;
    arg1 = hugs->getDouble();
    glEvalCoord1d(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glEvalCoord1fv
#endif

static void hugsprim_glEvalCoord1fv_8(HugsStackPtr);
static void hugsprim_glEvalCoord1fv_8(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    arg1 = hugs->getPtr();
    glEvalCoord1fv(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glEvalCoord1f
#endif

static void hugsprim_glEvalCoord1f_7(HugsStackPtr);
static void hugsprim_glEvalCoord1f_7(HugsStackPtr hugs_root)
{
    HsFloat arg1;
    arg1 = hugs->getFloat();
    glEvalCoord1f(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glGetMapiv
#endif

static void hugsprim_glGetMapiv_6(HugsStackPtr);
static void hugsprim_glGetMapiv_6(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    HsPtr arg3;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getPtr();
    glGetMapiv(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glGetMapdv
#endif

static void hugsprim_glGetMapdv_5(HugsStackPtr);
static void hugsprim_glGetMapdv_5(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    HsPtr arg3;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getPtr();
    glGetMapdv(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glGetMapfv
#endif

static void hugsprim_glGetMapfv_4(HugsStackPtr);
static void hugsprim_glGetMapfv_4(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    HsPtr arg3;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getPtr();
    glGetMapfv(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glMap2d
#endif

static void hugsprim_glMap2d_3(HugsStackPtr);
static void hugsprim_glMap2d_3(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsDouble arg2;
    HsDouble arg3;
    HsInt32 arg4;
    HsInt32 arg5;
    HsDouble arg6;
    HsDouble arg7;
    HsInt32 arg8;
    HsInt32 arg9;
    HsPtr arg10;
    arg1 = hugs->getWord32();
    arg2 = hugs->getDouble();
    arg3 = hugs->getDouble();
    arg4 = hugs->getInt32();
    arg5 = hugs->getInt32();
    arg6 = hugs->getDouble();
    arg7 = hugs->getDouble();
    arg8 = hugs->getInt32();
    arg9 = hugs->getInt32();
    arg10 = hugs->getPtr();
    glMap2d(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glMap2f
#endif

static void hugsprim_glMap2f_2(HugsStackPtr);
static void hugsprim_glMap2f_2(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsFloat arg2;
    HsFloat arg3;
    HsInt32 arg4;
    HsInt32 arg5;
    HsFloat arg6;
    HsFloat arg7;
    HsInt32 arg8;
    HsInt32 arg9;
    HsPtr arg10;
    arg1 = hugs->getWord32();
    arg2 = hugs->getFloat();
    arg3 = hugs->getFloat();
    arg4 = hugs->getInt32();
    arg5 = hugs->getInt32();
    arg6 = hugs->getFloat();
    arg7 = hugs->getFloat();
    arg8 = hugs->getInt32();
    arg9 = hugs->getInt32();
    arg10 = hugs->getPtr();
    glMap2f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glMap1d
#endif

static void hugsprim_glMap1d_1(HugsStackPtr);
static void hugsprim_glMap1d_1(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsDouble arg2;
    HsDouble arg3;
    HsInt32 arg4;
    HsInt32 arg5;
    HsPtr arg6;
    arg1 = hugs->getWord32();
    arg2 = hugs->getDouble();
    arg3 = hugs->getDouble();
    arg4 = hugs->getInt32();
    arg5 = hugs->getInt32();
    arg6 = hugs->getPtr();
    glMap1d(arg1, arg2, arg3, arg4, arg5, arg6);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glMap1f
#endif

static void hugsprim_glMap1f_0(HugsStackPtr);
static void hugsprim_glMap1f_0(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsFloat arg2;
    HsFloat arg3;
    HsInt32 arg4;
    HsInt32 arg5;
    HsPtr arg6;
    arg1 = hugs->getWord32();
    arg2 = hugs->getFloat();
    arg3 = hugs->getFloat();
    arg4 = hugs->getInt32();
    arg5 = hugs->getInt32();
    arg6 = hugs->getPtr();
    glMap1f(arg1, arg2, arg3, arg4, arg5, arg6);
    
    hugs->returnIO(hugs_root,0);
}

static struct hugs_primitive hugs_primTable[] = {
    {"glEvalPoint2", 3, hugsprim_glEvalPoint2_22},
    {"evalPoint1", 2, hugsprim_glEvalPoint1_21},
    {"glEvalMesh2", 6, hugsprim_glEvalMesh2_20},
    {"glEvalMesh1", 4, hugsprim_glEvalMesh1_19},
    {"glMapGrid2d", 7, hugsprim_glMapGrid2d_18},
    {"glMapGrid2f", 7, hugsprim_glMapGrid2f_17},
    {"glMapGrid1d", 4, hugsprim_glMapGrid1d_16},
    {"glMapGrid1f", 4, hugsprim_glMapGrid1f_15},
    {"glEvalCoord2dv", 2, hugsprim_glEvalCoord2dv_14},
    {"glEvalCoord2d", 3, hugsprim_glEvalCoord2d_13},
    {"glEvalCoord2fv", 2, hugsprim_glEvalCoord2fv_12},
    {"glEvalCoord2f", 3, hugsprim_glEvalCoord2f_11},
    {"glEvalCoord1dv", 2, hugsprim_glEvalCoord1dv_10},
    {"glEvalCoord1d", 2, hugsprim_glEvalCoord1d_9},
    {"glEvalCoord1fv", 2, hugsprim_glEvalCoord1fv_8},
    {"glEvalCoord1f", 2, hugsprim_glEvalCoord1f_7},
    {"glGetMapiv", 4, hugsprim_glGetMapiv_6},
    {"glGetMapdv", 4, hugsprim_glGetMapdv_5},
    {"glGetMapfv", 4, hugsprim_glGetMapfv_4},
    {"glMap2d", 11, hugsprim_glMap2d_3},
    {"glMap2f", 11, hugsprim_glMap2f_2},
    {"glMap1d", 7, hugsprim_glMap1d_1},
    {"glMap1f", 7, hugsprim_glMap1f_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGEvaluators
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

